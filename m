From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v6 2/6] ARM: s3c64xx: Skip legacy EINT setup if pinctrl-s3c64xx driver is present
Date: Wed, 17 Apr 2013 00:43:56 +0200
Message-ID: <5007310.KGcYpvCKGp@flatron>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com> <1366060483-20342-3-git-send-email-tomasz.figa@gmail.com> <20130416162642.GN26958@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f176.google.com ([209.85.215.176]:45407 "EHLO
	mail-ea0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965542Ab3DPWn4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Apr 2013 18:43:56 -0400
Received: by mail-ea0-f176.google.com with SMTP id h10so451450eaj.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Apr 2013 15:43:54 -0700 (PDT)
In-Reply-To: <20130416162642.GN26958@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>

The new pinctrl-s3c64xx is responsible for EINT handling on DT-enabled
platforms.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 arch/arm/mach-s3c64xx/common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-s3c64xx/common.c b/arch/arm/mach-s3c64xx/common.c
index e79ca92..5053879 100644
--- a/arch/arm/mach-s3c64xx/common.c
+++ b/arch/arm/mach-s3c64xx/common.c
@@ -366,6 +366,10 @@ static int __init s3c64xx_init_irq_eint(void)
 {
 	int irq;
 
+	/* On DT-enabled systems EINTs are handled by pinctrl-s3c64xx driver. */
+	if (of_have_populated_dt())
+		return -ENODEV;
+
 	for (irq = IRQ_EINT(0); irq <= IRQ_EINT(27); irq++) {
 		irq_set_chip_and_handler(irq, &s3c_irq_eint, handle_level_irq);
 		irq_set_chip_data(irq, (void *)eint_irq_to_bit(irq));
-- 
1.8.1.5
