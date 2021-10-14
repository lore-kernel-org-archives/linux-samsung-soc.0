Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4478DC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 19:46:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 275C161108
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 19:46:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbhJNTsu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Oct 2021 15:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbhJNTsu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 15:48:50 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB56C061570
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 12:46:44 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id z20so28835828edc.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 12:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LIsEKXGFSNqQILX0QaJSH8NtoAJ3+z1bPLQqixvplHo=;
        b=hNxW5hC2idI1Jg8+e26evIeA5PeqpxeKwsKwB+H30h8vvhunj1NqfCIkEBTEPWiIW6
         t24A1obCettCyty86kX4WHyoEnfLRxjsSfL2F/OKRbHMF511op01Xx1H62emuzBVoBn9
         9wCjlWfo0NQPwekkaNaUqxT/dzQt9N00eV/U3OIUTbnWXUuDKZoMBxoauySOY1qOD/V5
         CKgrqfEh10PJdZm6Yc9vcPAN61vfPJb6vk1OBq4g2snHqF6ys3BGN8Owy2PaZxTHacN2
         H0Uzs8OD6vn1CoCPtyBuQFYohU+eLMjqW3SIgrqS6khDvWmHV2UzXC/1nNQKRV3e4qOH
         CVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LIsEKXGFSNqQILX0QaJSH8NtoAJ3+z1bPLQqixvplHo=;
        b=Xiy6al1JFMIt1oAJURVIUPwea3eUZnOYyUb/8jBhiZ9SM7wQs2M7P8YSBFD2xGfPeG
         cuK+cgvdHpR+jPmsQsmqFk2abA1k7kpTGiPIClb/fw1gzPd7fyZcxQLV8O60lmVZrKIU
         3dJVdJzOzFknOUtYEGZpsqppbpAh5vEh36/00WwcvOz8lUg4ZqPJASDSLd1x7ME0iTPI
         mubco4W1NfCqLpt+CYzZb/J4Jtnert7OgNTQbcxfTLo8LHjL7c8cBe8A3DMG+G2lE3Ph
         0/dXTha27kcu2tzEEJeEPwgXS7vRW0B/lcz/CPpkONCIoWYbQhppQyh+q8KpFOFTi3wv
         /QLA==
X-Gm-Message-State: AOAM531XcMJkhjo8lsTKPPBQbflEZkMOYXPlST+ZAIxURWGWQ/n4wr6M
        JqBg5yiG/+yNbWHBl8CzBMdeYQ1FCO2cNbuoqZgIpg==
X-Google-Smtp-Source: ABdhPJwt4SGLP1Ol1ETFJg5qPFl0XVP2v4pyiP5CQ1uByeWMBYVAMQNWbYhCWtLDwTvOQ3exBnQhRcPeb/5S6cFcZIU=
X-Received: by 2002:a17:907:9908:: with SMTP id ka8mr1283587ejc.164.1634240803070;
 Thu, 14 Oct 2021 12:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20211013221032eucas1p1d8e2fcc36d3f021aa86cb846df0ed6da@eucas1p1.samsung.com>
 <20211013221021.3433704-1-willmcvicker@google.com> <b968773d-9ee4-4e7a-7e33-f3ded7362a9c@samsung.com>
In-Reply-To: <b968773d-9ee4-4e7a-7e33-f3ded7362a9c@samsung.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Thu, 14 Oct 2021 12:46:27 -0700
Message-ID: <CABYd82bcyweWba52wM6hXEgL_z6Ud+yE=Wtkb=5N8RyiQnxxiA@mail.gmail.com>
Subject: Re: [RFT PATCH v3 0/2] clk: samsung: add common support for CPU clocks
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Oct 14, 2021 at 1:33 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 14.10.2021 00:10, Will McVicker wrote:
> > These two patches were originally a part of the series [1]. They add
> > support to the common samsung clock driver to parse and register the
> > CPU clocks when provided. This allows for the samsung clock drivers to
> > simply provide a `struct samsung_cpu_clock` to `struct samsung_cmu_info`
> > and then call samsung_cmu_register_one(). With this new support, we can
> > now get rid of the custom apollo and atlas CLK_OF_DECLARE init functions.
> >
> > Since I don't have the hardware to test these, I'm including the RFT tag
> > to try and get help testing and verifying these.
> >
> > [1] https://protect2.fireeye.com/v1/url?k=91329df7-cea9a478-913316b8-0cc47a31307c-8e0b8e6442100c5a&q=1&e=50af1e33-8bdf-429f-9e54-434d425998d6&u=https%3A%2F%2Flore.kernel.org%2Fall%2F20210928235635.1348330-4-willmcvicker%40google.com%2F
>
> Works fine on my Exynos5433 TM2e test board.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for testing!

>
> > Will McVicker (2):
> >    [RFT] clk: samsung: add support for CPU clocks
> >    [RFT] clk: samsung: exynos5433: update apollo and atlas clock probing
> >
> >   drivers/clk/samsung/clk-cpu.c        |  26 ++++++
> >   drivers/clk/samsung/clk-exynos5433.c | 120 +++++++++++----------------
> >   drivers/clk/samsung/clk.c            |   2 +
> >   drivers/clk/samsung/clk.h            |  26 ++++++
> >   4 files changed, 102 insertions(+), 72 deletions(-)
> >
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
