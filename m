From: snawrocki@kernel.org
Subject: [PATCH] MAINTAINERS: Update my e-mail address
Date: Wed,  1 Aug 2018 22:09:49 +0200
Message-ID: <1533154189-23311-1-git-send-email-snawrocki@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: sboyd@kernel.org, mchehab@kernel.org, krzk@kernel.org, m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, cw00.choi@samsung.com, bzolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Sylwester Nawrocki <snawrocki@kernel.org>

I won't have access to my s.nawrocki@samsung.com account for some time
so replace that address with the kernel.org one.
Also a related entry to the .mailmap file is added.

Signed-off-by: Sylwester Nawrocki <snawrocki@kernel.org>
---
 .mailmap    |  1 +
 MAINTAINERS | 14 +++++++-------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/.mailmap b/.mailmap
index 29ddeb1..b8d05a2 100644
--- a/.mailmap
+++ b/.mailmap
@@ -177,6 +177,7 @@ Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
 Subhash Jadavani <subhashj@codeaurora.org>
 Sudeep Holla <sudeep.holla@arm.com> Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
 Sumit Semwal <sumit.semwal@ti.com>
+Sylwester Nawrocki <snawrocki@kernel.org> <s.nawrocki@samsung.com>
 Tejun Heo <htejun@gmail.com>
 Thomas Graf <tgraf@suug.ch>
 Thomas Pedersen <twp@codeaurora.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 03ab73c..4ccab9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10520,7 +10520,7 @@ F:	Documentation/devicetree/bindings/media/i2c/ov7740.txt
 OMNIVISION OV9650 SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 R:	Akinobu Mita <akinobu.mita@gmail.com>
-R:	Sylwester Nawrocki <s.nawrocki@samsung.com>
+R:	Sylwester Nawrocki <snawrocki@kernel.org>
 L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
@@ -11290,7 +11290,7 @@ F:	drivers/pinctrl/sh-pfc/
 PIN CONTROLLER - SAMSUNG
 M:	Tomasz Figa <tomasz.figa@gmail.com>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
-M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
+M:	Sylwester Nawrocki <snawrocki@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
@@ -12460,7 +12460,7 @@ F:	include/media/saa7146*
 SAMSUNG AUDIO (ASoC) DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sangbeom Kim <sbkim73@samsung.com>
-M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
+M:	Sylwester Nawrocki <snawrocki@kernel.org>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 F:	sound/soc/samsung/
@@ -12512,7 +12512,7 @@ F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.txt
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
 
 SAMSUNG S3C24XX/S3C64XX SOC SERIES CAMIF DRIVER
-M:	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
+M:	Sylwester Nawrocki <snawrocki@kernel.org>
 L:	linux-media@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 S:	Maintained
@@ -12551,14 +12551,14 @@ F:	drivers/crypto/s5p-sss.c
 
 SAMSUNG S5P/EXYNOS4 SOC SERIES CAMERA SUBSYSTEM DRIVERS
 M:	Kyungmin Park <kyungmin.park@samsung.com>
-M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
+M:	Sylwester Nawrocki <snawrocki@kernel.org>
 L:	linux-media@vger.kernel.org
 Q:	https://patchwork.linuxtv.org/project/linux-media/list/
 S:	Supported
 F:	drivers/media/platform/exynos4-is/
 
 SAMSUNG SOC CLOCK DRIVERS
-M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
+M:	Sylwester Nawrocki <snawrocki@kernel.org>
 M:	Tomasz Figa <tomasz.figa@gmail.com>
 M:	Chanwoo Choi <cw00.choi@samsung.com>
 S:	Supported
@@ -12597,7 +12597,7 @@ F:	drivers/thermal/samsung/
 
 SAMSUNG USB2 PHY DRIVER
 M:	Kamil Debski <kamil@wypas.org>
-M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
+M:	Sylwester Nawrocki <snawrocki@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/phy/samsung-phy.txt
-- 
2.7.4
