Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B98DC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Mar 2022 18:20:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243730AbiCNSVY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Mar 2022 14:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243724AbiCNSVY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Mar 2022 14:21:24 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67EEC35241
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Mar 2022 11:20:13 -0700 (PDT)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4360140031
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Mar 2022 18:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647282012;
        bh=XM2s1gZCmvaiMC5hvavtavOjROhOMhICf68KJhjCzDk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=KT/uX2sVsPSmI8vEtaWsTohMjRQSYMn2kSUM95g31pB9MVI+l0Te1LXH8Rq7XcVQw
         A3rF0QaSkgo5DkH1ij7nEZCCgFyv0PXmUEdTnH/Y0AksasFnPMQ3C6FtBRF7y6k8uy
         uMbg/McpRn3Wf+q3dv+UJQ9+f0blymVf99TV+rjSVEPKVeaHt8RfTAgAJ0u7abLLlt
         UVpbyVKthfi0rxqs2u+9hfoyR9jaQCpXPSYaWrWe2DozVIO+Wg/qL+4/5vGFyB151b
         j5pslMJTwoQawFw3CNj/EV7diyWPR3PZfhXWH+CYMYClb/11boZbxQaTiroPoOCCJd
         lQEILsrsNjZcw==
Received: by mail-ej1-f71.google.com with SMTP id qf24-20020a1709077f1800b006ce8c140d3dso8381213ejc.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Mar 2022 11:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XM2s1gZCmvaiMC5hvavtavOjROhOMhICf68KJhjCzDk=;
        b=3R7PO2FgcDsT8EAAX0hGRXkBR3f72pI0x+0e97nXIqf58zKtbLfX63OyVl6qeUS+ZS
         lWtvhXJuBW20Ek02jEv+uQMxNOvKKqR8KzlYlA68o12JKbjgA88Eb9edGdLbNjA2ioUm
         axr5zq0R5nAYyDQ0/7s4trn+byzWRFratvMTAuVd1iQgqR328vx79/glF7Z+LlJoUBih
         A2BWLjaeqfuGhr6tKMkKPe1H4zpdritdNoVrt1/7HW6pIyKnbLryBU42Xu64TW4nf70W
         4ZHx0yjyFOjIDVttGAwUvR0kdL8lRusRkaL6ZL+BpKw7ISXOyRSdYIapccj+dIc34MXm
         dtQg==
X-Gm-Message-State: AOAM5333y035nqlXDRpjcEEu5t1ubRvVf07wdixUoryaobfpA6An8ks6
        kqySMCpTBSf6BhuVnvLNNteLzwhQKIrWAI2pu6WIrToKU24swPFl3cC6UoD4M9h1sn8OUr9WCjN
        qWlt8UeZL59b+3Qb+wPHV2foDljY1zxQowffL9BXlWS8YFXSL
X-Received: by 2002:a17:906:a08b:b0:6b9:2e20:f139 with SMTP id q11-20020a170906a08b00b006b92e20f139mr20617745ejy.463.1647282011621;
        Mon, 14 Mar 2022 11:20:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5tg2FLtKp4Xqd7L0LVthZGXx0d5/uGsjTyL2DgIGrjaZnaYsMA1POfB2dWcScokMBvI7Axw==
X-Received: by 2002:a17:906:a08b:b0:6b9:2e20:f139 with SMTP id q11-20020a170906a08b00b006b92e20f139mr20617734ejy.463.1647282011472;
        Mon, 14 Mar 2022 11:20:11 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id i25-20020a50fd19000000b0041614eca4d1sm8566449eds.12.2022.03.14.11.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 11:20:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/5] ARM: dts: s5pv210: align EHCI/OHCI nodes with dtschema
Date:   Mon, 14 Mar 2022 19:19:45 +0100
Message-Id: <20220314181948.246434-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com>
References: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The node names should be generic and USB DT schema expects "usb" names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/s5pv210.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index 353ba7b09a0c..a7aca54832d9 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -427,7 +427,7 @@ usbphy: usbphy@ec100000 {
 			status = "disabled";
 		};
 
-		ehci: ehci@ec200000 {
+		ehci: usb@ec200000 {
 			compatible = "samsung,exynos4210-ehci";
 			reg = <0xec200000 0x100>;
 			interrupts = <23>;
@@ -444,7 +444,7 @@ port@0 {
 			};
 		};
 
-		ohci: ohci@ec300000 {
+		ohci: usb@ec300000 {
 			compatible = "samsung,exynos4210-ohci";
 			reg = <0xec300000 0x100>;
 			interrupts = <23>;
-- 
2.32.0

