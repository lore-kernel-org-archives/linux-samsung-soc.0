From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 01/10] Input: s3c2410_ts: fix S3C_ADC dependency
Date: Wed, 25 Nov 2015 17:06:46 +0100
Message-ID: <1448467615-447097-2-git-send-email-arnd@arndb.de>
References: <1448467615-447097-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1448467615-447097-1-git-send-email-arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Kukjin Kim <kgene@kernel.org>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

S3C_ADC is only available on machines that don't do ARCH_MULTIPLATFORM,
so changing the 'select' into 'depends on' here helps us move to
ARCH_MULTIPLATFORM without introducing regressions.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index ae33da7ab51f..ae35edcd6a34 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -365,7 +365,7 @@ config TOUCHSCREEN_IPROC
 config TOUCHSCREEN_S3C2410
 	tristate "Samsung S3C2410/generic touchscreen input driver"
 	depends on ARCH_S3C24XX || SAMSUNG_DEV_TS
-	select S3C_ADC
+	depends on S3C_ADC
 	help
 	  Say Y here if you have the s3c2410 touchscreen.
 
-- 
2.1.0.rc2
