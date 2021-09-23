Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B65C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 21:52:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 202476124D
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 21:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243390AbhIWVyU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Sep 2021 17:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238632AbhIWVyU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 17:54:20 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5BB6C061757
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Sep 2021 14:52:47 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u18so30742034lfd.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Sep 2021 14:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OzZoKQDZ72/TIZ5n5PQCjDKZ/aLZJVe4nOu4P+30/t8=;
        b=n/lKLseJnr+59RI5t6ZUq/unPrDB8OeU5L0NSrqlvqdVaht/rIyOJ+l47gVqFSBNLN
         TULDgRObSeYnLYtnCHi4BE2TUdA0+8905GPrVjaFaiJFwFbqxXAav5UzzyowNC4NJGWE
         gDpmC5/UTxJFVH7XhlIgiPohiOtj40dG6M/HUTAyEW5sc6uGjvrSNmNtSpU2TI0AQKwn
         62JakWCLJWtzNIV86FC86E++eE/jT7+a+IDbpEoj2xweOt00SEoMMGwrllnEuUn0sZS2
         0708OfzLswSVQ1LFA5c4WLbaXdqe5Tzj/NcsZoQ40YIZLWND+KA526I7usV9wfqAdTiL
         LszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OzZoKQDZ72/TIZ5n5PQCjDKZ/aLZJVe4nOu4P+30/t8=;
        b=B3eKjIfLayNzvBZuZ6MEUIRtsjG0CMVUhV0Pp551bFYLImyncZn1AVqZUF8uHHFNer
         xrBxOwsn8HwqJhlKwLVCHPpc1sixiU6IzUZHBEOtBFyUR81qSylxNKXYFF0FuayRTg3D
         r7v8JNeSXbLvZ0ngJvC4YwvmEUC4eZwFMHoUtJxRUAOOGl5KwdO5fQNNjJaZ4+0/Ru0H
         Jakx+Jim5hvbnnBhfblZESSbqZyv5CbE/b322sdzXooB81Q8LvdntvK8Z5CYASt+6jbF
         gml/9tE4p3v2tYXpJ1HcFoTGkShVY/lQtp/NDOYsCbqMiehGipkW4hY9KU6hrYEc+D8s
         SFVw==
X-Gm-Message-State: AOAM533J5+yueoqetkZCUBn8joPkIaWnABz1lulQdRmnpd8H75o5LCfx
        xT+CdLUghl/5RKMcAxi27BTRlHC2KdncFeywT8AgOw==
X-Google-Smtp-Source: ABdhPJzSavCXS6nxDVN2s1rRJDXqRhNXfyZp30z2Uvc8ETPMwVaX3Qu54L1YIt5i//VPUUTLjJFlzg587HqTLUC8Ruc=
X-Received: by 2002:a2e:89c9:: with SMTP id c9mr7533345ljk.288.1632433966185;
 Thu, 23 Sep 2021 14:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210920190350.3860821-1-willmcvicker@google.com> <20210920190350.3860821-4-willmcvicker@google.com>
In-Reply-To: <20210920190350.3860821-4-willmcvicker@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 23:52:35 +0200
Message-ID: <CACRpkdZAo76iiX2H5Vf_MCjPnzpJyB6H7Ut_Fd11pBx2f9Rb7Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] pinctrl: samsung: change PINCTRL_EXYNOS default
 config logic
To:     Will McVicker <willmcvicker@google.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Sep 20, 2021 at 9:04 PM Will McVicker <willmcvicker@google.com> wrote:

> Switching the default config logic of PINCTRL_EXYNOS to use "default
> y if ARCH_EXYNOS" versus having ARCH_EXYNOS directly select the config.
> This gives vendors the flexibility to disable the config or modularize
> it in the presence of a generic kernel.
>
> Verified this change doesn't effect the .config.
>
> Signed-off-by: Will McVicker <willmcvicker@google.com>

Krzysztof is collecting and sending pull requests for the Samsung
pinctrl portions so I expect him to merge this once you reach consensus.

Yours,
Linus Walleij
