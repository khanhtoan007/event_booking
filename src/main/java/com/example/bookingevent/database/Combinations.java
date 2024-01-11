package com.example.bookingevent.database;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

public class Combinations {
    public static List<List<Integer>> combine(int n, int k) {
        List<List<Integer>> result = new ArrayList<>(); // biến lưu trữ danh sách combination
        Stack<Integer> combination = new Stack<>(); // biến lưu giá trị của combination hiện tại

        int start = 1;

        while (true) {
            if (combination.size() == k) { // Kiểm tra xem kích thước combination hiện tại có bằng k hay không, nếu bằng thêm combination vào result
                result.add(new ArrayList<>(combination));
            }

            if (combination.size() == k || start > n - k + combination.size() + 1) { // Kiểm tra xem kích thước combination hiện tại có bằng k hoặc start có lớn quá hay không(nếu quá lớn sẽ không đủ phần từ còn lại để add vào combination)
                if (combination.isEmpty()) { // nếu combination trống thì break;
                    break; // Backtracking is complete
                }
                start = combination.pop() + 1; //Lấy phần tử cuối cùng từ ngăn xếp combination và đặt start thành số tiếp theo sau phần tử được lấy ra.
            } else {
                combination.push(start++); // tăng start lên và bắt đầu add vào combination
            }
        }

        return result; // trả về combination
    }

    public static void main(String[] args) {
        int n = 3;
        int k = 2;
        List<List<Integer>> result = combine(n, k);

        // Print the result
        for (List<Integer> combination : result) {
            System.out.println(combination);
        }
    }
}
