Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8E1C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Sep 2021 13:21:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0351161247
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Sep 2021 13:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351106AbhI3NXU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Sep 2021 09:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351100AbhI3NXQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Sep 2021 09:23:16 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF39C06176A
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2021 06:21:33 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id q127-20020a1ca785000000b0030cb71ea4d1so4344577wme.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2021 06:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0EnoGcQxVcjVLjhlbUWYyjl1NXgdf4STxEMEBfnyuEE=;
        b=RfTVTSp1Jll5QOCFPLIM78aADWMp5XJ+7MXbtAhSEJgHyf5spRRcODCjtBNQ1Zr29M
         3zZ0ofUeQgp4EmzaiUh9syLWblSChCksVV8XwwiVndwfk9CSH9jlVDatSVNRtfSkLV0K
         UUnMG/NHEM8gFVZWGcFMqUgEVGDEhc2uWRGCLnWvDTRkfyXc2jv+7H5qafKQ8fZl3Aum
         1Nnr8yVXQDR+vs8nayhUqdLXMCaj7KCNtU5EJNuhDJL0tkmteDGs407BQjMP6qfWasle
         4POTMeon+KJwy6tnw3miMqaA96nRffXtdAm+Ky0rqO/NNPSR0QKAem7NDkk6Kx3WDKv9
         1VCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0EnoGcQxVcjVLjhlbUWYyjl1NXgdf4STxEMEBfnyuEE=;
        b=yEI0YTAlKE2Qw1h3DPqX+kDDbOjIbZeysVSHHAmOWHX7iHtlH6xoSdAZcmCSEXbPnI
         P58S3MvoHtypB9TYzh5v5GB3xgNlARuewkdf75EgD6Qh8VBvIAu2qktsgtEkWFr2Qol5
         Dzs9uOfBoms4CvqLs1sE32d4NOItjkwbc/JaMYawDthO5aEwQbN71jRNWuQqVcDd2Ip4
         zVe7IBOkBegJVbOoFvX7moiQpqSJsscQOpeAVwiXjmIBBCanU1hMpht0C3nJ/f74azCJ
         6Gpd/ifQJ4LCA1EUOjV4c/AfkVAw+nPfjlpTqgFwlddFnmzfaK8T2saLfeIZbOhzV2D1
         3Ofg==
X-Gm-Message-State: AOAM531MsGFnupLHMJ0vPpRy6bPU141z0wPMTiNbrpIVQ69Yo38Cb1Gw
        NUB4MfRKYI87z/c8T6mjNtKH3g==
X-Google-Smtp-Source: ABdhPJyyEtgq7rfkTi/7o2F3OJOwqDVQ7uW6EcRjxsPnSK+R3odzh0Zz0IG2MLTOeNWuUz6OYd2YEg==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr5199573wmh.188.1633008092422;
        Thu, 30 Sep 2021 06:21:32 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id s13sm4847931wmc.47.2021.09.30.06.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 06:21:32 -0700 (PDT)
Date:   Thu, 30 Sep 2021 14:21:30 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: [PATCH 10/12] mfd: dt-bindings: samsung,s5m8767: document buck
 and LDO supplies
Message-ID: <YVW52vAdxbA8LqhM@google.com>
References: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
 <20210928084949.27939-11-krzysztof.kozlowski@canonical.com>
 <YVWx+08egbGPiYYt@google.com>
 <e5ab2ba9-e4ae-30db-8e54-8af42d7f3bf1@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5ab2ba9-e4ae-30db-8e54-8af42d7f3bf1@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:

> On 30/09/2021 14:47, Lee Jones wrote:
> > On Tue, 28 Sep 2021, Krzysztof Kozlowski wrote:
> > 
> >> Document the properties with regulator supplies for bucks and LDOs.  At
> >> least one board uses it (Exynos5250 Arndale).
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >> ---
> >>  .../bindings/mfd/samsung,s5m8767.yaml         | 38 +++++++++++++++++++
> >>  1 file changed, 38 insertions(+)
> > 
> > These all need Rob's Ack.
> 
> Correct.
> 
> > 
> > But can you start with reworking the subject line please.
> > 
> > It should be:
> > 
> >   "dt-bindings: mfd: <component>: <Subject starting with an uppercase char>"
> 
> Sure, just have in mind that Mark wants them the other way around for
> regulator. :)

a) I'm suggesting you use the standard formatting
b) This is not a regulator patch :)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
