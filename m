From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH v2] media: Doc add missing documentation for samsung,exynos4212-jpeg
Date: Fri, 15 Jul 2016 16:10:27 -0600
Message-ID: <1468620627-9750-1-git-send-email-shuahkh@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from resqmta-po-10v.sys.comcast.net ([96.114.154.169]:44717 "EHLO
	resqmta-po-10v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751683AbcGOWKd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2016 18:10:33 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, kgene@kernel.org, k.kozlowski@samsung.com, mchehab@osg.samsung.com, andrzej.p@samsung.com, j.anaszewski@samsung.com, hans.verkuil@cisco.com
Cc: Shuah Khan <shuahkh@osg.samsung.com>, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Add add missing documentation for samsung,exynos4212-jpeg codec,
reorder entries to improve readability and make it easier to add
new entries.

samsung,exynos4212-jpeg and samsung,exynos4210-jpeg are identical,
hence add samsung,exynos4212-jpeg as deprecated in the documentation.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---

Changes since v1:
- Added samsung,exynos4212-jpeg as deprecated

 Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt b/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
index 38941db..c5399e7 100644
--- a/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
+++ b/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
@@ -3,9 +3,11 @@ Samsung S5P/EXYNOS SoC series JPEG codec
 Required properties:
 
 - compatible	: should be one of:
-		  "samsung,s5pv210-jpeg", "samsung,exynos4210-jpeg",
-		  "samsung,exynos3250-jpeg", "samsung,exynos5420-jpeg",
+		  "samsung,s5pv210-jpeg", "samsung,exynos3250-jpeg",
+		  "samsung,exynos4210-jpeg", "samsung,exynos5420-jpeg",
 		  "samsung,exynos5433-jpeg";
+
+		  (Deprecated: "samsung,exynos4212-jpeg").
 - reg		: address and length of the JPEG codec IP register set;
 - interrupts	: specifies the JPEG codec IP interrupt;
 - clock-names   : should contain:
-- 
2.7.4
