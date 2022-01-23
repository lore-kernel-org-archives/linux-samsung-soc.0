Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3180BC4167D
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jan 2022 11:17:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236279AbiAWLRA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jan 2022 06:17:00 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38444
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236238AbiAWLQ4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 06:16:56 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E405B40052
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 11:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936614;
        bh=mZrAftbEtCYMgTENBFFGXCuFnaLbp5VnVYmLha/DMRk=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=SH1O7Dkc41IHRMFbDOfEVJG/NO2Uu2LOs6vlYa8+lGK2E+/sOeVlrf2VJgaTIYHlB
         HcjeJXeyS9ILljzp0vRtAnKRzTzJUIa0E0U8LBFfvWmgdfeoo3xiEZ3U0W03WkvG07
         dQrMxeEJkbp3erpRnWUa/Z2MNNFSi6his4LWaqdQkWiML3nfQTAMjD+mMo/h79u9Nk
         3rxGgLArt+u8EZ8XAAkQtGd4+b4RWgIoF4TnVbRZ7qjeYBG9CmS3yZddXfcGk72oYT
         /1CpQ+l5Vn6/nxqMoYbfsphUguzuB8uQybmhSxmCaNWrDC9xXm97GIV8kOsDa0TGzL
         MVz9HWhFle9mg==
Received: by mail-wm1-f69.google.com with SMTP id a3-20020a05600c348300b0034a0dfc86aaso12951873wmq.6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 03:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mZrAftbEtCYMgTENBFFGXCuFnaLbp5VnVYmLha/DMRk=;
        b=CQNEK4uuGepUoX2JhzUUx90clUiMOtHrVc39wVsUjMMhjvKlhbdqfdAnxcZ00OVyxO
         JbByrydfWA/N+5HEY7aC+w4nYO09w7eBC8l/A3HNZAZVSb2VJrwEjBKi9gFuvIy/aQ7I
         dulAsSMZYTXDeaWvyeaT7/uCNQS8v+kPj84/H5v2DNu2DAPKmlY93jALcSdZx/D5WJ8M
         XfQiLF2JnPRN5S2X52DxM/tUphqpg1FH2+U6d4QN0n6eKmcivuXZ1ergVHTcjPfHDqZ4
         vZx25ZmmmzPO2LtKqEHjpongAbhZqN4jzV7SN2EulPUuYD9DReOWaxcbg8OYFy8R3aqb
         NnXg==
X-Gm-Message-State: AOAM530MMaaas83ui5dbvkLCZCm8imfvmu7Qq3yMquXvaFyV9ljdxLX1
        viM+Dt9MUWQpHL90IrCmbRRHIzJekObViqeNaB0zsnc4y89KOmDupUe1woKh6INaev8lZVKEc7r
        AYp9u6hyYMiWQUVQf7gwM3peReqfg5pbYuuwWkWik+nZwEhBW
X-Received: by 2002:a5d:64a5:: with SMTP id m5mr2349922wrp.596.1642936614109;
        Sun, 23 Jan 2022 03:16:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbgZpejnF9FsaGyv4Km9SlVIA0mLrJyWVOdw4PpZPzd2pNEg41zEEfiODSBE5ZfvFaMZwUFg==
X-Received: by 2002:a5d:64a5:: with SMTP id m5mr2349911wrp.596.1642936613937;
        Sun, 23 Jan 2022 03:16:53 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:53 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] ARM: dts: exynos: add USB DWC3 supplies to Chromebook Spring
Date:   Sun, 23 Jan 2022 12:16:37 +0100
Message-Id: <20220123111644.25540-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add required voltage regulators for USB DWC3 block on Exynos5250
Chromebook Spring board.  Due to lack of board schematics, use same
regulators as on Arndale board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5250-spring.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/exynos5250-spring.dts
index e0feedcf54bb..138f51f974c7 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -553,4 +553,9 @@ &spi_1 {
 	num-cs = <1>;
 };
 
+&usbdrd {
+	vdd10-supply = <&ldo15_reg>;
+	vdd33-supply = <&ldo12_reg>;
+};
+
 #include "cros-ec-keyboard.dtsi"
-- 
2.32.0

