From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH 4/6] ARM: dts: exynos5250: add sclk_pcm_in to audss clock controller
Date: Fri, 20 Sep 2013 14:13:55 -0700
Message-ID: <1379711637-5226-4-git-send-email-abrestic@chromium.org>
References: <1379711637-5226-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ye0-f202.google.com ([209.85.213.202]:63754 "EHLO
	mail-ye0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754337Ab3ITVOK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Sep 2013 17:14:10 -0400
Received: by mail-ye0-f202.google.com with SMTP id r14so108402yen.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Sep 2013 14:14:09 -0700 (PDT)
In-Reply-To: <1379711637-5226-1-git-send-email-abrestic@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Jiri Kosina <jkosina@suse.cz>, Rahul Sharma <rahul.sharma@samsung.com>, Leela Krishna Amudala <l.krishna@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Padmavathi Venna <padma.v@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.orglinu

The parent of sclk_pcm in the AudioSS block is div_pcm0.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
 arch/arm/boot/dts/exynos5250.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 7d7cc77..bedc7a8 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -88,6 +88,8 @@
 		compatible = "samsung,exynos5250-audss-clock";
 		reg = <0x03810000 0x0C>;
 		#clock-cells = <1>;
+		clocks = <&clock 160>;
+		clock-names = "sclk_pcm_in";
 	};
 
 	timer {
-- 
1.8.4
