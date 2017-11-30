From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] ARM: multi_v7_defconfig: Enable missing drivers for
 supported Exynos boards
Date: Thu, 30 Nov 2017 19:22:42 +0100
Message-ID: <20171130182242.fozfzan72bjr7bwn@kozik-lap>
References: <20171130091004.22971-1-m.szyprowski@samsung.com>
 <CGME20171130091009eucas1p195871b12e598293afca3c74861b8c5ac@eucas1p1.samsung.com>
 <20171130091004.22971-2-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:44556 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752042AbdK3SWq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 13:22:46 -0500
Received: by mail-wm0-f68.google.com with SMTP id t8so14764889wmc.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Nov 2017 10:22:45 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171130091004.22971-2-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Thu, Nov 30, 2017 at 10:10:04AM +0100, Marek Szyprowski wrote:
> Enable following drivers for recently merged devices:
> - CEC and S5P CEC driver for all Exynos4 and Exynos5 boards with HDMI
> - Sii9234 DRM HDMI-MHL bridge for Trats2
> - dedicated Odroid ASoC machine driver for Odroid XU3/XU4
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
