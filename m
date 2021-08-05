Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658B9C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 07:23:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 421BD6105A
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 07:23:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238528AbhHEHXN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Aug 2021 03:23:13 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:40238
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238523AbhHEHXM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 03:23:12 -0400
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 3612240674
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Aug 2021 07:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628148178;
        bh=ONtar7oAWeIbCQuURvJ44/IWnb3dxwE5aeYGBppPBKI=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=B4+qXUqix/c4DHyf6uzs6FMn8IQAzNnMzQjUicSEJ9XfkiMpHS7qnt2gOEiVYqxO3
         jL14xl/EeA+LPECmk5+O01MaStsKM95rmFhthmpOhABSEv4jmD2FA7hen0UqoEB0Ms
         Vs1wHBe7U7rtwBHL8RMCvnx6cTwFaD7qRkVYh1Kz0sZK1ARgmzBk7HAfnak7iBFnm6
         3i3N+JqT2y9xi3VyolLgHcd05Wpw8kRLF4+vbX6J3zEvB6ZFARq9HcxIf+/5MYeHQY
         8UQyKDodE9MTcLaioOrTr/J3XHM17p4/a/bIRh26lzMMzBVHgK8IedPMsctIDfBRdK
         zriabDHeRrXIg==
Received: by mail-ej1-f71.google.com with SMTP id gg35-20020a17090689a3b0290580ff45a075so1694925ejc.20
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Aug 2021 00:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ONtar7oAWeIbCQuURvJ44/IWnb3dxwE5aeYGBppPBKI=;
        b=DgosiTJr/+Xq8dYsVhAhj7QHlgzjF2sPzE68UOXZogPRWU4XlPW+0kqoGVoPrktQ/w
         5IF3b/GFc8VUTDTqFqAmKfF05L/WeVl9Gd5NBgjoGfbPvMDFuh4pvEowmueOanT0snRP
         5h6mqAq+3KG0CoWoE9W1oPTmNAZv8LkWz2pUm1ZELfGUFwo7iz9HHQvQLKOfGH9yp/NE
         jlV9Z8oVqlA3gc6XAZJRXTSgSoIjZBjdbZ6DBYX7oyuHqDXRBGXcQcIaqpSJbZialmG/
         3wKR3+vBry2l2hyc3Gw5yW2sQhqPoQDOidWB3zL6WfOmqMact1CSXoD0Hd1FxAoLxmDX
         iyKQ==
X-Gm-Message-State: AOAM53294Alc8oTBjDc42uzz5QBzpm/k75NxwoY/JHY0eq50Diu5WTZn
        D2pJeB1U5zI7xxGoe88Ift/HpjBGlL/gTG2ZDBboJmkOcVkQqCFZSs8TlPgU/XH3voY2rtID5WY
        o6qcntHn25GYFVScgl5A0pvfbcqfdtTzsib12gMrwvmzel21D
X-Received: by 2002:a17:906:2c45:: with SMTP id f5mr3349695ejh.464.1628148177839;
        Thu, 05 Aug 2021 00:22:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVhDgv6oVjoOTRB86bXt5LOi30f0RkOusmT4UWH9ZJRR52LcF3STptm7Ol4GO9LKvMy+uRnQ==
X-Received: by 2002:a17:906:2c45:: with SMTP id f5mr3349686ejh.464.1628148177729;
        Thu, 05 Aug 2021 00:22:57 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id cm1sm1868470edb.68.2021.08.05.00.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 00:22:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH] arm64: dts: exynos: correct GIC CPU interfaces address range on Exynos7
Date:   Thu,  5 Aug 2021 09:21:10 +0200
Message-Id: <20210805072110.4730-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The GIC-400 CPU interfaces address range is defined as 0x2000-0x3FFF (by
ARM).

Reported-by: Sam Protsenko <semen.protsenko@linaro.org>
Reported-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 8b06397ba6e7..c73a597ca66e 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -137,7 +137,7 @@ gic: interrupt-controller@11001000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg =	<0x11001000 0x1000>,
-				<0x11002000 0x1000>,
+				<0x11002000 0x2000>,
 				<0x11004000 0x2000>,
 				<0x11006000 0x2000>;
 		};
-- 
2.30.2

