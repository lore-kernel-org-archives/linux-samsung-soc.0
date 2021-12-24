Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BE4C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Dec 2021 04:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351222AbhLXEGA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Dec 2021 23:06:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245522AbhLXEF7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Dec 2021 23:05:59 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44ACCC061757
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Dec 2021 20:05:59 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id s73so11919407oie.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Dec 2021 20:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AK/GoBD4NSOHwSVqZthu2O08Jw7u+mwsxqJi3Ry3nKc=;
        b=gq2yQoCaJnKxdj0aHEXvs8IGPBaDHeTzTaYt/ryWsKz+mIDvAu9iIBhc2ZkzWM1dOD
         tEu2K97Is8ypqo+4uHCIyWDHFikuEd0awybqFuyTHjZE7wnwRhO2UE9ryQXiKxIKfuna
         cqjppHyaaZXsq3bFvQROZpaikTDEru/hXH3SUQgRMUbQ1JXiw5+qJGPvOxtocEarf1Ty
         Ie66oOBvLSZ9QlTXAcC1gqlUQ+xQGNm/iYsoWS5WzMaqaHJ0BptL1180107BLwHzx7Ad
         uZBNx6khDhyGorIvjqLJTFeFxkGm4BVRqnw2F6ut+jL0OP4JXOozlmYqtzsB5HLe6GRL
         RNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AK/GoBD4NSOHwSVqZthu2O08Jw7u+mwsxqJi3Ry3nKc=;
        b=nkwF+Of8xZOfz2Mx//8u1c3qHWWm1wDMbIS83wXsfLdPKNATKiCIFH+pZHAL6nTw+9
         ezKElKspXB5sSC/zTK1Hszlb7l3vSN83NEdpsNNV+6VFpnYveAZLUNtX+A4BAuEORQ+V
         Cgef8Qw/dW0DAin5hSByDC1VsdVLVjY3oTd5vZrhrEqClUsCWH5w+Dw3Y1JKmEWAPjPq
         k3K4qSG9smnQEImuo9drLO/aleL1wf7EP/vtG9V/on/uEuTSbTLTJ6ftM6knrIhttxVk
         TWjaaE60wSfOeGwGffHKLzA4Nb5xl+fVNVC4NchIBhphk+Kl3HYPt37MWOstoXZitCHK
         SzVQ==
X-Gm-Message-State: AOAM531g2ux/4Ddq++N48Kx1m8UvdKZYgsPlaCIcgFyebjoDo/sItfoV
        a8BeN+JanaQOmqZU2awcy6Zi4nIfwgPv3p/QGdrESw==
X-Google-Smtp-Source: ABdhPJxQOSzC8McVfBe3KmWsuME/BKDeKWRpaj/52MKdPsPCfZWTUeKA3YUfD7+a3GmNhmxsLircXMO8+Vb1K/pQrgM=
X-Received: by 2002:a54:4613:: with SMTP id p19mr3662521oip.162.1640318758486;
 Thu, 23 Dec 2021 20:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20211218085843.212497-1-cuigaosheng1@huawei.com>
 <CAK8P3a1-0u4VCCfgc7tjmnANM0yr7oUrQX2y-ZSVvZHDN191BQ@mail.gmail.com>
 <dfc25b22-2f66-4404-66c4-44c9c8c3bab4@huawei.com> <CAK8P3a0aNoU693ft3pHCPJOcGubZ1dMFyOmWozO0N_8-F_JkLQ@mail.gmail.com>
 <CACRpkdaNv7850mOyXRMgmPf8TQxiM-C5VEkGnLfd+wvffW8FAg@mail.gmail.com> <CAMj1kXHgptq47g3mSPTKW9KMnqTH4K2Q7riBVwX4iA1V9YWYiA@mail.gmail.com>
In-Reply-To: <CAMj1kXHgptq47g3mSPTKW9KMnqTH4K2Q7riBVwX4iA1V9YWYiA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 Dec 2021 05:05:46 +0100
Message-ID: <CACRpkdafoc_erHyfkby9X1LhkYgkBQsad=qNyXh+Tq_32zr_yg@mail.gmail.com>
Subject: Re: [PATCH -next 0/3] replace open coded VA->PA calculation
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        cuigaosheng <cuigaosheng1@huawei.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        SoC Team <soc@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        gongruiqi1@huawei.com, wangweiyang2@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Dec 22, 2021 at 10:30 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Wed, 22 Dec 2021 at 03:31, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Dec 21, 2021 at 10:16 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > > I think for CPUs that can use LPAE, we want to eventually move to the 4G:4G
> > > memory model, which in turn depends on having the kernel in vmalloc space, as
> > > implemented by Linus Walleij in
> > > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/log/?h=kernel-in-vmalloc-v5.14-rc1
> >
> > Yeah I'm still working on this series. The 4/4 split works pretty well,

Actually it's just kernel-in-vmalloc, 4/4 comes after that.

> > but it breaks KASan and I was in the process of fixing that when I left
> > for parental leave.
> >
> > The reason it breaks would be related to KASan not expecting
> > executable code in the vmalloc area, and since the shadowing
> > algorithm is a simple pointer offset, and since we go to lengths
> > to chisel shadow memory out of lowmem at a fixed offset from
> > TEXT_OFFSET, we have a problem.
> >
>
> Vmap'ed stacks actually has a similar problem, which is why it is
> disabled when KAsan is enabled. But this can be fixed by enabling arch
> support for KASAN_VMALLOC, and I suspect it may address the vmap'ed
> kernel as well.

Yep after seeing the other convo on the topic I realized that this
is indeed the same as I'm seeing. I can't disable KASAN just
because the kernel is in VMALLOC though, so I suppose when
I finally get back to this I have to fix KASAN_VMALLOC too
if noone beats me to it.

(It'd be great if someone could beat me to it...)

Yours,
Linus Walleij
