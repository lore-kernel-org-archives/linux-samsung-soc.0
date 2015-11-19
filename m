From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4210-universal_c210: disable DMA for
 UARTs
Date: Thu, 19 Nov 2015 21:37:08 +0900
Message-ID: <564DC274.1090900@samsung.com>
References: <1447684614-25336-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:32893 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756066AbbKSMhM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2015 07:37:12 -0500
Received: by pabfh17 with SMTP id fh17so82986605pab.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2015 04:37:12 -0800 (PST)
In-Reply-To: <1447684614-25336-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: k.kozlowski.k@gmail.com, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

W dniu 16.11.2015 o 23:36, Marek Szyprowski pisze:
> PDMA for UART devices seems not to be working properly on Exynos 4210
> revision 0 used in Universal C210 boards, so disable it to let one to
> use UART devices (driver defaults to PIO mode if DMA is not present).
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-universal_c210.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Oh, DMA on UART strikes back.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
