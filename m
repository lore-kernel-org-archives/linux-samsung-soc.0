Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63AFC4708D
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Dec 2022 11:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbiLDLis (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Dec 2022 06:38:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbiLDLip (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Dec 2022 06:38:45 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBEA17A84
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Dec 2022 03:38:44 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b13so3488499lfo.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Dec 2022 03:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=54f+fjheTEu/HUFdw3SEpbYwL3Q8sweFLRQqmQJ/lT8=;
        b=Ud9QLMzZoXfwnzdZvxmXKfg4fWfJ4gVjkftsbMdqxCbCtMeqVOiGKLEfo/XFMulUc+
         zX+rOwbsQnoNv1FEUAcf/LzBbpmy1mlQu8gxxA5MTho6UfFT/fp+8z9KrixU2eBFPilG
         CZDG6J+jJyBQnxoj3Qa/ChMSO2hAkA5FsF4ricC6xLXuNmMMahh/j5f/zDp9Qz8viZGh
         kMlz4DD0PHZKTNDBxujjrYP1iCZBkqGSaat8FXCumzPkh4sgf+BEjYA751r9VHgvX2S5
         FchSY9VoSJ8Xjpl7VBrl5Tke+ZFI+X1xBlWt5Thex4bPg7kIIYXzbMNG3wpzgPCGzeMh
         PxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54f+fjheTEu/HUFdw3SEpbYwL3Q8sweFLRQqmQJ/lT8=;
        b=drgr7UsJJ20P2oGSKuad/uG13X/YCKhrJUsb5U8GZuBNItEzdZQNPVk6NB6Vo+i6v3
         ClaEc7AR6Lrl94meb5mLwMB06+pKC4O4uC2w0bE8hjy0ObbrBw9kXqFA68KJ6XAGnZO2
         xKtyETRhXWel3YCCVDVfRjGi6rFkIBmcXDoPVjllYifitQmyAdJCc4BNMwILpCPxmDcM
         yb7hUQ/G9/xQ08Icx4T/1Z5aIHBPb/fBU8uD5v1/fCM8v7RUVlaQVnCgbTgsto4A9zyI
         SjOdqQT3CeIRVLEreoEHjpNbjI+vAn4339sP9lZI5WV6hqVilWNgQM3TJwP5R6KmipXG
         TJ4g==
X-Gm-Message-State: ANoB5pnb0fic0YVJzleSYSAyvYoD8zzgR89r8A9iD1tT8LpKJTwVMqJ9
        Pnm0OcKP+vA8AY2DMJ6bTixjwQ==
X-Google-Smtp-Source: AA0mqf7M+HMtv9wOr7r6bDC/233KEeqt0lljhQxyXE4Y797JndzqbGhMEmEZ7w2cy3n0EgSjXkX8IQ==
X-Received: by 2002:a05:6512:400e:b0:4b5:5da1:4bc7 with SMTP id br14-20020a056512400e00b004b55da14bc7mr2044562lfb.485.1670153922489;
        Sun, 04 Dec 2022 03:38:42 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a11-20020ac25e6b000000b0048a9e899693sm1762826lfr.16.2022.12.04.03.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 03:38:42 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFT 1/3] arm64: dts: exynos: drop pwm-names from MAX77843 haptic in TM2
Date:   Sun,  4 Dec 2022 12:38:37 +0100
Message-Id: <20221204113839.151816-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

MAX77843 haptici driver does not take 'pwm-names' property:

  exynos5433-tm2.dtb: pmic@66: motor-driver: 'pwm-names' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 5b002a85b792..a8224b3123d4 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -925,7 +925,6 @@ haptic: motor-driver {
 			compatible = "maxim,max77843-haptic";
 			haptic-supply = <&ldo38_reg>;
 			pwms = <&pwm 0 33670 0>;
-			pwm-names = "haptic";
 		};
 	};
 };
-- 
2.34.1

