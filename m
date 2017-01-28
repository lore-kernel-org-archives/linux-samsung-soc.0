From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 3/3] arm64: dts: exynos: Add initial configuration for
 DISP clocks for TM2/TM2e
Date: Sat, 28 Jan 2017 17:28:46 +0200
Message-ID: <20170128152846.ychltfggmlrgrwwx@kozik-lap>
References: <20170126193529.5dyynx5dpmtmje5b@kozik-lap>
 <CGME20170127112056eucas1p15ced94a57821f980445c86f1393d5a94@eucas1p1.samsung.com>
 <1485516042-32291-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35383 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752001AbdA1P3w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 28 Jan 2017 10:29:52 -0500
Received: by mail-wm0-f67.google.com with SMTP id d140so65759917wmd.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 28 Jan 2017 07:29:26 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1485516042-32291-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

On Fri, Jan 27, 2017 at 12:20:42PM +0100, Marek Szyprowski wrote:
> Add initial clock configuration for display subsystem for Exynos5433
> based TM2/TM2e boards in device tree in order to avoid dependency on the
> configuration left by the bootloader. This initial configuration is also
> needed to ensure that display subsystem is operational if display power
> domain gets turned off before clock controller is probed and the inital
> clock configuration left by the bootloader saved.
> 
> TM2 and TM2e uses different rate for DISP PLL clock, but for better
> maintainability all 'assigned-clocks-*' properties for DISP CMU are
> defines in each board dts instead of redefining the rates property.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Changelog:
> v3:
> - added comment about DISP CMU clocks configuration on TM2 and TM2e
> ---
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 12 --------
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      | 34 ++++++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     | 34 ++++++++++++++++++++++
>  3 files changed, 68 insertions(+), 12 deletions(-)
>

Does not apply. Are you sure that you generated it on linux-next?

error: patch failed: arch/arm64/boot/dts/exynos/exynos5433-tm2.dts:18
error: arch/arm64/boot/dts/exynos/exynos5433-tm2.dts: patch does not apply
Patch failed at 0001 arm64: dts: exynos: Add initial configuration for DISP clocks for TM2/TM2e

Best regards,
Krzysztof
