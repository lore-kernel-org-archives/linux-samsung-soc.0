From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] videobuf2-core: make checking condition more strict
Date: Wed, 20 Aug 2014 11:26:14 +0200
Message-ID: <53F469B6.8050403@samsung.com>
References: <1408504315-3114-1-git-send-email-zhaowei.yuan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:10520 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750819AbaHTJ0Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Aug 2014 05:26:24 -0400
In-reply-to: <1408504315-3114-1-git-send-email-zhaowei.yuan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Zhaowei Yuan <zhaowei.yuan@samsung.com>, jtp.park@samsung.com
Cc: linux-media@vger.kernel.org, k.debski@samsung.com, m.chehab@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, hverkuil@xs4all.nl

On 20/08/14 05:11, Zhaowei Yuan wrote:
> It's also invalid that plane_no equals to vb->num_planes

The patch looks good to me but I would make the summary line more 
specific, e.g. "vb2: fix plane index sanity check in vb2_plane_cookie()".

I think this patch should be backported to the stable trees.

> Signed-off-by: Zhaowei Yuan <zhaowei.yuan@samsung.com>
> ---
>  drivers/media/v4l2-core/videobuf2-core.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/videobuf2-core.c b/drivers/media/v4l2-core/videobuf2-core.c
> index c359006..1ae4e57 100644
> --- a/drivers/media/v4l2-core/videobuf2-core.c
> +++ b/drivers/media/v4l2-core/videobuf2-core.c
> @@ -1130,7 +1130,7 @@ EXPORT_SYMBOL_GPL(vb2_plane_vaddr);
>   */
>  void *vb2_plane_cookie(struct vb2_buffer *vb, unsigned int plane_no)
>  {
> -	if (plane_no > vb->num_planes || !vb->planes[plane_no].mem_priv)
> +	if (plane_no >= vb->num_planes || !vb->planes[plane_no].mem_priv)
>  		return NULL;
> 
>  	return call_ptr_memop(vb, cookie, vb->planes[plane_no].mem_priv);
> --
> 1.7.9.5

-- 
Regards,
Sylwester
