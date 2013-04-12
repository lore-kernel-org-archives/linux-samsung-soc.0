From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: sdhci-s3c suspends immediately
Date: Fri, 12 Apr 2013 15:47:56 +0200
Message-ID: <201304121547.56887.heiko@sntech.de>
References: <5167FC1D.7020601@mail.ru>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:41430 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754587Ab3DLNr7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Apr 2013 09:47:59 -0400
In-Reply-To: <5167FC1D.7020601@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Varnin <fenixk19@mail.ru>
Cc: linux-samsung-soc@vger.kernel.org

Hi Alexander,

Am Freitag, 12. April 2013, 14:20:45 schrieb Alexander Varnin:
> Hello. I'm trying to bring up sdhci-s3c driver on S3C2443 SOC.
> It seems to initialize correctly, but immediately after that it get
> suspended by some force. This turns off all interrupts, so SD controller
> doesn't work. I don't know, where suspend command comes from, but whole
> system stay in working state.
> I've recorded some boot log with extended verbose for a driver. It is
> attached.
>
> I want to understand, why and where does this command come from. And how
> to turn it off. Now there is no suspend support working on my board, but
> i don't want to turn suspend (PM runtime) off at all, because it may be
> need to set it up in future.
> Please, help.

This is called runtime-suspend and is meant to put the hardware block in a low 
power mode when it's not used. While suspend-to-ram puts the whole system to 
sleep the runtime-powermanagement is meant to reduce the power consumption of 
the running system by turning of unused components.

Normally the controller will be woken up, when a card detect event is found, 
but in the mach-smdk2443.c there does not seem to be any configured.

Try adding something like the attached diff (only compile-tested) to your 
board file, which simply tells the driver that the card is always present for 
testing purposes.

To finalze this you will need to determine how the card detect is really 
managed for the channel on your board (via a gpio or similar)


Good luck
Heiko

------------ 8< -----------------

diff --git a/arch/arm/mach-s3c24xx/mach-smdk2443.c b/arch/arm/mach-
s3c24xx/mach-smdk2443.c
index 9435c3b..499d048 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2443.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2443.c
@@ -42,6 +42,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/samsung-time.h>
+#include <plat/sdhci.h>
 
 #include "common.h"
 #include "common-smdk.h"
@@ -108,6 +109,11 @@ static struct s3c2410_uartcfg smdk2443_uartcfgs[] 
__initdata = {
        }
 };
 
+static struct s3c_sdhci_platdata smdk2443_hsmmc1_pdata __initdata = {
+       .max_width              = 4,
+       .cd_type                = S3C_SDHCI_CD_PERMANENT,
+};
+
 static struct platform_device *smdk2443_devices[] __initdata = {
        &s3c_device_wdt,
        &s3c_device_i2c0,
@@ -133,6 +139,8 @@ static void __init smdk2443_machine_init(void)
        s3c24xx_ac97_setup_gpio(S3C24XX_AC97_GPE0);
 #endif
 
+       s3c_sdhci1_set_platdata(&smdk2443_hsmmc1_pdata);
+
        platform_add_devices(smdk2443_devices, ARRAY_SIZE(smdk2443_devices));
        smdk_machine_init();
 }
