Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFEEC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 31 Dec 2021 16:22:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhLaQWM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 31 Dec 2021 11:22:12 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46740
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229623AbhLaQWM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 31 Dec 2021 11:22:12 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3A7DB3F1A4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Dec 2021 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640967731;
        bh=vwFJRx2gAmVsM2SjiJl4digFkX/7ORkgzXaTv+w0Ivo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=hpxgekz8NkXlGlghY0JTiGLu63GmvGZBt+Uj01P0AuEcFDINVXN6ORuoNa/vCmX76
         VdXEo9+Iu8jbLNHEyygRATY/KvBQWVCuImFb6nruQYoh9VXTh8JkJSELNOI5AIH8sX
         K3hc+DNbnm3W66MUMqQZdZhf0NjnySrjr1NZxtJq18erl7YV8PV4U0X4nQiNwhz+nG
         TEbmrXSXRRUl4k257jiDi2KzlYCa72u1kgk9mx86e64Gn4MrBCimZHmXjovIxw8Nqv
         6/e1hwhlbhQ7XPuBb7Hchjq/Izc/hbL30AUnzYtIMhudMwdqg6AuFkcYG/PjeZDqkk
         YDMcHHPKNTEBg==
Received: by mail-lj1-f199.google.com with SMTP id k20-20020a2e9214000000b0022d6b13bc8aso9440586ljg.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Dec 2021 08:22:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vwFJRx2gAmVsM2SjiJl4digFkX/7ORkgzXaTv+w0Ivo=;
        b=FKxgnj2HMOczDs0fzFjKl4Y4RkGleBrhiqaj83Z44FluuuVzK4BC/6RWXZcHE2rGmG
         b+rtoqVx2fFMD2APocqX6z9w7Z2KeoAX6h0MXy5F0VayvQuo+9zhZ8mbe5AUY/u/akvd
         pYkYZnW89WR+59P7/2nVJyVXPF6VtLXHc+bgchBw+4opOTUAJcg3SLNo+dQYcE05uQ4m
         GfzXiFqjjdzstsFZMWDlhZjbPchVSzzQSZaK1hcrhBza79jIVOQuIoRnrKdWgrYHJzz4
         /atAeV5gv8h/F7gmWTx0SAdfO0izn5vq8ylmTiUG//2+tMD9YZ/hM2e0c+yNbbfVHvxE
         3MRg==
X-Gm-Message-State: AOAM531aPp/ouhR7x43sLtsXPng3WHuFaODV8UFYT6Btn/o/Dh/09yGA
        ItyMG27/AV0LpLpchInotFnb1+xHgdrg7jeb6RT+0cGjd2v3AgRxPp7qHDC02K1GvNXkwLCQ33f
        dL2ytsyS4KXrGJikmmuYRGfD4n6NuEHkFEmQiJYV7EC7+ghsT
X-Received: by 2002:a2e:a406:: with SMTP id p6mr24918855ljn.13.1640967730327;
        Fri, 31 Dec 2021 08:22:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRePFA1r4rMy5Stjb0m7lcPfHvozVux5rIote82Iw0v7IO7g4e2eHmUiX9FdO04m0djEyVQQ==
X-Received: by 2002:a2e:a406:: with SMTP id p6mr24918843ljn.13.1640967730180;
        Fri, 31 Dec 2021 08:22:10 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id y36sm2796514lfa.75.2021.12.31.08.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 08:22:09 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 07/24] ARM: dts: exynos: override pins by label in Peach Pi
Date:   Fri, 31 Dec 2021 17:21:50 +0100
Message-Id: <20211231162207.257478-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
References: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Using node paths to extend or override a device tree node is error
prone.  If there was a typo error, a new node will be created instead of
extending the existing node.  This will lead to run-time errors that
could be hard to detect.

A mistyped label on the other hand, will cause a dtc compile error
(during build time).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5800-peach-pi.dts | 33 +++++++++++------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 77013ee586f8..6bf3fd37fb2b 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -850,27 +850,26 @@ pmic_dvs_1: pmic-dvs-1 {
 	};
 };
 
-&pinctrl_1 {
-	/* Adjust WiFi drive strengths lower for EMI */
-	sd1_clk: sd1-clk {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+/* pinctrl_1 */
+/* Adjust WiFi drive strengths lower for EMI */
+&sd1_bus1 {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+};
 
-	sd1_cmd: sd1-cmd {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+&sd1_bus4 {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+};
 
-	sd1_bus1: sd1-bus-width1 {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+&sd1_bus8 {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+};
 
-	sd1_bus4: sd1-bus-width4 {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+&sd1_clk {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+};
 
-	sd1_bus8: sd1-bus-width8 {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+&sd1_cmd {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
 };
 
 &pinctrl_2 {
-- 
2.32.0

