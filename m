Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28FCC43217
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jan 2022 11:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236338AbiAWLRK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jan 2022 06:17:10 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56108
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236281AbiAWLRB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 06:17:01 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C11C33F1E0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 11:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936619;
        bh=66G1PF8Q0lr5LRIbEYZW0Tv4PnJMOlbJQ4z7W8Ayj8M=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=mOOrFPaB7NK12JbqA1RJfp4LAxPp0l/w5M2vNCK6geVLim9Soq7V9HanQcm8JWGJI
         RC6PtM4g1WvaYye9u8IXqUD25JAhN5+h+nQoZXF4+iiLu8ZTkKs5mALuKy71Afqgfe
         XXRbFnePZn0kpcnIOh1nqP43HwBq9zL+GNr42OR5LE28t3lw8zY/Oa2/m7DJuWifzK
         tydE7dV4nYfjdbIZ7p61+Q3tc51AvYtN7/km+18e3jdYb6w96iKYpkcF66X2G9MWr8
         hCw3IDWD57zUpC+ScQOZ9B47UVjMZeu/h22bSAze51NCHoHqeXWbiqoOgrunIpCXVV
         bDqw+AS9IvFTw==
Received: by mail-wm1-f70.google.com with SMTP id m127-20020a1ca385000000b0034e992a94a8so1471595wme.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 03:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=66G1PF8Q0lr5LRIbEYZW0Tv4PnJMOlbJQ4z7W8Ayj8M=;
        b=hdhiZZK9VbuE0Sv7jkVeespE/l4XKnweMDz18JeYLzBbEx7Uu6E+qSMc+ZRTgy8JHE
         vCFL7GplsKNB6U5fZ18WiDX/3JtcnvxM/WgLLDqDuTK2OjsPms80xSTCboYzvyCQSC5z
         VeKT3oceF/SfADK/UhXxxXmdKiZThi26aNJtoBHjZb9wQDKKb+HBa9H5T6upCPPA2aRA
         8at9cOEeZ7rWzEtOdw8UQp6tD10zTTTqUSQoAvXjRKW2PXZ/xLe+ZmOnYIuIbc5zcdTB
         Xi/PLOa4pZZt1NZpKsFKAWC3ymifdd3sJqF67BG0B2Do/JIYqxvXr7M+NjpqOmDuDrOQ
         YAeQ==
X-Gm-Message-State: AOAM531tQQgs021e9AiEOfY3Ly9hadaOzdFz7OPpY5wd+D+DbzI6LjEG
        gzLFuM1kDquLvXjxjUZ0dJWgNGcITS/Rxa/Er7H+FdDQrqBPoC6TOdm5lncCwjlp5+oEiqWPXJV
        7l/PIp5V4m4MJUh2PQiatoY4Z2pNBDcHClZRUDM8lBgjcoQ51
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr7689624wmk.191.1642936619325;
        Sun, 23 Jan 2022 03:16:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEem2eKrggZGWq3zOh3tVCEin/9AMSkAxLad8GyWyumd6SS0jXIESrFaTiCvb+wPkBmGYPsw==
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr7689615wmk.191.1642936619200;
        Sun, 23 Jan 2022 03:16:59 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:58 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] ARM: dts: exynos: add USB DWC3 supplies to SMDK5420
Date:   Sun, 23 Jan 2022 12:16:41 +0100
Message-Id: <20220123111644.25540-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add required voltage regulators for USB DWC3 block on Exynos5420
SMDK5420 board.  Due to lack of board schematics, use same
regulators as on ArndaleOcta board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index a4f0e3ffedbd..69ce3e430863 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -407,6 +407,16 @@ &rtc {
 	clock-names = "rtc", "rtc_src";
 };
 
+&usbdrd3_0 {
+	vdd10-supply = <&ldo11_reg>;
+	vdd33-supply = <&ldo9_reg>;
+};
+
+&usbdrd3_1 {
+	vdd10-supply = <&ldo11_reg>;
+	vdd33-supply = <&ldo9_reg>;
+};
+
 &usbdrd_phy0 {
 	vbus-supply = <&usb300_vbus_reg>;
 };
-- 
2.32.0

