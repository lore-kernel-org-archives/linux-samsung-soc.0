From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH] drivers: video: exynos: Fix compiler Warning
Date: Thu, 24 Oct 2013 20:57:34 +0530
Message-ID: <1382628454-11951-1-git-send-email-kishon@ti.com>
References: <CAOesGMhwotSY-1WQmt+wtsrsH2m30VE=j-MwyhpYU3mt_PSPPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOesGMhwotSY-1WQmt+wtsrsH2m30VE=j-MwyhpYU3mt_PSPPw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org, kgene.kim@samsung.com, dh09.lee@samsung.com, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, tomi.valkeinen@ti.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Fixed the following compilation warning:
../../drivers/video/exynos/exynos_mipi_dsi.c: In function
'exynos_mipi_dsi_blank_mode':
../../drivers/video/exynos/exynos_mipi_dsi.c:144:26: warning: unused
variable 'pdev' [-Wunused-variable]
  struct platform_device *pdev = to_platform_device(dsim->dev);

Reported-by: Olof Johansson <olof@lixom.net>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 drivers/video/exynos/exynos_mipi_dsi.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/exynos/exynos_mipi_dsi.c b/drivers/video/exynos/exynos_mipi_dsi.c
index 00b3a52..cee9602 100644
--- a/drivers/video/exynos/exynos_mipi_dsi.c
+++ b/drivers/video/exynos/exynos_mipi_dsi.c
@@ -141,7 +141,6 @@ static int exynos_mipi_dsi_early_blank_mode(struct mipi_dsim_device *dsim,
 
 static int exynos_mipi_dsi_blank_mode(struct mipi_dsim_device *dsim, int power)
 {
-	struct platform_device *pdev = to_platform_device(dsim->dev);
 	struct mipi_dsim_lcd_driver *client_drv = dsim->dsim_lcd_drv;
 	struct mipi_dsim_lcd_device *client_dev = dsim->dsim_lcd_dev;
 
-- 
1.7.10.4
