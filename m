From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 1/2] ARM: dts: Add DT changes for display on snow
Date: Thu, 28 Aug 2014 15:10:18 +0200
Message-ID: <20140828131017.GD14388@ulmo>
References: <1409150908-12801-1-git-send-email-ajaykumar.rs@samsung.com>
 <20140827150146.GB9737@leverpostej>
 <CAEC9eQMKfso-rmMdqyDZeCdaxf21O1fqN6Z2YrS=njqGHh5d5Q@mail.gmail.com>
 <20140828091509.GA14650@leverpostej>
 <CAEC9eQN+EJmrG70O+2Sg5GD0OHudhqo5beGDN8K4_kmOKKPOmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="twz1s1Hj1O0rHoT0"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:57923 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750754AbaH1NKY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Aug 2014 09:10:24 -0400
Content-Disposition: inline
In-Reply-To: <CAEC9eQN+EJmrG70O+2Sg5GD0OHudhqo5beGDN8K4_kmOKKPOmw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "kgene.kim@gmail.com" <kgene.kim@gmail.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "seanpaul@google.com" <seanpaul@google.com>, "jg1.han@samsung.com" <jg1.han@samsung.com>, "joshi@samsung.com" <joshi@samsung.com>, "prashanth.g@samsung.com" <prashanth.g@samsung.com>


--twz1s1Hj1O0rHoT0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2014 at 03:04:32PM +0530, Ajay kumar wrote:
> On Thu, Aug 28, 2014 at 2:45 PM, Mark Rutland <mark.rutland@arm.com> wrot=
e:
> > On Thu, Aug 28, 2014 at 06:34:33AM +0100, Ajay kumar wrote:
> >> On Wed, Aug 27, 2014 at 8:31 PM, Mark Rutland <mark.rutland@arm.com> w=
rote:
> >> > On Wed, Aug 27, 2014 at 03:48:27PM +0100, Ajay Kumar wrote:
> >> >> Add DT nodes for ptn3460 bridge chip and panel.
> >> >> Add backlight enable pin and backlight power supply for pwm-backlig=
ht.
> >> >> Also add bridge phandle needed by dp to enable display on snow.
> >> >>
> >> >> Note that, snow doesn't support "chunghwa,claa101wb01" panel,
> >> >> but still we choose to reuse the binding since "chunghwa,claa101wb0=
1"
> >> >> has similar LCD timings.
> >> >
> >> > What does it actually have?
> >> >
> >> > It's fine to have "chunghwa,claa101wb01" as a fallback but we should
> >> > have an identifier for the actual display, too.
> >> Actual display used is "AUO,B116XTN0", for which no data currently exi=
sts
> >> in panel file. Instead of adding a new panel_desc for B116XTN0,
> >> why not we reuse existing ones? what is the "identifier" you are talki=
ng about?
> >
> > The compatible string.
> >
> > So in the dts we'd have compatible =3D "au0,b116xtn0", "chunghwa,claa10=
1wb01";
> Sorry, hardware engineer says actual LCD name is "auo,b116xw03".
>=20
> > That way if we need specific data we can add it later.
> I think we can add a new panel_desc for "auo,b116xw03".
> Because its actual LCD dimension is 256x144, but "chungwa, claa101wb01" h=
as
> LCD dimension 223x125.
> What is Thierry's opinion on adding this new LCD?

I think you should simply add a new panel_desc for the panel. It may use
similar timings, but it's likely not "compatible" in the way required by
device tree. As you say, dimensions are different and those may have an
influence on the DPI setting. There's really no reason why this should
share the panel_desc with another panel.

Thierry

--twz1s1Hj1O0rHoT0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT/yo5AAoJEN0jrNd/PrOhBCUP+gPv9CAgJQ5q7UP79WBZDrsq
EOy3lNB5uM/hfb7xMA/n6sUDGKSgFMzfy5ek3YLP80QyXYaGeNb4cTdXHeOCGEPN
mvLz9LTSBU5poiuDb0T2C0+NeE3zZD1p5sA3F5WyFFDvE6xqkHQm5czv8DGcbiYP
qpbe/L50mOAsOSxMlfMA4eVnPolNE9jrq1BO22EqY/Xhyri/PfDGZtUBaRsypxPf
Zs9NvbI28TelIKuoIcM+Wi2RW62HwyLZ/g//6dvyj8ANGkA0Mt0xPrWnlaFo7Qsr
GQN8xW5roD1uIRG1aoNgvnSlKgqTyQEXoE81T6ReWXRgDR8axhtdcUtSgo4fq4L5
GhAko8DC6WYS0EaSKVEMPN1ltQS8LSFX7tPhI3RGsruyU6qf1rDbtX/fuj+1RcgT
+67YMIoXDXIHa2ZQQyGBeLOVUdS7IoHYf7+lOJVMc6JrqMQxZdu8J/wG1/Xj6xuA
Rn+bg+PKwrCJmfXfuGokAMJ8n3tYbW7LgAbAcyOpGQ3qKGCytvUTSdeF/EOlNkUw
9nzblhU/TdnLLX3DQHJOrfmKEE8ZGD8Iik7E3i7XFPJDlgVpXKk299gvAiKHwfm5
7UGhFchM7EBi0S0UHB2BPFh7Q5pbPjPYaezTVyHdiSakkhnQ0Q2MscIRQmdvs4z+
2qsusVxRfqMgqgLAS1rX
=9+U6
-----END PGP SIGNATURE-----

--twz1s1Hj1O0rHoT0--
