Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DEFC7EE2F
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 25 Feb 2023 16:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjBYQlA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 25 Feb 2023 11:41:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjBYQk7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 25 Feb 2023 11:40:59 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB8712059
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Feb 2023 08:40:58 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id p26so1687956wmc.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Feb 2023 08:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93hyDfec2pzQ0OqfcBQZLUSCJi6w4Dee8fakzIJF/Lo=;
        b=u55skNVbzNAMNmMY57wS15v5LY2y/uvjqRS0ScvrbuTcue7SPHChCEjtW/lpMlNIni
         b1HtB+6f/u/7SrfnLIYe3khjq1W7dtBGIklB1b14+PCQKpp7zsbTBZ6mbwq6uRMh4oX1
         Ya0To1Bap76JVUSv0vKa3cMRE/v12Nt6QsEllzwjhlCO2CpsxoFUV45oEj16dVVwSICd
         6EKmeAI85gX7ju+3gKTr7MxWngmxie0G9cYuoprd2Z6swoEfQVBOrCh285MAByeg499z
         hlsrftMjTISK1NKTLj2ByjOlMD0vn/EG6bMnKPiDhnCSizJZ9JyLtSPwI5knGdmtiGxs
         h5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93hyDfec2pzQ0OqfcBQZLUSCJi6w4Dee8fakzIJF/Lo=;
        b=Sz96OK5JLFzZmncPJCOijpIKh3bsnZRlxB472FgAzVj5fFpfVEwvI1XFjxcufXumqO
         hFLhlK5B76dGEbc5EeBZc/ebSqtpe/Y5x+x1Q5uiHxDeiuhM2+unoEEj6ZIG28IoVQl8
         YEoaV0Wa73hrzIy6x4NI6lwnEeBc3DYRBr+YngscX1c0AWpJnTuR6zbNuT10KUjgLPI7
         FwV/vBGxMLbVNTw78tKEio4FTLImdiYBEwlYpIBH8MjUAjs6WWYJd2PxUdpaKIMXDO2F
         axuFczoBSkx7k1FLf/AK841vPu5fopFW8dy5uovlt7k4UDHRpIe7BeUteGpUy3v9Et/Y
         dSGg==
X-Gm-Message-State: AO0yUKWfhkizq8ImApJy+QXjwbFESTtAqz4BZee8Dw82iYx4fNk02gKB
        mxECrG+MGbJ8cdfoR7BxLHj8TA==
X-Google-Smtp-Source: AK7set8H0d/6CvKxwPN/EpPWiObC3wRIWcGhIYxYauaZ312Cp0qfxdmTTylXsTgpAxOt5ju6iVhGxg==
X-Received: by 2002:a05:600c:994:b0:3eb:3104:efec with SMTP id w20-20020a05600c099400b003eb3104efecmr1816212wmp.16.1677343256966;
        Sat, 25 Feb 2023 08:40:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s17-20020adff811000000b002c758fe9689sm2189163wrp.52.2023.02.25.08.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 08:40:56 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: exynos: drop fake align STMPE properties in P4 Note
Date:   Sat, 25 Feb 2023 17:40:50 +0100
Message-Id: <20230225164050.42522-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225164050.42522-1-krzysztof.kozlowski@linaro.org>
References: <20230225164050.42522-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From STMPE device node in P4 Note remove unused irq-trigger property and
incorrectly placed interrupt-controller (which would be a property of
GPIO child).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-p4note.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
index 84db696d543a..317e248f354b 100644
--- a/arch/arm/boot/dts/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
@@ -188,8 +188,6 @@ adc@41 {
 			pinctrl-names = "default";
 			interrupt-parent = <&gpx0>;
 			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
-			interrupt-controller;
-			irq-trigger = <0x1>;
 			st,adc-freq = <3>;
 			st,mod-12b = <1>;
 			st,ref-sel = <0>;
-- 
2.34.1

