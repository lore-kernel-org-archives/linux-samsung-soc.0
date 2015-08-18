From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] s5p-mfc: fix state check from encoder queue_setup
Date: Tue, 18 Aug 2015 15:31:59 +0200
Message-ID: <55D333CF.9000504@samsung.com>
References: <1431501925-16905-1-git-send-email-sw0312.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:52096 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751826AbbHRNcE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Aug 2015 09:32:04 -0400
In-reply-to: <1431501925-16905-1-git-send-email-sw0312.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seung-Woo Kim <sw0312.kim@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, k.debski@samsung.com, mchehab@osg.samsung.com
Cc: m.szyprowski@samsung.com, s.nawrocki@samsung.com

On 05/13/2015 09:25 AM, Seung-Woo Kim wrote:
> MFCINST_GOT_INST state is set to encoder context with set_format
> only for catpure buffer. In queue_setup of encoder called during
> reqbufs, it is checked MFCINST_GOT_INST state for both capture
> and output buffer. So this patch fixes to encoder to check
> MFCINST_GOT_INST state only for capture buffer from queue_setup.
> 
> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>

Looks OK.

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej


> ---
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
> index e65993f..2e57e9f 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
> @@ -1819,11 +1819,12 @@ static int s5p_mfc_queue_setup(struct vb2_queue *vq,
>  	struct s5p_mfc_ctx *ctx = fh_to_ctx(vq->drv_priv);
>  	struct s5p_mfc_dev *dev = ctx->dev;
>  
> -	if (ctx->state != MFCINST_GOT_INST) {
> -		mfc_err("inavlid state: %d\n", ctx->state);
> -		return -EINVAL;
> -	}
>  	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> +		if (ctx->state != MFCINST_GOT_INST) {
> +			mfc_err("inavlid state: %d\n", ctx->state);
> +			return -EINVAL;
> +		}
> +
>  		if (ctx->dst_fmt)
>  			*plane_count = ctx->dst_fmt->num_planes;
>  		else
> 
