From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2] ARM: EXYNOS: Use platform device name as power domain name
Date: Wed, 11 Mar 2015 10:54:32 +0100
Message-ID: <1426067672-21589-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30276 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751165AbbCKJyo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Mar 2015 05:54:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

The power domain nodes in DTS may be very generic (e.g. "power-domain"
for Exynos 5420) making it very hard to debug:

$ cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
    domain                      status         slaves
power-domain                    on

Use platform device name instead so the names will be a little more user
friendly:
    domain                      status         slaves
100440e0.power-domain           on

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Suggested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Suggested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

Notes:
    Changes since v1:
    1. Add Javier's reviewed-by.

 arch/arm/mach-exynos/pm_domains.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 37266a826437..84e1d9f4d76c 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -125,7 +125,7 @@ static __init int exynos4_pm_init_power_domain(void)
 			return -ENOMEM;
 		}
 
-		pd->pd.name = kstrdup(np->name, GFP_KERNEL);
+		pd->pd.name = kstrdup(dev_name(dev), GFP_KERNEL);
 		pd->name = pd->pd.name;
 		pd->base = of_iomap(np, 0);
 		pd->pd.power_off = exynos_pd_power_off;
-- 
1.9.1
