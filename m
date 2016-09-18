From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH 00/10] ARM: dts: exynos: Fix invalid GIC interrupt flags
Date: Sun, 18 Sep 2016 10:49:36 +0200
Message-ID: <CAMuHMdUGsVKzye7rVzmHMvmskL+tnE5kDnctfmiHnmHX88bh4w@mail.gmail.com>
References: <1474054971-16831-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:33216 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755127AbcIRIth (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Sep 2016 04:49:37 -0400
In-Reply-To: <1474054971-16831-1-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alban Browaeys <alban.browaeys@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>

Hi Krzysztof,

On Fri, Sep 16, 2016 at 9:42 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Marek (internally), Geert and Alban reported errors like:
>         genirq: Setting trigger mode 0 for irq 16 failed (gic_set_type+0x0/0x68)

I didn't report these on Exynos, though, so I think you should drop my
Reported-by.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
