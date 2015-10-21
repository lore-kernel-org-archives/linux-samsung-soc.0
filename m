From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] MAINTAINERS: ARM: EXYNOS: Add documentation and dt-bindings
Date: Wed, 21 Oct 2015 10:33:23 +0900
Message-ID: <1445391203-3819-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:13314 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751621AbbJUBdi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 21:33:38 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Jonathan Corbet <corbet@lwn.net>, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>

Extend the Samsung Exynos maintainer entry to match SoC documentation
and SoC dt-bindings directories. Without that some files, like
bindings/arm/samsung/pmu.txt, are not matched by existing patterns.

This also may serve as a hint where new documentation and bindings (not
matching specific subsystem) should be put.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b556aad90930..cad7b6b628b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1459,6 +1459,8 @@ F:	drivers/*/*s3c2410*
 F:	drivers/*/*/*s3c2410*
 F:	drivers/spi/spi-s3c*
 F:	sound/soc/samsung/*
+F:	Documentation/arm/Samsung/
+F:	Documentation/devicetree/bindings/arm/samsung/
 N:	exynos
 
 ARM/SAMSUNG MOBILE MACHINE SUPPORT
-- 
1.9.1
