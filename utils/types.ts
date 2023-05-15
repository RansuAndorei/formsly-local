export type AppType = "GENERAL" | "REQUEST" | "REVIEW";
export type MemberRoleType = "OWNER" | "ADMIN" | "MEMBER";
export type AttachmentBucketType =
  | "USER_AVATARS"
  | "USER_SIGNATURES"
  | "TEAM_LOGOS"
  | "COMMENT_ATTACHMENTS"
  | "REQUEST_ATTACHMENTS";
export type ReceiverStatusType = "PENDING" | "APPROVED" | "REJECTED";
export type FormStatusType = ReceiverStatusType | "CANCELED";
export type FieldType =
  | "SECTION"
  | "TEXT"
  | "NUMBER"
  | "TEXTAREA"
  | "SELECT"
  | "MULTISELECT"
  | "SLIDER"
  | "DATE"
  | "DATERANGE"
  | "MULTICHECKBOX"
  | "BOOLEAN";
export type FieldTagType =
  | "POSITIVE_METRIC"
  | "NEGATIVE_METRIC"
  | "SUBMISSION_FORM_TITLE"
  | "SUBMISSION_FORM_DESCRIPTION"
  | "REVIEW_GENERAL_COMMENT"
  | "DUPLICATABLE_SECTION";
export type CommentType =
  | "ACTION_APPROVED"
  | "ACTION_REJECTED"
  | "REQUEST_CANCELED"
  | "REQUEST_UNDO"
  | "REQUEST_COMMENT"
  | "REQUEST_CREATED"
  | "REVIEW_CREATED"
  | "REVIEW_COMMENT";
export type NotificationType =
  | "REQUEST"
  | "APPROVED"
  | "REJECTED"
  | "INVITE"
  | "REVIEW";
