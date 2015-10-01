From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Subject: [PATCH 5/7] [media] mipi-csis: make sparse happy
Date: Thu,  1 Oct 2015 19:17:27 -0300
Message-ID: <de2ce8fd84f965a270bad28d284932bf20c349be.1443737683.git.mchehab@osg.samsung.com>
References: <cover.1443737682.git.mchehab@osg.samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <cover.1443737682.git.mchehab@osg.samsung.com>
In-Reply-To: <cover.1443737682.git.mchehab@osg.samsung.com>
References: <cover.1443737682.git.mchehab@osg.samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Fix the namespace issue that causes this warning:

drivers/media/platform/exynos4-is/mipi-csis.c:709:17: warning: incorrect type in argument 2 (different address spaces)
drivers/media/platform/exynos4-is/mipi-csis.c:709:17:    expected void const *<noident>
drivers/media/platform/exynos4-is/mipi-csis.c:709:17:    got void [noderef] <asn:2>*

Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/media/platform/exynos4-is/mipi-csis.c
index d74e1bec3d86..4b85105dc159 100644
--- a/drivers/media/platform/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/exynos4-is/mipi-csis.c
@@ -706,7 +706,8 @@ static irqreturn_t s5pcsis_irq_handler(int irq, void *dev_id)
 		else
 			offset = S5PCSIS_PKTDATA_ODD;
 
-		memcpy(pktbuf->data, state->regs + offset, pktbuf->len);
+		memcpy(pktbuf->data, (u8 __force *)state->regs + offset,
+		       pktbuf->len);
 		pktbuf->data = NULL;
 		rmb();
 	}
-- 
2.4.3
