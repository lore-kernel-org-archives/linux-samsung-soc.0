From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: exynos: Add power button for Odroid XU3/4
Date: Mon, 18 Sep 2017 20:37:54 +0200
Message-ID: <20170918183754.y6bkp7jy3s4qsaq3@kozik-lap>
References: <CGME20170912115804eucas1p1959db12366143b87d14725e227520854@eucas1p1.samsung.com>
 <1505217474-14725-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36616 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752898AbdIRSh5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 18 Sep 2017 14:37:57 -0400
Received: by mail-wm0-f67.google.com with SMTP id r136so1731355wmf.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Sep 2017 11:37:57 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1505217474-14725-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Brian Kim <brian.kim@hardkernel.com>

On Tue, Sep 12, 2017 at 01:57:54PM +0200, Marek Szyprowski wrote:
> From: Brian Kim <brian.kim@hardkernel.com>
> 
> The power button (SW2) on Odroid XU3/4 is connected to the PWRON pin
> of the S2MPS11 PMIC.
> 
> The S2MPS11 datasheet says that ONOB pin operates as 'PWRON key active
> low signal'. In fact, S2MPS11 PMIC acts as a 16ms debouce filter and
> signal inverter, thus effectively repeating PWRON (active high) to ONOB
> pin (active low).
> 
> ONOB PMIC pin is then connected to XEINT3 SoC pin, so we get the state
> of the power button on the gpx0-3 GPIO.
> 
> This patch adds device-tree bindings for the power button of Odroid
> XU3/4 boards.
> 
> Signed-off-by: Brian Kim <brian.kim@hardkernel.com>
> [mszyprow: extended commit message, added comments and fixed minor
>  issues in the dts]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Changelog:
> 
> v2: fixed minor issues pointed by Krzysztof Kozlowski:
> - added comments to dts
> - extended commit message
> - removed useless interrupts property
> - used proper macros for gpios
> - removed gpio prefix
> 
> v1: initial submission
> https://patchwork.kernel.org/patch/9605023/
> 
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>

Thanks, Marek (and Bartlomiej from other thread), for working on these
patches. Nice job!

Applied.

Best regards,
Krzysztof
