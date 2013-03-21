From: Giridhar Maruthy <giridhar.maruthy@linaro.org>
Subject: Fwd: [PATCH] ARM: EXYNOS5440: DTS: Add virtual GIC DT bindings
Date: Thu, 21 Mar 2013 15:13:17 +0530
Message-ID: <CAHuqX+G=LhpO_WuOYSEwVGDOtKU-Nby2j--xt-bLk2P3jyEsyg@mail.gmail.com>
References: <1363858839-13578-1-git-send-email-giridhar.maruthy@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f45.google.com ([74.125.83.45]:60692 "EHLO
	mail-ee0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756697Ab3CUJnT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Mar 2013 05:43:19 -0400
Received: by mail-ee0-f45.google.com with SMTP id b57so1678610eek.32
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Mar 2013 02:43:18 -0700 (PDT)
In-Reply-To: <1363858839-13578-1-git-send-email-giridhar.maruthy@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, thomas.abraham@linaro.org, kvm@vger.kernel.org

This patch is similar to the ones already submitted by Alexander Graf
and also in Christoffer's tree in linux-kvm-arm for Arndale board,
while this is required for exynos5440.




Exynos5440 has GIC which has virtualization support
in them. These are used by KVM.

Signed-off-by: Giridhar Maruthy <giridhar.m@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi
b/arch/arm/boot/dts/exynos5440.dtsi
index c374a31..25c6134 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -26,7 +26,11 @@
                compatible = "arm,cortex-a15-gic";
                #interrupt-cells = <3>;
                interrupt-controller;
-               reg = <0x2E1000 0x1000>, <0x2E2000 0x1000>;
+               reg =   <0x2E1000 0x1000>,
+                       <0x2E2000 0x1000>,
+                       <0x2E4000 0x2000>,
+                       <0x2E6000 0x2000>;
+               interrupts = <1 9 0xf04>;
        };

        cpus {
--
1.7.9.5
