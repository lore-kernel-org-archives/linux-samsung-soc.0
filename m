Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C358CC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Feb 2022 10:26:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbiBGKYv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Feb 2022 05:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357043AbiBGKL1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 05:11:27 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1989FC0401E2
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Feb 2022 02:11:09 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id m5so6474850wrb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Feb 2022 02:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=t1grJfuaAdS3B1XhyLaLbix7QKdpfthiiXC5enSQ1wU=;
        b=wPpS1R/uWVlqPEkanPeqJeH/0D36BtOQVNLC6MxnxsReockDsvWqZG0Z1ByYDDuvM7
         4wItKYbdClpjxyuOyRK9/gJfr5YryUe5EgYLsk6JfeJMCd3XkXMnnxdp9JqUXD/1UkV8
         t0mtIzGSIsgctau6xdm1KHCMbGvMNEL/JVAUQjalNg9u+oU7LrHc3Wn3uSNTw5lbgYUd
         DpByqvFXqb50PDV3lL8IoxrzzsNtFipGmOWCNjjpRAvXUMLeFiYICD19OtjrI4lXaS4R
         V0LkGJa1SmI6gGzOs8S5qtFDYA0i7YfRY+bvGhZQkICcuObnwhNHAjilL2KENHyKeg7s
         CLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=t1grJfuaAdS3B1XhyLaLbix7QKdpfthiiXC5enSQ1wU=;
        b=AbGqNz51rPoc4QOmpAxdogqPmht1hRIbbBKPCcZyoNrpaVsfMsNzEdod4/edWIVrNJ
         drv309Nf4Vdbc3ZQtWb34MMSuGiUcqdFZyOw/CnmHIJ+wJ5LAk8nwHGJgmWUdPhZX1BU
         0w+kOQJuACtfIrT9K+jAhW2F+LksoVGix1M+h+43rDoLVak9P5Dokdt8COuEWcUTK9j9
         lZXd3WjgjwHsIXCNI5OVlm+lksm8kpSc4f0GcTJ7zfCDjDjwKbZjY0iW3WOs1VK3v22F
         KgFSFS6UpWbE7bt8EbZYpmRzdX00wcN8vO3TSB6tJ5db4duVijPbeLKDfwTT/axQkW05
         a6tA==
X-Gm-Message-State: AOAM532MyCz3nFO6/DFdgtbtZ51O7/HNH6fgXVSlivlTnijNAOyzN8Qh
        wo+g6mY9wPjwZtCH5HP4vmBBLg==
X-Google-Smtp-Source: ABdhPJyfPm5Ul6/cWxD2ilu20wXd7IFB/LmDVwLybcoxL+DwkSm+3qkAcNf1ZOyzjv+UAG62JG50qg==
X-Received: by 2002:a05:6000:1548:: with SMTP id 8mr9155762wry.254.1644228667605;
        Mon, 07 Feb 2022 02:11:07 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id c13sm9620833wrv.24.2022.02.07.02.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 02:11:07 -0800 (PST)
Date:   Mon, 7 Feb 2022 10:11:05 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 0/5] mfd/extcon/regulators: max77843: add
 dtschema/bindings
Message-ID: <YgDwOWRpfVBfcXxs@google.com>
References: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
 <1bebedb9-644f-783d-492c-84a5de91720d@canonical.com>
 <YgDnUNCNCO+JLyHU@google.com>
 <88fcdbe6-5fef-d9cc-a645-69e35230cdeb@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <88fcdbe6-5fef-d9cc-a645-69e35230cdeb@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 07 Feb 2022, Krzysztof Kozlowski wrote:

> On 07/02/2022 10:33, Lee Jones wrote:
> > On Sun, 06 Feb 2022, Krzysztof Kozlowski wrote:
> > 
> >> On 11/01/2022 18:48, Krzysztof Kozlowski wrote:
> >>> Hi,
> >>>
> >>> The max77843 shares some parts with max77693 but it lacked bindings.  All
> >>> its compatibles were undocumented.  Add basic bindings for max77843,
> >>> matching existing devicetree.  These are not complete bindings, but
> >>> rather reverse-engineered to match current state.
> >>>
> >>> I do not have access to device with MAX77843, so if anyone else
> >>> volunteers to be the bindings maintainer, please join.
> >>>
> >>> Changes since v1
> >>> ================
> >>> 1. MFD: Use absolute path to schemas.
> >>> 2. Regulator: mention all allowed properties,
> >>>    additionalProperties=false, add min/max values for voltages and
> >>>    current, don't use patternProperties when not needed.
> >>> 3. extcon: Use absolute path to schemas.
> >>>
> >>> Dependencies
> >>> ============
> >>> 1. Patch 1/5 (dts): nothing depends on it, sending here so Rob's automatic
> >>>    checker won't complain about DTS.
> >>>    I will take it via Samsung SoC tree.
> >>>
> >>> 2. The patch 4/5 (mfd bindings) depends on regulator and extcon, so they
> >>>    should come together (2+3+4+5).
> >>>
> >> Dear Lee,
> >>
> >> This patchset was reviewed and there are no outstanding issues. Could
> >> you pick up patches 2-5 (skipping DTS patch) via MFD tree?
> > 
> > Are the subsystem maintainers not going to review/ack?
> > 
> 
> Would be nice to have them, but maybe since these are dt-bindings maybe
> they were skipped? 

Agreed, not required, but nice to have to avoid possible conflict.

> Or maybe it was the end-of-year holidays?

> I can resend hoping it will trigger more acks. Do you wish me to resend?

That shouldn't be necessary.

I'll give the guys a little while to protest/ack, then I'll merge.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
