Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B71EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 17:46:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 292FA611ED
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 17:46:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbhIURrc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Sep 2021 13:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231684AbhIURr3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 13:47:29 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6077BC061574
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 10:46:00 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id h17so77611320edj.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 10:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mQQDt3jbAZk0CeTPaKtXUkqjBcabdWOVqUMSrb9IMC0=;
        b=poXvbJmwz7vtECOa8f4BEix3x6KuyVodHQ2LT+fkzIYCmN5rc76INwCnGGLT7qMVqc
         elcQ8C14+wB3V3wLRTD3DsYkPnn4CSNAGxM2tbViuRIyeEDDbfalqJBgsIn6Fb03IA8h
         8/P5ccMVHF7gsNL7oHpYm4rL2ALddvSQGOMddTuujSQL9TACdsPiW2unJcL6yJg8oJ9h
         cZmqqzIxudo6uVBkm+erLwneUnyhOo5v2IC6pGR7r8z5DB/DCjLGEN5vQ3Pjj1nzBlmK
         9ir6qQxejsnqbuzuC+xYKr/TTDEcJlsbpkABxYUc6yrNZwSFV+yVzKEzisvnbPHzFbf3
         IksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mQQDt3jbAZk0CeTPaKtXUkqjBcabdWOVqUMSrb9IMC0=;
        b=nHTTPB3OiYAAu6T910kWRxuM8QcV594byaMOTAvyJWXv8NJ+OvGiydRzwtC2ImyCLJ
         zZPPjYK2aUNrTVV+LoVuD0yqJRUS6EqfEnDBtOJqQcdYG7Z10KMLR3H4RukL+x7Fornb
         ztgcvdPQNOHiIEVM3UOte/B3UTrP4lcvd2KhHmIdCog/iJmw19nVDMVL730L2iKdxlnq
         QvbE7HJpYDh2xjqCPASmy6MoZB7ufRUVmInh+013BNdbz1Imz0hyvt9OjKyLQMYgUWeH
         1aa2HaqV93zBPvNzkbyg/snLmB49qk9WuEmBajHRYnwK1XGFeA9b5u1NdwvnufvqggzO
         lfzQ==
X-Gm-Message-State: AOAM531TFXlJfqBvF+TuwXO1OdTUtK9EGD4qaFtH5A/Wp4/z2+KOPE1t
        Spa0pflBaDL9rLp8WI3ZTZyKaufs1T+0sxbEMzS6Qj2nVKJs4Q==
X-Google-Smtp-Source: ABdhPJwJbT/0NCvATNDegKI0IJETlYRX/RpirpTKRe62opaMokm4pqc+Vgau2G/y5TKgjLalAWmvyhKQx5wVPu1rhXc=
X-Received: by 2002:a50:e044:: with SMTP id g4mr5779430edl.46.1632246358716;
 Tue, 21 Sep 2021 10:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-3-willmcvicker@google.com> <2b48a41a-9130-b4cc-40d3-0bc7930ac76a@canonical.com>
 <YUmVj80m/rEC2mT7@google.com>
In-Reply-To: <YUmVj80m/rEC2mT7@google.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Tue, 21 Sep 2021 10:45:42 -0700
Message-ID: <CABYd82a4OwxHNUUmUtBmTpSvWLu-f4sepHMF49kPQtWLU3MkDA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] soc: samsung: change SOC_SAMSUNG default config logic
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Sep 21, 2021 at 1:19 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:
>
> > On 20/09/2021 21:03, Will McVicker wrote:
> > > Switch the default logic to enable SOC_SAMSUNG and it's sub-configs t=
o
> > > be enabled by default via "default y if ARCH_EXYNOS" versus being
> > > selected by the ARCH_EXYNOS config directly. This allows vendors to
> > > disable these configs if they wish and provides additional flexibilit=
y
> > > to modularize them in the presence of a generic kernel.
> >
> > This is not true. Vendors cannot disable these options as they are not
> > visible.
>
> Good point, well made.
>
> > Although I understand that Arnd prefers this way and I do not
> > object it, but your explanation is incorrect.

Thanks Krzysztof for the reviews! I'm sorry I missed the whole "hidden
configs" part. I'll upload the series to include the fix that refactos
the Samsung SoC drivers menuconfig which will address that and allow
one to enable/disable those configs. I'm going to hold off though
until we hash out the rest of the discussion in the cover letter
email.

Thanks,
Will

>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Senior Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
