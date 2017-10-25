package vo;

import java.util.Date;

//10/23 ����

public class ContentVO {
	int content_no;  //auto
	String title;
	int read_count;
	String writer;
	Date write_time;
	String main_img;
	String location;

	/////////////////////////////////////////////////////////////////////////////////////////////
	public ContentVO(int content_no, String title, int read_count, String writer, Date write_time, String main_img,
			String location) {
		this.content_no = content_no;
		this.title = title;
		this.read_count = read_count;
		this.writer = writer;
		this.write_time = write_time;
		this.main_img = main_img;
		this.location = location;
	}

	public ContentVO() {
	}

	///////////////////////////////////////////////////////////////////////////////////////////
	public int getContent_no() {
		return content_no;
	}

	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getWrite_time() {
		return write_time;
	}

	public void setWrite_time(Date write_time) {
		this.write_time = write_time;
	}

	public String getMain_img() {
		return main_img;
	}

	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "ContentVO [content_no=" + content_no + ", title=" + title + ", read_count=" + read_count + ", writer="
				+ writer + ", write_time=" + write_time + ", main_img=" + main_img + ", location=" + location + "]";
	}
}