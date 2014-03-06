From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/2] Move header files from dt-bindings/clk to dt-bindings/clock
Date: Thu,  6 Mar 2014 11:34:42 +0530
Message-ID: <1394085884-13081-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:54569 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751417AbaCFGKm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Mar 2014 01:10:42 -0500
Received: by mail-pb0-f45.google.com with SMTP id uo5so2144357pbc.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2014 22:10:41 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@maxim.org.za, plagnioj@jcrosoft.com, kgene.kim@samsung.com, t.figa@samsung.com

Clock related headers files are mostly located in include/dt-bindings/clock
folder. There are only 2 header files left in include/dt-bindings/clk. Move them
to the most used folder.

All changes related to a single file movement are contained in a single patch
to avoid any build breakage.

The patches are based next-20140305.

Tushar Behera (2):
  dt-bindings: clock: Move at91.h to dt-bindigs/clock
  dt-bindings: clock: Move exynos-audss-clk.h to dt-bindings/clock

 .../devicetree/bindings/clock/at91-clock.txt       |    2 +-
 arch/arm/boot/dts/exynos5250.dtsi                  |    2 +-
 arch/arm/boot/dts/exynos5420.dtsi                  |    2 +-
 arch/arm/boot/dts/sama5d3.dtsi                     |    2 +-
 arch/arm/boot/dts/sama5d3_mci2.dtsi                |    2 +-
 arch/arm/boot/dts/sama5d3_tcb1.dtsi                |    2 +-
 arch/arm/boot/dts/sama5d3_uart.dtsi                |    2 +-
 drivers/clk/samsung/clk-exynos-audss.c             |    2 +-
 include/dt-bindings/{clk => clock}/at91.h          |    0
 .../dt-bindings/{clk => clock}/exynos-audss-clk.h  |    0
 10 files changed, 8 insertions(+), 8 deletions(-)
 rename include/dt-bindings/{clk => clock}/at91.h (100%)
 rename include/dt-bindings/{clk => clock}/exynos-audss-clk.h (100%)

-- 
1.7.9.5
