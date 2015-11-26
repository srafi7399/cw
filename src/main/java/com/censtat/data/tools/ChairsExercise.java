package com.censtat.data.tools;

import java.util.ArrayList;
/**
 * 
 * @author Rafi Shaik
 *
 */
public class ChairsExercise {

	private ArrayList<Chair> chairsList = new ArrayList<Chair>();
	private ArrayList<Chair> removedChairs = new ArrayList<Chair>();

	public ChairsExercise() {
		init();
	}

	private void init() {
		for (int i = 0; i < 100; i++) {
			Chair chair = new Chair(i + 1);
			this.chairsList.add(chair);
		}
		System.out.println("Initial Chairs List--->" + chairsList);

	}

	public void startRemovingExercise() {
		while (true) {
			if (chairsList.size() == 1) {
				System.out.print("The Last Chair Remaining--->"
						+ chairsList.get(0));
				return;
			}
			int i = 0;
			int j = 1;
			while (i < chairsList.size()) {
			Chair removed = removeChair(i);
				this.removedChairs.add(removed);
				if (i == 0) {
					i = getNextChairToRemove(i) + 1;
				} else {
					i = i + getNextChairToRemove(j);
				}
				j++;
			}
			// purge removed chairs and start again
			purgeRemovedChairs(chairsList);
			System.out.println("Removed Chairs List -->" + this.removedChairs);
			System.out.println("Remaining Chairs List -->" + this.chairsList);
		}

	}

	private int getNextChairToRemove(int loopCount) {
		return loopCount + 1;
	}

	private ArrayList<Chair> purgeRemovedChairs(ArrayList<Chair> chairs) {
		for (int i = 0; i < chairs.size(); i++) {
			if (chairs.get(i).getRemoved()) {
				chairs.remove(i);
			}
		}
		return chairs;
	}

	private Chair removeChair(int i) {
		Chair chair = this.chairsList.get(i);
		chair.setRemoved(true);
		return chair;
	}

	public static void main(String[] args) {
		ChairsExercise exercise = new ChairsExercise();
		exercise.startRemovingExercise();

	}

	class Chair {
		private int chairNo = 0;
		private boolean removed = false;

		public int getChairNo() {
			return chairNo;
		}

		public void setChairNo(int chairNo) {
			this.chairNo = chairNo;
		}

		public Chair(int num) {
			this.chairNo = num;
		}

		public void setRemoved(boolean removed) {
			this.removed = removed;
		}

		public boolean getRemoved() {
			return this.removed;
		}

		public String toString() {
			return "Chair_" + chairNo;
		}

	}

}
