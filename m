From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 2/4] ARM: dts: exynos4: fix power domain for
 sysmmu-rotator device
Date: Sat, 14 Nov 2015 20:37:43 +0900
Message-ID: <56471D07.7050707@samsung.com>
References: <5645A0C5.3090006@samsung.com>
 <1447421386-8084-1-git-send-email-m.szyprowski@samsung.com>
 <1447421386-8084-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:36615 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750998AbbKNLhs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Nov 2015 06:37:48 -0500
Received: by pacdm15 with SMTP id dm15so125966680pac.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Nov 2015 03:37:48 -0800 (PST)
In-Reply-To: <1447421386-8084-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: k.kozlowski.k@gmail.com, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

W dniu 13.11.2015 o 22:29, Marek Szyprowski pisze:
> Rotator device and it's SYSMMU belongs to different power domains
> on various Exynos4 SoC revisions: LCD0 for 4210 and TOP for 4x12. This
> patch fixes this by moving power-domains property to exynos4210.dtsi. TOP
> power domain is always enabled and it is not represented in DTS.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi    | 1 -
>  arch/arm/boot/dts/exynos4210.dtsi | 4 ++++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
