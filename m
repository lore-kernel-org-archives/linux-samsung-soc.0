From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 3/4] ARM: multi_v7_defconfig: Enable s5p-secss driver
Date: Thu, 02 Jun 2016 07:55:15 +0200
Message-ID: <1464846916-3110-3-git-send-email-k.kozlowski@samsung.com>
References: <1464846916-3110-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1464846916-3110-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kevin Hilman <khilman@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The Exynos SoC provides a Security SubSystem block for accelerating some
cryptographic operations.  Enable the driver for it - s5p-secss to
utilize the hardware acceleration.

Currently the s5p-secss driver supports AES in CBC and ECB modes.
However its usefulness could be doubted. Excerpt of tests on Odroid XU3
(Exynos5422), for 256 bit key, encryption, performance CPU freq governor:

  algorithm        | block size [b] | average speed [MB/s] |
  cbc-aes-s5p      |             16 |                 11.5 |
  cbc-aes-s5p      |             64 |                 25.4 |
  cbc-aes-s5p      |            256 |                 41.0 |
  cbc-aes-s5p      |           1024 |                 47.4 |
  cbc-aes-s5p      |           8192 |                 49.0 |
  cbc(aes-generic) |             16 |                  0.4 |
  cbc(aes-generic) |             64 |                  1.8 |
  cbc(aes-generic) |            256 |                  6.6 |
  cbc(aes-generic) |           1024 |                 25.2 |
  cbc(aes-generic) |           8192 |                 83.1 |

Anyway enable the driver so it will get some testing coverage by
community.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 68cb3c766c39..ee7c884ab5d8 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -875,6 +875,7 @@ CONFIG_KEYSTONE_IRQ=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_ST=y
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
+CONFIG_CRYPTO_DEV_S5P=m
 CONFIG_CRYPTO_DEV_SUN4I_SS=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_ARM_CRYPTO=y
-- 
1.9.1
