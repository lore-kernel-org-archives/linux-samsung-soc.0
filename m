From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] [V2] ARM: dts: exynos: Add ADCs on 4412 and 5422 based
 odroid boards.
Date: Fri, 18 Nov 2016 14:05:01 +0200
Message-ID: <20161118120501.GA17929@kozik-lap>
References: <26f50ea7-9737-23dd-7d3c-92f5b4002860@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34432 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753488AbcKRMFH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 07:05:07 -0500
Received: by mail-wm0-f66.google.com with SMTP id g23so5519218wme.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Nov 2016 04:05:07 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <26f50ea7-9737-23dd-7d3c-92f5b4002860@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Fri, Nov 18, 2016 at 10:55:04AM +0100, Markus Reichl wrote:
> Odroid-X, -X2, -XU3 and -XU4 have SOC-ADC routed to an external connector.
> Enable the ADC for use as iio-device.
> 
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> ---
> Changes in V2:
> 	move ADC node from exynos4412-odroid-common.dtsi to
> 	exynos4412-odroidx.dts to exclude U3 as pointed to by Marek.
> 
> Tested on U3, X, XU3 and XU4.
> ---
>  arch/arm/boot/dts/exynos4412-odroidx.dts           |  5 +++++
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 11 +++++++++++
>  2 files changed, 16 insertions(+)
>

Thanks, applied.

Best regards,
Krzysztof
