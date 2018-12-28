From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 3/6] ARM: dts: s5pv210: fascinate4g: Remove hardcoded bootargs
Date: Fri, 28 Dec 2018 17:18:16 +0100
Message-ID: <20181228161819.18931-4-pawel.mikolaj.chmiel@gmail.com>
References: <20181228161819.18931-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181228161819.18931-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, pawel.mikolaj.chmiel@gmail.com, xc-racer2@live.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Since we have uboot (flashed in place of stock kernel),
it's not needed anymore to hardcode bootargs.

Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 arch/arm/boot/dts/s5pv210-fascinate4g.dts | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210-fascinate4g.dts b/arch/arm/boot/dts/s5pv210-fascinate4g.dts
index ccf761b1babf..07a8d9bbe5b8 100644
--- a/arch/arm/boot/dts/s5pv210-fascinate4g.dts
+++ b/arch/arm/boot/dts/s5pv210-fascinate4g.dts
@@ -11,13 +11,6 @@
 
 	chosen {
 		stdout-path = &uart2;
-		/*
-		 * It's hard to change those parameters in stock bootloader,
-		 * since it requires special hardware/cable.
-		 * Let's hardocde bootargs for now, till u-boot port is finished,
-		 * with which it should be easier.
-		 */
-		bootargs = "root=/dev/mmcblk1p1 rw rootwait ignore_loglevel earlyprintk";
 	};
 
 	gpio-keys {
-- 
2.17.1
