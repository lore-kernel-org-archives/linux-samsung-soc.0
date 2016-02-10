From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 RESEND 2/5] ARM: sa1111: ensure no negative value gets
 returned on positive match
Date: Wed, 10 Feb 2016 11:47:27 +0100
Message-ID: <1455101250-11327-3-git-send-email-m.szyprowski@samsung.com>
References: <1455101250-11327-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1455101250-11327-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch ensures that existing bus match callbacks don't return
negative values (which might be interpreted as potential errors in the
future) in case of positive match.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/common/sa1111.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index 3d22494..fb0a0a4 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -1290,7 +1290,7 @@ static int sa1111_match(struct device *_dev, struct device_driver *_drv)
 	struct sa1111_dev *dev = SA1111_DEV(_dev);
 	struct sa1111_driver *drv = SA1111_DRV(_drv);
 
-	return dev->devid & drv->devid;
+	return !!(dev->devid & drv->devid);
 }
 
 static int sa1111_bus_suspend(struct device *dev, pm_message_t state)
-- 
1.9.2
