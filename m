From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCH 1/3] drm/exynos: don't commit if plane scaling is required
Date: Thu, 26 Mar 2015 00:19:56 +0100
Message-ID: <5513429C.6050103@gmx.net>
References: <1426775270-31137-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:59912 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750979AbbCYXUH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Mar 2015 19:20:07 -0400
In-Reply-To: <1426775270-31137-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hello,

I've just send an alternate version of this patch, which at least
exposes the 2x scaling feature (which is already alluded to in the code):
https://patchwork.kernel.org/patch/6095901/

@Gustavo: What do you think?

With best wishes,
Tobias


Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> exynos doesn't show scaled planes properly on the screen so
> disable the feature and show a message to the user.
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 2e3bc57..a95fe84 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -550,6 +550,12 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
>  		fmt = ARGB8888;
>  	}
>  
> +	if (win_data->crtc_width != win_data->src_width ||
> +	    win_data->crtc_height != win_data->src_height) {
> +		DRM_DEBUG_KMS("plane scaling not supported\n");
> +		return;
> +	}
> +
>  	/* 2x scaling feature */
>  	x_ratio = 0;
>  	y_ratio = 0;
> 
