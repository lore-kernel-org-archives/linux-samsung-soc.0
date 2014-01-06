From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 1/5] dt-bindings: document the s3c24xx software-reset register
Date: Mon, 06 Jan 2014 19:37:45 +0100
Message-ID: <2635551.Gy9A9uhyAA@phil>
References: <3105326.uFdOVLyXH8@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:56007 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755838AbaAFSiN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jan 2014 13:38:13 -0500
In-Reply-To: <3105326.uFdOVLyXH8@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org

The S3C2412/S3C2413 as well as the S3C2443 and following contain a special
register that restarts the system when written to. This adds a simple
binding, so that it gets accessible on dt systems too.

We distinguish between the two types (s3c2412, s3c2443) because the
handling of the swrst register on the s3c2412 also needs to take care
of a hardware glitch at reset time.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../devicetree/bindings/arm/samsung/s3c24xx-swrst.txt  |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/s3c24xx-swrst.txt

diff --git a/Documentation/devicetree/bindings/arm/samsung/s3c24xx-swrst.txt b/Documentation/devicetree/bindings/arm/samsung/s3c24xx-swrst.txt
new file mode 100644
index 0000000..c3cacf2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/samsung/s3c24xx-swrst.txt
@@ -0,0 +1,16 @@
+SAMSUNG S3C24XX software-reset register
+
+Some SoCs of the series contain a special software-reset register
+to let the system restart.
+
+Properties:
+ - compatible : should be one of
+    "samsung,s3c2412-swrst" - for S3C2412, S3C2413
+    "samsung,s3c2443-swrst" - for S3C2416, S3C2443, S3C2450
+ - reg : offset and length of the register.
+
+Example:
+	swrst@4c000044 {
+		compatible = "samsung,s3c2443-swrst";
+		reg = <0x4c000044 0x4>;
+	};
-- 
1.7.10.4
