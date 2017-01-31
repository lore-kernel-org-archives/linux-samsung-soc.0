From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 3/3 REBASED] arm64: dts: exynos: Add initial
 configuration for DISP clocks for TM2/TM2e
Date: Tue, 31 Jan 2017 21:42:43 +0200
Message-ID: <20170131194243.rqpz3b6jtf66kujj@kozik-lap>
References: <20170128152846.ychltfggmlrgrwwx@kozik-lap>
 <CGME20170130105746eucas1p1232fb56b92e5939beb7ee65670422860@eucas1p1.samsung.com>
 <1485773856-22707-1-git-send-email-m.szyprowski@samsung.com>
 <588FDCD5.10105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35975 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751749AbdAaTs5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Jan 2017 14:48:57 -0500
Received: by mail-wm0-f68.google.com with SMTP id r18so494697wmd.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2017 11:48:56 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <588FDCD5.10105@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

On Tue, Jan 31, 2017 at 09:39:49AM +0900, Chanwoo Choi wrote:
> Hi Marek,
> 
> On 2017년 01월 30일 19:57, Marek Szyprowski wrote:
> > Add initial clock configuration for display subsystem for Exynos5433
> > based TM2/TM2e boards in device tree in order to avoid dependency on the
> > configuration left by the bootloader. This initial configuration is also
> > needed to ensure that display subsystem is operational if display power
> > domain gets turned off before clock controller is probed and the inital
> > clock configuration left by the bootloader saved.
> > 
> > TM2 and TM2e uses different rate for DISP PLL clock, but for better
> > maintainability all 'assigned-clocks-*' properties for DISP CMU are
> > defines in each board dts instead of redefining the rates property.
> > 
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> > Changelog:
> > v3 resend:
> > - rebased onto Linux next-20170130
> > 
> > v3:
> > - added comment about DISP CMU clocks configuration on TM2 and TM2e
> > ---
> >  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 12 --------
> >  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      | 34 ++++++++++++++++++++++
> >  arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     | 34 ++++++++++++++++++++++
> >  3 files changed, 68 insertions(+), 12 deletions(-)
> > 

Thanks, applied.

Best regards,
Krzysztof
