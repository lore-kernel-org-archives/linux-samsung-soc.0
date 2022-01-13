Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BFEC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 13 Jan 2022 18:54:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237675AbiAMSyI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 13 Jan 2022 13:54:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237671AbiAMSyI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Jan 2022 13:54:08 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE001C06161C
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 10:54:07 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id m21so688452pfd.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 10:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tb5858QqXIcL5etsmWCS0ZKhHGEgdWFwctSsz78MvDI=;
        b=UK7Pq02IigfJ4UwrZ8hJfii4Xs3neqjQIZcCnn8iEJ2HaSzAsOFfNWUOvyqHby6xZ3
         RPlt+Q9ETiZ57YNEA2lks/Dmj+Yk5qVw6hReh/CyXQxkUhA9iluXR8+lFYLBQ6QHkhM/
         n2ilJTcMm9FfoIvY9Pc/SVqd5ihJfZNoRu56K6O5UOOWWjHBbiczhjlaF92FQkLDeZZm
         Na/p4eIaTEnhyy5sMOVTJTMbbIUFAHYkfchs8yApFNnFluEjW71UU0DvNSBgg1u1x70O
         rdrXoDDPa4vNGbC08xoLC6Fkxa2SJR0HokkgcJz1d/qarYXgH+CmInrAtTcqudfn2bNH
         TnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tb5858QqXIcL5etsmWCS0ZKhHGEgdWFwctSsz78MvDI=;
        b=H1ONK2ByEQLQphXkwyD1OaTPpcrmH/0E/e31E/16MSujmoB13B7iQysXetYv0WSBG0
         LRo4riNn3OmzsfXzwGCbAbrrggQG2fYlj4o50URwXF07yFrwzjVJuNgZc5rpRF1yECfw
         U3tF7rQV55Rgo3qA7o815VKO6owQtC3CkQFEKO14LZt8rFv9qxx5Nt0RmA57IE58Q4Qo
         LVS4SCsmqbjym3GvuprW3sy5bPwXD/0BA9UOnpLwJOde9hU8tYkspnPOPKlYf2Hd51vF
         bUQDDGVOXJj4Iaj5z5VO/u1nzJKtMWP5C16Ogws1MjEKUt+KuUETiI4NYZGVatzOmaNu
         8G/w==
X-Gm-Message-State: AOAM5316yj2bTntx9dJuL2xbUneAk/00D+CE+nh6hVH3rbpp2ThGhaaP
        9DpmC0lHXuEAXVdLDnMx5yJojaBxxS2nrnQGAkjMYw==
X-Google-Smtp-Source: ABdhPJzXlahtnsFy6IBae/4XXtwKfp3ieNHsHEWW/ixmJdS+WTYxk6qaqsRZoeKRiQr50fLtEznw6+6eMB/iQsmKuX4=
X-Received: by 2002:a05:6a00:16c7:b0:4a5:d9c1:89da with SMTP id
 l7-20020a056a0016c700b004a5d9c189damr5491085pfc.34.1642100047311; Thu, 13 Jan
 2022 10:54:07 -0800 (PST)
MIME-Version: 1.0
References: <CGME20220113122302epcas5p1d45c0714fe286f8f91d0f28c3fad86e4@epcas5p1.samsung.com>
 <20220113121143.22280-1-alim.akhtar@samsung.com> <d1a852e1-c4c2-b7c4-ddeb-7fbcfd9b4e58@canonical.com>
In-Reply-To: <d1a852e1-c4c2-b7c4-ddeb-7fbcfd9b4e58@canonical.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Thu, 13 Jan 2022 10:53:55 -0800
Message-ID: <CAOesGMjZ8X3r2KvPLWWwJj1ckTruiGOjx9wLyu8YbCxW+OaZgQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] Add support for Tesla Full Self-Driving (FSD) SoC
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        SoC Team <soc@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Jan 13, 2022 at 4:32 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 13/01/2022 13:11, Alim Akhtar wrote:
> > This patch set adds basic support for the Tesla Full Self-Driving (FSD)
> > SoC. This SoC contains three clusters of four Cortex-A72 CPUs,
> > as well as several IPs.
> >
> > Patches 1 to 8 provide support for the clock controller
> > (which is designed similarly to Exynos SoCs).
> >
> > The remaining changes provide pinmux support, initial device tree support,
> > and SPI, ADC, and MCT IP functionality.
>
> Does FSD have some version number? The FDS, especially in compatibles,
> looks quite generic, so what will happen if a newer SoC comes later? You
> would have:
>  - tesla,fsd-pinctrl
>  - tesla,fsd-xxxx-pinctrl (where xxxx could be some new version)
>
> This will be extra confusing, because fsd-pinctrl looks like the generic
> one, while it is specific...

The public sources from Tesla on github uses "turbo,trav" here, but
that's also not a versioned name. The platform itself (hw3/hw31 -- 3.1
I presume?) has numbering, but that's system and not SoC:
https://github.com/teslamotors/linux/tree/tesla-4.14-hw3/arch/arm64/boot/dts/turbo

It would be easy to do "fsd2" for naming/numbering if needed for
future versions, for example. I'm not so worried about this,
especially if there's no corresponding internal version numbering that
this would map naturally to.


-Olof
