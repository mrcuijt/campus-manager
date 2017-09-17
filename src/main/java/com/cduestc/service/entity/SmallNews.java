package com.cduestc.service.entity;


public class SmallNews {
	private Long newsId;

	private String imgUrl;

	public Long getNewsId() {
		return newsId==null?0:newsId;
	}

	public void setNewsId(Long newsId) {
		this.newsId = newsId;
	}


	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl == null ? null : imgUrl.trim();
	}
}