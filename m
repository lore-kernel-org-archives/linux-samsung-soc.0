Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65EBC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Dec 2021 02:31:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbhLVCbY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Dec 2021 21:31:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhLVCbX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 21:31:23 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFABCC06173F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 18:31:22 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id bj13so1732906oib.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 18:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WVVTT3vmCo0q+zp9wFYRPgJeYzCdgYYZVxCTfsBXpCo=;
        b=mKsAMnpFxty/J3lsRPATdg9Gs0N+0Z+X2GBXtJSBuv5AtGMYxzkOAILiIvTERYbCez
         pR66vqnBgCquTFG1zBdeZTNQrJjVAlqtkBYUOlLsXnmuyBJCfirNpdTy92WUoJBD5pwZ
         OAUp1QhNYTo2E81BaaQoSagyvrf50+EhZawqS9QylSDjPy+3tMpH2nOKqN8MXOBHAlHe
         2s2RzTamSMr/f51jBQh1gq6V7D/3JOGYJD4b7Gh4zgqqO11mO+a22GJEDNG+NyZZLhBO
         9anAtrucLwlGE5/9E4rUVk5l0lgrIfMJN+hqeBRIJnYCogm4uY5D2faHxEWOaEv5M9kp
         AiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WVVTT3vmCo0q+zp9wFYRPgJeYzCdgYYZVxCTfsBXpCo=;
        b=YkXVuqNGNJY3k4EC1gxNTc5mUfvibV2uRPORjqt9m8TzgZ2LgaQAf0O76vcMs/6LLI
         1SaFRWcOdWFTnElQlyQDKAHYOVRS8gKX168pya4y/wBfyWoOKWwX2i8qNtOhXm+QKtkB
         Rf0ghwOrUtK27Y9wQJM69HAlZwh+BZrdmEtD7Zgi1EgRWxzuMtldFK0cvXC8XgHPu18C
         c3hEZlPF1OnEs34Q5CF7VR1pvwMC0eJfYAwBC7ZsradOPt+0LfNGAtX3bNr3Nvpfdr/A
         4SQpXmU1ckFawDzA3Vovqs+eJ4sQepbiSV9SiEi9Mt5ndoTPJ01dVM30FNCGDGCbro+u
         Hx6g==
X-Gm-Message-State: AOAM5337hjcvrmlKNEpaIuaXzqcyHFyv85NIR7tZcwXfHhfLiKsFuaq6
        6zQzcAXMyP9If6DsmbgQPA10MKJukRWPlVKzTd8S6w==
X-Google-Smtp-Source: ABdhPJyQw6pAlcKRGCxrInfNKU8CpUScnbM1HMPt/NrRC5sZMLlmMoxRq9pY61m6usNkXlYoPEcqNzn8/ggSyYEYD0U=
X-Received: by 2002:aca:5a87:: with SMTP id o129mr754536oib.114.1640140281901;
 Tue, 21 Dec 2021 18:31:21 -0800 (PST)
MIME-Version: 1.0
References: <20211218085843.212497-1-cuigaosheng1@huawei.com>
 <CAK8P3a1-0u4VCCfgc7tjmnANM0yr7oUrQX2y-ZSVvZHDN191BQ@mail.gmail.com>
 <dfc25b22-2f66-4404-66c4-44c9c8c3bab4@huawei.com> <CAK8P3a0aNoU693ft3pHCPJOcGubZ1dMFyOmWozO0N_8-F_JkLQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0aNoU693ft3pHCPJOcGubZ1dMFyOmWozO0N_8-F_JkLQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 Dec 2021 03:31:10 +0100
Message-ID: <CACRpkdaNv7850mOyXRMgmPf8TQxiM-C5VEkGnLfd+wvffW8FAg@mail.gmail.com>
Subject: Re: [PATCH -next 0/3] replace open coded VA->PA calculation
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     cuigaosheng <cuigaosheng1@huawei.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        SoC Team <soc@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        gongruiqi1@huawei.com, wangweiyang2@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Dec 21, 2021 at 10:16 AM Arnd Bergmann <arnd@arndb.de> wrote:

> I think for CPUs that can use LPAE, we want to eventually move to the 4G:4G
> memory model, which in turn depends on having the kernel in vmalloc space, as
> implemented by Linus Walleij in
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/log/?h=kernel-in-vmalloc-v5.14-rc1

Yeah I'm still working on this series. The 4/4 split works pretty well,
but it breaks KASan and I was in the process of fixing that when I left
for parental leave.

The reason it breaks would be related to KASan not expecting
executable code in the vmalloc area, and since the shadowing
algorithm is a simple pointer offset, and since we go to lengths
to chisel shadow memory out of lowmem at a fixed offset from
TEXT_OFFSET, we have a problem.

The patch "KASAN horror" shows what I am trying to do to fix it,
it's "just" some hard work missing.

Yours,
Linus Walleij
