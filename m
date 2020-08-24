Return-Path: <SRS0=sDIw=CC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C30C433E1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Aug 2020 13:21:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 260B821775
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Aug 2020 13:21:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HmZ0L+ZO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgHXNVv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Aug 2020 09:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbgHXNVt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 09:21:49 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D31C061574
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Aug 2020 06:21:48 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id bs17so8016573edb.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Aug 2020 06:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=90su1owIcZp1qZ8W+tbpS5QP1K7qOdgVEZYDn1cZZPI=;
        b=HmZ0L+ZO9rkNEJk5r0Ka6FMGlXEuCReREwZJyU/MzsB9S8jVOUjFNQYMNFTr4abObP
         fVq1khF3ehL0JqKu8fdJVYpL2pp6XNDHNuG3uUUBs0Lfm+yk9/suss49FVzUcBjw/aoI
         gkqBI6IH42fGKgFpGz3vy69QOSjGS+S1H/25Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=90su1owIcZp1qZ8W+tbpS5QP1K7qOdgVEZYDn1cZZPI=;
        b=LiqfXErf8nN2oR7Yqq2y9p5sKKWJdfcHq9rD4klOgTxK3EGRBHeXIPOEP3A3OMPlb1
         Y14EY4Z9YaGGNc9eoevTfM14TIkc30WMbXW9TYoVJ6v9s0Z2nQL0ddEViR9CrSs3fnQo
         xJy04ySGkgSiB8W1ir83UMYqtbPQc4p/aJwRE0cLDnfdp5JILK6KW9ozuw9jG+88jhyb
         lQw8dYdIBMtYqqRCyry0JfRnY2D8dggQLpM9cAPe1jsruP8QVyGikUP10VMGg/00xbyh
         3Zc4S9iRTzYGGolW8zwTxDwnDKC0xWHiPC0EBMexDk6acZMX47nla68X5w8uPn1bb4An
         +h6Q==
X-Gm-Message-State: AOAM532kFLMe05o4Ey3nkNokSIDewg/hvXcUdR74Y1RA5WcXzSyHDKE6
        yIsjo6hSs8+9WhYvg4obKiKtXIrF22BZSw==
X-Google-Smtp-Source: ABdhPJwpsp2k//MqQEvS8+e0cULK05gi+/XF9SHe7RbElgRCClvL+7P7eA+5lzAmB/rU1rTd7MbO2w==
X-Received: by 2002:aa7:d688:: with SMTP id d8mr5451211edr.168.1598275307410;
        Mon, 24 Aug 2020 06:21:47 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id bu19sm9410249edb.34.2020.08.24.06.21.46
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 06:21:46 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id a65so4713693wme.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Aug 2020 06:21:46 -0700 (PDT)
X-Received: by 2002:a1c:5581:: with SMTP id j123mr5764243wmb.11.1598275305542;
 Mon, 24 Aug 2020 06:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200824131716eucas1p16a3fde52aa765e7cd6584d4733762047@eucas1p1.samsung.com>
 <20200822124325.GF20423@kozik-lap> <dleftj5z98xjxs.fsf%l.stelmach@samsung.com>
In-Reply-To: <dleftj5z98xjxs.fsf%l.stelmach@samsung.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 24 Aug 2020 15:21:34 +0200
X-Gmail-Original-Message-ID: <CAAFQd5ADym6YapCoJ8+fJbPjSestcD_2R8L5T8jAfO4c=GFQkA@mail.gmail.com>
Message-ID: <CAAFQd5ADym6YapCoJ8+fJbPjSestcD_2R8L5T8jAfO4c=GFQkA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] spi: spi-s3c64xx: Ensure cur_speed holds actual
 clock value
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>, Andi Shyti <andi@etezian.org>,
        Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Aug 24, 2020 at 3:17 PM Lukasz Stelmach <l.stelmach@samsung.com> wr=
ote:
>
> It was <2020-08-22 sob 14:43>, when Krzysztof Kozlowski wrote:
> > On Fri, Aug 21, 2020 at 06:13:59PM +0200, =C5=81ukasz Stelmach wrote:
> >> cur_speed is used to calculate transfer timeout and needs to be
> >> set to the actual value of (half) the clock speed for precise
> >> calculations.
> >
> > If you need this only for timeout calculation just divide it in
> > s3c64xx_wait_for_dma().
>
> I divide it here to keep the relationship between the value the variable
> holds and the one that is inside clk_* (See? It's multiplied 3 lines
> above). If you look around every single clk_get_rate() call in the file i=
s
> divided by two.
>
> > Otherwise why only if (cmu) case is updated?
>
> You are righ I will update that too.
>
> However, I wonder if it is even possible that the value read from
> S3C64XX_SPI_CLK_CFG would be different than the one written to it?
>

It is not possible for the register itself, but please see my other
reply, where I explained the integer rounding error which can happen
when calculating the value to write to the register.

> > You are also affecting here not only timeout but
> > s3c64xx_enable_datapath() which is not mentioned in commit log. In othe=
r
> > words, this looks wrong.
>
> Indeed, there is a reference too. I've corrected the message.
>

Thanks!

Best regards,
Tomasz

> >>
> >> Cc: Tomasz Figa <tfiga@chromium.org>
> >> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> >> ---
> >>  drivers/spi/spi-s3c64xx.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> >> index 02de734b8ab1..89c162efe355 100644
> >> --- a/drivers/spi/spi-s3c64xx.c
> >> +++ b/drivers/spi/spi-s3c64xx.c
> >> @@ -626,6 +626,7 @@ static int s3c64xx_spi_config(struct s3c64xx_spi_d=
river_data *sdd)
> >>              ret =3D clk_set_rate(sdd->src_clk, sdd->cur_speed * 2);
> >>              if (ret)
> >>                      return ret;
> >> +            sdd->cur_speed =3D clk_get_rate(sdd->src_clk) / 2;
> >>      } else {
> >>              /* Configure Clock */
> >>              val =3D readl(regs + S3C64XX_SPI_CLK_CFG);
> >> --
> >> 2.26.2
> >>
> >
> >
>
> --
> =C5=81ukasz Stelmach
> Samsung R&D Institute Poland
> Samsung Electronics
