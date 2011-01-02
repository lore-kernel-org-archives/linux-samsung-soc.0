From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH] [media] s5p-fimc: modify name of function for uniformity
Date: Sun, 02 Jan 2011 21:32:45 +0100
Message-ID: <4D20E0ED.5050407@gmail.com>
References: <1293687343-27424-1-git-send-email-sungchun.kang@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:65178 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751257Ab1ABUcv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Jan 2011 15:32:51 -0500
In-Reply-To: <1293687343-27424-1-git-send-email-sungchun.kang@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sungchun Kang <sungchun.kang@samsung.com>
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, s.nawrocki@samsung.com, kgene.kim@samsung.com

On 12/30/2010 06:35 AM, Sungchun Kang wrote:
> This patch modified function name about add or pop queue.
>
> Reviewed-by Jonghun Han<jonghun.han@samsung.com>
> Signed-off-by: Sungchun Kang<sungchun.kang@samsung.com>
> ---
> This patch is depended on:
> http://git.infradead.org/users/kmpark/linux-2.6-samsung/shortlog/refs/heads/vb2-mfc-fimc
>
> drivers/media/video/s5p-fimc/fimc-capture.c |    2 +-
>   drivers/media/video/s5p-fimc/fimc-core.h    |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/video/s5p-fimc/fimc-capture.c b/drivers/media/video/s5p-fimc/fimc-capture.c
> index 4e4441f..fdef450 100644
> --- a/drivers/media/video/s5p-fimc/fimc-capture.c
> +++ b/drivers/media/video/s5p-fimc/fimc-capture.c
> @@ -155,7 +155,7 @@ int fimc_vid_cap_buf_queue(struct fimc_dev *fimc,
>   		return ret;
>
>   	if (test_bit(ST_CAPT_STREAM,&fimc->state)) {
> -		fimc_pending_queue_add(cap, fimc_vb);
> +		pending_queue_add(cap, fimc_vb);
>   	} else {
>   		/* Setup the buffer directly for processing. */
>   		int buf_id = (cap->reqbufs_count == 1) ? -1 : cap->buf_index;
> diff --git a/drivers/media/video/s5p-fimc/fimc-core.h b/drivers/media/video/s5p-fimc/fimc-core.h
> index 1f1beaa..5bd9d93 100644
> --- a/drivers/media/video/s5p-fimc/fimc-core.h
> +++ b/drivers/media/video/s5p-fimc/fimc-core.h
> @@ -668,7 +668,7 @@ active_queue_pop(struct fimc_vid_cap *vid_cap)
>   }
>
>   /* Add video buffer to the capture pending buffers queue */
> -static inline void fimc_pending_queue_add(struct fimc_vid_cap *vid_cap,
> +static inline void pending_queue_add(struct fimc_vid_cap *vid_cap,
>   					  struct fimc_vid_buffer *buf)
>   {
>   	list_add_tail(&buf->list,&vid_cap->pending_buf_q);

Nack. However these functions are static it seems more appropriate
to do the opposite, i.e. add a fimc_ prefix to the complementary 
functions, as well to those dealing with the active queue.

--
Regards,
Sylwester
