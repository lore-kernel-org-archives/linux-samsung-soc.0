Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BD4C43219
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2731F611CC
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239744AbhI1Iwf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Sep 2021 04:52:35 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53498
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239781AbhI1IwM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 04:52:12 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C6A1E402FC
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 08:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632819012;
        bh=9+M3zOsXaCPGsy+Y7A3HK2jtwWbSZ2cmPLzUVQxLrjg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=p96zupMrTPBt866gZ6AwyGZHNeH0nAxgbpYbxue13nOGLUm50081/jpcC+MWIjIo+
         h4GO7Ott9o3Mg+ySuxfP9P57/3nvSPTPJnZrEgE9gyeo+8WWjJRazXrO0MgP2Tys+2
         w9i8xpiQMJtqca7wzhOPkyXtL4auDwuAAe3yyuFZGL5prYKkUDFLiK5UxEpUlNpDoh
         dJAeL8/owfl1FjDf1uZOxRaVt2STZXCXx5/aFnX/lcLVRVLWF4VG9hL9eVARJzbTTW
         2DZNmeKO9pfX9vPQsqr3iQAAHZ7sgvj5mnYLL1BFLKdJ0EzplceogFPTqre4CFvMot
         76TxtdUuW5McQ==
Received: by mail-lf1-f70.google.com with SMTP id x29-20020ac259dd000000b003f950c726e1so18588562lfn.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 01:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9+M3zOsXaCPGsy+Y7A3HK2jtwWbSZ2cmPLzUVQxLrjg=;
        b=qYpGvPyazI/TAQu2gy9nPhFozPtv7TZPa26C0ausD4cWwqU9q+MjwzbbPa2dKZ6pgP
         uV5mIE1fTNOZJhB/uTDquBAj8r2vqZFDtKXRyzIiPtXCLHoPKecoydwphNyLhC7E4yTL
         VbgoypkONwzGu4jLHdp3uWPIomItWjyDzfxWeXzc3r4kAG8sL9QcbfEPU911U0Xz8+E1
         v3ryLXLMa7WLer2mlcy9weUS+cUlv9ZDU7AgRPExa91R1d9w1FZo2NhISCGbYCvoBkrB
         NSQLn6874wncfcInP+r7VWAqcy+vj55Sc5XPkvEmepH+1CnCT2JI934DvcmRpQLt/a5F
         FqTw==
X-Gm-Message-State: AOAM530u+jAjpDvZoMSQnZr15E4/jZx4KHs066vUYGcvYx+DTPT/KRIZ
        1D9oM5H/ZGTP+NvlFUYqJWb/SETdIMvPyz5OO4rIdw4n0e7mLZ055hOzQ34ph4Uzuih+6hsUgNK
        NHHYWYxsNdhdokTlnoc5Dwdxp/div/B9/tW7Az9SqzofdVBtn
X-Received: by 2002:a05:6512:13a0:: with SMTP id p32mr4522403lfa.492.1632819012272;
        Tue, 28 Sep 2021 01:50:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd1p1KF27X5q/HMw+Wy8K3uWfL4WhxDC2Ry8lcW1WZpEG8XLZ+MIvFRBAUiAMpcYmQVFUpMw==
X-Received: by 2002:a05:6512:13a0:: with SMTP id p32mr4522379lfa.492.1632819012109;
        Tue, 28 Sep 2021 01:50:12 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h13sm1848419lfl.205.2021.09.28.01.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 01:50:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 11/12] ARM: dts: exynos: remove unneeded DVS voltages from PMIC on Arndale
Date:   Tue, 28 Sep 2021 10:49:48 +0200
Message-Id: <20210928084949.27939-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
References: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The S5M8767 PMIC does not require anymore a safe DVS voltage, if the DVS
GPIO is not enabled.  Although previously bindings required providing
this safe DVS voltage, but since commit 04f9f068a619 ("regulator:
s5m8767: Modify parsing method of the voltage table of buck2/3/4") this
was ignored.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index a771542e28b8..3583095fbb2a 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -240,9 +240,6 @@ pmic@66 {
 		vinl8-supply = <&buck8_reg>;
 		vinl9-supply = <&buck8_reg>;
 
-		s5m8767,pmic-buck2-dvs-voltage = <1300000>;
-		s5m8767,pmic-buck3-dvs-voltage = <1100000>;
-		s5m8767,pmic-buck4-dvs-voltage = <1200000>;
 		s5m8767,pmic-buck-dvs-gpios = <&gpd1 0 GPIO_ACTIVE_HIGH>,
 					      <&gpd1 1 GPIO_ACTIVE_HIGH>,
 					      <&gpd1 2 GPIO_ACTIVE_HIGH>;
-- 
2.30.2

