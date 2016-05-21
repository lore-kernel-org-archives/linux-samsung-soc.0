From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0125/1529] Fix typo
Date: Sat, 21 May 2016 13:52:39 +0200
Message-ID: <20160521115239.5917-1-andrea.gelmini@gelma.net>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f195.google.com ([209.85.217.195]:36037 "EHLO
	mail-lb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758AbcEULwp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 May 2016 07:52:45 -0400
Received: by mail-lb0-f195.google.com with SMTP id r5so6870264lbj.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 May 2016 04:52:45 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, kgene@kernel.org, k.kozlowski@samsung.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/arm/plat-samsung/include/plat/gpio-cfg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/plat-samsung/include/plat/gpio-cfg.h b/arch/arm/plat-samsung/include/plat/gpio-cfg.h
index b5294ef..21391fa 100644
--- a/arch/arm/plat-samsung/include/plat/gpio-cfg.h
+++ b/arch/arm/plat-samsung/include/plat/gpio-cfg.h
@@ -35,7 +35,7 @@ struct samsung_gpio_chip;
  * struct samsung_gpio_cfg GPIO configuration
  * @cfg_eint: Configuration setting when used for external interrupt source
  * @get_pull: Read the current pull configuration for the GPIO
- * @set_pull: Set the current pull configuraiton for the GPIO
+ * @set_pull: Set the current pull configuration for the GPIO
  * @set_config: Set the current configuration for the GPIO
  * @get_config: Read the current configuration for the GPIO
  *
-- 
2.8.2.534.g1f66975
