Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA7BC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 22:31:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57BB161248
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 22:31:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233793AbhJVWeJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 22 Oct 2021 18:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234301AbhJVWeI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Oct 2021 18:34:08 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F81C061767
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Oct 2021 15:31:50 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id e10so10541287uab.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Oct 2021 15:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QLRoAaM9Isx2SYKNZgDhEi8NKtlHeAAiw6Jpcyu0C08=;
        b=wM+wdMFPI30xl5+kiTT1+ZZ5ugZcjAXQoxfAO8Ss8G193/Mvfmmd9KrXbKO1573HGX
         okhtvKolp7RtdPGuwm6a09Kg3w3S51+YZo8Y7YZYUpU1KrXL+e2E/MdIWqpcO2vBTAWs
         qBv9aazLIWKR+wOi71bzN7SNqcQlpiwJd7wqoh8gPBhM1oFKCz2wE12XWC1SxgtpcUYP
         GrCsDvFpRVRO4GEiGq9WtBRyAqKrhU4meWuL7ZIVg0ks2IodwXWGkBXvB6cFz3TnYYFx
         1Al/Ntsx88T3NZ0cqahOPKMliHEKdcfY1W4WI9KeWpjFzCJPWNCuA5GEkFcFOnY3LvSW
         HJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QLRoAaM9Isx2SYKNZgDhEi8NKtlHeAAiw6Jpcyu0C08=;
        b=nYAAT8htOD2ACmKMPg+aEIq7tH96dCvvk1OAfJ/p8XgtKHqqJcj5WIVlP6T7jzbjLB
         +CDXiGd2hXBDTk0E9/HU40ob7h7MMOtm4iUS7E6/QWKqovZ2sN4AXem7ODMGBqoCjWDI
         J235rhoPVk8XDoiWVvGcrKQ47vSe4hsN7Oy+LgC3tj8jMR84/zxJuqXBjiafrzjAbNR4
         oa9yty97qUcoWdYOzy/axuSgU00ZdH2PvQugMG9h/GtWhQGc9A15s5ESIxVyoci+gNKr
         icnMQ7lgCedz4txcdxftkV22IJS5GE/A/JcYUqFcZLhc7BCoQoJ3Qp6ENmYFJX1ZUcpE
         xxYA==
X-Gm-Message-State: AOAM533zuAx+10VbfeApKik1IvN7+0j52+2wlEwqCwypte4Bl5gaXj9W
        s4a0v+WvMhSzAU+HUGAe2zuv2fv8l0LP7dTq/2V5ng==
X-Google-Smtp-Source: ABdhPJzKLiNWVJSNzHAVe+uiS1jdtEVGUMYWrOZB/jm0v0Qbk+rhViEBBsEP6XEXq21q78Pl7gi2NkXHPU4M0C39BaM=
X-Received: by 2002:a9f:21b7:: with SMTP id 52mr3227824uac.9.1634941909421;
 Fri, 22 Oct 2021 15:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211021203152.29312-1-semen.protsenko@linaro.org>
 <20211021203152.29312-2-semen.protsenko@linaro.org> <864f52d2-1336-eaca-1647-99a0f55da6f9@gmail.com>
 <CAPLW+4kgAKut9fPJzZapBvVpprno++O3g3CFOE-Pj=0Oxb9McQ@mail.gmail.com> <CAGTfZH153PS40GcOB08HXzXPAr4NY-BWjbieQE8ExS+TqV-DYw@mail.gmail.com>
In-Reply-To: <CAGTfZH153PS40GcOB08HXzXPAr4NY-BWjbieQE8ExS+TqV-DYw@mail.gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sat, 23 Oct 2021 01:31:37 +0300
Message-ID: <CAPLW+4mx67JcSk21ntac=WGM27GA0wMFU-r6zAHi+5i6UKMNrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: samsung: exynos850: Implement CMU_APM domain
To:     Chanwoo Choi <cwchoi00@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 23 Oct 2021 at 01:18, Chanwoo Choi <cwchoi00@gmail.com> wrote:
>
> On 21. 10. 22. =EC=98=A4=ED=9B=84 10:39, Sam Protsenko wrote:
> > On Fri, 22 Oct 2021 at 11:58, Chanwoo Choi <cwchoi00@gmail.com> wrote:
> >>
> >> On 21. 10. 22. =EC=98=A4=EC=A0=84 5:31, Sam Protsenko wrote:
> >>> CMU_APM clock domain provides clocks for APM IP-core (Active Power
> >>> Management). According to Exynos850 TRM, CMU_APM generates I3C, Mailb=
ox,
> >>> Speedy, Timer, WDT, RTC and PMU clocks for BLK_ALIVE.
> >>>
> >>> This patch adds next clocks:
> >>>     - bus clocks in CMU_TOP needed for CMU_APM
> >>>     - all internal CMU_APM clocks
> >>>     - leaf clocks for I3C, Speedy and RTC IP-cores
> >>>     - bus clocks for CMU_CMGP and CMU_CHUB
> >>>
> >>> CMU_APM doesn't belong to Power Domains, but platform driver is used =
for
> >>> its registration to keep its bus clock always running. Otherwise rtc-=
s3c
> >>> driver disables that clock and system freezes.
> >>>
> >>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> >>> ---

...snip...

> >> Basically, you can never change the already defined clock id
> >> in nclude/dt-bindings/clock/*.h because of supporting
> >> the compatibility of dtb files which were using the
> >> already defined clock id instead of changed clock id
> >>
> >> If you want to add new clock with new clock id,
> >> you have to define the new clock id at the end of defined clock
> >> like the next of CLK_GOUT_PERI_IP for TOP domain case.
> >>
> >
> > Thanks for explaining that in details, Chanwoo. As Krzysztof pointed
> > out, right now there are no dts users of this clock driver in upstream
> > kernel (I didn't submit it yet), so it'd nice if this one can be taken
> > as is. In future I'll increment the last clock ID. Guess it was my OCD
> > talking, trying to keep all clock IDs grouped by clock type :)
>
> I know that there are no user for this clock. So that it doesn't make
> the real break for compatibility. But, when some kernel developers might
> check the kernel history by git command, they never know the history
> only we know. If there are any critical reason, I don't prefer to break
> the rule of clock id defintion for patch history.
>
> Just I want to keep the original rule of clock id patch in order to remov=
e
> the potential confusion. It is not a strong objection. But In my case,
> I cannot reply the ack. Thanks for your work.
>

Actually I was thinking about the same -- setting a bad example and
stuff. It's not a big deal, I'll send v2 soon :)

> --
> Best Regards,
> Samsung Electronics
> Chanwoo Choi
