From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: Odroid DT binding documentation corrections
Date: Fri, 09 Jun 2017 19:09:44 +0200
Message-ID: <1497028184-5244-1-git-send-email-s.nawrocki@samsung.com>
References: <CGME20170609171002epcas1p3664647f96ffc9553eabac446075fed4c@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:46927 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751527AbdFIRKG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Jun 2017 13:10:06 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, robh+dt@kernel.org, b.zolnierkie@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch removes unused and undocumented samsung,cpu-dai,
samsung,codec-dai properties from the dts example and moves
sub-nodes' description to a separate section.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 .../devicetree/bindings/sound/samsung,odroid.txt          | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.txt b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
index c1ac70c..c30934d 100644
--- a/Documentation/devicetree/bindings/sound/samsung,odroid.txt
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
@@ -5,11 +5,6 @@ Required properties:
  - compatible - "samsung,odroidxu3-audio" - for Odroid XU3 board,
 		"samsung,odroidxu4-audio" - for Odroid XU4 board
  - model - the user-visible name of this sound complex
- - 'cpu' subnode with a 'sound-dai' property containing the phandle of the I2S
-    controller
- - 'codec' subnode with a 'sound-dai' property containing list of phandles
-    to the CODEC nodes, first entry must be corresponding to the MAX98090
-    CODEC and the second entry must be the phandle of the HDMI IP block node
  - clocks - should contain entries matching clock names in the clock-names
     property
  - clock-names - should contain following entries:
@@ -32,12 +27,18 @@ Required properties:
    For Odroid XU4:
      no entries
 
+Required sub-nodes:
+
+ - 'cpu' subnode with a 'sound-dai' property containing the phandle of the I2S
+    controller
+ - 'codec' subnode with a 'sound-dai' property containing list of phandles
+    to the CODEC nodes, first entry must be corresponding to the MAX98090
+    CODEC and the second entry must be the phandle of the HDMI IP block node
+
 Example:
 
 sound {
 	compatible = "samsung,odroidxu3-audio";
-	samsung,cpu-dai = <&i2s0>;
-	samsung,codec-dai = <&max98090>;
 	model = "Odroid-XU3";
 	samsung,audio-routing =
 		"Headphone Jack", "HPL",
-- 
1.9.1
