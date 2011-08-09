From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: [PATCH 10/13] ARM: gpio: pxa: convert drivers to use asm/gpio.h
 rather than mach/gpio.h
Date: Tue, 09 Aug 2011 09:07:41 +0100
Message-ID: <E1QqhLh-0003ab-Pq@rmk-PC.arm.linux.org.uk>
References: <20110809080411.GA1831@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:41950 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752824Ab1HIIHt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Aug 2011 04:07:49 -0400
In-Reply-To: <20110809080411.GA1831@n2100.arm.linux.org.uk>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-sh@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Nicolas Pitre <nico@fluxnic.net>Grant Likely <grant.likely@secretlab.ca>Nicolas Pitre <nico@fluxnic.net>

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 drivers/pcmcia/pxa2xx_vpac270.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/pcmcia/pxa2xx_vpac270.c b/drivers/pcmcia/pxa2xx_vpac270.c
index e956f65..66ab92c 100644
--- a/drivers/pcmcia/pxa2xx_vpac270.c
+++ b/drivers/pcmcia/pxa2xx_vpac270.c
@@ -17,7 +17,7 @@
 
 #include <asm/mach-types.h>
 
-#include <mach/gpio.h>
+#include <asm/gpio.h>
 #include <mach/vpac270.h>
 
 #include "soc_common.h"
-- 
1.7.4.4
