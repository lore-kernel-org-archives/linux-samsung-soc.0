From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/2] drivers: amba: properly handle devices with power domains
Date: Wed, 25 Nov 2015 13:58:09 +0100
Message-ID: <1448456289-31960-1-git-send-email-m.szyprowski@samsung.com>
References: <1448456127-31842-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:63031 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751895AbbKYM6S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Nov 2015 07:58:18 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYD004YAG14SXB0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Nov 2015 12:58:16 +0000 (GMT)
In-reply-to: <1448456127-31842-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

To read pid/cid registers, the probed device need to be properly turned on.
When it is inside a power domain, the bus code should ensure that the
given power domain is enabled before trying to access device's registers.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/amba/bus.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
index f009936..25715cb 100644
--- a/drivers/amba/bus.c
+++ b/drivers/amba/bus.c
@@ -373,6 +373,12 @@ int amba_device_add(struct amba_device *dev, struct resource *parent)
 		goto err_release;
 	}
 
+	ret = dev_pm_domain_attach(&dev->dev, true);
+	if (ret) {
+		iounmap(tmp);
+		goto err_release;
+	}
+
 	ret = amba_get_enable_pclk(dev);
 	if (ret == 0) {
 		u32 pid, cid;
@@ -398,6 +404,7 @@ int amba_device_add(struct amba_device *dev, struct resource *parent)
 	}
 
 	iounmap(tmp);
+	dev_pm_domain_detach(&dev->dev, true);
 
 	if (ret)
 		goto err_release;
-- 
1.9.2
