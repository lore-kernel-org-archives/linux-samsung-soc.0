Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4D7C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Feb 2022 17:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383486AbiBHRTR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Feb 2022 12:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234241AbiBHRTQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 12:19:16 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CCAC06157A
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Feb 2022 09:19:15 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F1A4440048
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Feb 2022 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644340753;
        bh=VHcPmkTeJVNyntx2kBlzhzsUutabuRvxOsRCpNXtu84=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=CtCU8VIhY+ptcnf0HZyvZt8HqOPPuNOo+0wTkf7KNJWM7Bvgrrkl1M7hmNxLnPyGL
         4sI3nwrGxU77ENH1RzYZEhVtgLc0URRPzzE2mTFmX1oiRzm3W3aaLb5qmf6dV5SRdX
         V68FkFBT1fXcj6sLjdnF1m8aWUG49GHXxFfCG214gB3kRca+C+S8PdVChmhLiJvjMC
         QRu7wUvg9WOsDRcftCHLTmLrB8tu3rHlvpYEN15s3gVpqDapWObxzaViLqt+d3AJA/
         ER5AlDJT4cix9LntXTqSRrriEb6Lb7D3C4HPN0yG3MtuBetehFbMAKgjANEON8o2BX
         VSGtBZE9YPzoQ==
Received: by mail-ej1-f69.google.com with SMTP id r18-20020a17090609d200b006a6e943d09eso6038726eje.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Feb 2022 09:19:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VHcPmkTeJVNyntx2kBlzhzsUutabuRvxOsRCpNXtu84=;
        b=FaoTaG3+s73YAzHxBX0ybkzap8lsJWLf0ktHzs5wv+dVET4VYS9cS2C9qicdrcqlP9
         07OLAiZ+jS8Brn4B2zAcLhqsm0OqqdmoRscI/y+bj9tLsW4u9w4qyC/MWD+LiWnNXUKB
         PFHDfN41cg7msOud4A+r/NijC3OD4Eq9rPz6cofi1OLqT+og9m3I1OCxWt3hFRNsWYir
         Zz4sXzZwKuXns5x2UjQk7+KRNJNZOceuM385mgjirzaIAOvxCta3pvcw738xsbQC63gS
         0aZ01shTrvkdtD4OjzECSNjNeoGyfA7Daoidm0SNcFMcF2+FTAxuSSYjn8D9h7TdI0LC
         UkkA==
X-Gm-Message-State: AOAM530ktRMWIONPuaPtfTM0l5RD7q+GNeeFjkgNRH0vR2vnHQ3dfE95
        2rmOWGH/ENJBBh41GqFV/vo3zhOX8WpLxp4ug7nLMbqr1ICdPkb2vOApKLHS7FurVlRLX8mvS0l
        tkmYb4JJQbk6FuB3QnFCnJSZgRMN9H+s9TC+rNE4uT5LuxW6I
X-Received: by 2002:aa7:dd88:: with SMTP id g8mr5421156edv.437.1644340753083;
        Tue, 08 Feb 2022 09:19:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzu+cFFUCenp9+7nbzSzHf1p2aHa5gSlHKLF75wAskvl768sx1e6yjGcesa9sVQ2V3f6PILbQ==
X-Received: by 2002:aa7:dd88:: with SMTP id g8mr5421132edv.437.1644340752936;
        Tue, 08 Feb 2022 09:19:12 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id r10sm5125550ejy.148.2022.02.08.09.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 09:19:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        stable@vger.kernel.org
Subject: [PATCH 02/10] ARM: dts: exynos: add missing HDMI supplies on SMDK5420
Date:   Tue,  8 Feb 2022 18:18:15 +0100
Message-Id: <20220208171823.226211-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add required VDD supplies to HDMI block on SMDK5420.  Without them, the
HDMI driver won't probe.  Because of lack of schematics, use same
supplies as on Arndale Octa and Odroid XU3 boards (voltage matches).

Cc: <stable@vger.kernel.org> # v3.15+
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 2978b5775a6d..4d7b6d9008a7 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -124,6 +124,9 @@ &hdmi {
 	hpd-gpios = <&gpx3 7 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_hpd_irq>;
+	vdd-supply = <&ldo6_reg>;
+	vdd_osc-supply = <&ldo7_reg>;
+	vdd_pll-supply = <&ldo6_reg>;
 };
 
 &hsi2c_4 {
-- 
2.32.0

