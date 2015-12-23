From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 1/5] drivers: nvdimm: ensure no negative value gets returned
 on positive match
Date: Wed, 23 Dec 2015 11:59:24 +0100
Message-ID: <1450868368-5650-2-git-send-email-m.szyprowski@samsung.com>
References: <1450868368-5650-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:28186 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754581AbbLWLAr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Dec 2015 06:00:47 -0500
In-reply-to: <1450868368-5650-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

From: Dan Williams <dan.j.williams@intel.com>

This patch ensures that existing bus match callbacks don't return
negative values (which might be interpreted as potential errors in the
future) in case of positive match.

Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/nvdimm/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvdimm/bus.c b/drivers/nvdimm/bus.c
index 7e2c43f..2b2181c 100644
--- a/drivers/nvdimm/bus.c
+++ b/drivers/nvdimm/bus.c
@@ -62,7 +62,7 @@ static int nvdimm_bus_match(struct device *dev, struct device_driver *drv)
 {
 	struct nd_device_driver *nd_drv = to_nd_device_driver(drv);
 
-	return test_bit(to_nd_device_type(dev), &nd_drv->type);
+	return !!test_bit(to_nd_device_type(dev), &nd_drv->type);
 }
 
 static struct module *to_bus_provider(struct device *dev)
-- 
1.9.2
