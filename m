From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [RESEND PATCH v9 0/2] usb: phy: samsung: Introducing usb phy
 driver for samsung SoCs
Date: Wed, 27 Feb 2013 10:33:23 +0200
Message-ID: <20130227083323.GJ8016@arwen.pp.htv.fi>
References: <1358499623-13901-1-git-send-email-p.paneri@samsung.com>
 <20130227081521.GG8016@arwen.pp.htv.fi>
 <CAFp+6iGx1z9BcE3nLTVvOMG6VWVuYhDuKm5wu3DtbL8M1pfUtg@mail.gmail.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5603407113321521235=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAFp+6iGx1z9BcE3nLTVvOMG6VWVuYhDuKm5wu3DtbL8M1pfUtg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============5603407113321521235==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJFRpmOek+ZRSQoz"
Content-Disposition: inline

--IJFRpmOek+ZRSQoz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 27, 2013 at 02:00:25PM +0530, Vivek Gautam wrote:
> Hi Balbi,
>=20
>=20
> On Wed, Feb 27, 2013 at 1:45 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> > Hi,
> >
> > On Fri, Jan 18, 2013 at 02:30:21PM +0530, Praveen Paneri wrote:
> >> Changes from v8:
> >> Resending this patch series after rebasing to the latest usb-next bran=
ch.
> >> Rewording inline comments for better readability.
> >> Removed IS_ENABLED(CONFIG_OF) as pdev->dev.of_node is enough to check =
for dt support.
> >> Using of_match_ptr to add of_match_table to platform_driver structure.
> >> Removed unnecessary variables.
> >
> > trying applying these but it doesn't apply unfortunately.
> >
>=20
> Already present in 3.8.0 ? ;-)

heh, my bad. For whatever reason it was still marked as unread.

--=20
balbi

--IJFRpmOek+ZRSQoz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRLcTTAAoJEIaOsuA1yqREjhcP+QEyc+zC9ICrfwx1W9ussU9q
RhVUqht3OSAWOq+3+s1nTp6uG9UYsNaLfLoBUQ6Od4Rj/hhIXa+09+Bs/Mj1+FZz
dMtP8HeURVfW9jIZ8YZtWqykGJ/XRsBmTKd+05BMP/FE9+aUpU2VYDMPtBDC1Ubu
IPErxOfpxXOZc1bVecOyzD7OX0e3ggGeECmTEG+eu8dFaBAEq+V/BN7oFL3u2bu4
wFYp19XgSM0JsVdrxfapg5Yl+bXlpvt82tC8x5rLkI8WmK09n0GszTb/QmeI9XkL
jKi0E1lRZa5cW90sxDCs/Wdb0pWBN3Zbw8uhwPLkFV1ZFNj5J7ulHz88+TZwdwGP
hkgaZi6PbO4dcH4ZFJFoePuIMUFiKFQVAQmmuPmE7pN179r+NCINOoL2PbRGTrfP
u81Pt5pgnbF9QllbdQbO8GhvptZpp/cNuoLkMhdJ7+biI6vR744ZTF3yV6c/rW5Z
fGZISnSvV4MXWewXA4uXJsFlID+8ywHHToW1wEs69UZdudmwu87Ob/M4rsJiqUck
5YQkWzIQwedK4kSj46BBEm9l/7c1hEic32d9mZTDDYNg6GcrrzmQGjwlzTQMjG+w
IewVEimliqWGFPnenSS5C3vjLxu99Wn7oTtflwf6TmX0iILQa4carfj1GXXUU2rB
j1VEem/rjBBvAh+5FJvV
=uTZE
-----END PGP SIGNATURE-----

--IJFRpmOek+ZRSQoz--

--===============5603407113321521235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5603407113321521235==--
