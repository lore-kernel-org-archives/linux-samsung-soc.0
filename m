From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 7/8] of/documentation: Update hpd gpio property for
 exynos_hdmi
Date: Thu, 20 Jun 2013 18:43:53 +0530
Message-ID: <1371734034-21296-8-git-send-email-rahul.sharma@samsung.com>
References: <1371734034-21296-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:19550 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757686Ab3FTMyY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 08:54:24 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOO005FSZUMEN60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Jun 2013 21:54:23 +0900 (KST)
In-reply-to: <1371734034-21296-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Sachin Kamat <sachin.kamat@linaro.org>, Rahul Sharma <rahul.sharma@samsung.com>

From: Sachin Kamat <sachin.kamat@linaro.org>

Exynos SoCs use pinctrl to configure GPIOs. Update the document
to reflect this change.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 Documentation/devicetree/bindings/video/exynos_hdmi.txt |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
index 589edee..584385a 100644
--- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
+++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
@@ -8,9 +8,7 @@ Required properties:
 - hpd-gpio: following information about the hotplug gpio pin.
 	a) phandle of the gpio controller node.
 	b) pin number within the gpio controller.
-	c) pin function mode.
-	d) optional flags and pull up/down.
-	e) drive strength.
+	c) optional flags and pull up/down.
 
 Example:
 
@@ -18,5 +16,5 @@ Example:
 		compatible = "samsung,exynos5-hdmi";
 		reg = <0x14530000 0x100000>;
 		interrupts = <0 95 0>;
-		hpd-gpio = <&gpx3 7 0xf 1 3>;
+		hpd-gpio = <&gpx3 7 1>;
 	};
-- 
1.7.10.4
