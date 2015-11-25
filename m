From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4: unify g2d device node with other devices
Date: Thu, 26 Nov 2015 08:57:33 +0900
Message-ID: <56564AED.8000505@samsung.com>
References: <1448456398-32027-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:24028 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751198AbbKYX5e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Nov 2015 18:57:34 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYE00EQ5AJWRA80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Nov 2015 23:57:32 +0000 (GMT)
In-reply-to: <1448456398-32027-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 25.11.2015 21:59, Marek Szyprowski wrote:
> G2D device is always available and doesn't depend on any external (board
> specific) peripherals, so it can be unconditionally enabled.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-origen.dts         | 4 ----
>  arch/arm/boot/dts/exynos4210-smdkv310.dts       | 4 ----
>  arch/arm/boot/dts/exynos4210.dtsi               | 1 -
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 4 ----
>  arch/arm/boot/dts/exynos4412-origen.dts         | 4 ----
>  arch/arm/boot/dts/exynos4412-smdk4412.dts       | 4 ----
>  arch/arm/boot/dts/exynos4x12.dtsi               | 1 -
>  7 files changed, 22 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
