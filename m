Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81750C43217
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Nov 2022 14:57:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiKYO5Z (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Nov 2022 09:57:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiKYO5Y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Nov 2022 09:57:24 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9E63AC30
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 06:57:24 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id 130so4351068pfu.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 06:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jdhD7TyJAV9Yjv88DjHcR22sCnTCoFYgtGFsGgYfXW0=;
        b=Uqm0qn5phqXeWhCqw/F05B4fb0YwjNUdPVyTz7nqy4Q+gyHwPLQ6HvMR1FgS8jsCQU
         q1IK7QHUqNoSej2t1wae6i6GrPqtmNhKTjRNOXv6dBWEzRWn3zQdAUmrUhsthaHH4ikA
         cKR2je4BA6e11up3gJriA/c3gADhUN24D8E0lcOKMwEyz+uwt53A6gsbAQTo8nUyFU29
         Nzm2onZOM9+PF/v7Fqfbx9qr3HMphnAgYbvo2Oh7YGfVdmy0npoS0XPfeShCqUtIbkWN
         3x124UDWLQJk1XjK6AP0SfKR3Jb8jr/J7dC5VtiH9wtkfA9KDI0Bz/IE257BuNOsWrFa
         g8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdhD7TyJAV9Yjv88DjHcR22sCnTCoFYgtGFsGgYfXW0=;
        b=iuLsxsRKBIVj0rwy3sFnCe6IM8VRx3jf9UV2/gOJOJxQrQpLZy2ayQ5UFN9J9kM9vu
         DBjgSqOifipR6eOfCsu6XwvRI03JeKYEQjZDoz3uR8o7MON7CbYljP5KNJB5+t6/jG7F
         GfdBv9xjBlVqYqo2ArLjhXOrtszxRZyQnfnimDgVIGTKNA9b/gE7H5YugtGYPEWbu0EO
         BPNr6lZEHKcQU/bkg5UihqNTbz8XtziR24KRs8H925X1w2DaT9TNFt5g/+nAWlvBdyOg
         6fBYDbsDrV7V4pqt5D6oonbJqbQFFyZUW2Z+VvfuVlj0H68j3DQIow+et5nK2eDo9EOq
         NAZg==
X-Gm-Message-State: ANoB5pmfhL6yg/UeafeOFrVv7SvIZBlH0NefaAbdNm6j8plokqmnZJpS
        MfScAwwBWoF+6XHemg1KckaWyTv7wK663qJ16qQznA==
X-Google-Smtp-Source: AA0mqf5I5b28SQXiYfcgPnjF5puxBhYUKVhvjzG8dNtV0uM9fPMxZbbenGJQY8bIxdgwY3OxzBMUM0f64wcqVgqOMVc=
X-Received: by 2002:a63:e008:0:b0:46f:5979:8889 with SMTP id
 e8-20020a63e008000000b0046f59798889mr16712060pgh.119.1669388243590; Fri, 25
 Nov 2022 06:57:23 -0800 (PST)
MIME-Version: 1.0
References: <20221125112201.240178-1-krzysztof.kozlowski@linaro.org>
 <20221125112201.240178-3-krzysztof.kozlowski@linaro.org> <CAPLW+4kwFCLaiowajdCnA09eT4emOB-3d-6cbA=ZYyRLwYuCxw@mail.gmail.com>
 <dfd956d5-d62d-52ac-c485-afc71c441df5@linaro.org>
In-Reply-To: <dfd956d5-d62d-52ac-c485-afc71c441df5@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 25 Nov 2022 08:57:12 -0600
Message-ID: <CAPLW+4mWq5Q4Ht1Upx2Xw3fMfNvvSK6fEPbLFru1NLpKHLbKOg@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: soc: samsung: exynos-sysreg: add
 dedicated SYSREG compatibles to Exynos5433
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Sriranjani P <sriranjani.p@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 25 Nov 2022 at 08:47, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/11/2022 15:22, Sam Protsenko wrote:
> > On Fri, 25 Nov 2022 at 05:22, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> Exynos5433 has several different SYSREGs, so use dedicated compatibles
> >> for them.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Cc: Sriranjani P <sriranjani.p@samsung.com>
> >> Cc: Chanho Park <chanho61.park@samsung.com>
> >> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> >> ---
> >
> > Hi Krzysztof,
> >
> > Just curious: what is the rationale for adding those more specific
> > sysregs? AFAIR, e.g. in Exynos850, different SysReg instances have
> > pretty much the same register layout.
> >
>
> On Exynos5433 all these blocks have different registers. Are you saying
> that Exynos850 has four (or more) sysregs which are exactly the same?
> Same registers? Why would they duplicate it?
>

Ah, no, you are right. Just checked it, they are different. Just first
couple of registers are similar between blocks, that's why I memorized
it wrong.

So as I understand, adding those new compatibles follows "describe HW,
not a driver" rule? Because AFAIU, right now it'll fallback to
"syscon" compatible anyway.

> Best regards,
> Krzysztof
>
