From: =?ks_c_5601-1987?B?udrBpMXC?= <jtp.park@samsung.com>
Subject: RE: [RFC/PATCH v4 1/4] Changes in include/linux/videodev2.h for MFC 5.1
Date: Fri, 10 Dec 2010 12:32:05 +0900
Message-ID: <00e901cb981a$d3430eb0$79c92c10$%park@samsung.com>
References: <1291901723-20361-1-git-send-email-k.debski@samsung.com>
 <1291901723-20361-2-git-send-email-k.debski@samsung.com>
Reply-To: jtp.park@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:65280 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753775Ab0LJDc7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Dec 2010 22:32:59 -0500
In-reply-to: <1291901723-20361-2-git-send-email-k.debski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kamil Debski' <k.debski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, pawel@osciak.com, kyungmin.park@samsung.com, jaeryul.oh@samsung.com

Hi, Kamil

What do you think modification of codec class control ID for MFC as
following.
1. Define the CID base for MFC
2. Separate decode & encode controls
3. Separate common & codec-specific controls

> Add fourcc values for compressed video stream formats and
> V4L2_CTRL_CLASS_CODEC. Also adds controls used by MFC 5.1 driver.
> 
> 
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com
> ---
>  include/linux/videodev2.h |   48
> +++++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 48 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
> index d30c98d..c89f019 100644
> --- a/include/linux/videodev2.h
> +++ b/include/linux/videodev2.h
> @@ -339,6 +339,14 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_NV16    v4l2_fourcc('N', 'V', '1', '6') /* 16
Y/CbCr
> 4:2:2  */
>  #define V4L2_PIX_FMT_NV61    v4l2_fourcc('N', 'V', '6', '1') /* 16
Y/CrCb
> 4:2:2  */
> 
> +/* two non contiguous planes -- one Y, one Cr + Cb interleaved  */
> +#define V4L2_PIX_FMT_NV12M   v4l2_fourcc('N', 'M', '1', '2') /* 12
Y/CbCr
> 4:2:0  */
> +/* 12  Y/CbCr 4:2:0 64x32 macroblocks */
> +#define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2')
> +
> +/* three non contiguous planes -- Y, Cb, Cr */
> +#define V4L2_PIX_FMT_YUV420M v4l2_fourcc('Y', 'M', '1', '2') /* 12
> YUV420 planar */
> +
>  /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
>  #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8
BGBG..
> GRGR.. */
>  #define V4L2_PIX_FMT_SGBRG8  v4l2_fourcc('G', 'B', 'R', 'G') /*  8
GBGB..
> RGRG.. */
> @@ -362,6 +370,21 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_DV       v4l2_fourcc('d', 'v', 's', 'd') /* 1394
> */
>  #define V4L2_PIX_FMT_MPEG     v4l2_fourcc('M', 'P', 'E', 'G') /* MPEG-
> 1/2/4    */
> 
> +
> +#define V4L2_PIX_FMT_H264     v4l2_fourcc('H', '2', '6', '4') /* H264
*/
> +#define V4L2_PIX_FMT_H263     v4l2_fourcc('H', '2', '6', '3') /* H263
*/
> +#define V4L2_PIX_FMT_MPEG12   v4l2_fourcc('M', 'P', '1', '2') /* MPEG-1/2
> */
> +#define V4L2_PIX_FMT_MPEG4    v4l2_fourcc('M', 'P', 'G', '4') /* MPEG-4
> */
> +#define V4L2_PIX_FMT_DIVX     v4l2_fourcc('D', 'I', 'V', 'X') /* DivX  */
> +#define V4L2_PIX_FMT_DIVX3    v4l2_fourcc('D', 'I', 'V', '3') /* DivX
3.11
> */
> +#define V4L2_PIX_FMT_DIVX4    v4l2_fourcc('D', 'I', 'V', '4') /* DivX
4.12
> */
> +#define V4L2_PIX_FMT_DIVX500    v4l2_fourcc('D', 'X', '5', '2') /* DivX
> 5.00 - 5.02  */
> +#define V4L2_PIX_FMT_DIVX503    v4l2_fourcc('D', 'X', '5', '3') /* DivX
> 5.03 - x  */
> +#define V4L2_PIX_FMT_XVID     v4l2_fourcc('X', 'V', 'I', 'D') /* Xvid */
> +#define V4L2_PIX_FMT_VC1      v4l2_fourcc('V', 'C', '1', 'A') /* VC-1 */
> +#define V4L2_PIX_FMT_VC1_RCV      v4l2_fourcc('V', 'C', '1', 'R') /* VC-1
> RCV */
> +
> +
>  /*  Vendor-specific formats   */
>  #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1
YUV
> */
>  #define V4L2_PIX_FMT_WNVA     v4l2_fourcc('W', 'N', 'V', 'A') /* Winnov
hw
> compress */
> @@ -972,6 +995,7 @@ struct v4l2_output {
>  #define V4L2_OUTPUT_TYPE_ANALOG			2
>  #define V4L2_OUTPUT_TYPE_ANALOGVGAOVERLAY	3
> 
> +
>  /* capabilities flags */
>  #define V4L2_OUT_CAP_PRESETS		0x00000001 /* Supports S_DV_PRESET
> */
>  #define V4L2_OUT_CAP_CUSTOM_TIMINGS	0x00000002 /* Supports
> S_DV_TIMINGS */
> @@ -1009,6 +1033,7 @@ struct v4l2_ext_controls {
>  #define V4L2_CTRL_CLASS_MPEG 0x00990000	/* MPEG-compression
> controls */
>  #define V4L2_CTRL_CLASS_CAMERA 0x009a0000	/* Camera class controls */
>  #define V4L2_CTRL_CLASS_FM_TX 0x009b0000	/* FM Modulator control
> class */
> +#define V4L2_CTRL_CLASS_CODEC 0x009c0000	/* Codec control class */
> 
>  #define V4L2_CTRL_ID_MASK      	  (0x0fffffff)
>  #define V4L2_CTRL_ID2CLASS(id)    ((id) & 0x0fff0000UL)
> @@ -1342,6 +1367,29 @@ enum v4l2_mpeg_cx2341x_video_median_filter_type {
>  #define V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP
> 	(V4L2_CID_MPEG_CX2341X_BASE+10)
>  #define V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS
> 	(V4L2_CID_MPEG_CX2341X_BASE+11)
> 
> +/* For codecs */
> +
> +#define V4L2_CID_CODEC_BASE 			(V4L2_CTRL_CLASS_CODEC |
> 0x900)
> +#define V4L2_CID_CODEC_CLASS
(V4L2_CTRL_CLASS_CODEC | 1)
> +
> +/* For both decoding and encoding */
> +
> +/* For encoding */
> +#define V4L2_CID_CODEC_LOOP_FILTER_H264		(V4L2_CID_CODEC_BASE
> + 9)
> +enum v4l2_cid_codec_loop_filter_h264 {
> +	V4L2_CID_CODEC_LOOP_FILTER_H264_ENABLE = 0,
> +	V4L2_CID_CODEC_LOOP_FILTER_H264_DISABLE = 1,
> +	V4L2_CID_CODEC_LOOP_FILTER_H264_DISABLE_AT_BOUNDARY = 2,
> +};
> +
> +/* For decoding */
> +
> +#define V4L2_CID_CODEC_LOOP_FILTER_MPEG4_ENABLE	(V4L2_CID_CODEC_BASE
> + 110)
> +#define V4L2_CID_CODEC_DISPLAY_DELAY		(V4L2_CID_CODEC_BASE + 137)
> +#define V4L2_CID_CODEC_REQ_NUM_BUFS		(V4L2_CID_CODEC_BASE + 140)
> +#define
V4L2_CID_CODEC_SLICE_INTERFACE		(V4L2_CID_CODEC_BASE + 141)
> +#define V4L2_CID_CODEC_PACKED_PB		(V4L2_CID_CODEC_BASE + 142)
> +
>  /*  Camera class control IDs */
>  #define V4L2_CID_CAMERA_CLASS_BASE 	(V4L2_CTRL_CLASS_CAMERA | 0x900)
>  #define V4L2_CID_CAMERA_CLASS 		(V4L2_CTRL_CLASS_CAMERA | 1)
> --
> 1.6.3.3

-/* For codecs */
-
-#define V4L2_CID_CODEC_BASE                    (V4L2_CTRL_CLASS_CODEC |
0x900)
-#define V4L2_CID_CODEC_CLASS                   (V4L2_CTRL_CLASS_CODEC | 1)
+/* Codec class control IDs */
+#define V4L2_CID_CODEC_BASE                    (V4L2_CTRL_CLASS_CODEC |
0x900)
+#define V4L2_CID_CODEC_CLASS                   (V4L2_CTRL_CLASS_CODEC | 1)
 
-/* For both decoding and encoding */
+/* Codec class control IDs specific to the MFC5X driver */
+#define V4L2_CID_CODEC_MFC5X_BASE              (V4L2_CTRL_CLASS_CODEC |
0x1000)
 
-/* For encoding */
-#define V4L2_CID_CODEC_LOOP_FILTER_H264
(V4L2_CID_CODEC_BASE + 9)
-enum v4l2_cid_codec_loop_filter_h264 {
-       V4L2_CID_CODEC_LOOP_FILTER_H264_ENABLE = 0,
-       V4L2_CID_CODEC_LOOP_FILTER_H264_DISABLE = 1,
-       V4L2_CID_CODEC_LOOP_FILTER_H264_DISABLE_AT_BOUNDARY = 2,
-};
+/* For both decoding and encoding */
 
 /* For decoding */
+/* common */
+#define V4L2_CID_CODEC_MFC5X_DECODE_REQ_NUM_BUFS
(V4L2_CID_CODEC_MFC5X_BASE+100)
+#define V4L2_CID_CODEC_MFC5X_DECODE_SLICE_INTERFACE
(V4L2_CID_CODEC_MFC5X_BASE+101)
 
-#define V4L2_CID_CODEC_LOOP_FILTER_MPEG4_ENABLE
(V4L2_CID_CODEC_BASE + 110)
-#define V4L2_CID_CODEC_DISPLAY_DELAY           (V4L2_CID_CODEC_BASE + 137)
-#define V4L2_CID_CODEC_REQ_NUM_BUFS            (V4L2_CID_CODEC_BASE + 140)
-#define V4L2_CID_CODEC_SLICE_INTERFACE         (V4L2_CID_CODEC_BASE + 141)
-#define V4L2_CID_CODEC_PACKED_PB               (V4L2_CID_CODEC_BASE + 142)
+/* codec specific */
+#define V4L2_CID_CODEC_MFC5X_DECODE_H264_DISPLAY_DELAY
(V4L2_CID_CODEC_MFC5X_BASE+200)
+#define V4L2_CID_CODEC_MFC5X_DECODE_MPEG4_LOOP_FILTER
(V4L2_CID_CODEC_MFC5X_BASE+220)
+#define V4L2_CID_CODEC_MFC5X_DECODE_MPEG4_PACKED_PB
(V4L2_CID_CODEC_MFC5X_BASE+221)
+
+/* For encoding */
+/* common */
+#define V4L2_CID_CODEC_MFC5X_ENCODE_GOP_SIZE
(V4L2_CID_CODEC_MFC5X_BASE+300)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_MULTI_SLICE_MODE
(V4L2_CID_CODEC_MFC5X_BASE+301)
+enum v4l2_codec_mfc5x_encode_multi_slice_mode {
+       V4L2_CODEC_MFC5X_ENCODE_MULTI_SLICE_MODE_DISABLE                = 0,
+       V4L2_CODEC_MFC5X_ENCODE_MULTI_SLICE_MODE_MACROBLOCK_COUNT       = 1,
+       V4L2_CODEC_MFC5X_ENCODE_MULTI_SLICE_MODE_BIT_COUNT              = 3,
+};
+#define V4L2_CID_CODEC_MFC5X_ENCODE_MULTI_SLICE_MB
(V4L2_CID_CODEC_MFC5X_BASE+302)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_MULTI_SLICE_BIT
(V4L2_CID_CODEC_MFC5X_BASE+303)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_INTRA_REFRESH_MB
(V4L2_CID_CODEC_MFC5X_BASE+304)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_PAD_CTRL_ENABLE
(V4L2_CID_CODEC_MFC5X_BASE+305)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_PAD_LUMA_VALUE
(V4L2_CID_CODEC_MFC5X_BASE+306)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_PAD_CB_VALUE
(V4L2_CID_CODEC_MFC5X_BASE+307)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_PAD_CR_VALUE
(V4L2_CID_CODEC_MFC5X_BASE+308)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_RC_FRAME_ENABLE
(V4L2_CID_CODEC_MFC5X_BASE+309)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_RC_BIT_RATE
(V4L2_CID_CODEC_MFC5X_BASE+310)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_RC_REACTION_PARAM
(V4L2_CID_CODEC_MFC5X_BASE+311)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_STREAM_SIZE
(V4L2_CID_CODEC_MFC5X_BASE+312)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_PICTURE_COUNT
(V4L2_CID_CODEC_MFC5X_BASE+313)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_FRAME_TYPE
(V4L2_CID_CODEC_MFC5X_BASE+314)
+enum v4l2_codec_mfc5x_encode_frame_type {
+       V4L2_CODEC_MFC5X_ENCODE_FRAME_TYPE_NOT_CODED    = 0,
+       V4L2_CODEC_MFC5X_ENCODE_FRAME_TYPE_I_FRAME      = 1,
+       V4L2_CODEC_MFC5X_ENCODE_FRAME_TYPE_P_FRAME      = 2,
+       V4L2_CODEC_MFC5X_ENCODE_FRAME_TYPE_B_FRAME      = 3,
+       V4L2_CODEC_MFC5X_ENCODE_FRAME_TYPE_SKIPPED      = 4,
+       V4L2_CODEC_MFC5X_ENCODE_FRAME_TYPE_OTHERS       = 5,
+};
+#define V4L2_CID_CODEC_MFC5X_ENCODE_FORCE_FRAME_TYPE
(V4L2_CID_CODEC_MFC5X_BASE+315)
+enum v4l2_codec_mfc5x_encode_force_frame_type {
+       V4L2_CODEC_MFC5X_ENCODE_FORCE_FRAME_TYPE_NOT_CODED      = 1,
+       V4L2_CODEC_MFC5X_ENCODE_FORCE_FRAME_TYPE_I_FRAME        = 2,
+};
+#define V4L2_CID_CODEC_MFC5X_ENCODE_VBV_BUF_SIZE
(V4L2_CID_CODEC_MFC5X_BASE+316)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_SEQ_HDR_MODE
(V4L2_CID_CODEC_MFC5X_BASE+317)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_FRAME_SKIP_MODE
(V4L2_CID_CODEC_MFC5X_BASE+318)
+enum v4l2_codec_mfc5x_encode_frame_skip_mode {
+       V4L2_CODEC_MFC5X_ENCODE_FRAME_SKIP_MODE_DISABLE         = 0,
+       V4L2_CODEC_MFC5X_ENCODE_FRAME_SKIP_MODE_LEVEL           = 1,
+       V4L2_CODEC_MFC5X_ENCODE_FRAME_SKIP_MODE_VBV_BUF_SIZE    = 2,
+};
+#define V4L2_CID_CODEC_MFC5X_ENCODE_RC_FIXED_TARGET_BIT
(V4L2_CID_CODEC_MFC5X_BASE+319)
+
+/* codec specific */
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_B_FRAMES
(V4L2_CID_CODEC_MFC5X_BASE+400)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_PROFILE
(V4L2_CID_CODEC_MFC5X_BASE+401)
+enum v4l2_codec_mfc5x_encode_h264_profile {
+       V4L2_CODEC_MFC5X_ENCODE_H264_PROFILE_MAIN       = 0,
+       V4L2_CODEC_MFC5X_ENCODE_H264_PROFILE_HIGH       = 1,
+       V4L2_CODEC_MFC5X_ENCODE_H264_PROFILE_BASELINE   = 2,
+};
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_LEVEL
(V4L2_CID_CODEC_MFC5X_BASE+402)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_INTERLACE
(V4L2_CID_CODEC_MFC5X_BASE+403)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_LOOP_FILTER_MODE
(V4L2_CID_CODEC_MFC5X_BASE+404)
+enum v4l2_codec_mfc5x_encode_h264_loop_filter {
+       V4L2_CODEC_MFC5X_ENCODE_H264_LOOP_FILTER_ENABLE                 = 0,
+       V4L2_CODEC_MFC5X_ENCODE_H264_LOOP_FILTER_DISABLE                = 1,
+       V4L2_CODEC_MFC5X_ENCODE_H264_LOOP_FILTER_DISABLE_AT_BOUNDARY    = 2,
+};
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_LOOP_FILTER_ALPHA
(V4L2_CID_CODEC_MFC5X_BASE+405)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_LOOP_FILTER_BETA
(V4L2_CID_CODEC_MFC5X_BASE+406)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_ENTROPY_MODE
(V4L2_CID_CODEC_MFC5X_BASE+407)
+enum v4l2_codec_mfc5x_encode_h264_entropy_mode {
+       V4L2_CODEC_MFC5X_ENCODE_H264_ENTROPY_MODE_CAVLC = 0,
+       V4L2_CODEC_MFC5X_ENCODE_H264_ENTROPY_MODE_CABAC = 1,
+};
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_MAX_REF_PIC
(V4L2_CID_CODEC_MFC5X_BASE+408)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_NUM_REF_PIC_4P
(V4L2_CID_CODEC_MFC5X_BASE+409)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_8X8_TRANSFORM
(V4L2_CID_CODEC_MFC5X_BASE+410)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_RC_MB_ENABLE
(V4L2_CID_CODEC_MFC5X_BASE+411)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_RC_FRAME_RATE
(V4L2_CID_CODEC_MFC5X_BASE+412)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_RC_FRAME_QP
(V4L2_CID_CODEC_MFC5X_BASE+413)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_RC_MIN_QP
(V4L2_CID_CODEC_MFC5X_BASE+414)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_RC_MAX_QP
(V4L2_CID_CODEC_MFC5X_BASE+415)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_RC_MB_DARK
(V4L2_CID_CODEC_MFC5X_BASE+416)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_RC_MB_SMOOTH
(V4L2_CID_CODEC_MFC5X_BASE+417)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_RC_MB_STATIC
(V4L2_CID_CODEC_MFC5X_BASE+418)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_RC_MB_ACTIVITY
(V4L2_CID_CODEC_MFC5X_BASE+419)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_RC_P_FRAME_QP
(V4L2_CID_CODEC_MFC5X_BASE+420)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_RC_B_FRAME_QP
(V4L2_CID_CODEC_MFC5X_BASE+421)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_AR_VUI_ENABLE
(V4L2_CID_CODEC_MFC5X_BASE+422)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_AR_VUI_IDC
(V4L2_CID_CODEC_MFC5X_BASE+423)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_EXT_SAR_WIDTH
(V4L2_CID_CODEC_MFC5X_BASE+424)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_EXT_SAR_HEIGHT
(V4L2_CID_CODEC_MFC5X_BASE+425)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_OPEN_GOP
(V4L2_CID_CODEC_MFC5X_BASE+426)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H264_I_PERIOD
(V4L2_CID_CODEC_MFC5X_BASE+427)
+
+#define V4L2_CID_CODEC_MFC5X_ENCODE_MPEG4_B_FRAMES
(V4L2_CID_CODEC_MFC5X_BASE+440)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_MPEG4_PROFILE
(V4L2_CID_CODEC_MFC5X_BASE+441)
+enum v4l2_codec_mfc5x_encode_mpeg4_profile {
+       V4L2_CODEC_MFC5X_ENCODE_MPEG4_PROFILE_SIMPLE            = 0,
+       V4L2_CODEC_MFC5X_ENCODE_MPEG4_PROFILE_ADVANCED_SIMPLE   = 1,
+};
+#define V4L2_CID_CODEC_MFC5X_ENCODE_MPEG4_LEVEL
(V4L2_CID_CODEC_MFC5X_BASE+442)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_MPEG4_RC_FRAME_QP
(V4L2_CID_CODEC_MFC5X_BASE+443)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_MPEG4_RC_MIN_QP
(V4L2_CID_CODEC_MFC5X_BASE+444)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_MPEG4_RC_MAX_QP
(V4L2_CID_CODEC_MFC5X_BASE+445)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_MPEG4_QUARTER_PIXEL
(V4L2_CID_CODEC_MFC5X_BASE+446)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_MPEG4_RC_P_FRAME_QP
(V4L2_CID_CODEC_MFC5X_BASE+447)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_MPEG4_RC_B_FRAME_QP
(V4L2_CID_CODEC_MFC5X_BASE+448)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_MPEG4_VOP_TIME_RES
(V4L2_CID_CODEC_MFC5X_BASE+449)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_MPEG4_VOP_FRM_DELTA
(V4L2_CID_CODEC_MFC5X_BASE+450)
+
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H263_RC_FRAME_RATE
(V4L2_CID_CODEC_MFC5X_BASE+460)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H263_RC_FRAME_QP
(V4L2_CID_CODEC_MFC5X_BASE+461)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H263_RC_MIN_QP
(V4L2_CID_CODEC_MFC5X_BASE+462)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H263_RC_MAX_QP
(V4L2_CID_CODEC_MFC5X_BASE+463)
+#define V4L2_CID_CODEC_MFC5X_ENCODE_H263_RC_P_FRAME_QP
(V4L2_CID_CODEC_MFC5X_BASE+464)
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
