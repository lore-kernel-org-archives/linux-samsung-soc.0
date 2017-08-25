From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 1/9] drm/exynos: mixer: fix chroma comment in
 vp_video_buffer()
Date: Fri, 25 Aug 2017 12:03:38 +0900
Message-ID: <599F938A.6080608@samsung.com>
References: <20170822141944.8138-1-tjakobi@math.uni-bielefeld.de>
        <CGME20170822142003epcas2p44192b3895f42da5b2c0b0e2ece0ebc9b@epcas2p4.samsung.com>
        <20170822141944.8138-2-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47657 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754220AbdHYDDm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 23:03:42 -0400
In-reply-to: <20170822141944.8138-2-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com



2017년 08월 22일 23:19에 Tobias Jakobi 이(가) 쓴 글:
> The current comment sounds like the division op is done to
> compensate for some hardware erratum. But the chroma plane
> having half the height of the luma plane is just the way
> NV12/NV21 is defined, so clarify this behaviour.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index a998a8dd783c..c6d6f6d42900 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -532,7 +532,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
>  	/* setting size of input image */
>  	vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(fb->pitches[0]) |
>  		VP_IMG_VSIZE(fb->height));
> -	/* chroma height has to reduced by 2 to avoid chroma distorions */
> +	/* the chroma plane for NV12/NV21 is half the height of the luma plane */

WARNING: line over 80 characters
#86: FILE: drivers/gpu/drm/exynos/exynos_mixer.c:535:
+	/* the chroma plane for NV12/NV21 is half the height of the luma plane */

I just removed a word, 'the', in front of 'chroma' word.

Thanks,
Inki Dae


>  	vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(fb->pitches[0]) |
>  		VP_IMG_VSIZE(fb->height / 2));
>  
> 
