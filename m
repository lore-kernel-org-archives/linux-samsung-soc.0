From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: add drivers for Exynos4210
 Universal C210 board
Date: Thu, 19 Nov 2015 21:15:01 +0900
Message-ID: <564DBD45.40807@samsung.com>
References: <1447933935-3091-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:35627 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750775AbbKSMPH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2015 07:15:07 -0500
Received: by pacej9 with SMTP id ej9so79739192pac.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2015 04:15:06 -0800 (PST)
In-Reply-To: <1447933935-3091-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: k.kozlowski.k@gmail.com, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

W dniu 19.11.2015 o 20:52, Marek Szyprowski pisze:
> This patch enables drivers needed to get Exynos 4210 Universal C210 board
> working: MAX8998 MFD and regulators, GPIO-based bit-bang SPI, Exynos DRM
> FIMD parallel output and Samsung LD9040 RGB panel.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
