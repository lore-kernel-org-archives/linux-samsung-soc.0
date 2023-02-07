Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BC7C636D4
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Feb 2023 21:00:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbjBGVAt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Feb 2023 16:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjBGVAj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Feb 2023 16:00:39 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F9E265AB
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Feb 2023 13:00:35 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so11518wmb.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Feb 2023 13:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EL0UxKkbBJyJQsPoDByYBOTCFVMLiiPVdLRpwYhsZyU=;
        b=QYvkwDEtI17eFx3Aky5tWD098dmnaGI3c54T+cIdcAwUqyzH1RwHuKU5MEuuZ3xajx
         WaZVGXsze1tpE3vp8YrGuB4flr0lNTu/u1UjUGlMK6ZxiYqzRsZU/GVPVfH9b7b2IxDM
         I1zLkcQrDtvDWPfH6kzDPeKZ8aeimwOQ3ML2jSC/YaOqXy6rgobFjwcT2Aov3gkDQm6C
         IWIkSE6K0o1KLTt8Sr8Z3SUPA9oB9cM+PTf8KjPmW9CWgUwgJ7KgavUwaKG1XDpfwizt
         QjPaJAjiz1xuv61x36wVlC/1Qs8ptleONoKPJddwnmPFJzyorKByIyawP8SeYtWel9ss
         oaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EL0UxKkbBJyJQsPoDByYBOTCFVMLiiPVdLRpwYhsZyU=;
        b=4JzAjDoLfQAR+KkuTvcSnRAh7JeOWXeumv9rupr4Ib2OFJ8tMmO6h2PowjDhKS6Xnl
         fhg0vkEvfNHoAoS1/B14WB1dGgqPF1nZVmZcp2cUm2bYlYEF2C00BkWIARbs9pga/JnJ
         rzdcS1OA0iyG1bXgeqB4JsCiUGN7I8WRRoqXT4dz+gTkWWTo70n/o3g0g9UkDqCUVmH4
         H+JRjTb5dJ6OvXTaFU/KDKqELqLr/G4Pe3q3/T+tlg8eMJqjMZXpqIStldUvWUEeofSF
         0UaVu3ZP1ZsKLhETpvcIf7O31YW+LSW6Cq8wcnv6vUi3/I5LBBE5I9PTaEkQYDGHZKMB
         vDaA==
X-Gm-Message-State: AO0yUKWbYB2F5wli2QqPpOxiQKv1adjTXjpgMXlQCqbxte5BVzpS3Fff
        K57FZX4ymLDhEC128ZcXXPiJXQ==
X-Google-Smtp-Source: AK7set+iWPMML3Nm2brY9DDC78PaPSUmaB2xj9+8+sVGsinSPH+VjBv0oq3VZeEnT0ElEM52IECvQg==
X-Received: by 2002:a05:600c:a295:b0:3da:1e35:dfec with SMTP id hu21-20020a05600ca29500b003da1e35dfecmr4247864wmb.4.1675803633511;
        Tue, 07 Feb 2023 13:00:33 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c44c900b003dc4fd6e624sm8041631wmo.19.2023.02.07.13.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 13:00:33 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 7/7] ARM: dts: exynos: move I2C10 out of soc node on Arndale
Date:   Tue,  7 Feb 2023 22:00:20 +0100
Message-Id: <20230207210020.677007-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207210020.677007-1-krzysztof.kozlowski@linaro.org>
References: <20230207210020.677007-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

I2C10 is represented as i2c-gpio device, thus it is not really a part of
soc MMIO bus:

  exynos5250-arndale.dtb: soc: i2c-10: {'pinctrl-names': ['default'], ... } should not be valid under {'type': 'object'}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 28 +++++++++++-------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 305289ed06d8..56f08ca4762c 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -73,6 +73,19 @@ key-wakeup {
 		};
 	};
 
+	/*
+	 * For unknown reasons HDMI-DDC does not work with Exynos I2C
+	 * controllers. Lets use software I2C over GPIO pins as a workaround.
+	 */
+	i2c_ddc: i2c-10 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c2_gpio_bus>;
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpa0 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpa0 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>;
+	};
+
 	panel: panel {
 		compatible = "boe,hv070wsa-100";
 		power-supply = <&vcc_3v3_reg>;
@@ -615,21 +628,6 @@ &sata_phy_i2c {
 	status = "okay";
 };
 
-&soc {
-	/*
-	 * For unknown reasons HDMI-DDC does not work with Exynos I2C
-	 * controllers. Lets use software I2C over GPIO pins as a workaround.
-	 */
-	i2c_ddc: i2c-10 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c2_gpio_bus>;
-		compatible = "i2c-gpio";
-		sda-gpios = <&gpa0 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-		scl-gpios = <&gpa0 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-		i2c-gpio,delay-us = <2>;
-	};
-};
-
 &usbdrd {
 	vdd10-supply = <&ldo15_reg>;
 	vdd33-supply = <&ldo12_reg>;
-- 
2.34.1

