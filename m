Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF1AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Jul 2022 08:04:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234773AbiGGIET (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Jul 2022 04:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234218AbiGGIET (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Jul 2022 04:04:19 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457B2E00
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Jul 2022 01:04:18 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t25so29771910lfg.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Jul 2022 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z5ssFYeQl7V2JJ54NmhIzC4kevK2DFEIrlaz+FamJ4o=;
        b=nQyKLogTPnRG/buW57rEKh/p4nVI47DT4almuA9zdgse7ZnePqyIwZragdTmyL5Zkk
         Yp09663+gJTNo6qUACiFo0ItN4bQo+s4TS0rCPM2pDXCJPJX25HqaZZJNmvGB/j31Aq1
         aS3fWZ/H1HJmLrZV6uu9kUzNZlxk3eDVOBZXpwg0A10QMvW12iLmccF1dNE1rlP9sVtl
         Vq+JSBAzqzBEd5oPAnKpx18289Y2MSIz3mUyK+RGsBHrAhfB3FRo+SQj5UXSSaTGKfPM
         04k1TMBLdFVVsLPv9IxxFCW4Wh1/EQOusbiWmRBRv29+eVjtV9XMLbhofx+RqjB9ebGE
         QFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z5ssFYeQl7V2JJ54NmhIzC4kevK2DFEIrlaz+FamJ4o=;
        b=yd2HlTKV9SA+fJv6rlHqKdG0VACZHrfMNYrEe+v9gERmkqulLpddlq/yXeP+rUa7hF
         eO8qbpxarda0DemQ5DqWYE2rQzQI3HW9ndKtPLDDhxzshRlW/i39WPhGZbrcI5d77sUq
         +CoekZuDrEgajtz7Ana4YUKj0HPufREixbVsLgwRBlD19PI1UFBYYFUmUh1+6Qyy0ccE
         jUI+fzW6M0f3d7LWkICV2LDyKnaXb9YKoSGfZBSKl4bBVK+j6sF7tpFfjzBgn/Kke5hZ
         fswelNpL7pOWCJekfNpA2ZcHZe7rdUCSwOFNRyUTZHGntbvGoiD+23KRcRD5LVrWEKmw
         ompQ==
X-Gm-Message-State: AJIora8lFQT5CggAcdumeZr+bO51YUUMf0v+7JR6KYlWgxxnr4G3DoqK
        ewn2+CoHnzbTfZ1F+bWdhqhwMg==
X-Google-Smtp-Source: AGRyM1uBT3p2me4ed88jdqAaeNxgZQVJKSTxRZJFJljooGEjRoS8yamieK3o3TdtSIRerorKAVhrTw==
X-Received: by 2002:a05:6512:3c96:b0:488:c36d:b336 with SMTP id h22-20020a0565123c9600b00488c36db336mr623077lfv.410.1657181056637;
        Thu, 07 Jul 2022 01:04:16 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651220d000b00478ea0e4f66sm6702687lfr.169.2022.07.07.01.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 01:04:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: samsung: 2nd round for v5.20
Date:   Thu,  7 Jul 2022 10:04:08 +0200
Message-Id: <20220707080408.69251-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220707080408.69251-1-krzysztof.kozlowski@linaro.org>
References: <20220707080408.69251-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 1a4f20cab6411c6e73dd22d28b6595b728cc2829:

  Merge branch 'for-v5.20/exynos7885-emmc-clk' into next/dt64 (2022-06-24 09:12:47 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.20-2

for you to fetch changes up to 1ba1fd7d775dbccf43951671a7331c561408e72b:

  arm64: dts: exynosautov9: add usi device tree nodes (2022-07-05 12:34:36 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.20, part two

1. Correct SPI11 pin names on ExynosAutov9.
2. Add more USI (I2C/SPI/UART) devices to ExynosAutov9.

----------------------------------------------------------------
Chanho Park (5):
      arm64: dts: exynosautov9: correct spi11 pin names
      dt-bindings: soc: samsung: usi: add exynosautov9-usi compatible
      arm64: dts: exynosautov9: add pdma0 device tree node
      arm64: dts: exynosautov9: prepare usi0 changes
      arm64: dts: exynosautov9: add usi device tree nodes

 .../bindings/soc/samsung/exynos-usi.yaml           |    8 +-
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi      |    6 +-
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |    2 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       | 1087 +++++++++++++++++++-
 4 files changed, 1093 insertions(+), 10 deletions(-)
