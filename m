From: Jonghun Han <jonghun.han@samsung.com>
Subject: RE: [RFC/PATCH 2/4] [media] s5p-fimc: Porting to videobuf 2
Date: Tue, 07 Dec 2010 15:12:13 +0900
Message-ID: <00e501cb95d5$b2de31f0$189a95d0$%han@samsung.com>
References: <1291214153-6335-1-git-send-email-s.nawrocki@samsung.com>
 <1291214153-6335-3-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:32272 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751996Ab0LGGMS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Dec 2010 01:12:18 -0500
In-reply-to: <1291214153-6335-3-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com


Sylwester Nawrocki wrote:

> -----Original Message-----
> From: linux-media-owner@vger.kernel.org [mailto:linux-media-
> owner@vger.kernel.org] On Behalf Of Sylwester Nawrocki
> Sent: Wednesday, December 01, 2010 11:36 PM
> To: linux-media@vger.kernel.org; linux-samsung-soc@vger.kernel.org
> Cc: m.szyprowski@samsung.com; kyungmin.park@samsung.com;
> s.nawrocki@samsung.com
> Subject: [RFC/PATCH 2/4] [media] s5p-fimc: Porting to videobuf 2
> 
> Porting to videobuf 2 and minor cleanup.
> Separate videobuf_queue_ops are are created for m2m
> and capture video nodes.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---


<snip>

Hi, 

> @@ -968,6 +934,11 @@ static int fimc_m2m_streamon(struct file *file, void
*priv,
>  			   enum v4l2_buf_type type)
>  {
>  	struct fimc_ctx *ctx = priv;
> +
> +	/* The source and target color format need to be set */
> +	if (~ctx->state & (FIMC_DST_FMT | FIMC_SRC_FMT))
> +		return -EINVAL;
> +
>  	return v4l2_m2m_streamon(file, ctx->m2m_ctx, type);
>  }

You had better divide a state checking according to v4l2_buf_type to make
easier 
for application to use it. For example application can have two threads 
for handling m2m device. The one is for source control(OUTPUT) and 
the other is for destination control(CAPTURE). If state checking is not
divided, 
application should consider other thread's state whether VIDIOC_S_FMT was
called or not 
before VIDIOC_STREAMON.

BRs,
