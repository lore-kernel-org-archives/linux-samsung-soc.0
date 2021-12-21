Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3543C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Dec 2021 10:44:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234013AbhLUKoy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Dec 2021 05:44:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233864AbhLUKoy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 05:44:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4737C061574
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 02:44:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1AF9CB81615
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 10:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07FCC36AEF
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640083490;
        bh=x55Zzd7HNq5rdgKqpx2mX/aEedcy3jUIMG8Xt5xn4UI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tKk11elAXfiqOCoLDzKRjd2544Xt48Hxj1+PjX+V0W/67qgk9u9mYLWWTrpzbp/lM
         7UsfUu3IXJS1w3VSevPVXWrxb3rkhoGEqRBLDrwTEh2APEY6QMk+zac/qvtR27WwxC
         FsjI4A6QAcDzwbC8tNqrJA3o10Q5OztVHRe/KkpD2U+qzJYXZFiKx53jYuXG9/ONYN
         A7AbtXPN+zbpdgRqXyWKQhPEytyBR1HwIOjevKJoUbzYIInpRi0gl/HVFoqbdHQ3WC
         a+RafgTrIpxq3fgWcion0F9BYiniv41fZvHSL6tv+HQe8FaQIYzK+x1eBpwOQA4yNR
         d6TocytsYr4dA==
Received: by mail-wm1-f51.google.com with SMTP id i12so8749526wmq.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 02:44:50 -0800 (PST)
X-Gm-Message-State: AOAM532Nb2MoT7PjtZabbybQUqGHyZ0DvmqbhjSKl0WT6sSvlrBzBdkJ
        IvUxScZmQ5eXtqb04lXOBSNtNH9Dib2QuZcrxZA=
X-Google-Smtp-Source: ABdhPJwquZMfSz2YVwZCbW9aKQ7iWnZ4wzH9wWpweoXnqdyv9ytklLgv70k3D71SVZRfcDinKXCZYqlspCGu5JL2LBw=
X-Received: by 2002:a1c:7e14:: with SMTP id z20mr2139353wmc.25.1640083488917;
 Tue, 21 Dec 2021 02:44:48 -0800 (PST)
MIME-Version: 1.0
References: <20211122092816.2865873-1-ardb@kernel.org> <CGME20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739@eucas1p2.samsung.com>
 <20211122092816.2865873-8-ardb@kernel.org> <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
In-Reply-To: <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 21 Dec 2021 11:44:36 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG+P5AU-26t_16FL5xfQNd+ByQH_cfBLiwMSdoGPmvCuw@mail.gmail.com>
Message-ID: <CAMj1kXG+P5AU-26t_16FL5xfQNd+ByQH_cfBLiwMSdoGPmvCuw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] ARM: implement support for vmap'ed stacks
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Keith Packard <keithpac@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 21 Dec 2021 at 11:39, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi,
>
> On 22.11.2021 10:28, Ard Biesheuvel wrote:
> > Wire up the generic support for managing task stack allocations via vmalloc,
> > and implement the entry code that detects whether we faulted because of a
> > stack overrun (or future stack overrun caused by pushing the pt_regs array)
> >
> > While this adds a fair amount of tricky entry asm code, it should be
> > noted that it only adds a TST + branch to the svc_entry path. The code
> > implementing the non-trivial handling of the overflow stack is emitted
> > out-of-line into the .text section.
> >
> > Since on ARM, we rely on do_translation_fault() to keep PMD level page
> > table entries that cover the vmalloc region up to date, we need to
> > ensure that we don't hit such a stale PMD entry when accessing the
> > stack. So we do a dummy read from the new stack while still running from
> > the old one on the context switch path, and bump the vmalloc_seq counter
> > when PMD level entries in the vmalloc range are modified, so that the MM
> > switch fetches the latest version of the entries.
> >
> > Note that we need to increase the per-mode stack by 1 word, to gain some
> > space to stash a GPR until we know it is safe to touch the stack.
> > However, due to the cacheline alignment of the struct, this does not
> > actually increase the memory footprint of the struct stack array at all.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > Tested-by: Keith Packard <keithpac@amazon.com>
>
>
> This patch landed recently in linux-next 20211220 as commit a1c510d0adc6
> ("ARM: implement support for vmap'ed stacks"). Sadly it breaks
> suspend/resume operation on all ARM 32bit Exynos SoCs. Probably the
> suspend/resume related code must be updated somehow (it partially works
> on physical addresses and disabled MMU), but I didn't analyze it yet. If
> you have any hints, let me know.
>

Are there any such systems in KernelCI? We caught a suspend/resume
related issue in development, which is why the hunk below was added.
In general, any virt-to-phys translation involving and address on the
stack will become problematic.

Could you please confirm whether the issue persists with the patch
applied but with CONFIG_VMAP_STACK turned off? Just so we know we are
looking in the right place?

> diff --git a/arch/arm/kernel/sleep.S b/arch/arm/kernel/sleep.S
> index 43077e11dafd..803b51e5cba0 100644
> --- a/arch/arm/kernel/sleep.S
> +++ b/arch/arm/kernel/sleep.S
> @@ -67,6 +67,14 @@ ENTRY(__cpu_suspend)
>       ldr     r4, =cpu_suspend_size
>   #endif
>       mov     r5, sp                  @ current virtual SP
> +#ifdef CONFIG_VMAP_STACK
> +     @ Run the suspend code from the overflow stack so we don't have to rely
> +     @ on vmalloc-to-phys conversions anywhere in the arch suspend code.
> +     @ The original SP value captured in R5 will be restored on the way out.
> +     mov_l   r6, overflow_stack_ptr  @ Base pointer
> +     mrc     p15, 0, r7, c13, c0, 4  @ Get per-CPU offset
> +     ldr     sp, [r6, r7]            @ Address of this CPU's overflow stack
> +#endif
>       add     r4, r4, #12             @ Space for pgd, virt sp, phys resume fn
>       sub     sp, sp, r4              @ allocate CPU state on stack
>       ldr     r3, =sleep_save_sp
