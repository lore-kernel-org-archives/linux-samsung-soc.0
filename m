From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: Samsung/S3C6410/Mini6410: how to handle NAND's "clock off"
Date: Tue, 11 Nov 2014 19:42:26 +0100
Message-ID: <20141111184226.GH27002@pengutronix.de>
References: <201411111910.34231.juergen@kreuzholzen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:58222 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751184AbaKKSmq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Nov 2014 13:42:46 -0500
Content-Disposition: inline
In-Reply-To: <201411111910.34231.juergen@kreuzholzen.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Juergen Borleis <juergen@kreuzholzen.de>
Cc: linux-arm-kernel@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Ben Dooks <ben-linux@fluff.org>

On Tue, Nov 11, 2014 at 07:10:33PM +0100, Juergen Borleis wrote:
> Hi,
>=20
> the S3C2410 NAND driver [1] can still be used for NANDs attached to a=
n S3C6410
> SoC. But this driver has a "nice" feature called "clock off" to save =
some
> power while not in use. I tried it here on my Mini6410 platform and i=
t freezes
> the system.
>=20
> The clock tree is somehow:
>=20
> [...]
>   hclk                      4            4   133000000          0 0
>      hclk_mfc               0            0   133000000          0 0
>      hclk_mem0              2            2   133000000          0 0
>         mem0_srom           0            0   133000000          0 0
>         mem0_nfcon          1            1   133000000          0 0
>         mem0_onenand0       0            0   133000000          0 0
>         mem0_onenand1       0            0   133000000          0 0
>         mem0_cfcon          0            0   133000000          0 0
> [...]
>=20
> On the Mini6410 the "mem0_nfcon" clock is the only single user of the
> "hclk_mem0". And this clock is required to keep the access to the ext=
ernal
> network device enabled. When the NAND driver disables its clock "mem0=
_nfcon",
> the "hclk_mem0" gets also disabled because there is no consumer anymo=
re. The
> next time the network driver tries to access its device, the SoC free=
zes.
Sounds like the network driver should hold a reference to hclk_mem0. I
assume the system uses a device tree? This is the dm9000 driver? It
doesn't seem to use clk stuff, but it should be possible to add an
optional clk entry.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
