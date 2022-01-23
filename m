Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4BAC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jan 2022 11:17:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236255AbiAWLQ7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jan 2022 06:16:59 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38422
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236235AbiAWLQz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 06:16:55 -0500
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 50F884004C
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 11:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936613;
        bh=grI5UfAEDAIP80sPof/wJdxtniWt65JOOqzZgKpwDAo=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=v+8DeblTUjeFPYy3Bz1ZpaYt6NVCu4PfpjYkOc1U7vIoEPBLxyPSVDk3M9hUgfKlu
         AyUcG4OmFR+vu4bgn919KdDr2m6jtDzXLJp9RpbendqqQFNTqdR0047v7fi79PgPfX
         S7l0GA9R4STO1iQf9gTzTZE04O7He1Ijzls/4HY/93rvwN4TrBO3YKYX/Y1Zie+FT6
         HYZJ02x9y8Ug1XANcDtQIZR1AQpXOmP9gQIqSBkQ8HNrxfbNBsaV6B/3jwplRiu2mV
         tmmylyknHowzgFBG/S4hueN6Gad+MibMr/jmiLEst0O8qUjidw7wSGQVDHzW7tSeQp
         1JiUuwMs9KEzA==
Received: by mail-wm1-f72.google.com with SMTP id l16-20020a1c7910000000b0034e4206ecb7so4868259wme.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 03:16:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=grI5UfAEDAIP80sPof/wJdxtniWt65JOOqzZgKpwDAo=;
        b=mkOgYsqB9uabwF42DCMbxE93hDqZsvo0vFyKrBW0PDS5MQ42P96rWV8vSM6pdzKoMM
         e3zRwz5HXrqp1dTwYFiqXMR5sJGBhJ/0w/dD0sj9VPG/7/NEfZ8g5GXloYYBAZMYAQiA
         z2zUf8DJ67fhwu/3x/6U2YbR03l2uaZrmaWZyxkXG0P+RU0e4Wh8loySA6a9Z8KRo8OH
         KEXBon0ldWW6hYwrbLc2VPRWd3vNg6HJJWSX/hdz8Moektyw+ERKPf6ifcrQDYZUGzWo
         BsmNTHYgpQ3gt6bXUSvTDwBTZcVS+paOx2k+MzbMJzX1C+9ZtN/52rOerWQTDCFMMOBF
         pcDg==
X-Gm-Message-State: AOAM532qzBXZbleeLED4dfzA7VIj7HNVzuDL3OwzkdZESXYrhdo1G/tn
        yzroiLxICZUZQ5pUWbCropVfDZV1CSR2bLKaFSH9sELam0BHWMoiXqUrEdE5q8aWBLHMC4aWnPj
        MBXBV9LIzNhI+sztlEMWBt1U8H6He6fyDVHt2vF7WEjmmi8MI
X-Received: by 2002:a5d:5887:: with SMTP id n7mr3788124wrf.95.1642936613067;
        Sun, 23 Jan 2022 03:16:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxdELQf6sIqrI/0YVD1AI+KkjLutbJQyLtovsY93KZNKsW7PHRBKT0U90IZXspsKI6wQudDQ==
X-Received: by 2002:a5d:5887:: with SMTP id n7mr3788117wrf.95.1642936612924;
        Sun, 23 Jan 2022 03:16:52 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:52 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/12] ARM: dts: exynos: add USB DWC3 supplies to Chromebook Snow
Date:   Sun, 23 Jan 2022 12:16:36 +0100
Message-Id: <20220123111644.25540-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add required voltage regulators for USB DWC3 block on Exynos5250
Chromebook Snow board.  Due to lack of board schematics, use same
regulators as on Arndale board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5250-snow-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
index 2335c4687349..ccb32d53d598 100644
--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
@@ -698,6 +698,11 @@ &spi_1 {
 	cs-gpios = <&gpa2 5 GPIO_ACTIVE_HIGH>;
 };
 
+&usbdrd {
+	vdd10-supply = <&ldo15_reg>;
+	vdd33-supply = <&ldo12_reg>;
+};
+
 &usbdrd_dwc3 {
 	dr_mode = "host";
 };
-- 
2.32.0

