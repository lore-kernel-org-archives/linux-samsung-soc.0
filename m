Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FB2C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 01:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A01AA60C40
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 01:58:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbhJ2CBG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Oct 2021 22:01:06 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:38516 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbhJ2CBF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Oct 2021 22:01:05 -0400
Received: by mail-oi1-f178.google.com with SMTP id t4so11138256oie.5;
        Thu, 28 Oct 2021 18:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z0UqHSf36NPaWEAVne5fwEN/KtxfohQXpJllsTCMOqc=;
        b=vqknArZdDSS6MZ+uww2HXMsoHsv/T7C7zB2/5R18JBFljQPOnAdG+EJ8imhFsr/ch2
         W31VUF+PO+NOA0o0O/K3UuhM+sOjJOTpOlgcZGdyTWcbbHYttMOl1jQnH8tYmZiTTT87
         dxsjeaP8D1yag3XYrv1L6MtlaMX7gqMntOeEGakdeWCWMIRm90EFkqyIPSrmhFY24TP+
         p/cnb8NsyLpcKjEGnM+95Igu7P6QMlGXpdNrcc7bpmTokoMZGT2bDRIA5wvBa77GB1fa
         4a3fLamxQZxPGBkJhd9nw4QCmsO0EVYwgC/b0fvllgKJJR65yoX2tmjEoJ46amU50CJf
         h4qA==
X-Gm-Message-State: AOAM532VwFV18c6chOavlsazBBQdAoHyjPRihwn59vKL8/0Y6tkCfnBd
        kzNpWrcaX1N0ePfxxGbRBg==
X-Google-Smtp-Source: ABdhPJysAYzw/Qv1ezOiO0OVA8kqP9HbWcx9H7aUqZxKkF7fuA6n0Nr1cOv3WsPgduNhbYqsmI2ZxA==
X-Received: by 2002:a05:6808:8f6:: with SMTP id d22mr6078258oic.88.1635472717504;
        Thu, 28 Oct 2021 18:58:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f14sm1401069oop.8.2021.10.28.18.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 18:58:36 -0700 (PDT)
Received: (nullmailer pid 1000466 invoked by uid 1000);
        Fri, 29 Oct 2021 01:58:35 -0000
Date:   Thu, 28 Oct 2021 20:58:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: samsung: Document Exynos850
 CMU_APM
Message-ID: <YXtVS1YrZqE5kW32@robh.at.kernel.org>
References: <20211022224556.18742-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022224556.18742-1-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 23 Oct 2021 01:45:55 +0300, Sam Protsenko wrote:
> CMU_APM generates clocks for APM IP-core (Active Power Management). In
> particular it generates RTC clocks, which are needed to enable rtc-s3c
> driver on Exynos850 SoC.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
> Changes in v2:
>   - Added R-b tag by Krzysztof Kozlowski
>   - Added Ack by Chanwoo Choi
> 
>  .../clock/samsung,exynos850-clock.yaml        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
