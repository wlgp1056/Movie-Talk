package org.movietalk.app.web;

public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;

	private int total; // 전체 데이터 수
	private Criteria cri; // 한페이지에 10개뿌릴지 15개 뿌릴지 모르니까 선언해줌.
	// criteria 안에는 페이지에서 보여주는 데이터 수와 현재 페이지 번호를 갖고 있다.

	public PageDTO() {
		// TODO Auto-generated constructor stub
	}

	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;

		this.endPage = (int) (Math.ceil(cri.getPageNum() / 5.0)) * 5; //이후 jsp단에서 페이지 버튼 노출과 관련있다~
		// 페이지 넘버 먼저 가져오고.. 한 페이지에 (페이지 버튼을)5개씩 보여 줄 것. 소수점안나오니까 math.ceil로 한 번 올려준다.

		this.startPage = endPage - 4; // 끝 페이지가 5라면 첫 페이지는 1이고, 끝 페이지가 10이라면 첫 페이지는 6이니까..

		int realEnd = (int) (Math.ceil(total * 1.0) / cri.getAmount());
		if((Math.ceil(total * 1.0)%10 != 0)) {
	         realEnd++;
	      }
		// int realEnd2 = (int)(Math.ceil((total * 1.0) / cri.getAmount()));

		this.endPage = realEnd < endPage ? realEnd : endPage;
		// 진짜 끝페이지가 현재끝페이지보다 같거나 작으면 realEnd고 아니면 endPage고.. 삼항연산.
		this.prev = this.startPage > 1; // 1이 아니면 이전으로 가는 링크가 생긴다.
		this.next = this.endPage < realEnd; // 다음으로 가는 링크 처리...
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cri == null) ? 0 : cri.hashCode());
		result = prime * result + endPage;
		result = prime * result + (next ? 1231 : 1237);
		result = prime * result + (prev ? 1231 : 1237);
		result = prime * result + startPage;
		result = prime * result + total;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PageDTO other = (PageDTO) obj;
		if (cri == null) {
			if (other.cri != null)
				return false;
		} else if (!cri.equals(other.cri))
			return false;
		if (endPage != other.endPage)
			return false;
		if (next != other.next)
			return false;
		if (prev != other.prev)
			return false;
		if (startPage != other.startPage)
			return false;
		if (total != other.total)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "PageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}

}
