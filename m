From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: Exynos5250: Enabling samsung usb phy
Date: Fri, 18 Jan 2013 15:12:50 +0200
Message-ID: <20130118131250.GH4672@arwen.pp.htv.fi>
References: <1355845182-14104-1-git-send-email-gautam.vivek@samsung.com>
 <20130118131013.GG4672@arwen.pp.htv.fi>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1486145367507202558=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130118131013.GG4672-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
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
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============1486145367507202558==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xQmOcGOVkeO43v2v"
Content-Disposition: inline

--xQmOcGOVkeO43v2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 18, 2013 at 03:10:13PM +0200, Felipe Balbi wrote:
> Hi,
>=20
> On Tue, Dec 18, 2012 at 09:09:40PM +0530, Vivek Gautam wrote:
> > This patch-set enables the samsung-usbphy driver on exynos5250,
> > which enables the support for USB2 type and USB3 type phys.
> > The corresponding phy driver patches are available at:
> >  1) https://lkml.org/lkml/2012/12/18/201
> >  2) https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-December=
/024559.html
> >=20
> > Tested this patch-set on exynos5250 with following patch-sets for
> > USB 2.0 and USB 3.0:
> >  - https://patchwork.kernel.org/patch/1794651/
> >  - https://lkml.org/lkml/2012/12/18/201
> >  - https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-December/=
024559.html
> >  - http://comments.gmane.org/gmane.linux.usb.general/76352
> >  - https://lkml.org/lkml/2012/12/13/492
> >=20
> > Vivek Gautam (2):
> >   ARM: Exynos5250: Enabling samsung-usbphy driver
> >   ARM: Exynos5250: Enabling USB 3.0 phy for samsung-usbphy driver
>=20
> What should I do with this series ? Is it ready to apply ? If it is,
> then please resend with Kukjim's Acked-by.

actually, now that I look again, it's all under arch/arm/, so Kukjim can
take all of those through his tree ;-)

--=20
balbi

--xQmOcGOVkeO43v2v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ+UpSAAoJEIaOsuA1yqREb50QAKGs0rCGyrgv5vqJjavCqYn/
ibzVxtbi4H7tgbtGWO26u4CQ8ALt1LpyicEgOML1C+KMKXlosPzXQuKkZTNaMB1u
4EC+CMPFGRCZA28M7ZTtuZLQEt8ZLvY3cdAJO7516NRwuJKSkI6y3BxD4bl1mlSM
Z/GOsLWPwiEew0KkGzuQgbFl+GIzutED4GYdpY8y89IcyGWTo0BnpxZs6K4f9LZh
qO83faCSdkvzPNZq8b6HTJSra/X/8os4qy30uyqb3hZDRbnUr1LLRFrMqViXVjuJ
UgJiaKVeWS3im9B4vzl8VF5R0tzQ4HpBFhdEEOoqFJGM1Yc95AaCDfLugFC/jP4Z
llbTVB26VpjHThm5VtnZb4s6ZERwPuvkFamChuTTPMBlM0H/23f01TgK4cbzwTJc
j+6ezzRXoy48LNgcmQ6Tf6W63k574VsayhpusyE66X+DiAIiq3heu6S595Nqt/pI
4eDK9CznQeB+FW+cg3UItKikbFjv9XaTfqjBq7T5e/5ka2JJhz6TzUHUA3YGQ4QY
Lzg738T2bExewy4ScxADVANYy46lyXEwh9Qd4gs5pSjNzt0LKzLljth/Dwb5yMX0
6gxDOJwDn5v7lwSjyBPeNLAUD5HnLXKPQB9MP/w2NCwTnNDTpgImi0fhh5/HqrrY
gLnEggJsPpd9D6RAJbcc
=zpkJ
-----END PGP SIGNATURE-----

--xQmOcGOVkeO43v2v--

--===============1486145367507202558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1486145367507202558==--
