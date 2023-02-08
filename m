Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D81C636D3
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Feb 2023 06:08:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjBHGIL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:08:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjBHGIK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Feb 2023 01:08:10 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5EB43C2AC
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Feb 2023 22:08:09 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id t17so12413932pfj.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Feb 2023 22:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Iec23gsP+sSms2hV+HR+Vp0eFbhDQHdA6maO2iZiIVw=;
        b=LKUOLxjmnNMz9gvLHLLDkZ417tWU/oPLRPjDnHjj+O56WlbzroFIcAgNxOAnou09Td
         fq6PJ2vMNs6bzz2LqZas4kJwN6TIQKwcHleK2D0VS0yp1g1Tj3ko9+aMvpMYT0LXJjY6
         LADxqQdVRhECEjv9q0Inr1hNMEdOPXAlN9mfhhNUu50/oZHECDvUdIBMpwc1zksr3d99
         /hRoAJB9YcOQ9qYJ09bPJm/pQ9JaQidxeio6QRZw/k5SLWbNZWF5gCnC9J0rH+vn1DjD
         DhjLYhCq2b8LxHR/KhLuYaZgMjT3ydhbrTT5sD2S4KnTPD27vOGWf8yaTQGcmhJmqh21
         soUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iec23gsP+sSms2hV+HR+Vp0eFbhDQHdA6maO2iZiIVw=;
        b=lrJksfbePyHkHX2ZBIPjkeq8Be/hCwFKmOz0nuSKFgPu4fAVDvB8oqlwHtp+Gwog3p
         9kH7NNMRNOdMjUzkTDXnyxtRkh7pmqd1OUHbNJ/kHkB3vNBeq5rNilTGg1IESZodv6nT
         D9qmGj5qsXb1qY53nZfOPsDRjDqnopFEcnih7K9kPMiNrOOLpXHrEcQLwf0Z9F+mGgbv
         McXtwV10WpwxQ8sx7y1FeLZIdobfnPSZXkXZrWIkMATlJCFosILY08rb0nZwH+nrGIo8
         gpSMic9tL7XADsuzegEWfjsWddmyw8d3FiN25xMXvbtQ5voWa1IE0YLiYxogx3xI7Gw3
         /Gsg==
X-Gm-Message-State: AO0yUKU4jydGQIfAVCjC1xDIHnSe+ZG+7jk7S/ag0KSnS0dKi29pM/Al
        IdVk3Jmi4h4OpAQA/dQl4FMzjQ0ZKR1juhkfcmFu6Q==
X-Google-Smtp-Source: AK7set9VK9sGir420UmhyaPvxF5uQawzrlEDIpDo9OvveQC0SfMGXXRUKk/qqxnI3hWKpv94NGRSPK5OJiOWw65QFas=
X-Received: by 2002:a62:cf06:0:b0:5a8:1929:f482 with SMTP id
 b6-20020a62cf06000000b005a81929f482mr388781pfg.49.1675836489152; Tue, 07 Feb
 2023 22:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20230203060924.8257-1-semen.protsenko@linaro.org>
 <20230203060924.8257-7-semen.protsenko@linaro.org> <59ff815b-baad-02c5-67df-e4d65f63afa3@linaro.org>
In-Reply-To: <59ff815b-baad-02c5-67df-e4d65f63afa3@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 8 Feb 2023 00:08:18 -0600
Message-ID: <CAPLW+4mXJ8Gmb-OWabdN6EyaUrCUQuFAGyGh09TDgikmL5gjAg@mail.gmail.com>
Subject: Re: [PATCH 6/6] clk: samsung: exynos5433: Extract PM support to
 common ARM64 layer
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 3 Feb 2023 at 03:18, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/02/2023 07:09, Sam Protsenko wrote:
> > Exynos5433 clock driver implements PM support internally, which might be
> > also useful for other Exynos clock drivers. Extract all PM related code
> > from clk-exynos5433 to common ARM64 functions.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
>
>
> >
> >       if (IS_ERR(parent_clk)) {
> >               pr_err("%s: could not find bus clock %s; err = %ld\n",
> > @@ -91,6 +112,46 @@ static int __init exynos_arm64_enable_bus_clk(struct device *dev,
> >       return 0;
> >  }
> >
> > +static int __init exynos_arm64_cmu_prepare_pm(struct device *dev,
> > +             const struct samsung_cmu_info *cmu)
>
> Align the arguments.
>

The same issue here as in my previous answer, unfortunately: when I
try to align the `cmu' argument to match the open parentheses, it
doesn't fit 80 characters limit, which doesn't look nice to me. Do you
mind if I leave it as is?

> Rest looks good to me.
>
> Best regards,
> Krzysztof
>
