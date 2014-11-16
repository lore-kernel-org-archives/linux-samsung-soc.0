From: juergen@kreuzholzen.de
Subject: (unknown)
Date: Sun, 16 Nov 2014 18:29:35 +0100
Message-ID: <E1Xq3dn-0006lG-Fy@sslproxy02.your-server.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www291.your-server.de ([78.46.156.197]:51634 "EHLO
	www291.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755295AbaKPR3l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Nov 2014 12:29:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

>From 1dbef4fd0d8e819e3d366f087090f43858383fbd Mon Sep 17 00:00:00 2001
Message-Id: <1dbef4fd0d8e819e3d366f087090f43858383fbd.1416158605.git.juergen@kreuzholzen.de>
In-Reply-To: <cover.1416158605.git.juergen@kreuzholzen.de>
References: <cover.1416158605.git.juergen@kreuzholzen.de>
From: Juergen Borleis <juergen@kreuzholzen.de>
Date: Sat, 15 Nov 2014 16:01:57 +0100
Subject: [PATCH 1/8] ARM/Mini6410: enable watchdog support
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

The driver is already present, just enable its usage again.

Signed-off-by: Juergen Borleis <juergen@kreuzholzen.de>
---
 arch/arm/boot/dts/s3c6410-mini6410.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/s3c6410-mini6410.dts b/arch/arm/boot/dts/s3c6410-mini6410.dts
index 57e00f9..be22711 100644
--- a/arch/arm/boot/dts/s3c6410-mini6410.dts
+++ b/arch/arm/boot/dts/s3c6410-mini6410.dts
@@ -226,3 +226,7 @@
 		pagesize = <16>;
 	};
 };
+
+&watchdog {
+	status = "okay";
+};
-- 
1.8.1
