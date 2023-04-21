Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71756C7618E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 Apr 2023 19:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbjDUTCI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 Apr 2023 15:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjDUTCH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 15:02:07 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BCBB2D51
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Apr 2023 12:02:06 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-94eee951c70so296375366b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Apr 2023 12:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682103725; x=1684695725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2UBS6qwpsvEyxP32TXwMi8fHBLYovTzCgL1PEPMBQuA=;
        b=DOB3Ioeq/rZx6nkgZaBN9mIZE/veSl/HxbvsKaSyApSgF2V9oBicjtQGTAItyB8aeM
         c+Z5z1lMrvqZ4HFN1sTPky+Hiqs1p+x6O7KSwj3oC1dMtbobpgQq/UkJRpWr7G4MI8VB
         HPESqVa/DTBbtyAyqJ8bPRosZY8w9rWgoKpEZRzmLQ77Xlo1qkntNhC2PoOIVTWpoEKQ
         JwnJ621i04/JTTM6BTzty16Q/zkcjJvcgW+ewYUGcuar5b8ZKe9+tnCBuz1tbANmUK5L
         ZRBE3HMOHoZDtPov+p7ovMRTJVhUthEggoClFDkCOUZDJDvXd1Ua56B5x6FgF3xY448V
         bFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682103725; x=1684695725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UBS6qwpsvEyxP32TXwMi8fHBLYovTzCgL1PEPMBQuA=;
        b=NPgKlZ7oUMCwOdrsCp71XxxgqBNA0kntrwDNz+nb2JqwkAZwc1oU5E9PqV93A3mFz2
         aDTcv9p2COt6m+QPgo2btm4a2iCUj2NwMevMHGVoXnjcjyGcEl21ouFxOB819UfTf1vJ
         kLIoRCtp2lKAkAAE/58KZ1bTTyYgFiItgJgsWGnOlVRw8s0CtruCeySbDfMyOlPHFgRM
         bQ50ajW52DlF1hrYL/AfWCR4HZiTaOt1WekuliBQ0KK8YGwa/03krPbtqMswY4ad8Jba
         CTWFLLUM2sElQXZlr+VHEfcLhEodBwQSC5B6jxW59kaNtUKH/+pJ6DZ/hJAsbbM4PiVG
         3fVQ==
X-Gm-Message-State: AAQBX9cJfk2WQwcCvF2DaVSJVjAYg4FXjeChzVgw11436wnw6FozyAX8
        FxQ8pNugVQS4xZOimeeXEaMP2w==
X-Google-Smtp-Source: AKy350YsW2AxsPNc39fiucZ92EWX/p6AW1NDZ8Y2qO4dJNRiW3qIVSW2Q8N1evqIXOQheLneJbDZQA==
X-Received: by 2002:a17:906:71c2:b0:94e:e35f:6fed with SMTP id i2-20020a17090671c200b0094ee35f6fedmr3622193ejk.75.1682103725011;
        Fri, 21 Apr 2023 12:02:05 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906805000b00953285b937asm2376231ejw.189.2023.04.21.12.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 12:02:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: s5pv210: remove empty camera pinctrl configuration
Date:   Fri, 21 Apr 2023 21:02:02 +0200
Message-Id: <20230421190202.15471-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The camera's pinctrl configuration is simply empty and not effective.
Remove it to fix dtbs_check warnings like:

  s5pv210-torbreck.dtb: camera@fa600000: pinctrl-0: True is not of type 'array'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/s5pv210.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index d9436bbf77c8..faa3682ab5dd 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -549,8 +549,6 @@ i2c1: i2c@fab00000 {
 
 		camera: camera@fa600000 {
 			compatible = "samsung,fimc";
-			pinctrl-names = "default";
-			pinctrl-0 = <>;
 			clocks = <&clocks SCLK_CAM0>, <&clocks SCLK_CAM1>;
 			clock-names = "sclk_cam0", "sclk_cam1";
 			#address-cells = <1>;
-- 
2.34.1

