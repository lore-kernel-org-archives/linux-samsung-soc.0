From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 0/4] Adding usb2.0 host-phy support for exynos5250
Date: Wed, 31 Oct 2012 16:27:36 +0200
Message-ID: <20121031142736.GK10998@arwen.pp.htv.fi>
References: <1351518160-22369-1-git-send-email-gautam.vivek@samsung.com>
 <20121031140723.GF10998@arwen.pp.htv.fi>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tTtjoeSQr0V4EVgS"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121031140723.GF10998-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--tTtjoeSQr0V4EVgS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 31, 2012 at 04:07:23PM +0200, Felipe Balbi wrote:
> Hi,
>=20
> On Mon, Oct 29, 2012 at 07:12:36PM +0530, Vivek Gautam wrote:
> > This patchset is based on the work by Praveen Paneri for
> > samsung-usbphy driver:
> > http://comments.gmane.org/gmane.linux.kernel.samsung-soc/12653
> >=20
> > Changes from v2:
> >  - Using "EXYNOS5_PHY_" as common prefix along with exact names for
> >    PHY SFRs for register definitions
> >  - Using register names with bit macros to make things more clear.
> >  - Removed parentheses around 0x230 in definition for EXYNOS5_USB_CFG
> >    in [patch 2/4 v2].
> >=20
> > Tested on smdk5250 target with usb-next branch along with arch patches
> > for exynos5250:
> > http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13042
> > http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13048
> >=20
> > Vivek Gautam (4):
> >   usb: phy: samsung: Add host phy support to samsung-phy driver
> >   ARM: Exynos5250: Enabling samsung-usbphy driver
> >   USB: ehci-s5p: Add phy driver support
> >   USB: ohci-exynos: Add phy driver support
>=20
> you should join forces with Praveen Paneri so you guys have a single PHY
> code.
>=20
> (I haven't fully read your patches, so apologize if what I'm saying is
> already taken care of)

nevermind this comment, now I read more carefully :-)

--=20
balbi

--tTtjoeSQr0V4EVgS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQkTVYAAoJEIaOsuA1yqREU/YP+QG68FxaPPs/LoRZIGG5dEOQ
8nHg9bw/d/pE3rZc7yK7uYNPgJymMcUmayQMe4N9uNtsSk275tnKH5JkAlcpDYLu
fhWV0pIJdD51PilcmWXG6/gZlDbswXCUuaYva/VxS4rgPiAPT0JNC9+EP+QKwbc0
8TdmjTrqxpR+AjwPxCDum7tam5/xzaYemmLiiSdWELZE1nTRyPQWQDQXBLGG3erq
m01hCRg5DnSkxRvg3Up2b0C1tXzKeexjtDbFrqukY0Kq6wLXvqdbx8ELaZkPloNS
pM4oiEO8BcWnHH0FyCFZ3JLl4MfRsn6PQ1rJBOZh2o3eaUkD478Xd6HAB8uCUpdX
icMPw2vJmFQe6Sbh6KgJoVdmxlKI0zOrw5rKVnZj7Sw3ymNqFidRh0ao91rKN3FV
gw3HmE7N0Gwj53B5VlZscl9AdlRvNUGevZkx2IoUKEF+DrHHOAdN+nVvSuozVnHV
hif3dha62MOnki5cKDmnJgEyNcIBs2itlp3gbKrzcbf7Z0PDdrZuaFOgZpBdRZXf
/eG+4eSlV8bUUDWxKEFLCunadvt7zbEYjnYrZuOTUHmaCOCuwnAjXr1aqvhvhvmG
oOMw37ukO0i435JvRPKZzRKJ6NqMfozNh4Fwh5PTxZ8+kHhlnWzMl6NUfsai4+v5
xWHh7edlCQyrcuGUnWt5
=PnuF
-----END PGP SIGNATURE-----

--tTtjoeSQr0V4EVgS--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
