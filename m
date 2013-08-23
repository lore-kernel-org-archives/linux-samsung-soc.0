From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] [media] exynos4-is: print error message on timeout
Date: Fri, 23 Aug 2013 12:36:56 +0300
Message-ID: <20130823093656.GK31293@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

There is a stray '!' character so the error message never gets printed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  Not tested.

diff --git a/drivers/media/platform/exynos4-is/fimc-is-regs.c b/drivers/media/platform/exynos4-is/fimc-is-regs.c
index 63c68ec..42f2925 100644
--- a/drivers/media/platform/exynos4-is/fimc-is-regs.c
+++ b/drivers/media/platform/exynos4-is/fimc-is-regs.c
@@ -236,7 +236,7 @@ int fimc_is_itf_mode_change(struct fimc_is *is)
 	fimc_is_hw_change_mode(is);
 	ret = fimc_is_wait_event(is, IS_ST_CHANGE_MODE, 1,
 				FIMC_IS_CONFIG_TIMEOUT);
-	if (!ret < 0)
+	if (ret < 0)
 		dev_err(&is->pdev->dev, "%s(): mode change (%d) timeout\n",
 			__func__, is->config_index);
 	return ret;
