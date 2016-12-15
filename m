From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH 2/2] media: s5p-cec: Remove references to non-existent
 PLAT_S5P symbol
Date: Thu, 15 Dec 2016 15:03:24 +0100
Message-ID: <20161215140324.28986-2-clabbe.montjoie@gmail.com>
References: <20161215140324.28986-1-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20161215140324.28986-1-clabbe.montjoie@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: mchehab@kernel.org, gregkh@linuxfoundation.org, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Commit d78c16ccde96 ("ARM: SAMSUNG: Remove remaining legacy code")
removed the Kconfig symbol PLAT_S5P.
This patch remove the last occurrence of this symbol.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 drivers/staging/media/s5p-cec/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/s5p-cec/Kconfig b/drivers/staging/media/s5p-cec/Kconfig
index 0315fd7..cba4f8a 100644
--- a/drivers/staging/media/s5p-cec/Kconfig
+++ b/drivers/staging/media/s5p-cec/Kconfig
@@ -1,6 +1,6 @@
 config VIDEO_SAMSUNG_S5P_CEC
        tristate "Samsung S5P CEC driver"
-       depends on VIDEO_DEV && MEDIA_CEC && (PLAT_S5P || ARCH_EXYNOS || COMPILE_TEST)
+       depends on VIDEO_DEV && MEDIA_CEC && (ARCH_EXYNOS || COMPILE_TEST)
        ---help---
          This is a driver for Samsung S5P HDMI CEC interface. It uses the
          generic CEC framework interface.
-- 
2.10.2
