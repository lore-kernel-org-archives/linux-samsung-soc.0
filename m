Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E96CE9413E
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  7 Oct 2023 02:15:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234052AbjJGCPA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Oct 2023 22:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234064AbjJGCO7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Oct 2023 22:14:59 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67EB51A6
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Oct 2023 19:14:34 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-58907163519so2052226a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Oct 2023 19:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696644873; x=1697249673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mpftVBDmZlVrcM4E1/xk2GP1ZYmd4Pa5biiRHrPKWo=;
        b=g6suOmYpCsjGqoSf3EpLcaIBTsL+eA/rRIrqweK8N+FDTB7zVurnmFouKvYvKTz16R
         qQ/VQASeIGk61h+HpcqC0bn28/6RQav3aTkEngCbDLEo8mzgFKy4dBk0YyAwljH3De/D
         cxWWRjG/P6kYdYdOHyXXMCIxMKscbpb6L2sKuY9RilSqSf0Jwk+fmY6bwzSxjdCy8cu7
         z8XPptTx2k5dtKHU63VB4VOSelOU6pikBUW/Al+UHd6I1a1OXcqQFJEZgiit0/iVt6ED
         6RPVVtz7Tpaj63xCsR2um1mQEn3rXhEMgaGtS/3pXp50UQJjCXcSDmla4ksJPUzSxG80
         ahTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696644873; x=1697249673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mpftVBDmZlVrcM4E1/xk2GP1ZYmd4Pa5biiRHrPKWo=;
        b=EW67y5uF16Trku845LZB/0U6VayE6lV0gPf4v1jbqNVJTDChRUzVIc9uZZCzn4xtH2
         u2iYwvtDtGmLBeiGx7ia9HFnUj4gRNje6Tmhpy9zAO3JW0+WGBrlY/uWybjsZySmOlvT
         s24Ej7x6AphuYFRfQaiUiNNy/C1dGxzp0hia6BHVsZT4nm/opANsJKntMVqlIRNUC0Yi
         hwaXMouZ8cSXqSGD7BRRsw7SHOIu6dxzXwFZ/+q+2v3J0I+kznPPom2NVbzeyPkdbr4N
         fLsDdu4kTbySPbFlajuimcFtnWPaEqLpR7esNgA/N9hQ8TYWGfDFF/PlbFFb903Y1Zzv
         qv7Q==
X-Gm-Message-State: AOJu0Yz34e7c9NuayMghcWuKWfroCS4xZhg7FELv/rh23qqtO+McnIOi
        81FevcnuQEJlXL0FlaKwdTCUrDh8mz5mPz7DzcpmPQ==
X-Google-Smtp-Source: AGHT+IHPMxkPFA5YVZinAl5IZI/T7jsHLdvSFVbSBBkTfRA5h6555HgxF1kTPgvW3YXh5V+5e1YUQek8qN2ST7BEpjs=
X-Received: by 2002:a05:6a20:9188:b0:14c:d494:77c5 with SMTP id
 v8-20020a056a20918800b0014cd49477c5mr11675121pzd.13.1696644873540; Fri, 06
 Oct 2023 19:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20231006130032eucas1p18c6f5c39614768911730fa6ed0201ee3@eucas1p1.samsung.com>
 <20231006125557.212681-1-m.majewski2@samsung.com>
In-Reply-To: <20231006125557.212681-1-m.majewski2@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 6 Oct 2023 21:14:22 -0500
Message-ID: <CAPLW+4kmA6iYDPFxyASHLJifz63DRxT9gqQ-AsMAVy0RzoaFRw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix Samsung pinctrl driver static allocation of GPIO
 base warning
To:     Mateusz Majewski <m.majewski2@samsung.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 6, 2023 at 8:01=E2=80=AFAM Mateusz Majewski <m.majewski2@samsun=
g.com> wrote:
>
> The object of this work is fixing the following warning, which appears
> on all targets using that driver:
>
> gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic=
 allocation.
>
> This needs a small refactor to how we interact with the pinctrl
> subsystem. Finally, we remove some bookkeeping that has only been
> necessary to allocate GPIO bases correctly.
>
> Mateusz Majewski (4):
>   pinctrl: samsung: defer pinctrl_enable
>   pinctrl: samsung: use add_pin_ranges method to add pinctrl ranges
>   pinctrl: samsung: choose GPIO numberspace base dynamically
>   pinctrl: samsung: do not offset pinctrl numberspaces
>
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 56 ++++++++++++-----------
>  drivers/pinctrl/samsung/pinctrl-samsung.h |  4 +-
>  2 files changed, 31 insertions(+), 29 deletions(-)
>
> --

Hi Mateusz,

Thank you for handling this! Those deprecation warnings have been
bugging me for some time :) While testing this series on my E850-96
board (Exynos850 based), I noticed some changes in
/sys/kernel/debug/gpio file, like these:

8<-------------------------------------------------------------------------=
----------------->8
-gpiochip0: GPIOs 0-7, parent: platform/11850000.pinctrl, gpa0:
- gpio-7   (                    |Volume Up           ) in  hi IRQ ACTIVE LO=
W
+gpiochip0: GPIOs 512-519, parent: platform/11850000.pinctrl, gpa0:
+ gpio-519 (                    |Volume Up           ) in  hi IRQ ACTIVE LO=
W

-gpiochip1: GPIOs 8-15, parent: platform/11850000.pinctrl, gpa1:
- gpio-8   (                    |Volume Down         ) in  hi IRQ ACTIVE LO=
W
+gpiochip1: GPIOs 520-527, parent: platform/11850000.pinctrl, gpa1:
+ gpio-520 (                    |Volume Down         ) in  hi IRQ ACTIVE LO=
W

-gpiochip2: GPIOs 16-23, parent: platform/11850000.pinctrl, gpa2:
+gpiochip2: GPIOs 528-535, parent: platform/11850000.pinctrl, gpa2:

...
8<-------------------------------------------------------------------------=
----------------->8

So basically it looks like all line numbers were offset by 512. Can
you please comment on this? Is it an intentional change, and why it's
happening?

Despite of that change, everything seems to be working fine. But I
kinda liked the numeration starting from 0 better :)

Thanks!

> 2.42.0
>
