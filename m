From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] ARM: SAMSUNG: Select NO_IOPORT for plat-samsung
Date: Fri, 29 Jan 2010 09:02:19 +0000
Message-ID: <1264755741-16184-9-git-send-email-ben-linux@fluff.org>
References: <1264755741-16184-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:33733 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752532Ab0A2JCY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Jan 2010 04:02:24 -0500
In-Reply-To: <1264755741-16184-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

All these platforms select NO_IOPORT, so move it to plat-samsung Kconfig

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-samsung/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 93bd893..d552c65 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -7,6 +7,7 @@
 config PLAT_SAMSUNG
 	bool
 	depends on ARCH_S3C2410 || ARCH_S3C24A0 || ARCH_S3C64XX || ARCH_S5PC1XX
+	select NO_IOPORT
 	default y
 	help
 	  Base platform code for all Samsung SoC based systems
-- 
1.6.0.4
