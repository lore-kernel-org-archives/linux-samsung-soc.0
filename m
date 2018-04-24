From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFC 05/10] i2c: s3c2410: Remove support for Exynos5440
Date: Tue, 24 Apr 2018 22:32:34 +0200
Message-ID: <20180424203239.21885-6-krzk__35563.1070364781$1524602139$gmane$org@kernel.org>
References: <20180424203239.21885-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180424203239.21885-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org
Cc: Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The Exynos5440 is not actively developed, there are no development
boards available and probably there are no real products with it.
Remove wide-tree support for Exynos5440.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt | 4 +---
 drivers/i2c/busses/i2c-s3c2410.c                      | 2 --
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt b/Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt
index 89b3250f049b..66ae46d3bc2f 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt
@@ -8,9 +8,7 @@ Required properties:
       (b) "samsung, s3c2440-i2c", for i2c compatible with s3c2440 i2c.
       (c) "samsung, s3c2440-hdmiphy-i2c", for s3c2440-like i2c used
           inside HDMIPHY block found on several samsung SoCs
-      (d) "samsung, exynos5440-i2c", for s3c2440-like i2c used
-	   on EXYNOS5440 which does not need GPIO configuration.
-      (e) "samsung, exynos5-sata-phy-i2c", for s3c2440-like i2c used as
+      (d) "samsung, exynos5-sata-phy-i2c", for s3c2440-like i2c used as
 	   a host to SATA PHY controller on an internal bus.
   - reg: physical base address of the controller and length of memory mapped
     region.
diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 5d97510ee48b..9fe2b6951895 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -154,8 +154,6 @@ static const struct of_device_id s3c24xx_i2c_match[] = {
 	{ .compatible = "samsung,s3c2440-i2c", .data = (void *)QUIRK_S3C2440 },
 	{ .compatible = "samsung,s3c2440-hdmiphy-i2c",
 	  .data = (void *)(QUIRK_S3C2440 | QUIRK_HDMIPHY | QUIRK_NO_GPIO) },
-	{ .compatible = "samsung,exynos5440-i2c",
-	  .data = (void *)(QUIRK_S3C2440 | QUIRK_NO_GPIO) },
 	{ .compatible = "samsung,exynos5-sata-phy-i2c",
 	  .data = (void *)(QUIRK_S3C2440 | QUIRK_POLL | QUIRK_NO_GPIO) },
 	{},
-- 
2.14.1
