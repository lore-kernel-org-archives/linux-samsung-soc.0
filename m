From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] regulator: max77802: Fix DT binding document reference
Date: Fri, 29 Jan 2016 13:09:00 -0300
Message-ID: <1454083741-25626-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:34661 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751165AbcA2QJR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Jan 2016 11:09:17 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

The DT binding doc references the max77802 clocks header file which makes
no sense since of course it doesn't contain data related to the regulators.

It's a copy and paste error, so add a reference to the correct header file.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 Documentation/devicetree/bindings/regulator/max77802.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/max77802.txt b/Documentation/devicetree/bindings/regulator/max77802.txt
index 09d796ed48be..879e98d3b9aa 100644
--- a/Documentation/devicetree/bindings/regulator/max77802.txt
+++ b/Documentation/devicetree/bindings/regulator/max77802.txt
@@ -60,7 +60,7 @@ The possible values for "regulator-initial-mode" and "regulator-mode" are:
 	1: Normal regulator voltage output mode.
 	3: Low Power which reduces the quiescent current down to only 1uA
 
-The list of valid modes are defined in the dt-bindings/clock/maxim,max77802.h
+The valid modes list is defined in the dt-bindings/regulator/maxim,max77802.h
 header and can be included by device tree source files.
 
 The standard "regulator-mode" property can only be used for regulators that
-- 
2.5.0
