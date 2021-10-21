Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC21C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 09:47:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47C5760D42
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 09:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbhJUJtW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 05:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbhJUJtV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 05:49:21 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8DD7C061749
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 02:47:05 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id r7so45435wrc.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 02:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Xv7yy8py0DKeobvYvlJ9FHOkVAuAh9UvNYK21UpSTh0=;
        b=v//taxIpU61sYw2GgDkdnV/5qgqxhDV68363Q42soNTo+faeEN6SQHRA4Cief4D90P
         E0q62PU7tIxLdwWeNeZn/4QaJi/VxRT1v2nmdWXMwtzGL9S5cotZIL13nKppn2aYoLXC
         GBRrIDSuuEwNxZs4p0kjeaNCwi1Z7W7LAxgAXsQ/gTEA+DYVp2+MCiL/b2x6h6Bgyhtw
         yZyH4uCZq+NWAwpaDdw20xe1D3VKVcGD4ljOxD4eTCXrB51AVGCPpucnZmLWz0KsbWIE
         Si6lSz4FlVlJia8O9OEZ9u0Mzbg7XW5kLRgsF39/aOgDWclsAE7MX74CjDxkV9e2BLtX
         OaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Xv7yy8py0DKeobvYvlJ9FHOkVAuAh9UvNYK21UpSTh0=;
        b=2ZSXvuYC0RHAJcgP3iHFJiImThvKq5Xg2g9t9IWR/fmVNu4tEkWLmf8b2s/Lg+1Ney
         kaWO3Q//n1lyV6pzTiqPrhhuNa0sGjWkWaq2Lvha9Wpkj5s2+vjvnR/a8ebQ7WQmPOdX
         2cfZCCmSqZviLsBHEDCtj+tQKaczpHb28i4FWwXXbG4C3h6+iCIpDjgA4ttOeC7sIlmS
         7NpeCBojrbH34k+YuJ0S5aoelPsBlGP5KWgoLijMlMI8t2z4GFyDXU5tnietgFwusxZD
         qpj60V3rcn8k+vPwaAttwKEKlEh+1rg8sh0w1Rhjp3TzYovrxwp9whYFUhOLnks2Z+h1
         PhRg==
X-Gm-Message-State: AOAM5323HNohzoiZQ8NKevyOQEbyRYBeZKLuoYtTr36WQ+vN3KlgZPo/
        p16z6J3HS9EUwu/cv/EY6Tj1mQ==
X-Google-Smtp-Source: ABdhPJyuat/sV/sJFXIOlsrLqS92zPlOzm+T+23hm8J961JAtuxiY3SjW3So5Ni8FNDiFoPoNK+ISg==
X-Received: by 2002:a5d:4643:: with SMTP id j3mr6018858wrs.297.1634809624436;
        Thu, 21 Oct 2021 02:47:04 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id f186sm7184109wma.46.2021.10.21.02.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 02:47:03 -0700 (PDT)
Date:   Thu, 21 Oct 2021 10:47:01 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 07/10] dt-bindings: mfd: samsung,s2mps11: convert to
 dtschema
Message-ID: <YXE3FSiG87gNtN34@google.com>
References: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
 <20211008113931.134847-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211008113931.134847-4-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 08 Oct 2021, Krzysztof Kozlowski wrote:

> Convert the MFD part of Samsung S2MPS11/S2MPS13/S2MPS14/S2MPS15/S2MPU02
> family of PMICs to DT schema format.  Previously the bindings were
> mostly in mfd/samsung,sec-core.txt.
> 
> The conversion copies parts of description from existing bindings
> therefore the license is not changed from GPLv2.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/mfd/samsung,s2mps11.yaml         | 267 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 268 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
