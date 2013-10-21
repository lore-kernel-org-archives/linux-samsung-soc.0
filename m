From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: Arndale boot broken in -next
Date: Mon, 21 Oct 2013 15:50:10 +0530
Message-ID: <CAHbNUh2WLphNT3JCVdDFd=6AjCvROh-wCtgJhWv-q5b7q17vZw@mail.gmail.com>
References: <20131019163545.GB2443@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:54874 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752461Ab3JUKUL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Oct 2013 06:20:11 -0400
Received: by mail-wi0-f175.google.com with SMTP id hm4so3662231wib.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Oct 2013 03:20:10 -0700 (PDT)
In-Reply-To: <20131019163545.GB2443@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, Stephen Boyd <sboyd@codeaurora.org>

On 19 October 2013 22:05, Mark Brown <broonie@kernel.org> wrote:
> Hi,
>
> I've not yet had a chance to bisect this but it appears that Arndale
> boot has broken for me recently in -next; I'm getting absolutely no
> serial output at all afther the bootloader hands off to Linux so no
> useful diagnostics.  Is this a known issue?
>

On next-20131018, bisect points to following commit.

commit 65cd4f6c99c1170bd0114dbd71b978012ea44d28
Author: Stephen Boyd <sboyd@codeaurora.org>
Date:   Thu Jul 18 16:21:18 2013 -0700
Subject: arch_timer: Move to generic sched_clock framework


I don't know if this is a fix, but removing armv7-timer DT node brings
Arndale back to booting state.

diff --git a/arch/arm/boot/dts/exynos5250.dtsi
b/arch/arm/boot/dts/exynos5250.dtsi
index 9db5047..bb583f6 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -90,19 +90,6 @@
                #clock-cells = <1>;
        };

-       timer {
-               compatible = "arm,armv7-timer";
-               interrupts = <1 13 0xf08>,
-                            <1 14 0xf08>,
-                            <1 11 0xf08>,
-                            <1 10 0xf08>;
-               /* Unfortunately we need this since some versions of U-Boot
-                * on Exynos don't set the CNTFRQ register, so we need the
-                * value from DT.
-                */
-               clock-frequency = <24000000>;
-       };
-
        mct@101C0000 {
                compatible = "samsung,exynos4210-mct";
                reg = <0x101C0000 0x800>;


-- 
Tushar Behera
