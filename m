From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH 2/4] bindings: spi-samsung: add exynos5433 spi compatible
Date: Fri, 08 Jul 2016 21:18:22 +0900
Message-ID: <1467980304-14093-3-git-send-email-andi.shyti@samsung.com>
References: <1467980304-14093-1-git-send-email-andi.shyti@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:57576 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754574AbcGHMSe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Jul 2016 08:18:34 -0400
In-reply-to: <1467980304-14093-1-git-send-email-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>

The samsung,exynos5433-spi has some peculiarities that bring the
need of creating a new compatible in the binding.

One of those is the 3-clocks controller management where the spi
is fed with three clocks: "spi", "busclkN" and "ioclk".

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
---
 Documentation/devicetree/bindings/spi/spi-samsung.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-samsung.txt b/Documentation/devicetree/bindings/spi/spi-samsung.txt
index 6dbdeb3..d4294c7 100644
--- a/Documentation/devicetree/bindings/spi/spi-samsung.txt
+++ b/Documentation/devicetree/bindings/spi/spi-samsung.txt
@@ -10,6 +10,7 @@ Required SoC Specific Properties:
     - samsung,s3c6410-spi: for s3c6410 platforms
     - samsung,s5pv210-spi: for s5pv210 and s5pc110 platforms
     - samsung,exynos7-spi: for exynos7 platforms
+    - samsung,exynos5433-spi: for exynos5433 compatible controllers
 
 - reg: physical base address of the controller and length of memory mapped
   region.
-- 
2.8.1
