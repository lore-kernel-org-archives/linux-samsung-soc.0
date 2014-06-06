From: Kevin Hilman <khilman@linaro.org>
Subject: exynos5420-peach-pi: linux-next boot fails unless mau_epll left enabled?
Date: Thu, 05 Jun 2014 17:15:42 -0700
Message-ID: <7hoay6sxjl.fsf@paris.lan>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:41586 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751384AbaFFAPp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jun 2014 20:15:45 -0400
Received: by mail-pb0-f50.google.com with SMTP id ma3so1819592pbc.23
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Jun 2014 17:15:45 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, dianders@google.com, Olof Johansson <olof@lixom.net>, "Turquette, Mike" <mturquette@linaro.org>, javier.martinez@collabora.co.uk

Hello,

I'm trying to boot next-20140605[1] on my recently arrived Chromebook2
(peach-pi) and was not getting to userspace.  Comparing notes with Doug
Anderson, his was booting just fine, so after some debugging and adding
'clk_ignore_unused' to the command-line, it started booting fine.

So then, I tracked it down to which clock was causing the problems and
found that it's the mau_epll clock gating that's causing the problem,
and leaving it enabled[1] allows me to boot again.

Any ideas what's going on here?  

And in particular, any ideas why it would affect my board and not other
boards like Doug's?

Thanks,

Kevin

[1] Using this defconfig:
https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+/master/eclass/cros-kernel/exynos5_defconfig

[2] 
diff --git a/drivers/clk/samsung/clk-exynos5420.c
b/drivers/clk/samsung/clk-exynos5420.c
index 61eccf0dd72f..ed175088ee7e 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -911,7 +911,7 @@ static struct samsung_gate_clock
exynos5x_gate_clks[] __initdata = {
                        SRC_MASK_TOP2, 24, 0, 0),

        GATE(CLK_MAU_EPLL, "mau_epll", "mout_mau_epll_clk",
-                       SRC_MASK_TOP7, 20, 0, 0),
+                       SRC_MASK_TOP7, 20, CLK_IGNORE_UNUSED, 0),

        /* sclk */
        GATE(CLK_SCLK_UART0, "sclk_uart0", "dout_uart0",
