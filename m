From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 1/4] ARM: dts: exynos4: add rotator nodes
Date: Sat, 14 Nov 2015 20:37:41 +0900
Message-ID: <56471D05.6020709@samsung.com>
References: <5645A0C5.3090006@samsung.com>
 <1447421386-8084-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:36600 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750994AbbKNLhq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Nov 2015 06:37:46 -0500
Received: by pacdm15 with SMTP id dm15so125966284pac.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Nov 2015 03:37:46 -0800 (PST)
In-Reply-To: <1447421386-8084-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: k.kozlowski.k@gmail.com, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

W dniu 13.11.2015 o 22:29, Marek Szyprowski pisze:
> This patch adds device node for Rotator device to Exynos 4210 and 4x12
> device tree files.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi    | 9 +++++++++
>  arch/arm/boot/dts/exynos4210.dtsi | 4 ++++
>  arch/arm/boot/dts/exynos4x12.dtsi | 4 ++++
>  3 files changed, 17 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
