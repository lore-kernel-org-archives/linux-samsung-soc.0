From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 11/11] ARM: S5P6440: Remove redundant defines
Date: Thu, 13 May 2010 03:02:36 +0100
Message-ID: <20100513020236.GS6684@trinity.fluff.org>
References: <1273710481-14856-1-git-send-email-kgene.kim@samsung.com> <AANLkTimTm_Vxvb2xvJnVxTxUaYguFgGeaWGypzA1yjwM@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:41939 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754723Ab0EMCCj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 May 2010 22:02:39 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTimTm_Vxvb2xvJnVxTxUaYguFgGeaWGypzA1yjwM@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Thu, May 13, 2010 at 10:49:29AM +0900, Jassi Brar wrote:
> On Thu, May 13, 2010 at 9:28 AM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > From: Thomas Abraham <thomas.ab@samsung.com>
> > --- a/arch/arm/mach-s5p6440/clock.c
> > +++ b/arch/arm/mach-s5p6440/clock.c
> > @@ -357,121 +357,121 @@ static struct clk init_clocks_disable[] =3D=
 {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.parent =A0 =A0 =A0 =A0 =3D &clk_hcl=
k.clk,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0 =3D s5p6440_=
mem_ctrl,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D S5P_CLKCO=
N_MEM0_HCLK_NFCON,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 2),
> Peculiar. I have never seen defines dropped in favor of magic numbers=
=2E

I know it seems a little odd at first, but people seem to be clinging
on to writing it down in a header file and then using it once as some
form of high law of programming. Whilst talking with Kukjin and others
last year and looking at this, we came to the following conclusions
about single-use defines:

1) It takes two lines of code, where one is sufficient.

2) You only have to look in the relevant .c file to find out the
   value instead of tracking down a header. This makes it easier
   to verify the value against the manual and easier to compare
   against simialr code.

Thus ends today's public service broadcast.

--=20
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
