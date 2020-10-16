Return-Path: <SRS0=SlmQ=DX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8A7C433E7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Oct 2020 07:03:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 438A920848
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Oct 2020 07:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="up3tNrQx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394268AbgJPHDc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Oct 2020 03:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391475AbgJPHDc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 03:03:32 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8035DC061755;
        Fri, 16 Oct 2020 00:03:32 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x13so926975pfa.9;
        Fri, 16 Oct 2020 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:mime-version:subject:from:in-reply-to
         :date:cc:message-id:references:to;
        bh=gZuqvmeZLiB4EetTt35Ahi6N1kjCZ4lqMWrOBCtfCBw=;
        b=up3tNrQxBaE40+eqR/OR+ddHRuuz+YYuC7b7qxK7/TYAk0j4PiBoieKghL3hkrDtWo
         HZpISr7SwtAJdn2lW/aVRBfH5NbGcYRr3tR4nbmP0AzxSKUi8PmQiHfwL4IKYaJ99tUM
         k/wtnSc+InTj1VNBadeTBccPRWVCRVigfHt16YUUJpIoV4TjwKEveGtErheofOVbqn/h
         oDo+Kj7rEWBXgWez2pwrQWfM19cUD71Wkzg2t7xCY1/SMWbktE402LXStCxtsvJhqVlh
         r/BBJITIrmYBy+1pdxnBqr64PHRrA8Aqzfjo1aUMFYSXW05phnVIySlBxEFatUqJP70e
         1zgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:mime-version:subject
         :from:in-reply-to:date:cc:message-id:references:to;
        bh=gZuqvmeZLiB4EetTt35Ahi6N1kjCZ4lqMWrOBCtfCBw=;
        b=VwDbg4i2A7KI+W6LdqSC8ZZtn6SRM0MgZzI7cGUs06rnThn0Y7305tJ55zACaxdP+l
         Z+yudciXhBYy32TtuRvnMZhEuYIIb6JzU1/5amvx1g9eQ8PsXS5r0J+eZh+119TVzJjv
         steEBTHFWXuQo/1dNy/e88Dw5WDjhcOUfiYBfkCUsttexq/SU3MrDHX5gx1huF4Skd2F
         NYwlxFTb1w/TIt3Vp/GajmA9sVCewuyzWGQ8h9LxO83LqV1dRP8/w9gJE41O1PnRhQQJ
         2V/Ls9LGkcL3XRt8HdkZkh17fEGP5Sos2jor5Mh5ISofFagWWq4Ssb8a9ouYr2/pZu7J
         2hdA==
X-Gm-Message-State: AOAM531D9511dqQGYOLHyM/EvXInHi4aUv+BAoi9Goxi6FIRvLIVLo96
        xlCxYTxGJMD2IOaUCfrSHcc=
X-Google-Smtp-Source: ABdhPJz1CwgI2WS9NnLr3NQL/Qbp2ctqKJ8+y1sUimSFcDxbM+JFzvLgL2DBxP3iRIm7LnD/0ctNTw==
X-Received: by 2002:a65:64cc:: with SMTP id t12mr2057175pgv.106.1602831811915;
        Fri, 16 Oct 2020 00:03:31 -0700 (PDT)
Received: from [102.164.189.252] ([175.223.34.209])
        by smtp.gmail.com with ESMTPSA id g1sm1555127pfm.124.2020.10.16.00.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2020 00:03:30 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/2] MAINTAINERS: Move Kukjin Kim to credits
From:   Kukjin Kim <kgene.kim@gmail.com>
In-Reply-To: <20201016061848.6258-1-krzk@kernel.org>
Date:   Fri, 16 Oct 2020 16:03:28 +0900
List-Id: <soc.lore.kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, arm@kernel.org, soc@kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kukjin Kim <kgene@kernel.org>
Message-Id: <4A6641A3-2D1A-47AE-8330-8E3F269145CB@gmail.com>
References: <20201016061848.6258-1-krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: iPhone Mail (18A393)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


> 10/16/20 PM 3:19, Krzysztof Kozlowski <krzk@kernel.org> wrote:

Hi Krzysztof,

Thanks for your maintaining :)
I=E2=80=99m fine on this change.

> =EF=BB=BFKukjin Kim has been maintaining the Samsung ARM architectures sin=
ce 2010
> up to 2016.  He contributed many patches for the S3C, S5P and Exynos
> support.  However since 2016 there is little activity from him on the
> LKML [1] so move his name to the CREDITS.
>=20
> Dear Kukjin, thank you for all the effort you put in to the upstream
> Samsung support.
>=20
> [1] https://lore.kernel.org/lkml/?q=3Df%3A%22Kukjin+Kim%22
>=20
> Cc: Kukjin Kim <kgene@kernel.org>
Acked-by: Kukjin Kim <kgene@kernel.org>

> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Olof Johansson <olof@lixom.net>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
> CREDITS     | 4 ++++
> MAINTAINERS | 2 --
> 2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/CREDITS b/CREDITS
> index cb02b9923a52..5df027e12ff7 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -1910,6 +1910,10 @@ S: 660 Harvard Ave. #7
> S: Santa Clara, CA 95051
> S: USA
>=20
> +N: Kukjin Kim
> +E: kgene@kernel.org
> +D: Samsung S3C, S5P and Exynos ARM architectures
> +
> N: Russell King
> E: rmk@arm.linux.org.uk
> D: Linux/arm integrator, maintainer & hacker
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4538378de6f5..c3976803057c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2375,7 +2375,6 @@ F:    sound/soc/rockchip/
> N:    rockchip
>=20
> ARM/SAMSUNG EXYNOS ARM ARCHITECTURES
> -M:    Kukjin Kim <kgene@kernel.org>
> M:    Krzysztof Kozlowski <krzk@kernel.org>
> L:    linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)=

> L:    linux-samsung-soc@vger.kernel.org
> @@ -15497,7 +15496,6 @@ F:    include/linux/clk/samsung.h
> F:    include/linux/platform_data/clk-s3c2410.h
>=20
> SAMSUNG SPI DRIVERS
> -M:    Kukjin Kim <kgene@kernel.org>
> M:    Krzysztof Kozlowski <krzk@kernel.org>
> M:    Andi Shyti <andi@etezian.org>
> L:    linux-spi@vger.kernel.org
> --=20
> 2.25.1
>=20
