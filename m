From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: Samsung/S3C6410/Mini6410: how to handle NAND's "clock off"
Date: Wed, 12 Nov 2014 10:14:58 +0100
Message-ID: <20141112091458.GM27002@pengutronix.de>
References: <201411111910.34231.juergen@kreuzholzen.de>
 <20141111184226.GH27002@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:51285 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752214AbaKLJPj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Nov 2014 04:15:39 -0500
Content-Disposition: inline
In-Reply-To: <20141111184226.GH27002@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Juergen Borleis <juergen@kreuzholzen.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org

Hello again,

[extending audience a bit]

On Tue, Nov 11, 2014 at 07:42:26PM +0100, Uwe Kleine-K=F6nig wrote:
> On Tue, Nov 11, 2014 at 07:10:33PM +0100, Juergen Borleis wrote:
> > Hi,
> >=20
> > the S3C2410 NAND driver [1] can still be used for NANDs attached to=
 an S3C6410
> > SoC. But this driver has a "nice" feature called "clock off" to sav=
e some
> > power while not in use. I tried it here on my Mini6410 platform and=
 it freezes
> > the system.
> >=20
> > The clock tree is somehow:
> >=20
> > [...]
> >   hclk                      4            4   133000000          0 0
> >      hclk_mfc               0            0   133000000          0 0
> >      hclk_mem0              2            2   133000000          0 0
> >         mem0_srom           0            0   133000000          0 0
> >         mem0_nfcon          1            1   133000000          0 0
> >         mem0_onenand0       0            0   133000000          0 0
> >         mem0_onenand1       0            0   133000000          0 0
> >         mem0_cfcon          0            0   133000000          0 0
> > [...]
> >=20
> > On the Mini6410 the "mem0_nfcon" clock is the only single user of t=
he
> > "hclk_mem0". And this clock is required to keep the access to the e=
xternal
> > network device enabled. When the NAND driver disables its clock "me=
m0_nfcon",
> > the "hclk_mem0" gets also disabled because there is no consumer any=
more. The
> > next time the network driver tries to access its device, the SoC fr=
eezes.
> Sounds like the network driver should hold a reference to hclk_mem0.
After talking to J=FCrgen by phone, the solution that the dm9000 driver
should handle the clock sounds wrong. The clk in question is needed by
the SoC to operate the bus the dm9000 is connected to. So I think the
right approach would include

diff --git a/arch/arm/boot/dts/s3c6410-mini6410.dts b/arch/arm/boot/dts=
/s3c6410-mini6410.dts
index 57e00f9bce99..b5067e631216 100644
--- a/arch/arm/boot/dts/s3c6410-mini6410.dts
+++ b/arch/arm/boot/dts/s3c6410-mini6410.dts
@@ -55,9 +55,11 @@
 	srom-cs1@18000000 {
 		compatible =3D "simple-bus";
 		#address-cells =3D <1>;
 		#size-cells =3D <1>;
+		clock-names =3D "hclk-whatever";
+		clocks =3D <&no_idea_which_device MEM0_SROM>;
 		reg =3D <0x18000000 0x8000000>;
 		ranges;
=20
 		ethernet@18000000 {
 			compatible =3D "davicom,dm9000";

I don't think the simple bus has clock handling, and I'm not sure if
simple bus is intended to be too simple to handle that. Anyhow, it woul=
d
describe the hardware.
The next thing that will pop up once simple-bus (or a dedicated
whatever-bus) has clk-handling is power management. Does the bus notice
when all it's devices are suspended such that the bus driver can turn
off its clock?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
