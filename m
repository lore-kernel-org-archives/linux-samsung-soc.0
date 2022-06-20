Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E56CCA479
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jun 2022 12:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242310AbiFTM1Q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jun 2022 08:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242376AbiFTM1P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 08:27:15 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B0617A9D
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 05:27:13 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id eo8so14955646edb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 05:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7+7zSFmCgAYJTfLDYvta4u1btP/xlyhqRxIkaAavVr4=;
        b=vP24YWI/E50s3detS4JAuqTFxXsK7NvUJEF6p9PS7fQGYTTiDyF+J80GJMKoQsxn68
         4OIQNsVMvT+25pRV53ZNTrA5m8gxXmIdwSbiBne3dw/mStu/btTEcanz9iwaQ+TntYup
         dyGZVVNg+L2DugO1zdVnqRmR2fb8uTbRuYyH+AElMir/mzC0vrpcaA4GQENJBho5aGqv
         w9t2u0LAAbmCSLIShCLkGMvMnBewBG9g6nxrMdWx3H5TXhzVg28MnhfZohC0FfSNo6F4
         lqSX5iXCDJoucwc3KfiPbqMIDM+CsztJqRhFCVGYH4YpP9cQVrOdmVi3vqW3mE3R8GBg
         stpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7+7zSFmCgAYJTfLDYvta4u1btP/xlyhqRxIkaAavVr4=;
        b=w2XJ2oDYkggbbH7XV8lam5T5rs28ZY70aLjw4IBTYhcwVD+UUGQmf7RGQpsJ4HJtP8
         CvN8R29z366kwELeL5V/nqSk1iEV4wMo5edxQDjp+DWenikzKmFEwnclT0k+2u0NTBrH
         z/d6ozNRXFmEPdAzIGLX65SLP9TAY8YhmJn2zpbn3ZfC4/Wdn9o91S+fYk6jeSyXzWww
         x8DoTrgIXYWV/R5fJH4KIbod0sk+WOI/Mjy/N44eMsxSRuNehxQXwMtCJ8/xUP/tCY6A
         L/kxrCevn0S+FvfK8073yYQC2hcWj8giFIhfkh5tzzeufZTMk//HI0e+L9Rge+jcicLM
         Y8GA==
X-Gm-Message-State: AJIora9Q4JIweaks6l7Ge55Mwahm6yJz+2cB9rBotDBSpiE5JwBg0lZU
        3MoLD04JhqnPKe15NImfNY+3Ag==
X-Google-Smtp-Source: AGRyM1uhq/cePecmg+PBSpFN37PalbSei6PpK42hPQXx1xuFwBVIL0me4eTVOpNH9Mk0gWnlgM1K4w==
X-Received: by 2002:a05:6402:42c8:b0:42d:f0b0:c004 with SMTP id i8-20020a05640242c800b0042df0b0c004mr28878526edc.356.1655728031953;
        Mon, 20 Jun 2022 05:27:11 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 4-20020a170906300400b00722dcb4629bsm15987ejz.14.2022.06.20.05.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 05:27:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     David Virag <virag.david003@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        phone-devel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/5] dt-bindings: clock: Add bindings for Exynos7885 CMU_FSYS
Date:   Mon, 20 Jun 2022 14:27:07 +0200
Message-Id: <165572802724.43913.12874553470306396610.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220601233743.56317-2-virag.david003@gmail.com>
References: <20220601233743.56317-1-virag.david003@gmail.com> <20220601233743.56317-2-virag.david003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 2 Jun 2022 01:37:39 +0200, David Virag wrote:
> CMU_FSYS clock domain provides clocks for MMC (MMC_CARD, MMC_EMBD,
> MMC_SDIO), and USB30DRD.
> 
> Add clock indices and bindings documentation for CMU_FSYS domain.
> 
> 

Applied, thanks!

[1/5] dt-bindings: clock: Add bindings for Exynos7885 CMU_FSYS
      https://git.kernel.org/krzk/linux/c/cd268e309c29e9a8b15a47f684d848c1d57fe150

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
