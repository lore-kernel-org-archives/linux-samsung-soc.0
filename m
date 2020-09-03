Return-Path: <SRS0=oxPC=CM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E539CC433E2
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 20:08:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C775220897
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 20:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599163721;
	bh=VNQBiy+9hTVwRrEP9Lqn0yhiulQhOMN+3eYs5y17OSo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=uS3Bq/LHj3yp8lGQ485KZtk8pSkLW/Qo3Ium+wutJa7B2IUn3qKM2cEASLNDUBj57
	 3B0YcRwgVgyuDcg2Mm6F1ZD8f13uGQU4t1K3mYVWaejFZQ48QKuwwme65yKiMFB31h
	 LCZG2wM4pduuRDgqh1QHvVwIB2Jd+0Y+CCrMDDJo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728491AbgICUIl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Sep 2020 16:08:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:57180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728312AbgICUIl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 16:08:41 -0400
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65A31208FE
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2020 20:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599163720;
        bh=VNQBiy+9hTVwRrEP9Lqn0yhiulQhOMN+3eYs5y17OSo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fpu3+eIhqnPrgb0qkZaEvK3Kmu6p311u+wQxiizl/PBDQky26ZvdXEF9ZBBWJX790
         KQiAx25ql7TsaMgmfFnPlg+xYGZbmKisva1U51ZXi/PmbDdJ3jVQNYBbBEOzuUbsDI
         W4iLYZPfAEzOMG9cHh4+nZQsdoQ8fdBGp+++s/Tc=
Received: by mail-ej1-f46.google.com with SMTP id j11so5649986ejk.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Sep 2020 13:08:40 -0700 (PDT)
X-Gm-Message-State: AOAM530n2RN2eXdeFTyFNgv3h3CvG+oppVIom1g76wFvVFIsO6RkcaL0
        pJJtl8Q74sEPMOF1Atvg50Y87QxEHQq/A9cL6PA=
X-Google-Smtp-Source: ABdhPJyuDkfhPLPKz+PzRWR6ZZ6XjdtJBpFQ1L6Teu/datJrHcsDx/4D3LZlqVcdF89l0M1sqH04BmaIJmXbbK5x2pw=
X-Received: by 2002:a17:906:82d1:: with SMTP id a17mr3855109ejy.385.1599163718890;
 Thu, 03 Sep 2020 13:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 3 Sep 2020 22:08:27 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcJCfFL43OLXC_DAowU0o_jW2rZ7qX-m8ePcPEMo0PEgQ@mail.gmail.com>
Message-ID: <CAJKOXPcJCfFL43OLXC_DAowU0o_jW2rZ7qX-m8ePcPEMo0PEgQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] drm/exynos: Convert driver to drm bridge
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= 
        <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Cc:     dri-devel@lists.freedesktop.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, kernel@pengutronix.de,
        Laurent.pinchart@ideasonboard.com, narmstrong@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 3 Sep 2020 at 18:57, Michael Tretter <m.tretter@pengutronix.de> wrote:
>
> Hello,
>
> the Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
> i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
> the Exynos Decon. The driver for the LCDIF does not use the component
> framework, but uses drm bridges.
>
> This series converts the Exynos MIPI DSI into a drm bridge and makes it usable
> with such drivers. Although the driver is converted, it still supports the
> component framework API to stay compliant with the Exynos DRM driver.
>
> Unfortunately, I don't have any Exynos SoC to actually test the series.  I
> tested the driver with a few additional unfinished patches on the i.MX8M Mini
> EVK, but somebody should definitely verify that the driver is still working on
> Exynos hardware.

Hi Michael,

+Cc maintainers and folks in Samsung.

Please follow the script/get_maintainers.pl to get the list of
maintainers of the Exynos DRM drivers. First they could provide you
with testing, second they might be the people merging the driver.

Unfortunately I cannot provide proper testing as none of my boards
have a display attached. :)

Best regards,
Krzysztof
