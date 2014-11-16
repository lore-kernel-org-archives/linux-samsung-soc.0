From: juergen@kreuzholzen.de
Subject: (unknown)
Date: Sun, 16 Nov 2014 18:29:36 +0100
Message-ID: <E1Xq3do-0006lG-8U@sslproxy02.your-server.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www291.your-server.de ([78.46.156.197]:51626 "EHLO
	www291.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755217AbaKPR3l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Nov 2014 12:29:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

>From 2c598fc009d710ea0189e769de04f2bcf81f5d17 Mon Sep 17 00:00:00 2001
Message-Id: <2c598fc009d710ea0189e769de04f2bcf81f5d17.1416158605.git.juergen@kreuzholzen.de>
In-Reply-To: <cover.1416158605.git.juergen@kreuzholzen.de>
References: <cover.1416158605.git.juergen@kreuzholzen.de>
From: Juergen Borleis <juergen@kreuzholzen.de>
Date: Sat, 15 Nov 2014 16:02:57 +0100
Subject: [PATCH 4/8] ARM/Mini6410: enable real time clock support
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

The driver is already present, just enable its usage again.

Signed-off-by: Juergen Borleis <juergen@kreuzholzen.de>
---
 arch/arm/boot/dts/s3c6410-mini6410.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/s3c6410-mini6410.dts b/arch/arm/boot/dts/s3c6410-mini6410.dts
index be22711..1e196ca 100644
--- a/arch/arm/boot/dts/s3c6410-mini6410.dts
+++ b/arch/arm/boot/dts/s3c6410-mini6410.dts
@@ -230,3 +230,7 @@
 &watchdog {
 	status = "okay";
 };
+
+&rtc {
+	status = "okay";
+};
-- 
1.8.1
