Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55102C001DC
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jul 2023 09:08:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjGaJI1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jul 2023 05:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjGaJI0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 05:08:26 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28312103
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:08:25 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99bf9252eddso344954366b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690794503; x=1691399303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8/9NdmaSyKLbjJW5BdDysXmROAqdZ1S2mkS0FBxtKKA=;
        b=gMfN8qiVH2N6ecI32ZM4CkYJH5hoxVfdHz8RZUeuD54R5wz5q6+xuNd+cGTdHxTyEc
         FYci44NG45wCsKm6Mid2ieH9wnpzE7J3pWMKw7u40rm8xo8/ValyvexMdPQcWn5kFPTV
         wTGKNzZm2aq9oT5EOkJ86AMVLSbS2qXOJnyr4Bdicrlct4duEw0JOUfyX/jw62A8aDJF
         GzM5til2F5Oc9TJ0TDstRJCwukTMTXo3wuUFOoRa3fizYHrg5c2yuG0GSNP5cnS0fpAP
         qh1EHNfnu79NZgn5NQhCUL1HrxPXGkC/7QQoWsHW2VZxKX3YBT6qliMKgWF1k0aCufqv
         5cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690794503; x=1691399303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/9NdmaSyKLbjJW5BdDysXmROAqdZ1S2mkS0FBxtKKA=;
        b=QLxyegxkgUEw1g20Ydg6HuWB2XxBkCaWTjzwAkkdsMSZRWwPTwL1Jt9/Mf2ZEoxwRP
         gVJQvkXU6bs2FNb7KwSIqGq77SqSr/GkMkr/saa3AAkK7k5Svdvg68DJl+a7BkNKRPVG
         KZTBB65tpNexpOhkCIgZvdfAMv2TNnGp0lsswtC48Xu19z7uIvBJtk8qohSLudoiXwA7
         FGlx6nENz3g0LOTmViTltAIX4c7rOpN9/WMbouU3TMUZCwVpvgxUaA0lKj5KP1FdP4oB
         b1FAf4rKLRYPLIFS+L+aeJelJTL/E32+auq0Wj32MUGKa3i/Hg2G5391GObAm7Yh7V47
         +2uA==
X-Gm-Message-State: ABy/qLbq8s8Y5NDYmbwg4p1a7lywjTRv7qFYx6E9H7Ok3QuirWjFVua9
        6nx1Lhgj42t0d8A5DQBml5DDnU6zzA9Wpc6mTAo=
X-Google-Smtp-Source: APBJJlEBlycDp/8J+FKABadTyy2Yl/Sc9/q8lQirARa4V+e6Eyi8UTxknRrct9qsBrZuetqnsEtXMA==
X-Received: by 2002:a17:906:2258:b0:98d:fc51:b3dd with SMTP id 24-20020a170906225800b0098dfc51b3ddmr7257118ejr.41.1690794503657;
        Mon, 31 Jul 2023 02:08:23 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id gy26-20020a170906f25a00b00992b7ff3993sm5800563ejb.126.2023.07.31.02.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:08:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: exynos: exynos5433-tm2: drop redundant status=okay
Date:   Mon, 31 Jul 2023 11:08:21 +0200
Message-Id: <20230731090821.104733-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

status=okay is by default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index e4ed788413fe..d163891cd399 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -137,7 +137,6 @@ sound {
 			/* Receiver */
 			"RCV", "HPOUT3L",
 			"RCV", "HPOUT3R";
-		status = "okay";
 	};
 };
 
-- 
2.34.1

