From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH] media: Doc add missing documentation for samsung,exynos4212-jpeg
Date: Thu, 14 Jul 2016 14:01:39 -0600
Message-ID: <1468526499-8840-1-git-send-email-shuahkh@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, kgene@kernel.org, k.kozlowski@samsung.com, mchehab@osg.samsung.com, andrzej.p@samsung.com, j.anaszewski@samsung.com, hans.verkuil@cisco.com
Cc: Shuah Khan <shuahkh@osg.samsung.com>, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Add add missing documentation for samsung,exynos4212-jpeg codec,
reorder entries to improve readability and make it easier to add
new entries.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt b/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
index 38941db..093614c 100644
--- a/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
+++ b/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
@@ -3,9 +3,9 @@ Samsung S5P/EXYNOS SoC series JPEG codec
 Required properties:
 
 - compatible	: should be one of:
-		  "samsung,s5pv210-jpeg", "samsung,exynos4210-jpeg",
-		  "samsung,exynos3250-jpeg", "samsung,exynos5420-jpeg",
-		  "samsung,exynos5433-jpeg";
+		  "samsung,s5pv210-jpeg", "samsung,exynos3250-jpeg",
+		  "samsung,exynos4210-jpeg", "samsung,exynos4212-jpeg",
+		  "samsung,exynos5420-jpeg", "samsung,exynos5433-jpeg";
 - reg		: address and length of the JPEG codec IP register set;
 - interrupts	: specifies the JPEG codec IP interrupt;
 - clock-names   : should contain:
-- 
2.7.4
