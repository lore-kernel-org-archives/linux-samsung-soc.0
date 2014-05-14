From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH 07/18] ARM: dts: samsung-fimd: add I80 specific properties
Date: Wed, 14 May 2014 15:26:54 +0900
Message-ID: <1400048825-6052-8-git-send-email-yj44.cho@samsung.com>
References: <1400048825-6052-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50034 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751163AbaENG1P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 02:27:15 -0400
In-reply-to: <1400048825-6052-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, s.trumtrar@pengutronix.de, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

In case of using MIPI command mode interface panel,
the relevant registers should be set.
So this patch adds relevant DT bindings.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../devicetree/bindings/video/samsung-fimd.txt     |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
index 2dad41b..6bf93e9 100644
--- a/Documentation/devicetree/bindings/video/samsung-fimd.txt
+++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
@@ -44,6 +44,8 @@ Optional Properties:
 - display-timings: timing settings for FIMD, as described in document [1].
 		Can be used in case timings cannot be provided otherwise
 		or to override timings provided by the panel.
+- samsung,sysreg: handle to syscon used to control the system registers
+- vidout-i80-ldi: boolean to support i80 interface instead of rgb one
 
 The device node can contain 'port' child nodes according to the bindings defined
 in [2]. The following are properties specific to those nodes:
-- 
1.7.9.5
