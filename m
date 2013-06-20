From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 5/5] ARM: dts: update binding documentation for hdmi subsystem
Date: Thu, 20 Jun 2013 11:11:51 +0530
Message-ID: <1371706911-27016-6-git-send-email-rahul.sharma@samsung.com>
References: <1371706911-27016-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:35746 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752093Ab3FTFSh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 01:18:37 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOO00HPHER0TR80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Jun 2013 14:18:36 +0900 (KST)
In-reply-to: <1371706911-27016-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Adding information about clocks to mixer and hdmi dt
nodes. Also removed the updated fields for hpd property.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 .../devicetree/bindings/video/exynos_hdmi.txt         |   17 ++++++++++++++---
 .../devicetree/bindings/video/exynos_mixer.txt        |    4 ++++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
index 589edee..5dca3af 100644
--- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
+++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
@@ -8,9 +8,20 @@ Required properties:
 - hpd-gpio: following information about the hotplug gpio pin.
 	a) phandle of the gpio controller node.
 	b) pin number within the gpio controller.
-	c) pin function mode.
-	d) optional flags and pull up/down.
-	e) drive strength.
+	c) optional flags and pull up/down.
+- clocks: list of clock IDs from SoC clock driver.
+	a) hdmi: It is required for gate operation on aclk_200_disp1 clock
+		which clocks the display1 block.
+	b) sclk_hdmi: It is required for gate operation on sclk_hdmi clock
+		which clocks hdmi IP.
+	c) sclk_pixel: Parent for mux mout_hdmi.
+	d) sclk_hdmiphy: Parent for mux mout_hdmi.
+	e) mout_hdmi: It is required by the driver to switch between the 2
+		parents i.e. sclk_pixel and sclk_hdmiphy. If hdmiphy is stable
+		after configuration, parent is set to sclk_hdmiphy else
+		sclk_pixel.
+- clock-names: aliases as per driver requirements for above clock IDs:
+	"hdmi", "sclk_hdmi", "sclk_pixel", "sclk_hdmiphy" and "mout_hdmi".
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/video/exynos_mixer.txt b/Documentation/devicetree/bindings/video/exynos_mixer.txt
index 9b2ea03..54790a2 100644
--- a/Documentation/devicetree/bindings/video/exynos_mixer.txt
+++ b/Documentation/devicetree/bindings/video/exynos_mixer.txt
@@ -5,6 +5,10 @@ Required properties:
 - reg: physical base address of the mixer and length of memory mapped
 	region.
 - interrupts: interrupt number to the cpu.
+- clocks: list of clock IDs from SoC clock driver.
+	a) mixer: It is required for gate operation on aclk_200_disp1 clock
+		which clocks the display1 block.
+	b) sclk_hdmi: Parent for mux mout_mixer.
 
 Example:
 
-- 
1.7.10.4
