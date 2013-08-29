From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 6/6] of/documentation: update with clock information for exynos
 hdmi subsystem
Date: Thu, 29 Aug 2013 10:58:30 +0530
Message-ID: <1377754110-31084-6-git-send-email-rahul.sharma@samsung.com>
References: <1377754110-31084-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24702 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752230Ab3H2FGu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Aug 2013 01:06:50 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MSA002LY0TC3LO0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Aug 2013 14:06:49 +0900 (KST)
In-reply-to: <1377754110-31084-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Adding information about clocks to the binding documentation
for exynos mixer and hdmi.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 Documentation/devicetree/bindings/video/exynos_hdmi.txt  |   14 +++++++++++++-
 Documentation/devicetree/bindings/video/exynos_mixer.txt |    4 ++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
index 323983b..94aaa7d 100644
--- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
+++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
@@ -12,7 +12,19 @@ Required properties:
 	a) phandle of the gpio controller node.
 	b) pin number within the gpio controller.
 	c) optional flags and pull up/down.
-
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
 
 	hdmi {
diff --git a/Documentation/devicetree/bindings/video/exynos_mixer.txt b/Documentation/devicetree/bindings/video/exynos_mixer.txt
index 3334b0a..94b40b6 100644
--- a/Documentation/devicetree/bindings/video/exynos_mixer.txt
+++ b/Documentation/devicetree/bindings/video/exynos_mixer.txt
@@ -10,6 +10,10 @@ Required properties:
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
