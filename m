Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42838E95A67
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  8 Oct 2023 18:46:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjJHSqA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 8 Oct 2023 14:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234260AbjJHSqA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 8 Oct 2023 14:46:00 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3DCBA
        for <linux-samsung-soc@vger.kernel.org>; Sun,  8 Oct 2023 11:45:55 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6c4e30a3604so2598434a34.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Oct 2023 11:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696790754; x=1697395554; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CujsQmWVijcnFFnAd58nyb3uZ77IiKCwoX5T6HrihiY=;
        b=Ln2BP+AL9eC4MuEmuE3p9JshAeWJ0gkLRRWEc/oouewX1lqp7fjgY3BJTplfbdtcrY
         wZ62nPoYqJtyhXGhiOlcfZ+S46P7Sb83/XM8gxx6psdExIYdkMmiGkY/reyFxnz0Z/A3
         /CYKG0hU3Me+w6N5Vi05IY+cDpvV6Ghcr94Yx+HJlZjh9vekajKYSxs4vbVuXCMM+HLF
         4aRS8Emb8a5JVvseLjAMtTwbEdh3n9kkAz4wyVHMLEjG2c9d+xapBkIePKMKa0yXB6H1
         Zif7oCRyI8ljRFpDFKIQ4nDbiD/QXjZsrw0OarBKrW6YmXaNhlGn1TfHsLq/W0aoTRVb
         oxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696790754; x=1697395554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CujsQmWVijcnFFnAd58nyb3uZ77IiKCwoX5T6HrihiY=;
        b=bVB7ut0cVtibgLr8l26kc2OqdHJTwsMS5lQiRt2a7ltcjwI75oEVeBSn6Zh8P91qn7
         FXMZ+7Q/xzHz4CrathdNaibFJOYtkCZuUY/yziH3fc9VkJBjSWhIiQm9uac8qA9H1HUg
         Qz5zIui7eAm7AF+FsoIksRXsuo6D7o83Jj62CeIyoga0T5qgUQiwKPxPOq8t6gn52uJ5
         8PT7W5Ec4GVKXXDYXiUdsg1J3xlEUWEYmWz92jMp+ilEPdao5prF/Y2+LsXJmgKRNK2/
         vY0rfGICQZHKPC6yzosgXb7mj0cIgPiS4ImHL3V35oA7YTzZqjv9U1BIeKcF6AzZcarg
         PY7Q==
X-Gm-Message-State: AOJu0YysvVzITZndpWcFKSMCpHqxpa/G2klvR2Dvk/ttWv9wt/yKvsN2
        IA2lHnkxVBAneZoezu0YIU/MPoGW6XpV8Fv1izwxhg==
X-Google-Smtp-Source: AGHT+IEXssKlgAPw0Do71Nq8kia5d3yzpbhWf9URRm0ZqJp0ZOvO0OUK/rHeMp2thxTzHFTIoqfhNXn+J5HKs5LztRY=
X-Received: by 2002:a05:6358:63a9:b0:141:10f4:1cbc with SMTP id
 k41-20020a05635863a900b0014110f41cbcmr14208139rwh.14.1696790754107; Sun, 08
 Oct 2023 11:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20231006130032eucas1p18c6f5c39614768911730fa6ed0201ee3@eucas1p1.samsung.com>
 <20231006125557.212681-1-m.majewski2@samsung.com> <CAPLW+4kmA6iYDPFxyASHLJifz63DRxT9gqQ-AsMAVy0RzoaFRw@mail.gmail.com>
 <04260159-f5a8-47f7-b267-33f4ea19b8a6@linaro.org>
In-Reply-To: <04260159-f5a8-47f7-b267-33f4ea19b8a6@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sun, 8 Oct 2023 13:45:42 -0500
Message-ID: <CAPLW+4nyLunQw+wCxQmw9VDCGx2ECeAhUzjKRCBeHW7fGS1dFA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix Samsung pinctrl driver static allocation of GPIO
 base warning
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Mateusz Majewski <m.majewski2@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Oct 8, 2023 at 8:09=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 07/10/2023 04:14, Sam Protsenko wrote:
> > On Fri, Oct 6, 2023 at 8:01=E2=80=AFAM Mateusz Majewski <m.majewski2@sa=
msung.com> wrote:
> >>
> >> The object of this work is fixing the following warning, which appears
> >> on all targets using that driver:
> >>
> >> gpio gpiochip0: Static allocation of GPIO base is deprecated, use dyna=
mic allocation.
> >>
> >> This needs a small refactor to how we interact with the pinctrl
> >> subsystem. Finally, we remove some bookkeeping that has only been
> >> necessary to allocate GPIO bases correctly.
> >>
> >> Mateusz Majewski (4):
> >>   pinctrl: samsung: defer pinctrl_enable
> >>   pinctrl: samsung: use add_pin_ranges method to add pinctrl ranges
> >>   pinctrl: samsung: choose GPIO numberspace base dynamically
> >>   pinctrl: samsung: do not offset pinctrl numberspaces
> >>
> >>  drivers/pinctrl/samsung/pinctrl-samsung.c | 56 ++++++++++++----------=
-
> >>  drivers/pinctrl/samsung/pinctrl-samsung.h |  4 +-
> >>  2 files changed, 31 insertions(+), 29 deletions(-)
> >>
> >> --
> >
> > Hi Mateusz,
> >
> > Thank you for handling this! Those deprecation warnings have been
> > bugging me for some time :) While testing this series on my E850-96
> > board (Exynos850 based), I noticed some changes in
> > /sys/kernel/debug/gpio file, like these:
> >
> > 8<---------------------------------------------------------------------=
--------------------->8
> > -gpiochip0: GPIOs 0-7, parent: platform/11850000.pinctrl, gpa0:
> > - gpio-7   (                    |Volume Up           ) in  hi IRQ ACTIV=
E LOW
> > +gpiochip0: GPIOs 512-519, parent: platform/11850000.pinctrl, gpa0:
> > + gpio-519 (                    |Volume Up           ) in  hi IRQ ACTIV=
E LOW
> >
> > -gpiochip1: GPIOs 8-15, parent: platform/11850000.pinctrl, gpa1:
> > - gpio-8   (                    |Volume Down         ) in  hi IRQ ACTIV=
E LOW
> > +gpiochip1: GPIOs 520-527, parent: platform/11850000.pinctrl, gpa1:
> > + gpio-520 (                    |Volume Down         ) in  hi IRQ ACTIV=
E LOW
> >
> > -gpiochip2: GPIOs 16-23, parent: platform/11850000.pinctrl, gpa2:
> > +gpiochip2: GPIOs 528-535, parent: platform/11850000.pinctrl, gpa2:
> >
> > ...
> > 8<---------------------------------------------------------------------=
--------------------->8
> >
> > So basically it looks like all line numbers were offset by 512. Can
> > you please comment on this? Is it an intentional change, and why it's
> > happening?
> >
> > Despite of that change, everything seems to be working fine. But I
> > kinda liked the numeration starting from 0 better :)
>
> Could it be the reason of dynamic allocation?
>

I just asked because I didn't know :) But ok, if you want me to do
some digging... It seems like having GPIO_DYNAMIC_BASE=3D512 is not
necessarily the reason of dynamic allocation, but instead just a way
to keep 0-512 range for legacy GPIO drivers which might use that area
to allocate GPIO numbers statically. It's mentioned here:

    /*
     * At the end we want all GPIOs to be dynamically allocated from 0.
     * However, some legacy drivers still perform fixed allocation.
     * Until they are all fixed, leave 0-512 space for them.
     */
    #define GPIO_DYNAMIC_BASE    512

As mentioned in another comment in gpiochip_add_data_with_key(), that
numberspace shouldn't matter and in the end should go away, as GPIO
sysfs interface is pretty much deprecated at this point, and everybody
should stick to GPIO descriptors.

Anyway, now that it's clear that the base number change was intended
and shouldn't matter, for all patches in the series:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>

Thanks!

>
> Best regards,
> Krzysztof
>
