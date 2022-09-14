Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0973ECAAD3
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Sep 2022 12:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbiINM3i (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Sep 2022 08:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbiINM3f (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Sep 2022 08:29:35 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA1025C9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2022 05:29:34 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id q21so21996782edc.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2022 05:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jnespCOi4e5ijlHSzwftjeKRd5VFy0oZTyj9OtokYu0=;
        b=X65zrtpZYLz0qwP7r/w7k46Z/L+4PRmMlM86s+IJawVos+vRyzZy/HhnPpOqTcEanS
         kThtxLFsMy26r1O2ipy9cCDOmyJJpeyfQBJI1Q4sDUGBQ1E+1hxvNfWhv1cGQnd8VZDS
         yO6MBHNNs0KDD/mmuF8BStsYzCGW/Gvx5fJUkWql4K/Xo6NJzUJAR/uLLpyUSm8+D7nC
         hXRnmqONRW+kGiGYALDS8Xtj1foeHBXw7xF1VTtFjfzMupYDHhwkqwZrYjHcue3Up7f7
         yqxQoBpurRVeYSNHy+4jhj62vYN4cl5YZeLRcSifS2raNA0sdPumRq1u1o+mO1cgOAVW
         ceaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jnespCOi4e5ijlHSzwftjeKRd5VFy0oZTyj9OtokYu0=;
        b=hN+e4VGjJ3N7goAa6YoKDxF2mK7Ddvia4UrpLo8/+svK0f6krt3UYwq+hk+XMkGvUf
         6ZbUCWQsZ7Cr+e/ngx3KNMUMXCmNIFA7cMAocf/Uan8D8FvwLK2YtRFufxsxIGUkR1QF
         TKgS87w7sZzCkSC6p64YyTftS5NGOxn+kvrNCw6/iE5He81rOXTOz7AuVaP8FShtuS2U
         MvbrbPr/0hqbreywFichd9GpfjbHXMKg5aLB+HC1hX3fmzib30N6YZUkIw4lSdebLaou
         TFPMCS0HlPc/lc0gOdrEoP7XX/cV51RAyJn63gakm04RG8EUQfPYouOjKJ2X6yH3AKqn
         Ya7g==
X-Gm-Message-State: ACgBeo3r0LcPobhlCHbXP04TNhCF7msn1rzHvQYoz+tv17r6taHtyqru
        SzjHzP9E6ZcRgSuL+nZ2Ki186lLCjoaUDy3pxs4BlC+hzzw=
X-Google-Smtp-Source: AA6agR4+OibO8oFqsH94aYVpYZC3BLluNjZox/hh9hbWSFFI35QRbaPyjMKRRVrrbe4qdJsihkrSnqPSAYSL+OgeRSU=
X-Received: by 2002:a05:6402:2690:b0:452:3a85:8b28 with SMTP id
 w16-20020a056402269000b004523a858b28mr8306834edd.158.1663158572974; Wed, 14
 Sep 2022 05:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220909151605.821685-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909151605.821685-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Sep 2022 14:29:21 +0200
Message-ID: <CACRpkdb83rHkkUGSUs0=FAkSs8DNWeQYqvSQCf=MttYHhxJVGg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: for v6.1
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 9, 2022 at 5:16 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
>
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.1
>
> for you to fetch changes up to 9d9292576810d0b36897718c24dfbc1a2835314b:
>
>   dt-bindings: pinctrl: samsung: deprecate header with register constants (2022-08-19 16:54:10 +0300)

Pulled into my "devel" branch, thanks!

Yours,
Linus Walleij
