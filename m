From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: exynos: Fix IRQ type flags for Exynos5433
 SoC
Date: Fri, 18 Nov 2016 09:30:03 +0200
Message-ID: <20161118073003.GA26082@kozik-lap>
References: <1479392849-18049-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34470 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751527AbcKRHaJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 02:30:09 -0500
Received: by mail-wm0-f65.google.com with SMTP id g23so3230713wme.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Nov 2016 23:30:08 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1479392849-18049-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Thu, Nov 17, 2016 at 03:27:29PM +0100, Marek Szyprowski wrote:
> Interrupt of type IRQ_TYPE_NONE is not allowed for GIC interrupts. The
> GIC requires shared interrupts to be edge rising or level high. Platform
> declares support for both. Set all interrupts type to level high, as this
> works fine - tested on Exynos5433-based TM2 board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
> Changelog:
> v2:
> - fixed also interrupts defined in exynos5433-pinctrl.dtsi
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |  22 +++-
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 129 +++++++++++----------
>  2 files changed, 85 insertions(+), 66 deletions(-)
>

Thanks, applied.

Best regards,
Krzysztof
