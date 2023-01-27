Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A3EC38142
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Jan 2023 21:27:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjA0V11 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Jan 2023 16:27:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjA0V10 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 16:27:26 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE841205D
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 13:27:24 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id j17so4358282wms.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 13:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=smuQo4geAWNJOxGHerqBUE4luc859AqeHaJfREjKn6k=;
        b=YgKFG9jY7x3+04njsrvCicDj6oHs+G5HsblgQCn+sHNibQ60jhn6aQ4BQ0mO9+MIHQ
         j7ybROVnewB5v0CP99a1dioAZYnIxBpu5IfrtOpZzWbg5TIJnepROS5br8Uc2JwleCvV
         1E54MPBd74WQMPkvCfVXqjCBN8CZJgPZMf88oEQ5ytfbETfybFXFw+kFHKoSMNyCUokd
         BRRJIn3CurAaVkbi6KKWIaQjVCCE8zP3Z5Gu8j0L6RiujPjsUh5wvGhY5duO9Ms6vQsS
         IbP3MLp4rV0Ju27EDX+Ia+8JJ1C1EoGZydgPHYy1zvcs5GcW7q+2UA6O/tXmj0J2wBqf
         zIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smuQo4geAWNJOxGHerqBUE4luc859AqeHaJfREjKn6k=;
        b=lPGTrVwpVTgVsHme8/F4tFZlsktkeHcNpkqP8y/0Havrds4ML647qT4IdZ1tViIj3P
         +qO5124R7Na7jd7QtIZ8RlAKLSQeHilRhoNwKTyeFSKNGNxDbwMWLkL5uUR1OQ6D5t/p
         bxAOnLMd/CG4Xx+L9BuqSO0nybL5UDYcXTJWfPw10fFi5TCX/k1SBFeK9dWqNIAMAa+N
         W9njlb7vcGp87DW9MiwgzDMjX0tcwMOJUHt1b98auViTGoJRNzgtkjog52bccEqj84lL
         XTtXTOuJfk6pvEAvuIgG144wXBhb4/jOwVtbz9EQa8khI2bOwbfZgMMykr7YEnt5fR9Y
         VIAQ==
X-Gm-Message-State: AFqh2kqNSMoB40w8qG9EV0XRgz3YOJWpwpuX/SxP3PrMWZykfTFyru89
        Q9V68ReX6KBXQSoEyr9YuROI2A==
X-Google-Smtp-Source: AMrXdXuZGqnKBOjCXQNdvu2ZNVf0qkZubL90gPODwjPBra1PBu8DRipuQtBPKoQvMhCaJixwtZa7EQ==
X-Received: by 2002:a7b:c5c4:0:b0:3d7:889:7496 with SMTP id n4-20020a7bc5c4000000b003d708897496mr39599663wmk.17.1674854843408;
        Fri, 27 Jan 2023 13:27:23 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d11-20020a05600c3acb00b003db30be4a54sm8645303wms.38.2023.01.27.13.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 13:27:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v3 1/4] ARM: dts: exynos: add unit address to DWC3 node wrapper in Exynos5250
Date:   Fri, 27 Jan 2023 22:27:10 +0100
Message-Id: <20230127212713.267014-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Neither simple-bus bindings nor dtc W=1 accept device nodes in soc@ node
which do not have unit address.  Therefore usethe address space
of child device (actual DWC3 Controller) as the wrapper's address to
fix:

  exynos5250-smdk5250.dtb: soc: usb3: {'compatible': ['samsung,exynos5250-dwusb3'],
    ... } should not be valid under {'type': 'object'}

  exynos5250.dtsi:638.16-653.5: Warning (simple_bus_reg): /soc/usb3: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Use ranges with values and drop reg from usb-wrapper node.
2. Keep "usb" as wrapper's node name.
---
 arch/arm/boot/dts/exynos5250.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 97e89859ba3d..a5db4ac213d5 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -635,17 +635,17 @@ i2s2: i2s@12d70000 {
 			#sound-dai-cells = <1>;
 		};
 
-		usbdrd: usb3 {
+		usbdrd: usb@12000000 {
 			compatible = "samsung,exynos5250-dwusb3";
 			clocks = <&clock CLK_USB3>;
 			clock-names = "usbdrd30";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			ranges = <0x0 0x12000000 0x10000>;
 
-			usbdrd_dwc3: usb@12000000 {
+			usbdrd_dwc3: usb@0 {
 				compatible = "snps,dwc3";
-				reg = <0x12000000 0x10000>;
+				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbdrd_phy 0>, <&usbdrd_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
-- 
2.34.1

