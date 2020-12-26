package com.bgs.ssm.util;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GetAllFiledNameUtil {

    public static void main(String[] args) {
        // 在这里输入四个参数，第一个是数据库的名字，第二个是表的名字，第三个是数据库用户名（默认root）,第四个是数据库密码
        getAllList("222", "Province", "root", "wts");
    }

    public static void getAllList(String MySQLName, String tablerName, String userName, String password) {// 全查一张表
        Statement stt = null;
        Connection con = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/" + MySQLName;
            con = DriverManager.getConnection(url, userName, password);
            stt = con.createStatement();
            String sql = "select *from " + tablerName;
            rs = stt.executeQuery(sql);
            ResultSetMetaData data = rs.getMetaData();
            List<String> columnNameList = new ArrayList<>();
            List<String> columnTypeName = new ArrayList<>();
            for (int i = 0; i < data.getColumnCount(); i++) {
                String columnName = data.getColumnName(i + 1);
                String TypeName = data.getColumnTypeName(i + 1);
                columnNameList.add(columnName);
                columnTypeName.add(TypeName);
            }
            if (rs.next()) {
                String value = null;
                String filedName = null;
                String typeName = null;
                for (int i = 0; i < columnTypeName.size(); i++) {
                    String type = columnTypeName.get(i);
                    filedName = columnNameList.get(i);
                    typeName = columnTypeName.get(i);
                    switch (typeName) {
                        case "INT": // 数字
                            typeName = "Integer";
                            break;
                        case "VARCHAR": // Boolean
                            typeName = "String";
                            break;
                        case "DATETIME": // Boolean
                            typeName = "Date";
                            break;
                        case "DATE": // Boolean
                            typeName = "Date";
                            break;
                        case "DECIMAL": // Boolean
                            typeName = "double";
                            break;
                        default:
                            typeName = "String";
                            break;
                    }
                    String newString = "";
                    for (int j = 0; j < filedName.length(); j++) {
                        char newChar = filedName.charAt(j);
                        if ((newChar + "").length() > 0 && !(newChar + "").equals("_")) {
                            newString += Character.toLowerCase(newChar);
                        }
                        if ((newChar + "").equals("_")) {
                            newString += "_";
                        }
                    }
                    filedName = newString;
                    for (int a = 0; a < filedName.length(); a++) {

                        int indexOf = filedName.indexOf("_");
                        if (indexOf > 0) {
                            filedName = getFileName(filedName);
                        }
                    }

                    value = "private " + typeName + "  " + filedName + ";";
                    System.out.println(value);
                }

            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (rs != null & con != null & stt != null) {
                try {
                    rs.close();
                    con.close();
                    stt.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
    }

    public static String getFileName(String filedName) {

        int lastIndexOf = filedName.lastIndexOf('_');
        char charAt = 0;
        if (lastIndexOf > 1) {
            charAt = filedName.charAt(lastIndexOf + 1);
            if (Character.isLowerCase(charAt)) {
                charAt = Character.toUpperCase(charAt);
            }
            String substring1 = filedName.substring(0, lastIndexOf);
            String substring2 = filedName.substring(lastIndexOf + 2);
            filedName = substring1 + charAt + substring2;
        }


        return filedName;

    }


    public static char exChange(char str) {/* 把字符小写转为大写 */

        /* Character.isUpperCase(c) 如果字符为大写，则返回 true；否则返回 false */
        if (Character.isUpperCase(str)) {

            Character.toLowerCase(str);

        } else if (Character.isLowerCase(str)) {

            Character.toUpperCase(str);

        }

        return str;

    }

}
