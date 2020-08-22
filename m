Return-Path: <SRS0=N1Gb=CA=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4ABC433E1
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 22 Aug 2020 14:54:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74ACB2078D
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 22 Aug 2020 14:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FQkQhG80"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbgHVOyi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 22 Aug 2020 10:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbgHVOyf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 22 Aug 2020 10:54:35 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A90C061574
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Aug 2020 07:54:35 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id md23so5174932ejb.6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Aug 2020 07:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Mbzm5gpuiwO9tFrWmdPpY3arq5Fa+qKMjnEd29bPLpQ=;
        b=FQkQhG808JI0eCeL5TQ57rNtCCg1AYXnUaZ+z+bIXDm0JphY/3kTObu2x7RD3HTTTE
         J/4DdcSBvZEl3HzlW99RxNL4Ctxtq7j2efM5diD9FiLMYPYVjnlCzbrlPS7Reu+anrxL
         fbO+3Lp90y+V28Qscu0lHKi06nifW+YbDpIJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Mbzm5gpuiwO9tFrWmdPpY3arq5Fa+qKMjnEd29bPLpQ=;
        b=N6ZXF0/wQkXUmcDwxiqrMmsq/lcEeRNqMPexibZNp1PcIUlpOJTFmOxgldNtYNf3kv
         5gceGY3LErFbqZFJeR5eX2UWNhv8eY49VUGcyv2Okhc3zwCOaz7hpJ2pLRYtRscooA67
         etVn16oo9GK6kx+4Wtv9pZ7w+iKkhZVzoTh4SFm7xBlp2Da8BITfGbBRzFYRgv3gFGyW
         t7MehWjjRp8lJrUbbhzea4yEUvegnJuNyAu9Dj7RlSCV35l1V6HxUoaSPxaEBskmxZJz
         Fmm4XgSZInVEOP4c10KXegFhaOqJVhRheZEBPZD68bXJwOAkpOWSsKQk2Alcm060KxGI
         HQYA==
X-Gm-Message-State: AOAM533NlN607q/K/tlK66kN23SzIaHraszfmmQUgO6xbhLzXaHzVizs
        bMiFYwAihr21eMl+EInkQUWzpLUk0tWuow==
X-Google-Smtp-Source: ABdhPJxQJVWbfOuEypwsGQvP6rSFl+d9rpOPvqcCDA1osIzQ2frGLp7iicNmRA0Kj86wgIVY6TOYAQ==
X-Received: by 2002:a17:906:1f8e:: with SMTP id t14mr7905030ejr.336.1598108073711;
        Sat, 22 Aug 2020 07:54:33 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id 24sm3013745edx.35.2020.08.22.07.54.32
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2020 07:54:33 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id c15so4488480wrs.11
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Aug 2020 07:54:32 -0700 (PDT)
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr7016601wrn.385.1598108072233;
 Sat, 22 Aug 2020 07:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200821161407eucas1p249e4833b8839f717cc2a496ab43bb8a2@eucas1p2.samsung.com>
 <20200821161401.11307-1-l.stelmach@samsung.com> <20200821161401.11307-8-l.stelmach@samsung.com>
In-Reply-To: <20200821161401.11307-8-l.stelmach@samsung.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 22 Aug 2020 16:54:19 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DKCsDOQXcaAqB0h8V8rdo_EcBevgkPO1LzU7FZJ+r_hg@mail.gmail.com>
Message-ID: <CAAFQd5DKCsDOQXcaAqB0h8V8rdo_EcBevgkPO1LzU7FZJ+r_hg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] spi: spi-s3c64xx: Ensure cur_speed holds actual
 clock value
To:     linux-spi@vger.kernel.org
Cc:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Aug 21, 2020 at 6:14 PM =C5=81ukasz Stelmach <l.stelmach@samsung.co=
m> wrote:
>
> cur_speed is used to calculate transfer timeout and needs to be
> set to the actual value of (half) the clock speed for precise
> calculations.
>
> Cc: Tomasz Figa <tfiga@chromium.org>

As we talked on IRC, Lukasz forgot to add:

Suggested-by: Tomasz Figa <tomasz.figa@gmail.com>

Would be nice if it could be added when (and if) applying.

> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> ---
>  drivers/spi/spi-s3c64xx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 02de734b8ab1..89c162efe355 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -626,6 +626,7 @@ static int s3c64xx_spi_config(struct s3c64xx_spi_driv=
er_data *sdd)
>                 ret =3D clk_set_rate(sdd->src_clk, sdd->cur_speed * 2);
>                 if (ret)
>                         return ret;
> +               sdd->cur_speed =3D clk_get_rate(sdd->src_clk) / 2;
>         } else {
>                 /* Configure Clock */
>                 val =3D readl(regs + S3C64XX_SPI_CLK_CFG);
> --
> 2.26.2
>
