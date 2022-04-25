package com.ssafy.happyhouse.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.Notice;

public class AlgoUtil {
	//1. KMP 알고리즘 : 모든 경우를 다 비교하지 않아도 부분 문자열을 찾을 수 있는 알고리즘.
	//접두사와 접미사 개념을 활용해서, '반복되는 연산을 최대한 줄이도록'
	//지금까지 검사한 문자열의 접두사와 접미사가 일치하는 최대길이만큼 겹침을 이용
	
	//파이 테이블 : 각 길이별로 접두사==접미사의 최대길이가 저장된 배열
	public static int[] getPi(String pattern) {
		int[] pi = new int[pattern.length()];
		int j = 0;
		for(int i=1;i<pattern.length();i++) {
			//맞는 경우
			if(pattern.charAt(i) == pattern.charAt(j)) {
				//i길이 문자열의 공통길이는 j의 위치 + 1
				pi[i] = ++j;
			}
			//안맞는 경우
			else {
				if(j==0)
					continue;
				//맞는날이 올때까지 하나 전 칸에서의 공통부분 위치로 이동
				while(j>0 && pattern.charAt(i)!=pattern.charAt(j))
					j = pi[j-1];
			}
		}
		return pi;
	}
	public static boolean KMP(String origin, String pattern) {
		int[] pi = getPi(pattern);
		int j=0;
		for(int i=0;i<origin.length();i++) {
			//안맞는 경우
			while(j>0 && origin.charAt(i) != pattern.charAt(j))
				j = pi[j-1];
			//맞는경우
			if(origin.charAt(i) == pattern.charAt(j)) {
				if(j == pattern.length() -1) {
					return true;
				}
				//맞았지만 패턴이 끝나지 않았다면 j를 하나 더 증가
				else
					j++;
			}
		}
		return false;
	}
//	public static void main(String[] args) {
//		String origin = "사직동";
//		String pattern = "사직";
//		KMP(origin,pattern);
//	}
	
	
	//2. MergeSort 
    public static void main( String[] args )
    {
        List<Notice> list = new ArrayList<>();
        Notice temp = new Notice();
        temp.setViews(19);
        Notice temp2 = new Notice();
        temp2.setViews(1);
        list.add(temp2);
        list.add(temp);
        List<Notice> result = sort(list);
        print(result);
    }

    /**
     * Notice list를 받아서 한 줄로 프린트 합니다.
     *
     * @param result
     */
    public static void print(List<Notice> result) {
        result.stream().forEach(item -> System.out.print(item.toString()));
        System.out.println();
    }

    /**
     * merge sort를 시행합니다.
     *
     * @param noticeList sort할 target 입니다.
     * @return
     */
    public static List<Notice> sort(List<Notice> noticeList) {
        // 사이즈가 1보다 크다면
        if (noticeList.size() > 1) {
            // 왼쪽 오른쪽을 merge 합니다.
            return merge(
                // 왼쪽 / 오른쪽으로 배열을 나누고 다시 sort하도록 합니다.
                sort(noticeList.subList(0, noticeList.size() / 2)),
                sort(noticeList.subList(noticeList.size() / 2, noticeList.size()))
            );
        } else {
            // 사이즈가 1 이하라면 재귀가 종료됩니다.
            return noticeList;
        }
    }

    /**
     * 병합합니다.
     *
     * @param left 왼쪽 배열
     * @param right 오른쪽 배열
     * @return
     */
    public static List<Notice> merge (List<Notice> left, List<Notice> right) {
        // 결과가 될 임시 배열입니다.
        List<Notice> result = new ArrayList<>();
        int rightIdx = 0;

        for (Notice l : left) {

            while (right.size() > rightIdx && l.getViews() < right.get(rightIdx).getViews() ) {
                result.add(right.get(rightIdx));
                rightIdx++;
            }
            result.add(l);
        }
        for (int i = rightIdx; i < right.size(); i ++) {
            result.add(right.get(i));
        }
        return result;
    }
    
    // 3. QuickSort
    public static List<HouseDeal> quickSort(List<HouseDeal> list) {
        if (list.size() <= 1) return list;
        HouseDeal mid = list.get(list.size() / 2);

        List<HouseDeal> left = new LinkedList<>();
        List<HouseDeal> result = new LinkedList<>();
        List<HouseDeal> right = new LinkedList<>();

        for (HouseDeal num : list) {
            if (num.getBuildYear() < mid.getBuildYear()) left.add(num);
            else if (num.getBuildYear() > mid.getBuildYear()) right.add(num);
            else result.add(num);
        }

        return Stream.of(quickSort(left), result, quickSort(right))
                .flatMap(Collection::stream)
                .collect(Collectors.toList());
    }
}
