Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C671C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Apr 2022 07:22:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359677AbiDTHYs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Apr 2022 03:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359683AbiDTHYr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 03:24:47 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4A43B006
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Apr 2022 00:21:57 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z12so1113246edl.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Apr 2022 00:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uxmYy8O3B9S8Z/t2A4fXr3iVXi2rAgR9IiSdOI1pb5c=;
        b=j4MlJffbNOKszAngWM2pnsI5+AUS4yrhe1hYMLBt7tQNu1TXEqTLJI/+cMGaadm4qX
         DVWvgylWFQBi4/TWkOkHefBsKemVN1H9R2p5KXp+kCngYSyrKAVCoy0KT2F+18bZGFcU
         GTnlZVE0qm7dg1YC+xszO66TvXEZjT+xNUpl8cCuaU5Wg1mph7ZSsBL04PpaYPCcfDUg
         R9yFKx3CfS2Qt3P7uR+IJdudn1ZO3Duq6Ttl4a2Ll4AQrwGxvoPfHyhTuPVijSvGrs8d
         K6paQYxg0JNv7f9ZEWlrJx4iG+m0DTBe7W3e368zPAgyYRxzcWkk3o5k/gFrVMhJZjqT
         BOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uxmYy8O3B9S8Z/t2A4fXr3iVXi2rAgR9IiSdOI1pb5c=;
        b=oVKfaY0VRPwVECKy0ZdAW2T+RS2pDK/iEpso5oPbV5FTNyymEs3kZ0W7EENdkJGy8x
         LTvW5PBOonaQpqayESmfvyW15cAypbklVQLVQLpb1xXUyZemf2++qlt7noAks4KaTWoT
         /2QMyw94r88BbivOV8tM6eQglbSArTv3vCtLWNc7g5Q4WKsPHm7p6fejO4gWS/93HDnf
         VWVGU+ZrbYY6CUNb4BzaPn8YT2VwH2W4QErhWOLieHb+p72KCIc7dxpZrOWRcoLAg25g
         dLOzW5bk7gzEJ17G8WpZJtniKpa0TJXvLMPERanJTST2T6374rfsBoft7VImaSdKpXBY
         oE3A==
X-Gm-Message-State: AOAM530B/I6qDAcWbmMwW3v/C6LeGuF+1o1oZrYwxDMXCmoqvi2IM9BU
        YYLdLKTdiWxh/l/7UdCDKCOlbQ==
X-Google-Smtp-Source: ABdhPJwSy+FJb4H1cp6AcRQOgklNGnvLsJgBDZ3kdwqQ0JHRbbxJeuyMHY/Sv45mSH+JW9f+TfpEpA==
X-Received: by 2002:a05:6402:1e89:b0:423:e004:bf61 with SMTP id f9-20020a0564021e8900b00423e004bf61mr16075680edf.14.1650439316140;
        Wed, 20 Apr 2022 00:21:56 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm6492106ejj.142.2022.04.20.00.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 00:21:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] ARM: dts: various: cleanup for v5.19
Date:   Wed, 20 Apr 2022 09:21:50 +0200
Message-Id: <20220420072152.11696-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

These were waiting on the LKML for some time, got few acks but no one picked
them up.  Please take them through SoC.

Best regards,
Krzysztof


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/dt-cleanup-5.19

for you to fetch changes up to c9bdd50d2019f78bf4c1f6a79254c27771901023:

  ARM: dts: socfpga: align interrupt controller node name with dtschema (2022-04-07 21:30:22 +0200)

----------------------------------------------------------------
Minor cleanup of ARM DTS for v5.19

Align node names and unit addresses to DT schema and DT coding style in
nspire, ox820 and socfpga.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: nspire: use lower case hex addresses in node unit addresses
      ARM: dts: ox820: align interrupt controller node name with dtschema
      ARM: dts: socfpga: align interrupt controller node name with dtschema

 arch/arm/boot/dts/nspire-classic.dtsi  | 10 +++---
 arch/arm/boot/dts/nspire-cx.dts        |  4 +--
 arch/arm/boot/dts/nspire.dtsi          | 60 +++++++++++++++++-----------------
 arch/arm/boot/dts/ox820.dtsi           |  2 +-
 arch/arm/boot/dts/socfpga.dtsi         |  2 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi |  2 +-
 6 files changed, 40 insertions(+), 40 deletions(-)
