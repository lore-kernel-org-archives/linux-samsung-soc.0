Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEBEC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 21:40:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99D646109E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 21:40:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234108AbhJNVm0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Oct 2021 17:42:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:41554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232249AbhJNVmZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 17:42:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C61361041;
        Thu, 14 Oct 2021 21:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634247620;
        bh=i03ogI8uLMCOusZcFQNAgTcrdkd2jubSzNvAHm4eGDo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mxAua16kNAiqmfFDIccxSVPUbhGt+j5uWyjU+1FZQCUcob94vIou1VilExBf3X5OP
         V9vNPEPeFIX0DP4hoUO9ntvuTakXPgjUjMfkomfJeSN2CbCZi1q8RakAMJfjpXrACB
         rXjwaKOnoYvK9ZbkhSaBPa3lkvJ69KOr6TZGlbEpXSCdRBByZYXswHC0VN4lyPT/IX
         wnCyWa0/vaNwcX/xg3/UCi35E0FmoEZVT0J7nuJqShhsYF7XG1ltf9FsYFIbY9Ewdl
         IvqAcEZ7YdG2Wnz4GaDb1ta5vye8p6WtZ+xM6Ra81TwlCayf9qNDaeTUQ0MdQitiv/
         x95fTAyMLiF5g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CABYd82a7G7jAOMr=yjpkG6sbH+g0-r36NKSBwVEDZeEthuTTLA@mail.gmail.com>
References: <20211013221021.3433704-1-willmcvicker@google.com> <20211013221021.3433704-2-willmcvicker@google.com> <163417617897.936110.4798836682696423903@swboyd.mtv.corp.google.com> <CABYd82a7G7jAOMr=yjpkG6sbH+g0-r36NKSBwVEDZeEthuTTLA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] [RFT] clk: samsung: add support for CPU clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>, Cc:
        Android Kernel <kernel-team@android.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Will McVicker <willmcvicker@google.com>
Date:   Thu, 14 Oct 2021 14:40:18 -0700
Message-ID: <163424761868.1688384.7017177221097736499@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Will McVicker (2021-10-14 12:35:57)
> On Wed, Oct 13, 2021 at 6:49 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Will McVicker (2021-10-13 15:10:19)
> > > diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-=
cpu.c
> > > index 00ef4d1b0888..b5017934fc41 100644
> > > --- a/drivers/clk/samsung/clk-cpu.c
> > > +++ b/drivers/clk/samsung/clk-cpu.c
> > > @@ -469,3 +469,29 @@ int __init exynos_register_cpu_clock(struct sams=
ung_clk_provider *ctx,
> > >         kfree(cpuclk);
> > >         return ret;
> > >  }
> > > +
> > > +void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
> > > +               const struct samsung_cpu_clock *list, unsigned int nr=
_clk)
> > > +{
> > > +       unsigned int idx;
> > > +       unsigned int num_cfgs;
> > > +       struct clk *parent_clk, *alt_parent_clk;
> > > +       const struct clk_hw *parent_clk_hw =3D NULL;
> > > +       const struct clk_hw *alt_parent_clk_hw =3D NULL;
> > > +
> > > +       for (idx =3D 0; idx < nr_clk; idx++, list++) {
> > > +               /* find count of configuration rates in cfg */
> > > +               for (num_cfgs =3D 0; list->cfg[num_cfgs].prate !=3D 0=
; )
> > > +                       num_cfgs++;
> > > +
> > > +               parent_clk =3D __clk_lookup(list->parent_name);
> >
> > Please stop using __clk_lookup()
>=20
> Thanks, I believe I have a way around this. I'll fix this up in the
> follow-up version.

Great!

>=20
> >
> > > +               if (parent_clk)
> > > +                       parent_clk_hw =3D __clk_get_hw(parent_clk);
> > > +               alt_parent_clk =3D __clk_lookup(list->alt_parent_name=
);
> >
> > Can the DT binding be updated?
>=20
> Are you referring to removing alt_parent and just adding it as another
> parent clock?
>=20

I was wondering if this is an external clk that feeds into here or if it
is all internal to the clk controller. It sounds like it's all internal
to the clk controller? In which case a binding update isn't needed.
