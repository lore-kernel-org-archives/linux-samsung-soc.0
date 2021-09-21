Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD69C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 07:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C7A86120A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 07:51:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhIUHwh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Sep 2021 03:52:37 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:38417 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhIUHwh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 03:52:37 -0400
Received: by mail-vs1-f52.google.com with SMTP id y141so7858387vsy.5;
        Tue, 21 Sep 2021 00:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8/N4irXZXXoqT9WU1NeZNtea91/GmlWjvw07gZnEdTY=;
        b=VZsnPjqOc1S6CsBhivezYB6nPC7RbRUfNYPuOeMhub8Lov3xz7ft/TQkbhPQvOGlUQ
         b+tB6H8H64GIEDPV7PKsskMZHfBU2NbVIb001bUwf0gM3aKlImQFLoB/sIDQ8Uc6js8X
         1R6T6U3P7VwjDE6qUryDvf6sh5FiJ74674WM5aWycnFa+KVmtokZuQKlOqMc8DH6A1bI
         JtJQiL/4p0Z6sG4CHF/8akqbFR8PUShqgBs1gd2IEDsRmQCJh9s8P5NEraI/sXqf4HRC
         0Pe4bziE4NJKOsNiMONL5KJdBqneMjHjg9YP2L4xwTSIf0s5svH3ZZEG5WbClGMm/W8j
         5SXg==
X-Gm-Message-State: AOAM533cOxsO17fXr8JulND28XLFNHCTfZoXTvrfZ6g+/E8odW7zWozx
        6jkqlNTRW1BLfyuZvqmqGbcriZiw6A5RUFsdU2s=
X-Google-Smtp-Source: ABdhPJzYZGsZ4dZcqwbCdynpvilMS743u09VJ9Cuu54KRX/0QCI+aNebqqkhz49kmbioxdtwj7MTDXk6FsjhvAqZnFE=
X-Received: by 2002:a67:2c58:: with SMTP id s85mr2438234vss.35.1632210668743;
 Tue, 21 Sep 2021 00:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-2-willmcvicker@google.com> <a8d40b96-bcb2-5eb6-b0e5-c20c14471c8a@kernel.org>
In-Reply-To: <a8d40b96-bcb2-5eb6-b0e5-c20c14471c8a@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Sep 2021 09:50:57 +0200
Message-ID: <CAMuHMdWdHF49qj+qV-DnbDDv14J3y98TPHd_6y_i7o7_azhErg@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] clk: samsung: change COMMON_CLK_SAMSUNG default
 config logic
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Sep 21, 2021 at 9:31 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 20/09/2021 21:03, Will McVicker wrote:
> > COMMON_CLK_SAMSUNG is selected by ARCH_EXYNOS which forces this config
> > to be built-in when ARCH_EXYNOS is enabled. Switch the logic to use a
> > "default y if ARCH_EXYNOS" to provide flexibilty for vendors to disable
> > or modularize this driver.
>
> The clock drivers are essential, you cannot disable them for a generic
> kernel supporting ARCH_EXYNOS. Such kernel won't work properly on platforms.

Obviously it's not gonna work if the clock driver is not enabled
at all.  But does it work if you make the clock driver modular, and
put it with all other essential driver modules in initramfs?  Debugging
would be hard, as the serial console driver also relies on clocks
and PM Domains etc.

If not, this patch should be NAKed, until it works with a modular
clock driver.

If yes, perhaps another line should be added (_before_ the other line)?

  + default m if ARCH_EXYNOS && MODULES
    default y if ARCH_EXYNOS

However, many developers may want MODULES=y, but not want to bother
with an initramfs.  So perhaps we need a new symbol
MINIMUM_GENERIC_KERNEL or so, protected by EXPERT, and make the
driver default to m if that is enabled?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
