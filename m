From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 07/22] ARM: dts: Remove '0x's from Exynos4210 DTSI file
Date: Wed, 24 Jul 2013 16:09:37 +0100
Message-ID: <20130724150937.GO26801@laptop>
References: <1374490361-25769-1-git-send-email-lee.jones@linaro.org>
 <1374490361-25769-7-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47]:59049 "EHLO
	mail-ee0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751243Ab3GXPJn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 11:09:43 -0400
Received: by mail-ee0-f47.google.com with SMTP id e49so307042eek.34
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jul 2013 08:09:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1374490361-25769-7-git-send-email-lee.jones@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>
Cc: arnd@arndb.de, linus.walleij@stericsson.com, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

... for the sake of consistency and assumed convention.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index b7f358a..53e2527 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -72,7 +72,7 @@
                };
        };
 
-       clock: clock-controller@0x10030000 {
+       clock: clock-controller@10030000 {
                compatible = "samsung,exynos4210-clock";
                reg = <0x10030000 0x20000>;
                #clock-cells = <1>;
