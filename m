Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48316C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 31 Mar 2022 10:19:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbiCaKVM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 31 Mar 2022 06:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234582AbiCaKVL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 06:21:11 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE4B4667B;
        Thu, 31 Mar 2022 03:19:23 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 2E1BF5C01B3;
        Thu, 31 Mar 2022 06:19:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 31 Mar 2022 06:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; bh=aIIdikQ6BinNUj
        lLTKP7oRxwmVl6g9SbKG/hAgruEic=; b=HxlxHD+e8wxAkM73dNVXPWGE3qDmdG
        5ffDJI3vQHUykPaDNwy59OCk4u1beSzwPuVmOLcu/rwpqoG4nx06YH9VhfDCHNZ6
        +ohz0efnEiHKbpfpvOVFZc6lXJC5DuFble/X2Kdg8J2QCFOaB5Vyb5B6qYmwlFL/
        MVp2v8N5vaLTK/7s8L8r4X4lF/eUQJaUl/set5DUL0yIdCNxr+xkx1KE/QvGknMj
        tKsmi3IthtBqNRvzJsHesxwD4T87oshC+wMBiD7+KlxjIoV4uWAkGINvCVO4yka3
        Jh+Uo94ekyypEprG5F4Ax+nPTRQ+S2nVH9lpmt3mlH935+qwRQbwhaVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=aIIdikQ6BinNUjlLTKP7oRxwmVl6g9SbKG/hAgruE
        ic=; b=QKfkxoWADkg9OGe5Fm1C5or+nxS8ydkHOK8CimajDNfRHP3qfPWAujS9G
        MjrR2+kk6we4txWlkVX1GMN49+gByYXhSzU6DKlBeVcFVrk4JB+31IvEdj+y1lDt
        yo3K/WnSKCLLweeIq1FcrymX1I40jQ9uEJil3agdHYLtRSUdcT0ZMdKIrMu3tON8
        1nqi3zVaKky3bLkTwdF2QnlzMkbfA8jGBtFnvvZ79vfh5MlSA62or582I8EvnaDw
        y5PJjLlYm/qRAuwvp0NjhG8Pp/+DYbP7JkNhYJR+Bk9scLAeWn9qnWWP9w5mEjvN
        lwRUJQir2P6lkCa5D0wfMdwAj+5mA==
X-ME-Sender: <xms:KoBFYiz5CijH9U9O6rXJywNXtUVO9PrSwQFDY0Dc74KqWCgvrMSApw>
    <xme:KoBFYuS7Dw2nDPgvLECIUSOG5OKxPN3Gqh2fa4aSAdv4i8kjcFo1vHXdVXuwd5K1f
    6h-51JpwrHlLj9lI9Q>
X-ME-Received: <xmr:KoBFYkUwEpgAXkpS6LuC5_kzeOdjeIZwlV7umUD38mvuVFJBMG3VqgimOArPcvHTcjWqEo00zb2JONKPBdd9KPcfycnSd6yKa8wUR54>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeehledvhfeklefgveelkeeludevffethfdukedvfffhhfegfeeugfehgeef
    jeevtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KoBFYoj3m7HQ83GLNhSWdcxMydurXjmV14AsrRphh1blxxz3fkKTmg>
    <xmx:KoBFYkBZcB22RZCTD1u5ghaZ7WFCLZqhTYq5pZ3XdlJdiIHWTNHKcg>
    <xmx:KoBFYpIc7MAfpzwy1nuttYOtJZP3a23F3gydzX_2bms6Cn45Kpn50Q>
    <xmx:K4BFYj5SUJfBWhO1wf3oJTr7KXwhJi6DhiNFqsbqxm2B6vIRyUXL7A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 06:19:21 -0400 (EDT)
Date:   Thu, 31 Mar 2022 12:19:19 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Message-ID: <20220331101919.urqhi2cspyjfthlj@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
 <7465a7dc-c45e-2612-4c39-d15eceb9b75c@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7465a7dc-c45e-2612-4c39-d15eceb9b75c@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 31, 2022 at 11:56:51AM +0200, Marek Szyprowski wrote:
> Hi,
>=20
> On 30.03.2022 10:47, Maxime Ripard wrote:
> > On Wed, Mar 30, 2022 at 10:06:13AM +0200, Marek Szyprowski wrote:
> >> On 25.03.2022 17:11, Maxime Ripard wrote:
> >>> While the current code will trigger a new clk_set_rate call whenever =
the
> >>> rate boundaries are changed through clk_set_rate_range, this doesn't
> >>> occur when clk_put() is called.
> >>>
> >>> However, this is essentially equivalent since, after clk_put()
> >>> completes, those boundaries won't be enforced anymore.
> >>>
> >>> Let's add a call to clk_set_rate_range in clk_put to make sure those
> >>> rate boundaries are dropped and the clock drivers can react.
> >>>
> >>> Let's also add a few tests to make sure this case is covered.
> >>>
> >>> Fixes: c80ac50cbb37 ("clk: Always set the rate on clk_set_range_rate")
> >>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >> This patch landed recently in linux-next 20220328 as commit 7dabfa2bc4=
80
> >> ("clk: Drop the rate range on clk_put()"). Sadly it breaks booting of
> >> the few of my test systems: Samsung ARM 32bit Exynos3250 based Rinato
> >> board and all Amlogic Meson G12B/SM1 based boards (Odroid C4, N2, Khad=
as
> >> VIM3/VIM3l). Rinato hangs always with the following oops:
> >>
> >> --->8---
> >>
> >> Kernel panic - not syncing: MCT hangs after writing 4 (offset:0x420)
> >> CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.17.0-rc1-00014-g7dabfa2bc4=
80
> >> #11551
> >> Hardware name: Samsung Exynos (Flattened Device Tree)
> >>   =A0unwind_backtrace from show_stack+0x10/0x14
> >>   =A0show_stack from dump_stack_lvl+0x58/0x70
> >>   =A0dump_stack_lvl from panic+0x10c/0x328
> >>   =A0panic from exynos4_mct_tick_stop+0x0/0x2c
> >> ---[ end Kernel panic - not syncing: MCT hangs after writing 4
> >> (offset:0x420) ]---
> >>
> >> --->8---
> >>
> >> Amlogic boards hang randomly during early userspace init, usually just
> >> after loading the driver modules.
> >>
> >> Reverting $subject on top of linux-next fixes all those problems.
> >>
> >> I will try to analyze it a bit more and if possible provide some more
> >> useful/meaning full logs later.
> > I'm not sure what could go wrong there, but if you can figure out the
> > clock, if it tries to set a new rate and what rate it is, it would be
> > awesome :)
>=20
> So far I've noticed that the problem is caused by setting rate of some=20
> clocks to zero. The following patch fixes my issues:
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 32a9eaf35c6b..39cab08dbecb 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2201,6 +2201,9 @@ static int clk_core_set_rate_nolock(struct=20
> clk_core *core,
>  =A0=A0=A0=A0=A0=A0=A0 if (!core)
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;
>=20
> +=A0=A0=A0=A0=A0=A0 if (req_rate =3D=3D 0)
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;
> +
>  =A0=A0=A0=A0=A0=A0=A0 rate =3D clk_core_req_round_rate_nolock(core, req_=
rate);
>=20
>  =A0=A0=A0=A0=A0=A0=A0 /* bail early if nothing to do */
> --
>=20
> I will soon grab the call stack and relevant clock topology show how the=
=20
> rate is set to zero.

The most likely thing to happen is that clk_set_rate_range will call
clk_core_set_rate_nolock with clk_core->req_rate, and at the time
req_rate is at 0.

And I'm a bit puzzled at this point, the only reason I could spot for
req_rate to be at 0 is that it's an orphan clock that doesn't have its
parent yet, but during userspace init I'd expect all the clocks to have
been registered.

Can you check if that clock is still orphan?

Maxime
