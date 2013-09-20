From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH 6/6] ARM: dts: exynos5420: add sclk_pcm_in to audss clock controller
Date: Fri, 20 Sep 2013 14:13:57 -0700
Message-ID: <1379711637-5226-6-git-send-email-abrestic@chromium.org>
References: <1379711637-5226-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1379711637-5226-1-git-send-email-abrestic@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Jiri Kosina <jkosina@suse.cz>, Rahul Sharma <rahul.sharma@samsung.com>, Leela Krishna Amudala <l.krishna@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Padmavathi Venna <padma.v@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.orglinu
List-Id: linux-samsung-soc@vger.kernel.org

The parent of sclk_pcm in the AudioSS block is sclk_maupcm0.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
 arch/arm/boot/dts/exynos5420.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index d537cd7..339ab93 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -72,8 +72,8 @@
 		compatible = "samsung,exynos5420-audss-clock";
 		reg = <0x03810000 0x0C>;
 		#clock-cells = <1>;
-		clocks = <&clock 148>;
-		clock-names = "sclk_audio";
+		clocks = <&clock 148>, <&clock 149>;
+		clock-names = "sclk_audio", "sclk_pcm_in";
 	};
 
 	codec@11000000 {
-- 
1.8.4

