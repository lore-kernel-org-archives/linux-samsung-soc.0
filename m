From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] arm: dts: exynos: Enable DMA support for UART modules
 on Exynos5 SoCs
Date: Thu, 29 Dec 2016 16:09:25 +0200
Message-ID: <20161229140925.lhjytmbfv5cvbufe@kozik-lap>
References: <1481891940-10385-1-git-send-email-m.szyprowski@samsung.com>
 <1482141648-21294-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36437 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752311AbcL2OJd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Dec 2016 09:09:33 -0500
Received: by mail-lf0-f68.google.com with SMTP id t196so15723843lff.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Dec 2016 06:09:32 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1482141648-21294-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Mon, Dec 19, 2016 at 11:00:48AM +0100, Marek Szyprowski wrote:
> UART modules can use DMA for offloading data transfers and reducing
> interrupts, so enable this feature for Exynos5 boards. Tested on
> Google ChromeBook Snow (Exynos5250), Odroid XU (Exynos5410) and Odroid
> XU3 (Exynos5422) boards.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v3:
> - added Exynos5410
> - fixed serial 1/2 again, in v2 they were incorrectly swaped as a result
>   of my hurry in patch posting
> 
> v2:
> - added Exynos5250
> - fixed copy/paste typo for serial 2 and 3
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 8 ++++++++
>  arch/arm/boot/dts/exynos5410.dtsi | 8 ++++++++
>  arch/arm/boot/dts/exynos5420.dtsi | 8 ++++++++
>  3 files changed, 24 insertions(+)

Thanks, applied.

Best regards,
Krzysztof
