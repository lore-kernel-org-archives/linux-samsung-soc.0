Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D924C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  9 Feb 2022 14:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235284AbiBIOxH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 9 Feb 2022 09:53:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235276AbiBIOxF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Feb 2022 09:53:05 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D799DC0613CA
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Feb 2022 06:53:08 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B6AD53FFD6
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Feb 2022 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644418387;
        bh=oL3G0KTBvKZFBmaD1spgYT7xGS/6Sp6ECAtBQvhfA8U=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=XKRcbEjUr4HJRxVhJps7pYwtBFONsEC0z1CL2Lyp2mNloAA+WJyfXsS14ZyxDKiOQ
         eVYYCiZawoMqc6eHBordTMSnwnY3UWkbHN9O15CJskf4vn++ygquDhCUl4NMzLrhI1
         AP0dDtij0AmGS3tLsDZYCYMN5qMLuHTWYbsmWB+m4Z1m9/k06oxsZXddvV/F3dj/8g
         4de4ZDUroLH5CJsrstzoe1/W2NuAcdVHxf3LECIvtnKau1mQTKfXRkZMafFbe1SChy
         viXgIY74VYRx/w6tiZqCH1qFTMG5r4f5U6lCu20Qbdp58JF6TVtffQQ+hMOclrFqVw
         HHmOS6RFO+MXQ==
Received: by mail-ej1-f72.google.com with SMTP id o4-20020a170906768400b006a981625756so1329529ejm.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Feb 2022 06:53:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oL3G0KTBvKZFBmaD1spgYT7xGS/6Sp6ECAtBQvhfA8U=;
        b=SQQfv0SdtuIG6H3zAGEmG2zm0OHDhZjFl66vfm4GrDPMqsA1j9CVcL21jmBlcvIv55
         PntPVwM4TLfebE5CyTGINbaJUbZV2WKhN1bYSSJipx/CgiVbHIHaSQeoy48qVrsuZQsm
         +6WQ6pKA/gN/1LsdHJj6Peay8yDUnoe7hx2HnLCQ/vxiISY0U4pcqddTzVEk6JGw6Yeq
         9EOo4+4D2KBVH4jDCUk+OqDw0eFXPG9tkVFijimcY8w65t8+kOE5YAIZ95FYTv4R9E3a
         PyC4Zw89CTOAPkE3JxAZsaW45hSiBSBvKwA9S+iL+SJjNjIv+aB1TOAAnOFbC/Fz0ACT
         M+Vg==
X-Gm-Message-State: AOAM5333l27gu2RnDh2PV/pnbhQSHiPfBqgpRR3GGBuDTleFlIbv5ZcF
        gwaI51UthPLQvXV+U+bFbsetcMB3DHMTQbELYmEpUDlDmOznxYns+/V2BCAHy8rgDDkTod0m3aJ
        /lL5K27mmZIdtzFolicTnqqQjoaw1IXSCMeGi0Cc+EzwZW/Jf
X-Received: by 2002:a17:907:1689:: with SMTP id hc9mr2406719ejc.348.1644418387025;
        Wed, 09 Feb 2022 06:53:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6LcsMbhZ5TCpcF6qqibz+KqLtei0SqlqsL9qTaE2HplOfVygICFD8/UG1Z6CkaPAilDMXOw==
X-Received: by 2002:a17:907:1689:: with SMTP id hc9mr2406711ejc.348.1644418386866;
        Wed, 09 Feb 2022 06:53:06 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f18sm2839309ejl.12.2022.02.09.06.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 06:53:06 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: samsung: Exynos for v5.18
Date:   Wed,  9 Feb 2022 15:52:26 +0100
Message-Id: <20220209145226.184375-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220209145226.184375-1-krzysztof.kozlowski@canonical.com>
References: <20220209145226.184375-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

This includes arm64 DTS changes for v5.17-late which did not make it.

Best regards,
Krzysztof


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.18

for you to fetch changes up to a0d5455330ece6f50ddf9e71d530f91c302803e9:

  arm64: dts: exynos: adjust USB DRD clocks with dtschema in Exynos7 (2022-02-01 09:17:16 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.18

1. Minor improvements and dtschema fixes (node names, properties).
2. Fix issues pointed out by DT schema checks:
 - Add necessary clock controller inputs on Exynos7.
 - Add USB DWC3 supplies.
 - Drop old syscon phandle on Exynos5433.
3. Add initial Exynos850 support and WinLink E850-96 board using it.

----------------------------------------------------------------
Krzysztof Kozlowski (6):
      arm64: dts: exynos: Align MAX77843 nodes with dtschema on TM2
      arm64: dts: exynos: add necessary clock inputs in Exynos7
      arm64: dts: exynos: add USB DWC3 supplies to Espresso board
      arm64: dts: exynos: align pl330 node name with dtschema
      arm64: dts: exynos: drop unneeded syscon phandle in Exynos5433 LPASS
      arm64: dts: exynos: adjust USB DRD clocks with dtschema in Exynos7

Sam Protsenko (2):
      arm64: dts: exynos: Add initial Exynos850 SoC support
      arm64: dts: exynos: Add initial E850-96 board support

 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  17 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |   7 +-
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |   5 +
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |  44 +-
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   | 195 ++++++
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi  | 663 ++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi          | 741 +++++++++++++++++++++
 8 files changed, 1654 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi
