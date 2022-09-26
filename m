Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28005C6FA83
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Sep 2022 11:41:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238318AbiIZLlq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Sep 2022 07:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238315AbiIZLlH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 07:41:07 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F3C6E2F0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Sep 2022 03:45:25 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id o2so10115678lfc.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Sep 2022 03:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rNWG4JRe++162NhDsfBIYQjTSKMyRVIRJUKX50ptAGY=;
        b=apxdxC/SZwYOVZdXn24zNBfDFMi7EsEuSmVWj/G5E7GAKkNZyQyX/ID4c6HnZkHbEo
         gVMD4bQFbeOrQzgMFGXt6eu5MdTVjYOiSSK3WpdMOafWWegTCyoqHnLWdZoGsGIyhy3k
         iLFE1mtY8NVMrsD6yL0AKE0H8fz4x5egsl7ImWlfltr1xExX2ugkok9daCAdEp1QVZCx
         RxOIL3VKv3EttfaNcX9i+6zAP8GaBP2BX9PjdQz+mZcSyK9cbMbVeRUgFOGLGd5rD+ei
         YEcX0uNahfhoa/VxgdTxGNAt//86dEk0bX3m5temSnsyOz5wgR7zNsnGVteXqUuJ1no+
         V0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rNWG4JRe++162NhDsfBIYQjTSKMyRVIRJUKX50ptAGY=;
        b=wr6aoijVmLg1ONJRpb6e0qO0olUMXaUMICOwKJB1apQoKM/XekW4tTmZTgGnPgVCz7
         /SZrHuiidCDjOkErDNbBX4ByRonCj06ntraxbtPVf2RSdq2OkA1YauyEiLW2K0qjBuOc
         lW44CRPiJDSFoiG/sjU2bpGYw5IzAf4SJ3tq0h+wzyk3Nlsmh5KAYx84OEeFNobUoXTm
         bOxElMqg+LV+iBLP2o2wv4TOWuCLdMGsuvAfU0OJCM2MmxmUCJj52xyXw1/ktlSytJd6
         gOXNyraXWUR/vI64SaUkZaiW4GerTcWwlZ/ur0Gg4/AxpOkluusv2w8Eljj9cSvP6g8m
         XD9Q==
X-Gm-Message-State: ACrzQf0wBVUZAknwlCc1+FIHGJ6Imi9BQZzguFTKbs9wiX8nvww2J5em
        IdwDuUb4upGWOzLcP3TkH+esQA==
X-Google-Smtp-Source: AMsMyM7CTPcD1Iie9wuX6WkBzCWvvWDCPmmDKnQ42CjusRkxdgW8d+lPCLtPFyFHH5xQbvrQRr7TgQ==
X-Received: by 2002:a19:4f01:0:b0:49c:94fc:1848 with SMTP id d1-20020a194f01000000b0049c94fc1848mr8103685lfb.415.1664189046445;
        Mon, 26 Sep 2022 03:44:06 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y1-20020a05651c020100b0026c423959desm2313408ljn.25.2022.09.26.03.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:44:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene.kim@samsung.com>,
        Tomasz Figa <t.figa@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL 1/2] ARM: dts: exynos: correct s5k6a3 reset polarity on Midas family
Date:   Mon, 26 Sep 2022 12:43:53 +0200
Message-Id: <20220926104354.118578-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926104354.118578-1-krzysztof.kozlowski@linaro.org>
References: <20220926104354.118578-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

According to s5k6a3 driver code, the reset line for the chip appears to
be active low. This also matches the typical polarity of reset lines in
general. Let's fix it up as having correct polarity in DTS is important
when the driver will be switched over to gpiod API.

Fixes: b4fec64758ab ("ARM: dts: Add camera device nodes for Exynos4412 TRATS2 board")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20220913164104.203957-1-dmitry.torokhov@gmail.com
---
 arch/arm/boot/dts/exynos4412-midas.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index b967397a46c5..8e1c19a8ad06 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -586,7 +586,7 @@ image-sensor@10 {
 		clocks = <&camera 1>;
 		clock-names = "extclk";
 		samsung,camclk-out = <1>;
-		gpios = <&gpm1 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
 
 		port {
 			is_s5k6a3_ep: endpoint {
-- 
2.34.1

