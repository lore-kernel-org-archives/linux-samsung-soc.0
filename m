Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262500;
	b=RCfKhOEQTHMTA7x0wQw47dOkdOduOiZjXCCfsIFrI46+uuyYaUSzux7Ydq3SyJsuUcY5
	 sBK0V5TFzXtF1HU7J4fsP+MvtuhF7VF6NMXImka7LZs5ri5dgwkAmhPpxVrcdwAakyihO
	 593cbd5V+/8RzAGgiNjLtWCX+wYX2YDmL4FM/eaOpZmpLle9ZDOTbEI0HuKI+YWxouxe3
	 muGEIFCJX44eZb/Dh5zKZuqr+JL/XafmYZ7L/D4T1q2tEtOoegfBBVzb1o6DGqMC+BGJ3
	 F+x5hYhPQEye3SdKZr66IDzQeqWICiCuLWsElwzLKQdMECAXEHeX12xtqmtO8AvMDcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262500;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=Kf7JvF1WzWZ9AwviwgEJy2FgeoW4LkvsdrSvH+WiNBU=;
	b=dJ4O3dlpqv96Uee+XX6HN9vnU0WohMyDm2TpooZ0W5tNv19vos4FF2A0QS8AhWbMKGde
	 xsrTibNCujCiujMmDzvkHE+YgKo9ETbk4C9GnBQX8l6Tbp6WmaFhXZlh4Okm1UtlVEJKt
	 NXdx4DrFfUGq8ur/NN+4HaaFFx/gebawE1gadcfFPEEOFoVrfGU0HHZ/T9D1SOSuG6dZf
	 d/xubPS1c6AnKE1/BJliKz7BWJ2y9cllS0Et4H9l2JKBT46eSTTEUct20LurCgBWqSQhH
	 KejLXvHeteYhNQELYQIMIRvgWmPdF4bX03vQVP+okdHUW/xg0UhftopdVZv8lPw9O9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=NSja48IB;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B28606A31A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2026 08:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16B28606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=NSja48IB
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261029082817euoutp02c1c07bae0019334171e0705978e4cd51~i8r2HRva02653526535euoutp02c
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2026 08:28:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261029082817euoutp02c1c07bae0019334171e0705978e4cd51~i8r2HRva02653526535euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793262497;
	bh=Kf7JvF1WzWZ9AwviwgEJy2FgeoW4LkvsdrSvH+WiNBU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=NSja48IBqVcx0BUcmlpc2gwtcUDvB9+Vw6FtO8yBtICndQWgyIfIQw8rnsE3pOqBb
	 KfV5PLewuosfKSLkKiRDzwmVepOnv0BUgD2B/KjpF6edaMSFMEcn0MhNd3Ugz9R4WQ
	 Vy6f1/ixwdE41DDnVM+6j+PxCgQBjJcN76JgnqBc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261029082816eucas1p25ff90791a8e401afe8c9dd47abe2697a~i8r1m2GjN2728427284eucas1p2M;
	Thu, 29 Oct 2026 08:28:16 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261029082815eusmtip2df2a074abe4ea0fd3612973fb29f0775~i8r0UhXw62474924749eusmtip2f;
	Thu, 29 Oct 2026 08:28:15 +0000 (GMT)
Message-ID: <6ac81fac-39e9-4e19-b57f-c1c6c5fc9b9b@samsung.com>
Date: Thu, 29 Oct 2026 09:28:14 +0100
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 2/3] drm/exynos: exynos_dp: change poweron/off to
 encoder enable/disable
To: tb@a-marquet.fr, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae
	<inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
	Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Douglas Anderson <dianders@chromium.org>, Jessica
	Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	Lukas Timmermann <linux@timmermann.space>, Henrik Grimler
	<henrik@grimler.se>, Hendrik Noack <hendrik-noack@gmx.de>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261027-drm-misc-next-manta-auxbus-v1-2-3a45c3cf531d@a-marquet.fr>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261029082816eucas1p25ff90791a8e401afe8c9dd47abe2697a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261027122323eucas1p2659e431cd43431d20b3d90b4bcad4528
X-EPHeader: CA
X-CMS-RootMailID: 20261027122323eucas1p2659e431cd43431d20b3d90b4bcad4528
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
	<CGME20261027122323eucas1p2659e431cd43431d20b3d90b4bcad4528@eucas1p2.samsung.com>
	<20261027-drm-misc-next-manta-auxbus-v1-2-3a45c3cf531d@a-marquet.fr>

On 27.10.2026 13:01, Alexandre Marquet via B4 Relay wrote:
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> Current functions exynos_dp_poweron()/exynos_dp_poweroff(), that
> supposedly powers on/off the device, actually only enable the encoder
> clock. This cause issues where poweron() calls fail silently in
> analogix_dp_probe(), leading in some cases to a state were the encoder
> is never enabled but the rest of the driver assumes that it is.
>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Snow, Peach-Pit and Peach-Pi Chromebooks work fine with this change.

> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 40 +++++++++++++-------------------------
>  1 file changed, 13 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
> index 82c238829921..16b00aacd55b 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -43,39 +43,27 @@ struct exynos_dp_device {
>  	struct analogix_dp_plat_data plat_data;
>  };
>  
> -static int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *plat_data,
> -				bool enable)
> -{
> -	struct exynos_dp_device *dp = to_dp(plat_data);
> -	struct drm_encoder *encoder = &dp->encoder;
> -
> -	if (!encoder->crtc)
> -		return -EPERM;
> -
> -	exynos_drm_pipe_clk_enable(to_exynos_crtc(encoder->crtc), enable);
> -
> -	return 0;
> -}
> -
> -static int exynos_dp_poweron(struct analogix_dp_plat_data *plat_data)
> +static void exynos_dp_mode_set(struct drm_encoder *encoder,
> +			       struct drm_display_mode *mode,
> +			       struct drm_display_mode *adjusted_mode)
>  {
> -	return exynos_dp_crtc_clock_enable(plat_data, true);
>  }
>  
> -static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
> +static void exynos_dp_crtc_clock_enable(struct drm_encoder *encoder,
> +					bool enable)
>  {
> -	return exynos_dp_crtc_clock_enable(plat_data, false);
> +	if (encoder->crtc)
> +		exynos_drm_pipe_clk_enable(to_exynos_crtc(encoder->crtc), enable);
>  }
>  
> -static void exynos_dp_mode_set(struct drm_encoder *encoder,
> -			       struct drm_display_mode *mode,
> -			       struct drm_display_mode *adjusted_mode)
> +static void exynos_dp_enable(struct drm_encoder *encoder)
>  {
> +	exynos_dp_crtc_clock_enable(encoder, true);
>  }
>  
> -static void exynos_dp_nop(struct drm_encoder *encoder)
> +static void exynos_dp_disable(struct drm_encoder *encoder)
>  {
> -	/* do nothing */
> +	exynos_dp_crtc_clock_enable(encoder, false);
>  }
>  
>  static const struct drm_encoder_funcs exynos_dp_encoder_funcs = {
> @@ -84,8 +72,8 @@ static const struct drm_encoder_funcs exynos_dp_encoder_funcs = {
>  
>  static const struct drm_encoder_helper_funcs exynos_dp_encoder_helper_funcs = {
>  	.mode_set = exynos_dp_mode_set,
> -	.enable = exynos_dp_nop,
> -	.disable = exynos_dp_nop,
> +	.enable = exynos_dp_enable,
> +	.disable = exynos_dp_disable,
>  };
>  
>  static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
> @@ -171,8 +159,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
>  
>  	/* The remote port can be either a panel or a bridge */
>  	dp->plat_data.dev_type = EXYNOS_DP;
> -	dp->plat_data.power_on = exynos_dp_poweron;
> -	dp->plat_data.power_off = exynos_dp_poweroff;
>  	dp->plat_data.ops = &exynos_dp_ops;
>  
>  	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

