From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v5 2/2] [media] s5p-mfc: Add support for resolution change
 event
Date: Wed, 14 May 2014 11:10:02 +0200
Message-ID: <537332EA.9020702@samsung.com>
References: <1400050783-2158-1-git-send-email-arun.kk@samsung.com>
 <1400050783-2158-3-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:47816 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752836AbaENJKI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 05:10:08 -0400
In-reply-to: <1400050783-2158-3-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, k.debski@samsung.com, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, posciak@chromium.org, arunkk.samsung@gmail.com

On 14/05/14 08:59, Arun Kumar K wrote:
> From: Pawel Osciak <posciak@chromium.org>
> 
> When a resolution change point is reached, queue an event to signal the
> userspace that a new set of buffers is required before decoding can
> continue.
> 
> Signed-off-by: Pawel Osciak <posciak@chromium.org>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> ---
>  drivers/media/platform/s5p-mfc/s5p_mfc.c     |    8 ++++++++
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c |    2 ++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> index 6b04f17..f3a4576 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> @@ -349,8 +349,16 @@ static void s5p_mfc_handle_frame(struct s5p_mfc_ctx *ctx,
>  	/* All frames remaining in the buffer have been extracted  */
>  	if (dst_frame_status == S5P_FIMV_DEC_STATUS_DECODING_EMPTY) {
>  		if (ctx->state == MFCINST_RES_CHANGE_FLUSH) {
> +			static const struct v4l2_event ev_src_ch = {
> +				.type = V4L2_EVENT_SOURCE_CHANGE,
> +				.u.src_change.changes =
> +					V4L2_EVENT_SRC_CH_RESOLUTION,
> +			};
> +
>  			s5p_mfc_handle_frame_all_extracted(ctx);
>  			ctx->state = MFCINST_RES_CHANGE_END;
> +			v4l2_event_queue_fh(&ctx->fh, &ev_src_ch);
> +
>  			goto leave_handle_frame;
>  		} else {
>  			s5p_mfc_handle_frame_all_extracted(ctx);
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> index 4586186..326d8db 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> @@ -851,6 +851,8 @@ static int vidioc_subscribe_event(struct v4l2_fh *fh,
>  	switch (sub->type) {
>  	case V4L2_EVENT_EOS:
>  		return v4l2_event_subscribe(fh, sub, 2, NULL);
> +	case V4L2_EVENT_SOURCE_CHANGE:
> +		return v4l2_src_change_event_subscribe(fh, sub);
>  	default:
>  		return -EINVAL;
>  	}
