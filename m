Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C55C43334
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Jun 2022 09:23:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232725AbiFFJXB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Jun 2022 05:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232715AbiFFJWw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Jun 2022 05:22:52 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C13E9FF9
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 02:22:43 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id q21so27742232ejm.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2022 02:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fGRLkNVBEPkUsV8SPQw3ABXYbXe6EdbELeiUgQBePYA=;
        b=WqseQOMPYK8MtmeQ3Kkoko/rUiFzh3SL9nHcPLpjSaMGKNzUY/bM2kO9mccec2nndj
         Es30XiLV69voPXzf50v/7GMp9rUWP3Pmn2fTRfhsEUtifITso3/OqiGX26cC0IXP5aHs
         KMu01xOf5C8NqxPp2MX0t40HcFz7q2KGhudIgn55T4L7G6x3zgytSrPsGIHzs3Z60zvR
         l6oHPfEtUSmAkrvoNzPFz5stg4ygu7bta/LXDgO3rgOhVgRGktGoHfcynofGdrc+WQoM
         DDMS6/WctRgBCEUL4PYLpHEsHp94isQuIcHf3Wx2i5QlYQBZ+H4uVjiYyNtmcAcsmooo
         RTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fGRLkNVBEPkUsV8SPQw3ABXYbXe6EdbELeiUgQBePYA=;
        b=xjtKUv1/mZUVPmcuLecOeTQRgIb5Op6onngJG1NSr1kD1RS3qqjHC/gYrLHyjkNS2n
         Ici9gcJ3bZFla20aGGw0hwEDafiVtvhtAXJCXBS116aQHTR1aRkcQ1+X09wz15OZ9WTv
         3bcKDkOEoNA6i+3JBWPDvPuOp62T9CI+Hrf50bpzr9D+htkvoWcsRwhoxPJ2JzJSAok8
         sB4YT0D/WyA5hI7cE4xXoxr4g1YJXbwZJBlqsowT7yu34f2+FSq1KZM9nrc/ZCF0xCxA
         o8ViMd1ZRRSGReG4eoTgf+lF1HpYlG1MORweWpO70aTh5BzoVie4xmq6u7JUksF5Xwcr
         1hYQ==
X-Gm-Message-State: AOAM533bRzc/BCJsJFYEVuXfPWG0cxuXY9Sr61Z30Px5tSJtvzhculKr
        IOxozkMJ0/BF+wdsPo4vmR97Lw==
X-Google-Smtp-Source: ABdhPJwB8O++kySo/b2d5bDo6PpURaIlpqQGd9zSK+XnslDqZS9WA2tu9uD1t37154fYUKza3+BAng==
X-Received: by 2002:a17:907:7f03:b0:6ff:4721:3c75 with SMTP id qf3-20020a1709077f0300b006ff47213c75mr20350547ejc.508.1654507362219;
        Mon, 06 Jun 2022 02:22:42 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u21-20020a1709064ad500b006f3ef214e14sm5956397ejt.122.2022.06.06.02.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 02:22:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 0/2] syscon reboot/reboot_mode support for exynosautov9
Date:   Mon,  6 Jun 2022 11:22:33 +0200
Message-Id: <165450734050.62970.8421607592750868580.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523121244.67341-1-chanho61.park@samsung.com>
References: <CGME20220523121210epcas2p11d0b4f27edd5a403b2fd7d3833d577ff@epcas2p1.samsung.com> <20220523121244.67341-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 23 May 2022 21:12:42 +0900, Chanho Park wrote:
> This adds to support syscon reboot and reboot_mode for Exynos Auto v9 SoC.
> 
> Changes from v2:
> - Change license of samsung,boot-mode.h to (GPL-2.0-only OR BSD-2-Clause)
> - Add copyright of samsung,boot-mode.h
> - Change ifdef guard __DT_BINDINGS_SAMSUNG_BOOT_MODE_H
> - Remove brackets of the definitions
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: soc: add samsung,boot-mode definitions
      https://git.kernel.org/krzk/linux/c/95099951557c9eb2f180d6bcb9885eecaca97d24
[2/2] arm64: dts: exynoautov9: add syscon reboot/reboot_mode support
      https://git.kernel.org/krzk/linux/c/694d04a1d5449d948e438af1fd1d610d356bacc3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
