From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 0/4] Adding usb2.0 host-phy support for exynos5250
Date: Tue, 6 Nov 2012 15:14:54 +0200
Message-ID: <20121106131453.GL11931@arwen.pp.htv.fi>
References: <1351518160-22369-1-git-send-email-gautam.vivek@samsung.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bZ2MuwyI/0uB8yuJ"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1351518160-22369-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--bZ2MuwyI/0uB8yuJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 29, 2012 at 07:12:36PM +0530, Vivek Gautam wrote:
> This patchset is based on the work by Praveen Paneri for
> samsung-usbphy driver:
> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/12653
>=20
> Changes from v2:
>  - Using "EXYNOS5_PHY_" as common prefix along with exact names for
>    PHY SFRs for register definitions
>  - Using register names with bit macros to make things more clear.
>  - Removed parentheses around 0x230 in definition for EXYNOS5_USB_CFG
>    in [patch 2/4 v2].
>=20
> Tested on smdk5250 target with usb-next branch along with arch patches
> for exynos5250:
> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13042
> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13048
>=20
> Vivek Gautam (4):
>   usb: phy: samsung: Add host phy support to samsung-phy driver
>   ARM: Exynos5250: Enabling samsung-usbphy driver
>   USB: ehci-s5p: Add phy driver support
>   USB: ohci-exynos: Add phy driver support

I really don't know what to do with this series. I know it depends on
the other PHY changes which I have in my queue, but it touches too much
arch specific code, plus the USB Host code which I don't maintain.

On top of all that, I have no platform to test these patches, which
makes me even more worried about signing off under this series ;-)

Would it be ok if we delay this to v3.9 ? At least the dependency with
other PHY changes would be dropped by then.

--=20
balbi

--bZ2MuwyI/0uB8yuJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQmQ1NAAoJEIaOsuA1yqRE5g8P/1rwduvmHJ14dtYa4pzgb8o4
ndcpTQBG2zcnEJlMfbuw0x8s/M9CvAh9NJ/HGatVA6VHCPbrm9rMMmbktDjF2uWB
a4OCVctNGVJZjTrps1cYa1JlVDfTOJwjLhobM4gUJPSINAgKKhi9J3nNPh4Z0J4F
SqSFJIXM+4qDoxAoYkx32x+L2qB60/l68R8pIGbotw6C0ycnrhKxJDntAZWdjYiV
hyvsM1EcVxA1DrvSa68h84fId6aQmWL4uQMVs8LOv3kjkgFYmlk9tgNUDTDhWTIj
XD8csqh/pmocrvxKNW5IcjLsNat1X3M3I59GIZz7mf1Adxyo7qwkKBf21vmfJkRb
FwPM11ExVhg5FQaKSCIhwRYDpEyNEphARaWScbd9wvYQkuLLKFrw/BxguU2EdD6r
/VBKiviaSlT8ujfKkrEMFHC4nd7kEel0qCo1LmCT4Z0e9eDvxojNjuTsF9i/B0W9
rnQmErN3pw5I2NJG5JQkCUUruKQcnzVRhMUvGG40QJk+Pn41Qi6AIVRzCNSKJsD9
H7Qk+P0ytEda1ycoTKIYOl9IGSqjejBbTCuym5seIXA1oQii6NOJYJM1cSaJ++af
VoBelt3iskUqBenqLvVOVccrL+dL6G60e1IlW2ECJCMOzr4SdOYokPzjNstdVJNE
umQN1lxvrWxyyVHahVw8
=7T95
-----END PGP SIGNATURE-----

--bZ2MuwyI/0uB8yuJ--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
