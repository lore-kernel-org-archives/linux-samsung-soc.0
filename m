From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/3] Media devices support for Exynos5433 TM2 board
Date: Fri, 18 Nov 2016 14:13:10 +0200
Message-ID: <20161118121310.GA13153@kozik-lap>
References: <CGME20161117090207eucas1p2a928c452b520e75a9dae420fabfd9adb@eucas1p2.samsung.com>
 <1479373317-11711-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36574 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753626AbcKRMNS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 07:13:18 -0500
Received: by mail-wm0-f65.google.com with SMTP id m203so5540899wma.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Nov 2016 04:13:18 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1479373317-11711-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Thu, Nov 17, 2016 at 10:01:54AM +0100, Marek Szyprowski wrote:
> Hi!
> 
> This patchset adds support for various media devices found in Exynos 5433
> SoC and enables them on TM2 board. Patches are prepared on top of my
> previous patchset with fixes for Exynos 5433 TM2 board (see "Fixes for
> Exynos5433 TM2 board" thread).
> 
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
> 
> 
> Changelog:
> v2:
> - rearranged nodes in alphabetical order
> - added irq type flags
> - moved aliases to board dts
> - unified order of clock-names and clocks properties

This needs rebasing:
Applying: arm64: dts: exynos: TM2 - add support for GScaler devices
error: patch failed: arch/arm64/boot/dts/exynos/exynos5433-tm2.dts:30
error: arch/arm64/boot/dts/exynos/exynos5433-tm2.dts: patch does not
apply
Patch failed at 0001 arm64: dts: exynos: TM2 - add support for GScaler
devices

BR,
Krzysztof
