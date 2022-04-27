Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C51C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Apr 2022 15:59:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240692AbiD0QCK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Apr 2022 12:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240764AbiD0QCJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 12:02:09 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D68AAE3C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:58:50 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id g20so2472698edw.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x6OVCi3akUJaXXWrQM/eK3YAmsx4+Jbm9nzUSMwO/J0=;
        b=Mu/QqvJPsDAD3NexJvD8FfRgcmRDKVWYZzG+gwOGBgEaWmbJIAZUz6iNFYQnzER5Qc
         omotwEkbVemPBfWDR2tX2Q7WOuPD5MFYtBaQww9dCvddcTmSKMmlL6DPfPlnolWwYEUP
         r6pNMmZocnjijM2ZNqaKXNraZLHqQo2PBlXKsb3AAsto0NgcDL6hM5b45p+uuIC3YIp6
         2m7csq6m8qOF+QTQA/p74b80ATrGYgF5oOdUijgM9wQY3bquRUCgA+YU16QfI0WsKQr2
         Nzs9aC2PElZpcUqZz10sSNjxsGasYlB/wzW/pIvP3PlWLm51QIISwtEKI/P7zhZsBmxT
         PUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x6OVCi3akUJaXXWrQM/eK3YAmsx4+Jbm9nzUSMwO/J0=;
        b=WbmKVweABJRJdNP5Z167xvA1gYS5GukfXdKgi2V1pJX1HOqwhxoBXVI2ExVddcf6Ba
         B2UxUUvvJ17YEB3LJng2agrwstWePOSTpvqtAKzapzXXADYPrcToAdm+5mN9B1jXsmFJ
         5mrfIKflNRmzNNzonNpG0Vy5psyLHtjie5I+UWpKe9Nn9hpoDF7ESujhNCB9eIDQNipK
         1aK9Plf/rLWsnHMTDNhi6ino5OMxSNrdtdym9v3+sLditQqV7ZrSxD8wKo2Er6pqA43Z
         jpz9PcUDRgXYqwRSX/6in+eBRvMV5o7xCSyqMZzNBbp43VlbaOJTvaqbGfhBebpDzZHD
         ecOg==
X-Gm-Message-State: AOAM5321jXewuiU2Q7I8tnpHv2HVlG9NnkUwoFi/aNsAN6jVqXswWwEj
        EjrIRU2zpSlPg5CPG2X1wRGOiaj87YL3fg==
X-Google-Smtp-Source: ABdhPJwT5Z2kK25hO2pVIZa/UepfpjQgKHrThIEomnFp//g9b8h8gIxcVOzewH6A5cDdKuFhKiP5QQ==
X-Received: by 2002:a05:6402:198:b0:410:83e3:21d7 with SMTP id r24-20020a056402019800b0041083e321d7mr31474664edv.159.1651075126027;
        Wed, 27 Apr 2022 08:58:46 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l20-20020a1709062a9400b006ce71a88bf5sm6931993eje.183.2022.04.27.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 08:58:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
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
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/10] ARM/arm64: dts: use proper 'dma-channels/requests' properties
Date:   Wed, 27 Apr 2022 17:58:30 +0200
Message-Id: <20220427155840.596535-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Rob reported [1] that many (all?) PL330 device nodes use wrong dma-channels and
dma-requests properties.  The proper ones are without leading '#'.

I guess everything started with 42cf20980cde ("ARM: dts: pl330: Add #dma-cells for
generic dma binding support").

Patches are independent and can be picked-up as is. Otherwise please ack and
I'll push it to SoC.

[1] https://lore.kernel.org/linux-devicetree/fedb56be-f275-aabb-cdf5-dbd394b8a7bd@linaro.org/T/#m6235f451045c337d70a62dc65eab9a716618550b

Best regards,
Krzysztof

Krzysztof Kozlowski (10):
  ARM: dts: zynq-7000: use proper 'dma-channels/requests' properties
  ARM: dts: socfpga: use proper 'dma-channels/requests' properties
  arm64: dts: stratix10/agilex: use proper 'dma-channels/requests'
    properties
  arm64: dts: juno: use proper 'dma-channels/requests' properties
  arm64: dts: broadcom: use proper 'dma-channels/requests' properties
  dt-bindings: mfd: samsung,exynos5433-lpass: fix
    'dma-channels/requests' properties
  ARM: dts: s5pv210: use proper 'dma-channels/requests' properties
  ARM: dts: exynos: use proper 'dma-channels/requests' properties
  arm64: dts: exynos: use proper 'dma-channels/requests' properties
  arm64: dts: fsd: use proper 'dma-channels/requests' properties

 .../mfd/samsung,exynos5433-lpass.yaml         |  4 ++--
 arch/arm/boot/dts/exynos3250.dtsi             |  8 ++++----
 arch/arm/boot/dts/exynos4.dtsi                | 12 +++++------
 .../boot/dts/exynos4210-universal_c210.dts    |  4 ++--
 arch/arm/boot/dts/exynos5250.dtsi             | 16 +++++++--------
 arch/arm/boot/dts/exynos5410.dtsi             |  8 ++++----
 arch/arm/boot/dts/exynos5420.dtsi             | 20 +++++++++----------
 arch/arm/boot/dts/s5pv210.dtsi                | 12 +++++------
 arch/arm/boot/dts/socfpga.dtsi                |  4 ++--
 arch/arm/boot/dts/socfpga_arria10.dtsi        |  4 ++--
 arch/arm/boot/dts/zynq-7000.dtsi              |  4 ++--
 .../boot/dts/altera/socfpga_stratix10.dtsi    |  4 ++--
 arch/arm64/boot/dts/arm/juno-base.dtsi        |  4 ++--
 .../boot/dts/broadcom/northstar2/ns2.dtsi     |  4 ++--
 .../boot/dts/broadcom/stingray/stingray.dtsi  |  4 ++--
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 12 +++++------
 arch/arm64/boot/dts/exynos/exynos7.dtsi       |  8 ++++----
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi |  4 ++--
 arch/arm64/boot/dts/tesla/fsd.dtsi            | 16 +++++++--------
 19 files changed, 76 insertions(+), 76 deletions(-)

-- 
2.32.0

