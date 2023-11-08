package com.kh.hrp.common.model.vo;

public class PlaceImage {
	
	private int placeImageNo;
	private int placeNo;
	private String placeImageOrigin;
	private String placeImageChange;
	private String placeImagePath;
	private String placeImageDate;
	
	public PlaceImage() {
		super();
	}

	public PlaceImage(int placeImageNo, int placeNo, String placeImageOrigin, String placeImageChange,
			String placeImagePath, String placeImageDate) {
		super();
		this.placeImageNo = placeImageNo;
		this.placeNo = placeNo;
		this.placeImageOrigin = placeImageOrigin;
		this.placeImageChange = placeImageChange;
		this.placeImagePath = placeImagePath;
		this.placeImageDate = placeImageDate;
	}
	
	
	
	// selectImage 용 생성자
	public PlaceImage(int placeImageNo, String placeImageChange, String placeImagePath) {
		super();
		this.placeImageNo = placeImageNo;
		this.placeImageChange = placeImageChange;
		this.placeImagePath = placeImagePath;
	}

	public int getPlaceImageNo() {
		return placeImageNo;
	}

	public void setPlaceImageNo(int placeImageNo) {
		this.placeImageNo = placeImageNo;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	public String getPlaceImageOrigin() {
		return placeImageOrigin;
	}

	public void setPlaceImageOrigin(String placeImageOrigin) {
		this.placeImageOrigin = placeImageOrigin;
	}

	public String getPlaceImageChange() {
		return placeImageChange;
	}

	public void setPlaceImageChange(String placeImageChange) {
		this.placeImageChange = placeImageChange;
	}

	public String getPlaceImagePath() {
		return placeImagePath;
	}

	public void setPlaceImagePath(String placeImagePath) {
		this.placeImagePath = placeImagePath;
	}

	public String getPlaceImageDate() {
		return placeImageDate;
	}

	public void setPlaceImageDate(String placeImageDate) {
		this.placeImageDate = placeImageDate;
	}

	@Override
	public String toString() {
		return "PlaceImage [placeImageNo=" + placeImageNo + ", placeNo=" + placeNo + ", placeImageOrigin="
				+ placeImageOrigin + ", placeImageChange=" + placeImageChange + ", placeImagePath=" + placeImagePath
				+ ", placeImageDate=" + placeImageDate + "]";
	}
	
	

}
