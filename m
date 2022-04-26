Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1446C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Apr 2022 18:34:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351954AbiDZSiB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Apr 2022 14:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351930AbiDZSiA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 14:38:00 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4DF606EB
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Apr 2022 11:34:50 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id y3so17463908ejo.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Apr 2022 11:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I36VwtUeuAmuD4bFbNMu6bpDdj7jTQxYDk6uobWAz4I=;
        b=CSDcGpGYwWyi+nQU+QfG4w4xt2JugtgrTpyEtNtutBA+oc3F4R7DvwwsgFe53SR/G7
         DLVv0C0TK6QT41ZWb+XnlfrZ1TGqOyVkbyu6yrZsB+zQYy45spAMBqiBuOubQ9BSXJCu
         LqCOgzzvLvmkdUuyr5nsztZ4LADuWO4RhV18QXGMAH45tlJa5A0kpNl1Q3Z6Qxc4nwZX
         rNO/0HmEoVuUkzBIrzR17BPuAx55VoevddCiX3aW9ftyZwtFIFkrugvakhlWRwpVrpaz
         pBpxTqNbrrlavAVZWw6pICQbfulgC75uUZKZiLq9K7CExLa6qfv3mSIaWdpmZ0w7pQae
         rm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I36VwtUeuAmuD4bFbNMu6bpDdj7jTQxYDk6uobWAz4I=;
        b=ezP1nZiEfRmdPFtkliY2B0Z+WfcfkOEVLur9pCQCefhja7jOT+R3B/64pFSzjZ0KID
         or0aToEqX0QmNdn1lXfz5BcHH1fUF2Jd945RE3v1yMs7Y3oNgtqXUDuuHQxmnTy5tNw6
         YBCcaYjRJZap4m98x26Y0hQmsomevEKhHOvh5JHjBkUvMiQe1reJyn7uYqFSnoO+5Lbs
         atgzZWFgfJaJZ7HWNppR1t0faAtjLeXhJTUOgEsNNuy4BAhTaemqLYF3+uTw77kmd0Uh
         Mpoh5A+RWq/yqiA8TjDgqUI107JBt3XiRU7xFk4bSAHpMnfK865DoI8/IRoXFDynkvWQ
         OHUw==
X-Gm-Message-State: AOAM531LUX/HNRR1hCNjZ7B/fHBRoRcqK/zR75OW7ymTue+kt6mZxncN
        gNWSKoP4GvVuOu5obdtvlUe+gw==
X-Google-Smtp-Source: ABdhPJzv66jM6MIqRtt7g5BYGXZjhviSioV3C+dNgc0TitekVscN7XXrq3vvtBMi+cECjIvjLanl0A==
X-Received: by 2002:a17:906:7c93:b0:6cd:341a:a1d5 with SMTP id w19-20020a1709067c9300b006cd341aa1d5mr22084235ejo.698.1650998088759;
        Tue, 26 Apr 2022 11:34:48 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x1-20020a1709060ee100b006e8a49f215dsm5292323eji.73.2022.04.26.11.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 11:34:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH] ARM: dts: exynos: add atmel,24c128 fallback to Samsung EEPROM
Date:   Tue, 26 Apr 2022 20:34:43 +0200
Message-Id: <20220426183443.243113-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Samsung s524ad0xd1 EEPROM should use atmel,24c128 fallback,
according to the AT24 EEPROM bindings.

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 21fbbf3d8684..71293749ac48 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -129,7 +129,7 @@ &i2c_0 {
 	samsung,i2c-max-bus-freq = <20000>;
 
 	eeprom@50 {
-		compatible = "samsung,s524ad0xd1";
+		compatible = "samsung,s524ad0xd1", "atmel,24c128";
 		reg = <0x50>;
 	};
 
@@ -289,7 +289,7 @@ &i2c_1 {
 	samsung,i2c-max-bus-freq = <20000>;
 
 	eeprom@51 {
-		compatible = "samsung,s524ad0xd1";
+		compatible = "samsung,s524ad0xd1", "atmel,24c128";
 		reg = <0x51>;
 	};
 
-- 
2.32.0

