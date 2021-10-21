Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2DDC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 09:07:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E528D6112D
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 09:07:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhJUJJZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 05:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbhJUJJZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 05:09:25 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4964DC06174E
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 02:07:09 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id m22so23323wrb.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 02:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fa8qTNUMfdlm5vVlUvR29Di6jRAMYyn6oP+QaN90AGc=;
        b=GJgVEZZOZYp+PLlgHwjiuMJ0smmcTiEeRFCpmRgAvtDPhVEyxooLd4PxqPk32F2yCn
         HAVijInvS6hf+6qOwSa5NxtTfgxemgw3RO15ka8CSmmtCpEl5SG5dnE8aGmjdGTD/RRd
         EAWScowWFcONLMtYxRsOmUxP0SW8eQRVea5mShWM3/1I1KUxFhA6heGkJMjxhubFbyui
         hT57540L21MmRtgM2RfI9hhDgBWfWBDP0pjhmEcHasi5sKYuVmBwhaobY1nna1m5GX42
         RXEePQr7gXWR0A8FDB5URysq2I2AJTVc4eRsh2wSJAfUaF5iVXUf4luG0KKw6VIs5SGK
         bocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fa8qTNUMfdlm5vVlUvR29Di6jRAMYyn6oP+QaN90AGc=;
        b=pLOBef01IXwVr+UEsdx4e1xiYFrIR1kVjgtK+coPWTZyuKIlZxljrKxFra4fcAK/RS
         +AZhO/XqwzEHSEMUmxTF23mpklK7fbycXdJCooyqZgaCDHnNLun8JqB2gh70tXGY/4Rg
         4NY4YolP8ao5AHkf23l2DbW5ozn/PQqCDSN58+aEzL11f1FTWxczLBWprDKm+XuGksoA
         kbE+jwU8hyZPHiQ3orvk9D0iIkszYizL9xcd8RZuc0sCUwTUzYlhr5m1gakXcfJ50Beb
         nvY8eFC6FKFVTqc36/gY2HXsPa8o+HoAyQEOEpF65GHvkRIVJlr4iT2io5iamMeSTTdO
         jUnQ==
X-Gm-Message-State: AOAM532hPSzSltncmGzjFVapuKBrkKLswbOeViaBMJLr/Qe7lPFWBpPT
        M+gaEUoNqWBO1q6yd5188pzAfg==
X-Google-Smtp-Source: ABdhPJyLvrmnvqTWa0t6F6IhSJkal5/W1VnSEpvXXHa1yE5OnPVfRhps7Jd/HKqKroDO8CuXCMBanw==
X-Received: by 2002:adf:b350:: with SMTP id k16mr5744094wrd.368.1634807227725;
        Thu, 21 Oct 2021 02:07:07 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id d1sm4408449wrr.72.2021.10.21.02.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 02:07:07 -0700 (PDT)
Date:   Thu, 21 Oct 2021 10:07:05 +0100
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
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 00/10] regulator/mfd/clock: dt-bindings: Samsung S2M
 and S5M to dtschema
Message-ID: <YXEtuX5j9z8es0/i@google.com>
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
 <YXA+GoTf6u/Y4qLX@google.com>
 <16c79986-03b2-b74b-0de8-4118e2c4419f@canonical.com>
 <b98bd487-6c55-d058-8073-689b9396b527@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b98bd487-6c55-d058-8073-689b9396b527@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 20 Oct 2021, Krzysztof Kozlowski wrote:

> On 20/10/2021 18:08, Krzysztof Kozlowski wrote:
> > On 20/10/2021 18:04, Lee Jones wrote:
> >> On Wed, 06 Oct 2021, Krzysztof Kozlowski wrote:
> >>
> >>> Hi All,
> >>>
> >>> Changes since v2
> >>> ================
> >>> 1. Add Rob's tags.
> >>> 2. Remove "regulator-name" from properties (all regulator dtschema).
> >>> 3. Move "unevaluatedProperties" higher to make code easier to read (all regulator dtschema).
> >>> 4. Add ref-type to op-mode property (patch 6: s5m8767 regulators).
> >>>
> >>> Changes since v1
> >>> ================
> >>> 1. Drop DTS patches - applied.
> >>> 2. Fully remove bindings/regulator/samsung,s5m8767.txt .
> >>> 3. Minor subject reformatting and few typos in text.
> >>>
> >>>
> >>> Intro
> >>> =====
> >>> This patchset converts all devicetree bindings of Samsung S2M and S5M
> >>> PMIC devices from txt to dtschema.
> >>>
> >>> It includes also two fixes because later conversion depends on it
> >>> (contextually).
> >>>
> >>>
> >>> Merging/dependencies
> >>> ====================
> >>> 1. Regulator related binding changes depend on first two commits (the
> >>>    fixes), because of context.
> >>> 2. The mfd bindings depend on clock and regulator bindings.
> >>>
> >>> The fixes and bindings changes (patches 1-10) should go via the same
> >>> tree.  For example regulator or mfd tree.
> >>>
> >>> Another alternative is that regulator patches (1-2, 4-6) go via Mark who
> >>> later gives MFD a stable branch/tag to pull. Then the clock and MFD
> >>> bindings would go on top via MFD tree. Or any other setup you would like
> >>> to have. :)
> >>>
> >>>
> >>> Overview of devices
> >>> ===================
> >>> Essentially all Samsung S2M and S5M PMICs are very similar devices. They
> >>> provide the same functionality: regulators, RTC, 2 or 3 clocks and main
> >>> power management (e.g. power cut to SoC).
> >>>
> >>> The differences are mostly in registers layout and number of regulators.
> >>>
> >>> The drivers are built around one common part, mfd/sec-core.c, and share
> >>> some drivers between devices:
> >>> 1. MFD sec-core for all devices,
> >>> 1. one clock driver for most of devices,
> >>> 2. one RTC driver for all devices,
> >>> 3. three regulator drivers.
> >>>
> >>> The regulator drivers were implementing slightly different features,
> >>> therefore one regulator binding for all devices does not make much
> >>> sense.  However the clock device binding can be shared.
> >>>
> >>> The final dtschema bindings try to implement this - share only the clock
> >>> bindings.
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>>
> >>> Krzysztof Kozlowski (10):
> >>>   regulator: s5m8767: do not use reset value as DVS voltage if GPIO DVS
> >>>     is disabled
> >>>   regulator: dt-bindings: samsung,s5m8767: correct
> >>>     s5m8767,pmic-buck-default-dvs-idx property
> >>>   dt-bindings: clock: samsung,s2mps11: convert to dtschema
> >>>   regulator: dt-bindings: samsung,s2m: convert to dtschema
> >>>   regulator: dt-bindings: samsung,s2mpa01: convert to dtschema
> >>>   regulator: dt-bindings: samsung,s5m8767: convert to dtschema
> >>>   dt-bindings: mfd: samsung,s2mps11: convert to dtschema
> >>>   dt-bindings: mfd: samsung,s2mpa01: convert to dtschema
> >>>   dt-bindings: mfd: samsung,s5m8767: convert to dtschema
> >>>   dt-bindings: mfd: samsung,s5m8767: document buck and LDO supplies
> >>
> >> Looks like these are ready to be pushed.
> >>
> >> However, I am not in receipt of patches 1-2.
> >>
> >> Am I okay to merge 3-10 right now?
> > 
> > No. This is v3, but we need v4. Please:
> > 1. Merge tag from Mark:
> > https://lore.kernel.org/lkml/YWCT+YL%2F9qHbF9f0@sirena.org.uk/
> > 
> > 2. Then apply patches 7-10 (MFD bindings).
> 
> ... patches 7-10 from that v4 of course. They start here:
> https://lore.kernel.org/lkml/20211008113931.134847-4-krzysztof.kozlowski@canonical.com/

... and these can do in on their own?  With no inter-dependencies?

Or is Rob going to tell me off again?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
