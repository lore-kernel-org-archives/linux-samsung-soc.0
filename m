From: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Subject: [PATCH 2/2] ARM: dts:Move fifo-depth property from cros5250-common.dtsi
Date: Mon,  9 Dec 2013 12:08:38 +0530
Message-ID: <1386571118-17793-2-git-send-email-yuvaraj.cd@samsung.com>
References: <1386571118-17793-1-git-send-email-yuvaraj.cd@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:35998 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760403Ab3LIGiy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 01:38:54 -0500
In-Reply-To: <1386571118-17793-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, devicetree@vger.kernel.org, a.kesavan@samsung.com
Cc: t.figa@samsung.com, alim.akhtar@samsung.com, sonnyrao@chromium.org, dianders@chromium.org, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

Commit 64c138a ("ARM: dts: Move fifo-depth property from exynos5250
board dts") missed out handling the exynos5250 snow dts file.
Deletes the fifo-depth property, as this property has been moved to
SOC specific exynos5250.dtsi file.

Signed-off-by : Abhilash Kesavan <a.kesavan@samsung.com>

Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
---
 arch/arm/boot/dts/cros5250-common.dtsi |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
index 1ceb62e..2dd70e9 100644
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ b/arch/arm/boot/dts/cros5250-common.dtsi
@@ -233,7 +233,6 @@
 		num-slots = <1>;
 		supports-highspeed;
 		broken-cd;
-		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
@@ -250,7 +249,6 @@
 	mmc@12220000 {
 		num-slots = <1>;
 		supports-highspeed;
-		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
@@ -269,7 +267,6 @@
 		num-slots = <1>;
 		supports-highspeed;
 		broken-cd;
-		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
-- 
1.7.9.5
