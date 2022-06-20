Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA0DC43334
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jun 2022 17:50:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243781AbiFTRul (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jun 2022 13:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243706AbiFTRuk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 13:50:40 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1407CBE10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:50:39 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id u12so22561262eja.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vGTTZHlQr24mk7rw2kpSOCNl9rG0rfShjLY5RzkauRM=;
        b=OKVdOylpEHkO3dTs4aJiHn7RMRuX2w9ZQcLfeTU9oNSZEtf6otbNPXufB9xpv92odC
         btCJtuFmVoLlckuFWAARV0qy7NmgIsAgtu4/3QS7nvmlPGeklsFdZY26QLv2jpDfd5t0
         WZKkcJQHX9cvj4Mzx2EA15vh6GA64tNEA6ak7KPcXMQoFsa3qlzybFE//ucS+z6EKx7+
         UorL3KXEGqMIIE+WMhrdGZPEIeQC3al84M1Wh+25ZIlD6I2gcTmAaVdZfmsS5oyabHCo
         m+/8/8D+MUkFEk7YOQXk6IpqLhPe4HW5zJTeA7tKbODduMe+bVl56l4sB0cbKTjSA77q
         RhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vGTTZHlQr24mk7rw2kpSOCNl9rG0rfShjLY5RzkauRM=;
        b=PKMczVqerm5MObs+15Tox4aA2SBtbwsMWRVQXOgrc3WqZGh1pT/vU7DVpWUG8lhuNU
         8k49EVwR6+RkdcXXVgkheJQ/qpFspTD10sRfEDu/SGu6A7q6Vn9Wf0OelTiX23HIYl4P
         spCTTTtvdX04IfND64MY9MOKoQRuMDC9p/xMX/cRnSvK0ghNBDJ0WR3CGzu+RFRqOCRW
         M1ZY5XASuZWKkjbCmauhQWpPCvjDbYei3N2/PaxhLuve9ezZm4hNvGtiuyt1QizrCpdW
         p6wcdHTsQAo45suXzE73IRmmpK12jvRsYBw+G/Tc+1dyLd+TKFojYHaB5XdayGi03NrH
         ymEA==
X-Gm-Message-State: AJIora8J6nYEgP1TIEQhfgsLKUiNdAoiVNx84gOa4CYksOuQFUndhcYU
        HBf2dKowW55vILCVqur4cIaIxA==
X-Google-Smtp-Source: AGRyM1tt6WbrQlUjWKpq62Y+60g2hfC12z40MZISM38MBpPEfW0QRdczB8cjytEsStFlFwH9o9WEzA==
X-Received: by 2002:a17:907:7b86:b0:711:d2c8:ab18 with SMTP id ne6-20020a1709077b8600b00711d2c8ab18mr21704654ejc.580.1655747437601;
        Mon, 20 Jun 2022 10:50:37 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906304d00b00704757b1debsm6346056ejd.9.2022.06.20.10.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:50:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/3] leds/arm: dts: leds on Samsung Galaxy S3
Date:   Mon, 20 Jun 2022 19:50:30 +0200
Message-Id: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Merging
=======
1. Bindings patch: via leds tree.
2. DTS patches: I will take them via Samsung SoC tree.

Changes since v1
================
1. Drop the label from example and DTS, per discussions with Jacek.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  dt-bindings: leds: skyworks,aat1290: convert to dtschema
  ARM: dts: exynos: align aat1290 flash LED node with bindings in Galaxy
    S3
  ARM: dts: exynos: add function and color to aat1290 flash LED node in
    Galaxy S3

 .../devicetree/bindings/leds/leds-aat1290.txt | 77 ---------------
 .../bindings/leds/skyworks,aat1290.yaml       | 95 +++++++++++++++++++
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi   |  6 +-
 3 files changed, 99 insertions(+), 79 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-aat1290.txt
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml

-- 
2.34.1

