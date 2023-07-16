Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A282C0015E
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 16 Jul 2023 22:08:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbjGPWIS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 16 Jul 2023 18:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbjGPWIG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Jul 2023 18:08:06 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEEC3D9;
        Sun, 16 Jul 2023 15:08:05 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fdb3f66fd6so1854136e87.3;
        Sun, 16 Jul 2023 15:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689545284; x=1692137284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r81jEnIG0dKobw9ApVBDGGLSYHLrTY1Vn/rJeVXh+Ek=;
        b=PKdUz1CV9jo9/Vl8XyfmFV0P5/HI4OgUAqqLj5rYk2jrmP8LPtLyEDirpw5HxFPgLm
         yLwKFwx3Z2eNxPZaDkgyAwASRoo3Oocm3dITptMwmwlaMayTEKtcYW4pjSa8Or6hTgdl
         utwuxagKQnahiylqyYVDwwKs2zKt2yQvgE1HtgHiYZZt53tliucLFUGKIbNByACewaWe
         G29LbNh717A/ulqn7JSwEuXw03NiOM7EIo5TpJ3aMr7tzxbxkMRl95FWkhjjyjo+SMET
         jEpgphx8RT0ER99t1Vj+AHdfrKsYZDbHiF99jvTrFhoqRHrJ+7aezTfHgBcV8bbk3jWB
         CbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689545284; x=1692137284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r81jEnIG0dKobw9ApVBDGGLSYHLrTY1Vn/rJeVXh+Ek=;
        b=Nb8p2XJf2aQu7GK0yeH9c751cGatkta95vvg8oh5dNDLr47DLPLmKvyD+naD8FtWfm
         Ogwses98FfpW25MJQuEkk6Hp23gkMbTClMc3kRa/LQ/nx+er1HM0hI0ndYNukZ3mRFd/
         yIbXU4daYdYbVa6lnTuA8Rh+iBwQ8JaPDT0tVKYnUFBFW8fu/k9YW2rTmRre3pm0nJIl
         fsoNvFlVTVfGmDg9rc8dKgx0HqRqnHTvqBaxl/+jg5dUTmEQwE61KUZVl4QxWmEUox1F
         9Kh2UoeRbXjAPO4UtyOUyQkbFczwIrQMtPteOcsE+2sVITmVFfR9fUMB7QtfCc1p85Wb
         1R6A==
X-Gm-Message-State: ABy/qLaxL06IyE+ekkr7v8z3luNaKziezmWmIZ3tKaO+NJkK4APibbfY
        obwpP1tlCZOaa2SY5ZU3rmA=
X-Google-Smtp-Source: APBJJlEXxoR743OlBYK8yq3Reg7VLesJsMR7imUllu+BG8eMXsBzSGyyq1ts4aOscD9vUcOjKDIjqw==
X-Received: by 2002:a05:6512:2214:b0:4f8:67aa:4f03 with SMTP id h20-20020a056512221400b004f867aa4f03mr7529377lfu.1.1689545283948;
        Sun, 16 Jul 2023 15:08:03 -0700 (PDT)
Received: from localhost.localdomain ([62.122.67.26])
        by smtp.gmail.com with ESMTPSA id h24-20020a197018000000b004fb9c625b4asm2464091lfc.210.2023.07.16.15.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 15:08:03 -0700 (PDT)
From:   Markuss Broks <markuss.broks@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Markuss Broks <markuss.broks@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] ARM: dts: exynos: k3g: Add fuel gauge support
Date:   Mon, 17 Jul 2023 01:05:05 +0300
Message-ID: <20230716220644.22158-5-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230716220644.22158-1-markuss.broks@gmail.com>
References: <20230716220644.22158-1-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This device has Maxim MAX17048 fuel gauge, just like
its Snapdragon counterpart. It inherits the double capacity
issue.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 arch/arm/boot/dts/exynos5422-samsung-k3g.dts | 29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-samsung-k3g.dts b/arch/arm/boot/dts/exynos5422-samsung-k3g.dts
index c3e006dc34ea..582faedd6aab 100644
--- a/arch/arm/boot/dts/exynos5422-samsung-k3g.dts
+++ b/arch/arm/boot/dts/exynos5422-samsung-k3g.dts
@@ -80,6 +80,30 @@ firmware@2073000 {
 		reg = <0x02073000 0x1000>;
 	};
 
+	i2c-battery {
+		compatible = "i2c-gpio";
+
+		sda-gpios = <&gpb0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpb0 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		battery@36 {
+			compatible = "maxim,max17048";
+			reg = <0x36>;
+
+			interrupt-parent = <&gpx1>;
+			interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&battery_irq>;
+
+			maxim,double-soc; /* Reports double the capacity */
+		};
+	};
+
 	tsp_vdd: regulator-tsp-vdd-en {
 		compatible = "regulator-fixed";
 		regulator-name = "tsp_vdd_en";
@@ -703,6 +727,11 @@ s2mps11_irq: s2mps11-irq-pins {
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
 
+	battery_irq: battery-irq-pins {
+		samsung,pins = "gpx1-5";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
 	touch_irq: touch-irq-pins {
 		samsung,pins = "gpx1-6";
 		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
-- 
2.41.0

