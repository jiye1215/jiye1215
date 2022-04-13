package kr.co.mlec.board.vo;

public class BoardCommentVO {
   
   private int commentNo;        // 댓글 글번호
    private int no;        // 게시글 번호
    private String commentId;        // 댓글 작성자
    private String commentDate;        // 댓글 작성일
    private String commentContent;    // 댓글 내용
   
    public BoardCommentVO() {
      
   }
   
   
   public BoardCommentVO(int commentNo, int no) {
      super();
      this.commentNo = commentNo;
      this.no = no;
   }


   public BoardCommentVO(int commentNo, int no, String commentId, String commentDate,
         String commentContent) {
      super();
      this.commentNo = commentNo;
      this.no = no;
      this.commentId = commentId;
      this.commentDate = commentDate;
      this.commentContent = commentContent;
   }


   
   public int getCommentNo() {
      return commentNo;
   }
   public void setCommentNo(int commentNo) {
      this.commentNo = commentNo;
   }

   public int getNo() {
      return no;
   }

   public void setNo(int no) {
      this.no = no;
   }

   public String getCommentId() {
      return commentId;
   }
   public void setCommentId(String commentId) {
      this.commentId = commentId;
   }
   public String getCommentDate() {
      return commentDate;
   }
   public void setCommentDate(String commentDate) {
      this.commentDate = commentDate;
   }
   public String getCommentContent() {
      return commentContent;
   }
   public void setCommentContent(String commentContent) {
      this.commentContent = commentContent;
   }

   @Override
   public String toString() {
      return "BoardCommentVO [commentNo=" + commentNo + ", no=" + no + ", commentId=" + commentId + ", commentDate="
            + commentDate + ", commentContent=" + commentContent + "]";
   }

    
   
}