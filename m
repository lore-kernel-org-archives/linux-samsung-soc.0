Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D9FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 15:11:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E9A860C40
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 15:11:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbhJZPNY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 11:13:24 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:46725 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234877AbhJZPNV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 11:13:21 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N0o3X-1mu9l442GD-00wimC for <linux-samsung-soc@vger.kernel.org>; Tue, 26
 Oct 2021 17:10:56 +0200
Received: by mail-wr1-f41.google.com with SMTP id k7so15219453wrd.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 08:10:55 -0700 (PDT)
X-Gm-Message-State: AOAM530hpur5lOL5BicT2fqJ/OP8WZtwkjurhp9+MeXW8rvUntU+Anyv
        0mCcD5+Hxkv75ChmhzE5MSjigrh5hoMHq2kjZiA=
X-Google-Smtp-Source: ABdhPJy+7SUebQLbF0Q1W8y0RnNXZNYOKe2RjrD/OSPEJ3iGKSMB21RzxOjstxrdGrCGx79gQiShwPFj7/Z4vBk/6MU=
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr20048042wrb.336.1635261055644;
 Tue, 26 Oct 2021 08:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210901123557.1043953-1-liu.yun@linux.dev>
In-Reply-To: <20210901123557.1043953-1-liu.yun@linux.dev>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 26 Oct 2021 17:10:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2AxmdhGKhGxfQetfzE0nKaaTRBmX=0OEPoaxkkZwABNg@mail.gmail.com>
Message-ID: <CAK8P3a2AxmdhGKhGxfQetfzE0nKaaTRBmX=0OEPoaxkkZwABNg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: s3c: irq-s3c24xx: Fix return value check for s3c24xx_init_intc()
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Jackie Liu <liuyun01@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:sKz8AK2s1fxijo8P28GDH0elMEtvsHDYQsnOhd2mAnmd+cukegB
 GAtSKc1rG4jfQjYqTmn+Wu0em7VijURKtmNOQJaiHkV+sgfJDRVUHtK9fpFcIu0AzMMUjs0
 lS5rmMR7R+PkxjHgZaW4hC/eJ++h9zn6wMaGL1yUQFot+G15UjO4/W9uNRlYyj5bNNYI7kI
 x2M1DHt62aCk2bF8KgqMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uzkNhT3m1ag=:7VIkFDUHr87xQzJV4ZPL7v
 7iFJmyb6YyFTIvMdOjrjTBPeKzCOVWrh6kc1jzFZdT0dk9VrPbcRz/cApRQhFYWriFPjo0LIC
 16eBCCAq9F3Z4tvMivrHTBOXFuY5IzsSmsygk+3JinDD2482BT3xXEZEsxdMMQ4hqew0tAFjo
 ofUPuRx9o7jpyq8VdOH90AiSuGK66KUKazzcjEthlezLtnOs1e8ZbkHwI3w6lUAGX++N91w7q
 YqmWs7X/RB9ju7oKnOM6Tg26LJpLuaf6FGgNN/HvsGy4USX6Ro7Sa++rmSifzDD4aMqH/Qb/X
 WKFIFSO8RSaoGMw34pa8ypMoUQmqRDpaleal7mklmXymeJ5K6hmZdtzParhQ6j6NxMLSNCmKh
 JgKwDyCzDFJdsqGXE4TiSYW21Ah6BTWuhghehL/qj0lxV03ur96aNHmQrgQ9bGpzFQg/OHoO2
 3s7K5cQQrA3LVLaU+ev3zu1GE77BAUviNFkTx5S8NxahqoS/GuvmxdV5yNpSQ/M/E6JYwMcaY
 1mZbwPVrcEqHXOqOe/ORzsG25NvieRgnwkZbgAMLMwbtVTKX9TFhKvuj6q6JDCYYE4FG7yKm+
 Ih+Sw5XVJSgv+pAbsBjAAdpbkNt7W6rnmpFJQzuaTKQ+8UvbF04maPcmHjSgy+u/io/hwzq9j
 Dvja5qK3jEVcTtHf8YprYAwU382TnwMFrKfnms3+vvkMM2tyArjUOk2/b2wcyHwx9DlU=
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 1, 2021 at 2:35 PM Jackie Liu <liu.yun@linux.dev> wrote:

> +               /* For platform based machines, neither ERR nor NULL can happen here.
> +                * The s3c24xx_handle_irq() will be set as IRQ handler iff this succeeds:
> +                *
> +                *    s3c_intc[0] = s3c24xx_init_intc()
> +                *
> +                * If this fails, the next calls to s3c24xx_init_intc() won't be executed.
> +                *
> +                * For DT machine, s3c_init_intc_of() could set the IRQ handler without
> +                * setting s3c_intc[0] only if it was called with num_ctrl=0. There is no
> +                * such code path, so again the s3c_intc[0] will have a valid pointer if
> +                * set_handle_irq() is called.
> +                *
> +                * Therefore in s3c24xx_handle_irq(), the s3c_intc[0] is always something.
> +                */
> +               if (s3c24xx_handle_intc(s3c_intc[0], regs, 0))
> +                       continue;
>
> -               if (s3c_intc[2])
> +               if (!IS_ERR_OR_NULL(s3c_intc[2]))
>                         if (s3c24xx_handle_intc(s3c_intc[2], regs, 64))
>                                 continue;

I just saw this in the pull request. I'm taking the pull request since
it's a bugfix and
the resulting code is technically correct, but I'd point out that this
is particularly
ugly. Any use of IS_ERR_OR_NULL() essentially means we have a misdefined
interface, and it's clear that this is one of them.

Nothing actually uses the return code of s3c24xx_init_intc(), so returning
NULL on error there and changing all the checks to that would be a much
more straightforward solution.

Any chance you could send a follow-up to do that?

      Arnd
