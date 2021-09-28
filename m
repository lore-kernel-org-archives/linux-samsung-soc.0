Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D877FC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 09:52:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB81C610A2
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 09:52:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240019AbhI1JyF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Sep 2021 05:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239996AbhI1JyF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 05:54:05 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF13CC061604
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 02:52:25 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t8so57072476wri.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 02:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yVcQbOuCpqmzA0Unotd8q5BfUkjxaUbJiv1/pjgSmvw=;
        b=IT+UEBuPtAVijXSWbsiNBfN2jv6zi3NY6h6mLsCshHMfL44Q1zDsxubpu2mLKW11fh
         JS/kscx5DjMePLiRz+yItlMxPX/br/edRBPxcx52PmZPe2GmzHlOQGdoVKPGfAIhvNbN
         0UJON/ZWF4FxrhiW8doKw2YrtE1oO37zTNsfYC5FbIsgJWcrdEn80meonMsUYB6iZyv1
         c4eebUvTkFVsRvpfK6LEXz/5uR/YI+NAeZ29mfRV2UlK1Sk7sLZnNLBii0AP7yFspKv7
         sa6+s9JbCTtjLW4yAnHQcu7RMJGjOFwVx2oM54hHEfD4aygh0ZCgM7Z67sWhT8QitPyf
         MUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yVcQbOuCpqmzA0Unotd8q5BfUkjxaUbJiv1/pjgSmvw=;
        b=CyCFXges8rcL/c1OxuzPVE+HM3zQ9IQH+onLHE2RRkxArStYS4Vmtvzcsw4xPlDtNZ
         v8dVJmzWUu/9RgH0sME3lX1YaEtXRJICP8q+v6Q6ORdg1EiIdgiY3Wxbntm0DtKZu2WC
         Qaw1JdqR5E/BbEj/amnL46FmnxU07k1IGWdQ97cCVvtpXxa0hPZIAwzLQhhh/8Wa7Cjg
         GSbpnabRvzxF0PdeOjmKVcSR+2MkIAkOS/dxsPIqsgwG00rhcrh/moe7SA7hAseyMuXd
         6Fyn/1r8eMbVyd2B3pDKOc/bEwowZKb3TSAcwdb9PFftd4iY8D26qTMIXt39WqQnFxg0
         CJrg==
X-Gm-Message-State: AOAM533q9O3HQxDZ12RT+Zk+N9/JW4A/t+UNhnx3m1pHmV5DC5CgJAZQ
        8MtXsAf6Q7UvZi0Su6wwg9qgvA==
X-Google-Smtp-Source: ABdhPJweAtsLKmkEaMGSf+R8jmjUTDWtQcN5Xf7jIS0jkEcJSO32F6bKYQNNj9DajCWOKJAkdfh3WA==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr5386646wrr.187.1632822744424;
        Tue, 28 Sep 2021 02:52:24 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id n66sm2243910wmn.2.2021.09.28.02.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 02:52:24 -0700 (PDT)
Date:   Tue, 28 Sep 2021 10:52:22 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RESEND PATCH v2 1/4] mfd: sec-irq: Do not enforce (incorrect)
 interrupt trigger type
Message-ID: <YVLl1tigynO1MtYu@google.com>
References: <20210602110445.33536-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602110445.33536-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 02 Jun 2021, Krzysztof Kozlowski wrote:

> From: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Interrupt line can be configured on different hardware in different way,
> even inverted.  Therefore driver should not enforce specific trigger
> type - edge falling - but instead rely on Devicetree to configure it.
> 
> The Samsung PMIC drivers are used only on Devicetree boards.
> 
> Additionally, the PMIC datasheets describe the interrupt line as active
> low with a requirement of acknowledge from the CPU therefore the edge
> falling is not correct.
> 
> Marek Szyprowski reports that together with DTS change (proper level in
> DTS) it fixes RTC alarm failure that he observed from time to time on
> TM2e board.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> ---
> 
> Rebased on https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next
> 
> Changes since v1:
> 1. Mention in commit msg that this fixes TM2e RTC alarm.
> 2. Add Marek's tested-by.
> ---
>  drivers/mfd/sec-irq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
