Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925A8C636D7
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Feb 2023 10:59:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjBIK7U (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Feb 2023 05:59:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjBIK7T (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 05:59:19 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495694588A
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Feb 2023 02:58:50 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so3562879wmb.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Feb 2023 02:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+5nqWCuDUyZTrVyTtaVBg5+R7qkLRJ5SKf8oifJuNE=;
        b=C69x6HcOdwDaax4dQIsZ6lvHh32/OoP4EWO2aJ0twI8ailNtWQ9OPF6jtqm5WSOtRU
         jhN7SOyNb9O2Vy98sl79QMKWMTZnbNYWJc3/iOsmpBFROqIIVgP/F4UJXRBNHg+kEZfF
         F6AP4Uc1VlwkIfXgeof2hxprOgIz9vhPZ13YqBDeJZHK3HTOahN+z32poEb29w+xnl3x
         tAh82Z99/IFOecnNElo+Pt4G4UM9qTvxDx/hsp+qw1aHzUkthUt+29r8YxRim2B9If79
         JrqUR3tvWhuaERlOzgpeDLg+Ec8eY13d9MdIOQBN3NWoNhg2gXDJ34d7+Mvy6ojYVISo
         k9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+5nqWCuDUyZTrVyTtaVBg5+R7qkLRJ5SKf8oifJuNE=;
        b=Fe9R2OhujPyHuu+698sznWRUyqfq0TxWlQOP0SXtUpNpMc8Kvyw0dxrB5LZtISAFxV
         Zgn6HXmG8taFfUpOZpeLLA5y1J9nSpTFHvPsjDCig0877lJC6ZNnqNEaOGXGmal4XbaL
         HDeJld2CMbTrcC1z1/kgW0gmGv5uKtvcz6J1CHBEpmo8MmMg0jNHGj9Tj4aKTzpw0U2l
         rcIYuKHl/rXxyLueYrqTqjwR9qhooqqkwwyAgwIb6Mv2Dmca6SE9Tbqlk0bwJKw1tW9H
         hL/xBv/xmD38SPEtlbs4THmrlMB5Xq+94L7rA0MqvhcDZ7VPBJH7lRSGf2pwNYedwBdK
         E+BQ==
X-Gm-Message-State: AO0yUKXlNeS9WQWn7MjPA1QqdLzqEC6hYbUEUWmyA/oVt1Ovxyog2qpI
        F0n7o3aEJqQxtgjVzOfNEsTYeA==
X-Google-Smtp-Source: AK7set9WVWtkx2S7B89JQ/mNz6qaCe3zX687iIYP2pWF7b9uabSpfjwcAIhcz+xh7ijHdy1YxltQzA==
X-Received: by 2002:a05:600c:3ac4:b0:3dc:18de:b20d with SMTP id d4-20020a05600c3ac400b003dc18deb20dmr10614671wms.33.1675940327411;
        Thu, 09 Feb 2023 02:58:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d6987000000b002be063f6820sm927987wru.81.2023.02.09.02.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 02:58:46 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Lukasz Majewski <l.majewski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Javier Martinez Canillas <javier@osg.samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 1/6] ARM: dts: exynos: correct TMU phandle in Exynos4
Date:   Thu,  9 Feb 2023 11:58:36 +0100
Message-Id: <20230209105841.779596-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

TMU node uses 0 as thermal-sensor-cells, thus thermal zone referencing
it must not have an argument to phandle.

Fixes: 328829a6ad70 ("ARM: dts: define default thermal-zones for exynos4")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4-cpu-thermal.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4-cpu-thermal.dtsi b/arch/arm/boot/dts/exynos4-cpu-thermal.dtsi
index 021d9fc1b492..27a1a8952665 100644
--- a/arch/arm/boot/dts/exynos4-cpu-thermal.dtsi
+++ b/arch/arm/boot/dts/exynos4-cpu-thermal.dtsi
@@ -10,7 +10,7 @@
 / {
 thermal-zones {
 	cpu_thermal: cpu-thermal {
-		thermal-sensors = <&tmu 0>;
+		thermal-sensors = <&tmu>;
 		polling-delay-passive = <0>;
 		polling-delay = <0>;
 		trips {
-- 
2.34.1

