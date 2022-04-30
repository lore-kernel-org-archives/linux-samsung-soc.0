Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FE0C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 30 Apr 2022 12:19:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346521AbiD3MWd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 30 Apr 2022 08:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbiD3MWc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 Apr 2022 08:22:32 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720C3192A8
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Apr 2022 05:19:10 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id l18so19933110ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Apr 2022 05:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XJsO6zp5HIqeawhz+G48N6kCNBm5it1pr/8l1aJFgqo=;
        b=rEsvm+OUkBzf7n+dcAoz7wZYN90YKp2szr8f5scR5xrjL19QVzOv5UPpohF5J9+qsc
         gleUSf4Oi6ZpbSXAMmogWLatFTg9wDVWfD2YGrgcg8fAoCnY7v0cfWVvXBPDvdm8ON//
         5jCVRUoVvTjjzb45cXzXT7C+O1H1GKV4R45ki822+gk4HaZ63mUl1MVGMoWFDbIW1oFP
         +jhWcPt3S1d4NfPxF3jbaxECvMsL53vgOqZeezMM4LRe+dUVgnlNkZTvH9B05x0pp+PC
         UT5/g75Y4g07IsZdc+0ZWX35XJ4HGkrt9T61HlxCuj4SqWleL1chJVJdFugoIT0S5YOr
         mfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XJsO6zp5HIqeawhz+G48N6kCNBm5it1pr/8l1aJFgqo=;
        b=4Fl9g6QzWg+8aUQgosKO3/StpAS83PcmkCL3PQMW4fXFB4V8Q19XughvG9MsLvXVIm
         hZNptX5DUCu6U33x4oEI9FsMaZLgp537Y91Tu4pTPSwYzAqWIvuT3O+5aK/sl2sO45Yw
         L7hwgHfC1D/8GTtJ779ifXv8SkvTCiODeOiLSjqD7eUoAVW+85Xhl2ZSpKLbYP3KZC17
         xj/gGqTMeTTnAqlpjCkEviKonOe7Wfie01wKg3SClmvQ/a1R1ixODRqWzwpgm21kwWbR
         FW6RZYGOVlC3VC46VjE/ikRwWBXd6VGNIvOsyyYW/dkGwh0wNJr+451BryX6FRz8GsNm
         oy/A==
X-Gm-Message-State: AOAM53381LeKrY7ojRkvmiLRn9JEw+l6abMfRe0a5hmR5b24AtfrEfYr
        tfl1W0TQa0KVglR9MbH3CWXfHA==
X-Google-Smtp-Source: ABdhPJyWPGFBnJrCEsH9QO9aQGlOnq7Q3CWlo0lHVjbvaNqUPfIs4wSMnVyk9G8eNfGDWui8KxSHTw==
X-Received: by 2002:a17:906:3513:b0:6f3:a080:9f46 with SMTP id r19-20020a170906351300b006f3a0809f46mr3546347eja.466.1651321149041;
        Sat, 30 Apr 2022 05:19:09 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c26-20020a056402159a00b0042617ba63d1sm4059091edv.91.2022.04.30.05.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 05:19:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/9] ARM/arm64: dts: drop useless 'dma-channels/requests' properties
Date:   Sat, 30 Apr 2022 14:18:53 +0200
Message-Id: <20220430121902.59895-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Changes since v1
================
1. After discussion with Marek and Rob, drop the properties entirely instead of
   fixing the names.
2. Not adding acquired review tags because of that change.
3. Drop mfd patch (applied).

Description
===========
Rob reported [1] that many (all?) PL330 device nodes use wrong dma-channels and
dma-requests properties.  The proper ones are without leading '#'.

I guess everything started with 42cf20980cde ("ARM: dts: pl330: Add #dma-cells for
generic dma binding support").

Patches are independent and can be picked-up as is. Otherwise please ack and
I'll push it to SoC.

[1] https://lore.kernel.org/linux-devicetree/fedb56be-f275-aabb-cdf5-dbd394b8a7bd@linaro.org/T/#m6235f451045c337d70a62dc65eab9a716618550b

Best regards,
Krzysztof

Krzysztof Kozlowski (9):
  ARM: dts: zynq-7000: drop useless 'dma-channels/requests' properties
  ARM: dts: socfpga: drop useless 'dma-channels/requests' properties
  arm64: dts: stratix10/agilex: drop useless 'dma-channels/requests'
    properties
  arm64: dts: juno: drop useless 'dma-channels/requests' properties
  arm64: dts: broadcom: drop useless 'dma-channels/requests' properties
  ARM: dts: s5pv210: drop useless 'dma-channels/requests' properties
  ARM: dts: exynos: drop useless 'dma-channels/requests' properties
  arm64: dts: exynos: drop useless 'dma-channels/requests' properties
  arm64: dts: fsd: drop useless 'dma-channels/requests' properties

 arch/arm/boot/dts/exynos3250.dtsi                   |  4 ----
 arch/arm/boot/dts/exynos4.dtsi                      |  6 ------
 arch/arm/boot/dts/exynos4210-universal_c210.dts     |  2 --
 arch/arm/boot/dts/exynos5250.dtsi                   |  8 --------
 arch/arm/boot/dts/exynos5410.dtsi                   |  4 ----
 arch/arm/boot/dts/exynos5420.dtsi                   | 10 ----------
 arch/arm/boot/dts/s5pv210.dtsi                      |  6 ------
 arch/arm/boot/dts/socfpga.dtsi                      |  2 --
 arch/arm/boot/dts/socfpga_arria10.dtsi              |  2 --
 arch/arm/boot/dts/zynq-7000.dtsi                    |  2 --
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi   |  2 --
 arch/arm64/boot/dts/arm/juno-base.dtsi              |  2 --
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi    |  2 --
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi |  2 --
 arch/arm64/boot/dts/exynos/exynos5433.dtsi          |  6 ------
 arch/arm64/boot/dts/exynos/exynos7.dtsi             |  4 ----
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi       |  2 --
 arch/arm64/boot/dts/tesla/fsd.dtsi                  |  8 --------
 18 files changed, 74 deletions(-)

-- 
2.32.0

