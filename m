From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V2] ARM: dts: Enable RTC node for Arndale
Date: Mon, 17 Jun 2013 09:39:39 +0530
Message-ID: <1371442179-23597-1-git-send-email-tushar.behera@linaro.org>
References: <CAHbNUh2byimQ_ep0j9XkUjRFaU3K6YZE_ANcch5UhP4QsuZxPw@mail.gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:34783 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751140Ab3FQEY2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 00:24:28 -0400
Received: by mail-pd0-f177.google.com with SMTP id p10so2320213pdj.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jun 2013 21:24:27 -0700 (PDT)
In-Reply-To: <CAHbNUh2byimQ_ep0j9XkUjRFaU3K6YZE_ANcch5UhP4QsuZxPw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, patches@linaro.org

The issues reported in commit 522ccdb6fd0e ("ARM: dts: Disable the RTC
by default on exynos5") are no longer reproduced on EXYNOS5250 based
Arndale board. Hence re-enabling RTC support for Arndale board.

This is helpful for testing S2R on Arndale board.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
Changes for V2:
* RTC node is enabled only for Arndale board. Earlier it was enabled
in exynos5250.dtsi.

 arch/arm/boot/dts/exynos5250-arndale.dts |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 02cfc76..b38080a 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -449,4 +449,8 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	rtc {
+		status = "okay";
+	};
 };
-- 
1.7.9.5
