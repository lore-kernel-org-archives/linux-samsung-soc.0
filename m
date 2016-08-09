From: Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: [PATCH 3/4] media: platform: exynos4-is: fimc-is-i2c: don't print error when adding adapter fails
Date: Tue,  9 Aug 2016 13:35:15 +0200
Message-ID: <1470742517-12774-4-git-send-email-wsa-dev@sang-engineering.com>
References: <1470742517-12774-1-git-send-email-wsa-dev@sang-engineering.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470742517-12774-1-git-send-email-wsa-dev@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, Wolfram Sang <wsa-dev@sang-engineering.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The core will do this for us now.

Signed-off-by: Wolfram Sang <wsa-dev@sang-engineering.com>
---
 drivers/media/platform/exynos4-is/fimc-is-i2c.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-is-i2c.c b/drivers/media/platform/exynos4-is/fimc-is-i2c.c
index 7521aa59b0649c..fd888ef447a903 100644
--- a/drivers/media/platform/exynos4-is/fimc-is-i2c.c
+++ b/drivers/media/platform/exynos4-is/fimc-is-i2c.c
@@ -56,11 +56,8 @@ static int fimc_is_i2c_probe(struct platform_device *pdev)
 	i2c_adap->class = I2C_CLASS_SPD;
 
 	ret = i2c_add_adapter(i2c_adap);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to add I2C bus %s\n",
-						node->full_name);
+	if (ret < 0)
 		return ret;
-	}
 
 	platform_set_drvdata(pdev, isp_i2c);
 
-- 
2.8.1
