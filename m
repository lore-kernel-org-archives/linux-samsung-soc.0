From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 27/36] ARM: s3c: fix mmc gpio lookup tables
Date: Thu, 10 Oct 2019 22:30:11 +0200
Message-ID: <20191010203043.1241612-27-arnd@arndb.de>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191010203043.1241612-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, Arnd Bergmann <arnd@arndb.de>, Jaehoon Chung <jh80.chung@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sergio Prado <sergio.prado@e-labworks.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The gpio controller names differ between s3c24xx and s3c64xx,
and it seems that these all got the wrong names, using GPx instead
of GPIOx.

Fixes: d2951dfa070d ("mmc: s3cmci: Use the slot GPIO descriptor")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c24xx/mach-at2440evb.c | 2 +-
 arch/arm/mach-s3c24xx/mach-h1940.c     | 4 ++--
 arch/arm/mach-s3c24xx/mach-mini2440.c  | 4 ++--
 arch/arm/mach-s3c24xx/mach-n30.c       | 4 ++--
 arch/arm/mach-s3c24xx/mach-rx1950.c    | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-at2440evb.c b/arch/arm/mach-s3c24xx/mach-at2440evb.c
index 3a793aaf2cba..b2199906e678 100644
--- a/arch/arm/mach-s3c24xx/mach-at2440evb.c
+++ b/arch/arm/mach-s3c24xx/mach-at2440evb.c
@@ -143,7 +143,7 @@ static struct gpiod_lookup_table at2440evb_mci_gpio_table = {
 	.dev_id = "s3c2410-sdi",
 	.table = {
 		/* Card detect S3C2410_GPG(10) */
-		GPIO_LOOKUP("GPG", 10, "cd", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOG", 10, "cd", GPIO_ACTIVE_LOW),
 		/* bus pins */
 		GPIO_LOOKUP_IDX("GPIOE",  5, "bus", 0, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIOE",  6, "bus", 1, GPIO_ACTIVE_HIGH),
diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index 24f785da7659..446891e23511 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -469,9 +469,9 @@ static struct gpiod_lookup_table h1940_mmc_gpio_table = {
 	.dev_id = "s3c2410-sdi",
 	.table = {
 		/* Card detect S3C2410_GPF(5) */
-		GPIO_LOOKUP("GPF", 5, "cd", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOF", 5, "cd", GPIO_ACTIVE_LOW),
 		/* Write protect S3C2410_GPH(8) */
-		GPIO_LOOKUP("GPH", 8, "wp", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOH", 8, "wp", GPIO_ACTIVE_LOW),
 		/* bus pins */
 		GPIO_LOOKUP_IDX("GPIOE",  5, "bus", 0, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIOE",  6, "bus", 1, GPIO_ACTIVE_HIGH),
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index 5c000efdf0e8..d73167f615b8 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -244,9 +244,9 @@ static struct gpiod_lookup_table mini2440_mmc_gpio_table = {
 	.dev_id = "s3c2410-sdi",
 	.table = {
 		/* Card detect S3C2410_GPG(8) */
-		GPIO_LOOKUP("GPG", 8, "cd", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOG", 8, "cd", GPIO_ACTIVE_LOW),
 		/* Write protect S3C2410_GPH(8) */
-		GPIO_LOOKUP("GPH", 8, "wp", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("GPIOH", 8, "wp", GPIO_ACTIVE_HIGH),
 		/* bus pins */
 		GPIO_LOOKUP_IDX("GPIOE",  5, "bus", 0, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIOE",  6, "bus", 1, GPIO_ACTIVE_HIGH),
diff --git a/arch/arm/mach-s3c24xx/mach-n30.c b/arch/arm/mach-s3c24xx/mach-n30.c
index 8d7ad61e9930..f283abab0761 100644
--- a/arch/arm/mach-s3c24xx/mach-n30.c
+++ b/arch/arm/mach-s3c24xx/mach-n30.c
@@ -362,9 +362,9 @@ static struct gpiod_lookup_table n30_mci_gpio_table = {
 	.dev_id = "s3c2410-sdi",
 	.table = {
 		/* Card detect S3C2410_GPF(1) */
-		GPIO_LOOKUP("GPF", 1, "cd", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOF", 1, "cd", GPIO_ACTIVE_LOW),
 		/* Write protect S3C2410_GPG(10) */
-		GPIO_LOOKUP("GPG", 10, "wp", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOG", 10, "wp", GPIO_ACTIVE_LOW),
 		{ },
 		/* bus pins */
 		GPIO_LOOKUP_IDX("GPIOE",  5, "bus", 0, GPIO_ACTIVE_HIGH),
diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24xx/mach-rx1950.c
index 820e626f5129..7752203fd9cd 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -569,9 +569,9 @@ static struct gpiod_lookup_table rx1950_mmc_gpio_table = {
 	.dev_id = "s3c2410-sdi",
 	.table = {
 		/* Card detect S3C2410_GPF(5) */
-		GPIO_LOOKUP("GPF", 5, "cd", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOF", 5, "cd", GPIO_ACTIVE_LOW),
 		/* Write protect S3C2410_GPH(8) */
-		GPIO_LOOKUP("GPH", 8, "wp", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("GPIOH", 8, "wp", GPIO_ACTIVE_LOW),
 		/* bus pins */
 		GPIO_LOOKUP_IDX("GPIOE",  5, "bus", 0, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIOE",  6, "bus", 1, GPIO_ACTIVE_HIGH),
-- 
2.20.0
