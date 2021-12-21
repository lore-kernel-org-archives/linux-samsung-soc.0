Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898B6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Dec 2021 13:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbhLUNfE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Dec 2021 08:35:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235298AbhLUNfD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 08:35:03 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94011C061574
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 05:35:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2BDB4615B1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 13:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F66C36AE2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 13:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640093701;
        bh=SB5zGXuVjZ54ZHTK9LNxlJ4nxNjZxgutVLXAW3t8YDU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ODOVmvi4N70mGOeFFl2Dl59RtRolLJc5zrutLUm2Qh5nPFOmt4y79NRpWYUgh7koj
         uq3ZpyB0OY6Ek4tevb7LAuLR0Riys4uXHXRC/s5XSyP64TjQM3HalIKZyqKvA/zr+z
         cs+BETc7NvEUc1w8ix83IdHdG6N13+g0Qi/9HOHswpM2IyK5O01XJbpGYjvl664UvF
         7eyHsQwFal46jJQ+NWKGznqja8R7XXGLtlBgbvcdAMWE5fhK8rMPippYE7Qq2/vDBI
         sVrTIzBBUMTU2qkfrnDOlsKP3Ny+u0Kv2J8PoSBXP0XtgNQGa0F83iH9uT1Q9WX654
         +2bXF3icNA3Jg==
Received: by mail-wr1-f45.google.com with SMTP id e5so26967141wrc.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 05:35:01 -0800 (PST)
X-Gm-Message-State: AOAM5332XDT5AjqYew7gMH8MVZvV8/kuIyGSmU5o2RfGE3VxUcJ6JdFZ
        FLIC6KuCBIbMo6CJL8DiFVrX/6XE8eJJz721vO0=
X-Google-Smtp-Source: ABdhPJwog6USymuJRT8kUtnzlfiJfh+Z3bpc7ogxmZankrw3B7hNj2HfV+Eg9W89t/4mUtTIOWSjFwhZliC5p4/VYeE=
X-Received: by 2002:adf:c450:: with SMTP id a16mr2575034wrg.454.1640093699847;
 Tue, 21 Dec 2021 05:34:59 -0800 (PST)
MIME-Version: 1.0
References: <20211122092816.2865873-1-ardb@kernel.org> <CGME20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739@eucas1p2.samsung.com>
 <20211122092816.2865873-8-ardb@kernel.org> <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
 <CAMj1kXG+P5AU-26t_16FL5xfQNd+ByQH_cfBLiwMSdoGPmvCuw@mail.gmail.com> <e07a229a-e565-0077-9f8a-a24ffa45f395@samsung.com>
In-Reply-To: <e07a229a-e565-0077-9f8a-a24ffa45f395@samsung.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 21 Dec 2021 14:34:47 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG3neg0riLAaU32KLvB2PLBNzwqgO0F21nbK1ivS=FwMg@mail.gmail.com>
Message-ID: <CAMj1kXG3neg0riLAaU32KLvB2PLBNzwqgO0F21nbK1ivS=FwMg@mail.gmail.com>
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

On Tue, 21 Dec 2021 at 12:15, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi Ard,
>
> On 21.12.2021 11:44, Ard Biesheuvel wrote:
> > On Tue, 21 Dec 2021 at 11:39, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >> On 22.11.2021 10:28, Ard Biesheuvel wrote:
> >>> Wire up the generic support for managing task stack allocations via vmalloc,
> >>> and implement the entry code that detects whether we faulted because of a
> >>> stack overrun (or future stack overrun caused by pushing the pt_regs array)
> >>>
> >>> While this adds a fair amount of tricky entry asm code, it should be
> >>> noted that it only adds a TST + branch to the svc_entry path. The code
> >>> implementing the non-trivial handling of the overflow stack is emitted
> >>> out-of-line into the .text section.
> >>>
> >>> Since on ARM, we rely on do_translation_fault() to keep PMD level page
> >>> table entries that cover the vmalloc region up to date, we need to
> >>> ensure that we don't hit such a stale PMD entry when accessing the
> >>> stack. So we do a dummy read from the new stack while still running from
> >>> the old one on the context switch path, and bump the vmalloc_seq counter
> >>> when PMD level entries in the vmalloc range are modified, so that the MM
> >>> switch fetches the latest version of the entries.
> >>>
> >>> Note that we need to increase the per-mode stack by 1 word, to gain some
> >>> space to stash a GPR until we know it is safe to touch the stack.
> >>> However, due to the cacheline alignment of the struct, this does not
> >>> actually increase the memory footprint of the struct stack array at all.
> >>>
> >>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >>> Tested-by: Keith Packard <keithpac@amazon.com>
> >> This patch landed recently in linux-next 20211220 as commit a1c510d0adc6
> >> ("ARM: implement support for vmap'ed stacks"). Sadly it breaks
> >> suspend/resume operation on all ARM 32bit Exynos SoCs. Probably the
> >> suspend/resume related code must be updated somehow (it partially works
> >> on physical addresses and disabled MMU), but I didn't analyze it yet. If
> >> you have any hints, let me know.
> >>
> > Are there any such systems in KernelCI? We caught a suspend/resume
> > related issue in development, which is why the hunk below was added.
>
>
> I think that some Exynos-based Odroids (U3 and XU3) were some time ago
> available in KernelCI, but I don't know if they are still there.
>
>
> > In general, any virt-to-phys translation involving and address on the
> > stack will become problematic.
> >
> > Could you please confirm whether the issue persists with the patch
> > applied but with CONFIG_VMAP_STACK turned off? Just so we know we are
> > looking in the right place?
>
>
> I've just checked. After disabling CONFIG_VMAP_STACK suspend/resume
> works fine both on commit a1c510d0adc6 and linux-next 20211220.
>

Thanks. Any other context you can provide beyond 'does not work' ?
