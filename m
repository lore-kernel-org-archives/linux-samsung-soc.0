From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos5422-odroidxu3*: use peripheral mode for
 dwc3_1
Date: Thu, 19 Nov 2015 21:33:17 +0900
Message-ID: <564DC18D.3000700@samsung.com>
References: <1447933882-3030-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:32921 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750815AbbKSMdW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2015 07:33:22 -0500
Received: by pabfh17 with SMTP id fh17so82899914pab.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2015 04:33:21 -0800 (PST)
In-Reply-To: <1447933882-3030-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: k.kozlowski.k@gmail.com, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

W dniu 19.11.2015 o 20:51, Marek Szyprowski pisze:
> DWC3 device found on Exynos SoCs cannot work in OTG mode alone, because
> it lacks some OTG related control part. OTG mode operation is possible
> only with external hardware logic (usually GPIO-based) specific to
> the board. Right now, however, there is no driver for such logic and no
> bindings, so the OTG mode is disfunctional at all (this means that it

s/disfunctional/dysfunctional/
(no need to resend, this can be fixed when applying)

> doesn't work as a peripheral nor as a host). This patch sets the operation
> mode to peripheral to get DWC3_1 device at least somehow working. This can
> be later updated, when proper OTG driver and bindings get developed.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts | 2 +-
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Explanation makes sense.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
