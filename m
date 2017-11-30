From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] ARM: exynos_defconfig: Enable missing drivers for
 supported Exynos boards
Date: Thu, 30 Nov 2017 19:22:28 +0100
Message-ID: <20171130182228.66czvzildgdeu6i4@kozik-lap>
References: <CGME20171130091008eucas1p1968966968d4a0d5cc98d5f481744cd72@eucas1p1.samsung.com>
 <20171130091004.22971-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:45618 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752042AbdK3SWd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 13:22:33 -0500
Received: by mail-wm0-f68.google.com with SMTP id 9so14751903wme.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Nov 2017 10:22:32 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171130091004.22971-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Thu, Nov 30, 2017 at 10:10:03AM +0100, Marek Szyprowski wrote:
> Enable following drivers for recently merged devices:
> - perf events and ARM PMU (Performance Measurement Unit) driver for all
>   Exynos boards
> - CEC and S5P CEC driver for all Exynos4 and Exynos5 boards with HDMI
> - Sii9234 DRM HDMI-MHL bridge for Trats2
> - dedicated Odroid ASoC machine driver for Odroid XU3/XU4
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
