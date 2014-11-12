From: Juergen Borleis <jbe@pengutronix.de>
Subject: Re: Samsung/S3C6410/Mini6410: how to handle NAND's "clock off"
Date: Wed, 12 Nov 2014 13:00:27 +0100
Message-ID: <201411121300.30286.jbe@pengutronix.de>
References: <201411111910.34231.juergen@kreuzholzen.de> <20141111184226.GH27002@pengutronix.de> <20141112091458.GM27002@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:55151 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752231AbaKLL7t convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Nov 2014 06:59:49 -0500
In-Reply-To: <20141112091458.GM27002@pengutronix.de>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Juergen Borleis <juergen@kreuzholzen.de>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Grant Likely <grant.likely@linaro.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>


On Wednesday 12 November 2014 10:14:58 Uwe Kleine-K=F6nig wrote:
> Hello again,
>
> [extending audience a bit]
>
> On Tue, Nov 11, 2014 at 07:42:26PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Tue, Nov 11, 2014 at 07:10:33PM +0100, Juergen Borleis wrote:
> > > Hi,
> > >
> > > the S3C2410 NAND driver [1] can still be used for NANDs attached =
to an
> > > S3C6410 SoC. But this driver has a "nice" feature called "clock o=
ff" to
> > > save some power while not in use. I tried it here on my Mini6410
> > > platform and it freezes the system.
> > >
> > > The clock tree is somehow:
> > >
> > > [...]
> > >   hclk                      4            4   133000000          0=
 0
> > >      hclk_mfc               0            0   133000000          0=
 0
> > >      hclk_mem0              2            2   133000000          0=
 0
> > >         mem0_srom           0            0   133000000          0=
 0
> > >         mem0_nfcon          1            1   133000000          0=
 0
> > >         mem0_onenand0       0            0   133000000          0=
 0
> > >         mem0_onenand1       0            0   133000000          0=
 0
> > >         mem0_cfcon          0            0   133000000          0=
 0
> > > [...]
> > >
> > > On the Mini6410 the "mem0_nfcon" clock is the only single user of=
 the
> > > "hclk_mem0". And this clock is required to keep the access to the
> > > external network device enabled. When the NAND driver disables it=
s
> > > clock "mem0_nfcon", the "hclk_mem0" gets also disabled because th=
ere is
> > > no consumer anymore. The next time the network driver tries to ac=
cess
> > > its device, the SoC freezes.
> >
> > Sounds like the network driver should hold a reference to hclk_mem0=
=2E
>
> After talking to J=FCrgen by phone, the solution that the dm9000 driv=
er
> should handle the clock sounds wrong. The clk in question is needed b=
y
> the SoC to operate the bus the dm9000 is connected to. So I think the
> right approach would include

I think we need the same here for the S3C6410 SoC, like the imx-weim dr=
iver is=20
for i.MX SoCs.

jbe

--=20
Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| Juergen Borleis =A0 =A0 =A0 =A0 =A0 =A0 |
Industrial Linux Solutions               =A0 =A0 =A0| Phone: +49-5121-2=
06917-5128 |
Peiner Str. 6-8, 31137 Hildesheim, Germany =A0 =A0| Fax: =A0 +49-5121-2=
06917-5555 |
Amtsgericht Hildesheim, HRA 2686 =A0 =A0 =A0 =A0 =A0 =A0 =A0| http://ww=
w.pengutronix.de/ =A0|
