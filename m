Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEF9C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Dec 2021 16:20:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239668AbhLUQUU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Dec 2021 11:20:20 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:52088 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236213AbhLUQUT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 11:20:19 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 981266167A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 16:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F118BC36AF0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640103619;
        bh=usw0hQYTeheHZ8dExDfMKf4IRSf4uY3lhBFyF5ZhSBA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fkJA/S8w28g4ISqDHtJEUQuhCMG+Qg4Cc8Y4VApQXQVERTOVnKvPAAT1FfOxHlN8O
         Vac0n45klqFGgb0vG4o/Gz5C+p+ZJTQ0YmEjsU5O2vf2Y9WcQYHVYP60YiOvGt/ZpP
         afhnKLklltkiV0r05svVlp2NKRyP3J8S06wbtk9jiOdFZvNR9HcwlqcIPOG7D0kuqP
         OBXGrsmsGOxXupj4TSevz87MpCHrZXvORtu3FzXno6kTP8Bv6IJGQo4cKJ5uKvu8uS
         ag3RJqR98eo8LfaDQo0FEx6YXxT0yDhCk4mXWeeyFgmQxf2IMywCN7vwG405QMgLNB
         UwFcCLFfcbm4g==
Received: by mail-wr1-f54.google.com with SMTP id s1so22603415wra.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 08:20:18 -0800 (PST)
X-Gm-Message-State: AOAM533cDs7DGRZb69senOJpnVrgn0k9WrlfVY1OD+ZgW4mfiMcw5/RO
        D5aMgd8Ci8FyDI0u9CXMm3DN3h38O6kK2pRc1MU=
X-Google-Smtp-Source: ABdhPJwMunvK4wCgDEblWmVbWZ/liIAsWgH88NA9m86D3PVveWuXNyuIuGR9Lzt/EjvLJ+S6DQr4nQLNDzAUlta5b7c=
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr3256450wrc.417.1640103617104;
 Tue, 21 Dec 2021 08:20:17 -0800 (PST)
MIME-Version: 1.0
References: <20211122092816.2865873-1-ardb@kernel.org> <CGME20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739@eucas1p2.samsung.com>
 <20211122092816.2865873-8-ardb@kernel.org> <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
 <CAMj1kXG+P5AU-26t_16FL5xfQNd+ByQH_cfBLiwMSdoGPmvCuw@mail.gmail.com>
 <e07a229a-e565-0077-9f8a-a24ffa45f395@samsung.com> <CAMj1kXG3neg0riLAaU32KLvB2PLBNzwqgO0F21nbK1ivS=FwMg@mail.gmail.com>
 <b22077f6-0925-ee00-41ea-3e52241926e2@samsung.com>
In-Reply-To: <b22077f6-0925-ee00-41ea-3e52241926e2@samsung.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 21 Dec 2021 17:20:05 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHQrqZSE1kHaQyQyK6R58EV3cUyvJFmM1JYifaMemyUhQ@mail.gmail.com>
Message-ID: <CAMj1kXHQrqZSE1kHaQyQyK6R58EV3cUyvJFmM1JYifaMemyUhQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] ARM: implement support for vmap'ed stacks
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
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

On Tue, 21 Dec 2021 at 14:51, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi,
>
> On 21.12.2021 14:34, Ard Biesheuvel wrote:
> > On Tue, 21 Dec 2021 at 12:15, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >> Hi Ard,
> >>
> >> On 21.12.2021 11:44, Ard Biesheuvel wrote:
> >>> On Tue, 21 Dec 2021 at 11:39, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >>>> On 22.11.2021 10:28, Ard Biesheuvel wrote:
> >>>>> Wire up the generic support for managing task stack allocations via vmalloc,
> >>>>> and implement the entry code that detects whether we faulted because of a
> >>>>> stack overrun (or future stack overrun caused by pushing the pt_regs array)
> >>>>>
> >>>>> While this adds a fair amount of tricky entry asm code, it should be
> >>>>> noted that it only adds a TST + branch to the svc_entry path. The code
> >>>>> implementing the non-trivial handling of the overflow stack is emitted
> >>>>> out-of-line into the .text section.
> >>>>>
> >>>>> Since on ARM, we rely on do_translation_fault() to keep PMD level page
> >>>>> table entries that cover the vmalloc region up to date, we need to
> >>>>> ensure that we don't hit such a stale PMD entry when accessing the
> >>>>> stack. So we do a dummy read from the new stack while still running from
> >>>>> the old one on the context switch path, and bump the vmalloc_seq counter
> >>>>> when PMD level entries in the vmalloc range are modified, so that the MM
> >>>>> switch fetches the latest version of the entries.
> >>>>>
> >>>>> Note that we need to increase the per-mode stack by 1 word, to gain some
> >>>>> space to stash a GPR until we know it is safe to touch the stack.
> >>>>> However, due to the cacheline alignment of the struct, this does not
> >>>>> actually increase the memory footprint of the struct stack array at all.
> >>>>>
> >>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >>>>> Tested-by: Keith Packard <keithpac@amazon.com>
> >>>> This patch landed recently in linux-next 20211220 as commit a1c510d0adc6
> >>>> ("ARM: implement support for vmap'ed stacks"). Sadly it breaks
> >>>> suspend/resume operation on all ARM 32bit Exynos SoCs. Probably the
> >>>> suspend/resume related code must be updated somehow (it partially works
> >>>> on physical addresses and disabled MMU), but I didn't analyze it yet. If
> >>>> you have any hints, let me know.
> >>>>
> >>> Are there any such systems in KernelCI? We caught a suspend/resume
> >>> related issue in development, which is why the hunk below was added.
> >>
> >> I think that some Exynos-based Odroids (U3 and XU3) were some time ago
> >> available in KernelCI, but I don't know if they are still there.
> >>
> >>
> >>> In general, any virt-to-phys translation involving and address on the
> >>> stack will become problematic.
> >>>
> >>> Could you please confirm whether the issue persists with the patch
> >>> applied but with CONFIG_VMAP_STACK turned off? Just so we know we are
> >>> looking in the right place?
> >>
> >> I've just checked. After disabling CONFIG_VMAP_STACK suspend/resume
> >> works fine both on commit a1c510d0adc6 and linux-next 20211220.
> >>
> > Thanks. Any other context you can provide beyond 'does not work' ?
>
> Well, the board properly suspends, but it doesn't wake then (tested
> remotely with rtcwake command). So far I cannot provide anything more.
>

Thanks. Does the below help? Or otherwise, could you try doubling the
size of the overflow stack at arch/arm/include/asm/thread_info.h:34?


diff --git a/arch/arm/kernel/sleep.S b/arch/arm/kernel/sleep.S
index b062b3738bc6..a59bd03a3f2e 100644
--- a/arch/arm/kernel/sleep.S
+++ b/arch/arm/kernel/sleep.S
@@ -67,7 +67,7 @@ ENTRY(__cpu_suspend)
        ldr     r4, =cpu_suspend_size
 #endif
        mov     r5, sp                  @ current virtual SP
-#ifdef CONFIG_VMAP_STACK
+#if 0 //def CONFIG_VMAP_STACK
        @ Run the suspend code from the overflow stack so we don't have to rely
        @ on vmalloc-to-phys conversions anywhere in the arch suspend code.
        @ The original SP value captured in R5 will be restored on the way out.
diff --git a/arch/arm/kernel/suspend.c b/arch/arm/kernel/suspend.c
index 43f0a3ebf390..ab1218ac5b4a 100644
--- a/arch/arm/kernel/suspend.c
+++ b/arch/arm/kernel/suspend.c
@@ -76,7 +76,9 @@ void __cpu_suspend_save(u32 *ptr, u32 ptrsz, u32 sp,
u32 *save_ptr)
 {
        u32 *ctx = ptr;

-       *save_ptr = virt_to_phys(ptr);
+       *save_ptr = IS_ENABLED(CONFIG_VMAP_STACK)
+                   ? __pfn_to_phys(vmalloc_to_pfn(ptr)) + offset_in_page(ptr)
+                   : virt_to_phys(ptr);

        /* This must correspond to the LDM in cpu_resume() assembly */
        *ptr++ = virt_to_phys(idmap_pgd);
