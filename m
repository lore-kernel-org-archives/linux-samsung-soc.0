Return-Path: <SRS0=ZafQ=2O=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490A8C2D0D2
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Dec 2019 07:53:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 207222077B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Dec 2019 07:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577173989;
	bh=r/BxLHZ2kIL3z3M4NiqdWj2qJGId/jqvcT7kxFmG+Z0=;
	h=In-Reply-To:References:Cc:From:To:Subject:Date:List-ID:From;
	b=b0+Y69oZClfQBrm+Rc2TH/feoKzP7KuZs0WiloksvwENiAjj4cptEEEfq3yssRRZM
	 Jw6Zoz5XVBdc1dRO9O3qQ5cGVNY7wisJSlyXCoZ8G/3vr1j1OoK0YoHjD/kuHqpBBl
	 flbYgXPFQ7x6u8NcEIlEiyTpTDIzLarVuPml10X8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbfLXHxI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Dec 2019 02:53:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:44356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbfLXHxI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Dec 2019 02:53:08 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6BBAA2071A;
        Tue, 24 Dec 2019 07:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577173987;
        bh=r/BxLHZ2kIL3z3M4NiqdWj2qJGId/jqvcT7kxFmG+Z0=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=iNuCiFWaiV6/PKXahwve0YoTljS1WcMj4pkbmuO2Pydp/LEcGHM07AQCDBUfDSuIc
         skYY0cHB6xIPxu7+/UncYetR87s43DIWhY6Q9jUOhqMSIDVEymxF+6uPBQRYQYezoR
         XRYATdpLwKIbvMmBxuWgHDCh0Fa+t6pa8AhXVxpo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f4f23b53-4eae-de3e-c8b2-099909522ce2@samsung.com>
References: <CGME20191216131423eucas1p2162d6bf0a870357be9f0ab308641015b@eucas1p2.samsung.com> <20191216131407.17225-1-m.szyprowski@samsung.com> <f4f23b53-4eae-de3e-c8b2-099909522ce2@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: samsung: exynos5420: Keep top G3D clocks enabled
User-Agent: alot/0.8.1
Date:   Mon, 23 Dec 2019 23:53:06 -0800
Message-Id: <20191224075307.6BBAA2071A@mail.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2019-12-19 02:05:04)
> On 12/16/19 14:14, Marek Szyprowski wrote:
> > In Exynos542x/5800 SoCs, the G3D leaf clocks are located in the G3D pow=
er
> > domain. This is similar to the other hardware modules and their power
> > domains. However there is one thing specific to G3D clocks hierarchy.
> > Unlike other hardware modules, the G3D clocks hierarchy doesn't have any
> > gate clock between the TOP part of the hierarchy and the part located in
> > the power domain and some SoC internal busses are sourced directly from
> > the TOP muxes. The consequence of this design if the fact that the TOP
> > part of the hierarchy has to be enabled permanently to ensure proper
> > operation of the SoC power related components (G3D power domain and
> > Exynos Power Management Unit for system suspend/resume).
> >=20
> > This patch adds an explicit call to clk_prepare_enable() on the last MUX
> > in the TOP part of G3D clock hierarchy to keep it enabled permanently to
> > ensure that the internal busses get their clock regardless of the main
> > G3D clock enablement status.
>=20
> > ---
> > diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung=
/clk-exynos5420.c
> > index 3a991ca1ee36..c9e5a1fb6653 100644
> > --- a/drivers/clk/samsung/clk-exynos5420.c
> > +++ b/drivers/clk/samsung/clk-exynos5420.c
>=20
> > @@ -1646,6 +1647,13 @@ static void __init exynos5x_clk_init(struct devi=
ce_node *np,
> >                                    exynos5x_subcmus);
> >       }
> > =20
> > +     /*
> > +      * Keep top part of G3D clock path enabled permanently to ensure
> > +      * that the internal busses get their clock regardless of the
> > +      * main G3D clock enablement status.
> > +      */
> > +     clk_prepare_enable(__clk_lookup("mout_sw_aclk_g3d"));
> > +
> >       samsung_clk_of_add_provider(np, ctx);
> >  }
>=20
> It's a bit unfortunate we don't store that clock in the driver internally,
> which would let us avoid the __clk_lookup() call. I can't come up with any
> simple alternative though so let's apply it for now.

Yes it would be better to not use __clk_lookup(). I'll apply it for now
but please avoid it somehow in a future patch.

