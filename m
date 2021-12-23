Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D9BC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Dec 2021 14:23:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348809AbhLWOXk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Dec 2021 09:23:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhLWOXk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Dec 2021 09:23:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004B1C061401
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Dec 2021 06:23:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B1BF6B820E2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Dec 2021 14:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803AAC36AEF
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Dec 2021 14:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640269417;
        bh=uTekfRd5diWJajpjCBfBDbxMzcJ6leyCJ2PcSwWJFWI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rmWvQ3pl1xrpErSlCBnAbG+lKaeZinBOS3d1yp5MznIWy9F5qY9fWLDIwmNapehfu
         opkDp8zIna3OvL8IdMDd0Ok+uK1EDXt+gvE/SVavj3K48Bh6HQ6qJlLawWxrg2lqu0
         wNvzOPr9pxFigxTCHREIlfz6Vd4T8d72sfJ+jwnfjnaQl3h+GC3uHu8nL648xqhdUC
         to8/f3AnlcgnZJYRWEz7cdEhNhz1TYos7DRlLGLO0I17Iy6Oclwy1f8wDED039UlxP
         w49KXhS+ghAlQSgo5oIof3OSXFWk6oVquun6aBr2qXsp/AhSNUGCZYASLHBC8QIgLu
         LXK9qk1pU+vbA==
Received: by mail-wr1-f51.google.com with SMTP id t18so11738546wrg.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Dec 2021 06:23:37 -0800 (PST)
X-Gm-Message-State: AOAM532gN5FO61TdL+vTmYouNHfXegRaHuSXhhnSJIoRxSgJtDeLQdQJ
        Pe8+h0aCeXe3u29jFpPKZB3BzU38saXzYpLRjO4=
X-Google-Smtp-Source: ABdhPJzQNM3+ca/mAcI6OOysBAfkomK4GD6Y4i9yqQf6XuC9Pb0/bzYn94HaEREP6UVKItBVeh02KnkCspLY+Z0Gbvg=
X-Received: by 2002:a5d:6b8f:: with SMTP id n15mr1877841wrx.189.1640269415763;
 Thu, 23 Dec 2021 06:23:35 -0800 (PST)
MIME-Version: 1.0
References: <20211122092816.2865873-1-ardb@kernel.org> <CGME20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739@eucas1p2.samsung.com>
 <20211122092816.2865873-8-ardb@kernel.org> <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
 <CAMj1kXG+P5AU-26t_16FL5xfQNd+ByQH_cfBLiwMSdoGPmvCuw@mail.gmail.com>
 <e07a229a-e565-0077-9f8a-a24ffa45f395@samsung.com> <CAMj1kXG3neg0riLAaU32KLvB2PLBNzwqgO0F21nbK1ivS=FwMg@mail.gmail.com>
 <b22077f6-0925-ee00-41ea-3e52241926e2@samsung.com> <CAMj1kXHQrqZSE1kHaQyQyK6R58EV3cUyvJFmM1JYifaMemyUhQ@mail.gmail.com>
 <f469726d-86fb-cf54-2775-d4658d2f3a5d@samsung.com>
In-Reply-To: <f469726d-86fb-cf54-2775-d4658d2f3a5d@samsung.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 23 Dec 2021 15:23:24 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGyL7yTV4+pOs9iBWYuVvVmPTZrV5r=nzqttqpZ6-vYJA@mail.gmail.com>
Message-ID: <CAMj1kXGyL7yTV4+pOs9iBWYuVvVmPTZrV5r=nzqttqpZ6-vYJA@mail.gmail.com>
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

On Tue, 21 Dec 2021 at 22:56, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi,
>
> On 21.12.2021 17:20, Ard Biesheuvel wrote:
> > On Tue, 21 Dec 2021 at 14:51, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >> On 21.12.2021 14:34, Ard Biesheuvel wrote:
> >>> On Tue, 21 Dec 2021 at 12:15, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >>>> On 21.12.2021 11:44, Ard Biesheuvel wrote:
> >>>>> On Tue, 21 Dec 2021 at 11:39, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >>>>>> On 22.11.2021 10:28, Ard Biesheuvel wrote:
> >>>>>>> Wire up the generic support for managing task stack allocations via vmalloc,
> >>>>>>> and implement the entry code that detects whether we faulted because of a
> >>>>>>> stack overrun (or future stack overrun caused by pushing the pt_regs array)
> >>>>>>>
> >>>>>>> While this adds a fair amount of tricky entry asm code, it should be
> >>>>>>> noted that it only adds a TST + branch to the svc_entry path. The code
> >>>>>>> implementing the non-trivial handling of the overflow stack is emitted
> >>>>>>> out-of-line into the .text section.
> >>>>>>>
> >>>>>>> Since on ARM, we rely on do_translation_fault() to keep PMD level page
> >>>>>>> table entries that cover the vmalloc region up to date, we need to
> >>>>>>> ensure that we don't hit such a stale PMD entry when accessing the
> >>>>>>> stack. So we do a dummy read from the new stack while still running from
> >>>>>>> the old one on the context switch path, and bump the vmalloc_seq counter
> >>>>>>> when PMD level entries in the vmalloc range are modified, so that the MM
> >>>>>>> switch fetches the latest version of the entries.
> >>>>>>>
> >>>>>>> Note that we need to increase the per-mode stack by 1 word, to gain some
> >>>>>>> space to stash a GPR until we know it is safe to touch the stack.
> >>>>>>> However, due to the cacheline alignment of the struct, this does not
> >>>>>>> actually increase the memory footprint of the struct stack array at all.
> >>>>>>>
> >>>>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >>>>>>> Tested-by: Keith Packard <keithpac@amazon.com>
> >>>>>> This patch landed recently in linux-next 20211220 as commit a1c510d0adc6
> >>>>>> ("ARM: implement support for vmap'ed stacks"). Sadly it breaks
> >>>>>> suspend/resume operation on all ARM 32bit Exynos SoCs. Probably the
> >>>>>> suspend/resume related code must be updated somehow (it partially works
> >>>>>> on physical addresses and disabled MMU), but I didn't analyze it yet. If
> >>>>>> you have any hints, let me know.
> >>>>>>
> >>>>> Are there any such systems in KernelCI? We caught a suspend/resume
> >>>>> related issue in development, which is why the hunk below was added.
> >>>> I think that some Exynos-based Odroids (U3 and XU3) were some time ago
> >>>> available in KernelCI, but I don't know if they are still there.
> >>>>
> >>>>
> >>>>> In general, any virt-to-phys translation involving and address on the
> >>>>> stack will become problematic.
> >>>>>
> >>>>> Could you please confirm whether the issue persists with the patch
> >>>>> applied but with CONFIG_VMAP_STACK turned off? Just so we know we are
> >>>>> looking in the right place?
> >>>> I've just checked. After disabling CONFIG_VMAP_STACK suspend/resume
> >>>> works fine both on commit a1c510d0adc6 and linux-next 20211220.
> >>>>
> >>> Thanks. Any other context you can provide beyond 'does not work' ?
> >> Well, the board properly suspends, but it doesn't wake then (tested
> >> remotely with rtcwake command). So far I cannot provide anything more.
> >>
> > Thanks. Does the below help? Or otherwise, could you try doubling the
> > size of the overflow stack at arch/arm/include/asm/thread_info.h:34?
>
> I've tried both (but not at the same time) on the current linux-next and
> none helped. This must be something else... :/
>

Thanks.

As i don't have access to this hardware, I am going to have to rely on
someone who does to debug this further. The only alternative is
marking CONFIG_VMAP_STACK broken on MACH_EXYNOS but that would be
unfortunate.
