From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH] usb: phy: samsung: let it be built as a module
Date: Wed, 27 Feb 2013 14:13:34 +0200
Message-ID: <20130227121334.GF8016@arwen.pp.htv.fi>
References: <CAFp+6iEfVSbyGVNhDFc2wW7w=ZMGwVpcc28GAGOgHffCWQRLMQ@mail.gmail.com>
 <1361962133-21296-1-git-send-email-balbi@ti.com>
 <CAFp+6iHx0-UX4g3BVwFM1V=4JuJHe0VRE=CTLmEY5qEt1YqNjg@mail.gmail.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pcjGMRtmGLNVN1Bo"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:37858 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755137Ab3B0MNp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 07:13:45 -0500
Content-Disposition: inline
In-Reply-To: <CAFp+6iHx0-UX4g3BVwFM1V=4JuJHe0VRE=CTLmEY5qEt1YqNjg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautamvivek1987@gmail.com>
Cc: Felipe Balbi <balbi@ti.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, kgene@kernel.org, linux-samsung-soc@vger.kernel.org

--pcjGMRtmGLNVN1Bo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 27, 2013 at 05:31:53PM +0530, Vivek Gautam wrote:
> Hi Felipe,
>=20
>=20
> On Wed, Feb 27, 2013 at 4:18 PM, Felipe Balbi <balbi@ti.com> wrote:
> > There's no reason not to allow samsung PHY
> > drivers be built as modules. This patch changes
> > Kconfig to allow that.
> >
> > Signed-off-by: Felipe Balbi <balbi@ti.com>
> > ---
> >
> > Hi,
> >
> > I will take your patches but I'm planning to add this on top
> > as there is no reason not to allow these drivers being built
> > as modules.
> >
>=20
> aargh !! my bad :-(
> actually missed exporting the symbols in drivers/usb/phy/samsung-usbphy.c
> Getting compile errors.
> Shall i just update the patch [PATCH v5 0/2] Adding USB 3.0 DRD-phy
> support for exynos5250
> or send a separate patch on top so that you can squash this change
> along with. ;-)

there's still time to update the original. I'll drop all 3 patches for
now (both of yours and mine).

cheers

--=20
balbi

--pcjGMRtmGLNVN1Bo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRLfhtAAoJEIaOsuA1yqREhzoP+gMrjk+DFSPyTurPMF4PW/43
zG8JfcvKwsUCV5KXueqh5mVLzVXUP3VmuZPfN6A5WTMoktPgNBDp07jJPufi17t5
a+A/Dzb/CC85GR99mFtwUM3hM7ZHmZNmQll1MxRYQc9rASKuPsDqwQq+IGV7OBWM
uNHBfkzqSen6o4W/NSDQ8c1ednaxFW3g5o4Kf7TxLRiVtGTU3Pq1pi9veKrGTgPf
hS6iRH+nELVa4Gq87pllsf4s+UtKCIiTBIivw2OInk2xSFgL2J+imAaHKUBUQm2j
t6gjHxjXNHqQC1VkxC44tk23ReWSNzE9rVWSEL94Ac4DjGLJBYatmxxs4iAFmQmb
NhZPtYkYoNFFi2mknZtcN0BHiPtp9KfbZi7nnbnc7Ybv0Ayg3MUgbyAZbMkdTCiK
m+7EyjSv9sJlKl+JzIFat0m6Sn9OMgCxgbH1p60WFgW721vP1iQXYH2kUme6pSuv
TC1rYbONoxjwz1JProp5BTq1RVCn9GQdJggqCG+Tvl8S3qohGi/hEUAVg6ffj4dC
c/PBKo5G3MJJNNa/O/5EX+bO5Jgm7ZSsOS+bMWWnXLEBVnTkKOTsUlJ//Zc4h2Lo
t5BDpRG+XBK6dmpeXMMV4y7qJAbHBzjwQcemXfot3Rxwjz9q6koBE1nZn96dvUMK
8PLgXRWty9zoS8neGldo
=WDyE
-----END PGP SIGNATURE-----

--pcjGMRtmGLNVN1Bo--
