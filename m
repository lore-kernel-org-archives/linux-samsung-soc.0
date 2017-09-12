From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 10/10] drm/exynos/mixer: enable support for 1024x768 and
 1280x1024 modes
Date: Tue, 12 Sep 2017 14:50:32 +0200
Message-ID: <d0798187-795d-7b06-ef08-bfad3a9cebc9@math.uni-bielefeld.de>
References: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
 <CGME20170906103732eucas1p16966a1fd86daf50dc2b5217dfb90785d@eucas1p1.samsung.com>
 <1504694220-15818-11-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:43599 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751439AbdILMum (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 08:50:42 -0400
In-Reply-To: <1504694220-15818-11-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

Hello Andrzej,


Andrzej Hajda wrote:
> Since HDMI can handle these modes despite of MIXER limitations lets
> enable them.
lets --> let's

Reviewed-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>


> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 5aae82b..108dccb 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -1014,6 +1014,9 @@ static int mixer_mode_valid(struct exynos_drm_crtc *crtc,
>  		(w >= 1664 && w <= 1920 && h >= 936 && h <= 1080))
>  		return MODE_OK;
>  
> +	if ((w == 1024 && h == 768) || (w == 1280 && h == 1024))
> +		return MODE_OK;
> +
>  	return MODE_BAD;
>  }
>  
> 
