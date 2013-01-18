From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v7 2/4] usb: phy: samsung: Add host phy support to
 samsung-phy driver
Date: Fri, 18 Jan 2013 17:07:32 +0200
Message-ID: <20130118150732.GP4672@arwen.pp.htv.fi>
References: <1357916550-11421-3-git-send-email-gautam.vivek@samsung.com>
 <1358166135-22073-1-git-send-email-gautam.vivek@samsung.com>
 <20130118131633.GJ4672@arwen.pp.htv.fi>
 <CAFp+6iF9H+n1Fwr89es-jtDAN=ht1PuXQER9vQ=jG2RZQTceWw@mail.gmail.com>
 <20130118142251.GL4672@arwen.pp.htv.fi>
 <CAFp+6iE5gU5QrheYyHLV2yfO=d3j3fVA7qq8CQ4KLysjXFRh3w@mail.gmail.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7210812673193660840=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAFp+6iE5gU5QrheYyHLV2yfO=d3j3fVA7qq8CQ4KLysjXFRh3w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============7210812673193660840==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fjEAjMKpll6GDq3U"
Content-Disposition: inline

--fjEAjMKpll6GDq3U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 18, 2013 at 07:59:52PM +0530, Vivek Gautam wrote:
> HI Balbi,
>=20
>=20
> On Fri, Jan 18, 2013 at 7:52 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> > On Fri, Jan 18, 2013 at 07:51:08PM +0530, Vivek Gautam wrote:
> >> Hi Felipe,
> >>
> >>
> >> On Fri, Jan 18, 2013 at 6:46 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> >> > Hi,
> >> >
> >> > On Mon, Jan 14, 2013 at 05:52:15PM +0530, Vivek Gautam wrote:
> >> >> This patch adds host phy support to samsung-usbphy driver and
> >> >> further adds support for samsung's exynos5250 usb-phy.
> >> >>
> >> >> Signed-off-by: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >> >> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >> >
> >> > Missing Kukjim's Acked-by here
> >> >
> >>
> >> Hope you are fine with the changes happened after discussion in thread:
> >> [PATCH v5 2/4] usb: phy: samsung: Add host phy support to samsung-phy =
driver
> >>
> >> Is it something you want me to modify in this patch ?
> >
> > please send the final patch and we shall see. After quickly browsing
> > that thread, I didn't see anything scary, but I'd like to see your final
> > version before giving my final answer ;-)
> >
>=20
> this series of patch is the final version from my side unless Doug or
> you have any further comments
> on the thread :
> https://lkml.org/lkml/2013/1/14/481
>=20
> Seems like Doug wanted to know your opinion in this regard. ;-)

only Kukjim's Acked-by missing ;-)

--=20
balbi

--fjEAjMKpll6GDq3U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ+WU0AAoJEIaOsuA1yqRExVYQAIE98Z1eaD7ChM52KAOBEC6l
rQWxRkwCwP98uPMUfgVGkuULf9y2JIGKkoZmE8/VjrHvnJsQ0ap31vz6W/I0IZMw
knI/abaJhllsCRd8LWk93q/q21+g86MS/NcOeKUj5/jaNfSubD6K13P3AlDPaPzZ
Qpf3q3zfVDkxFDnQ+IK694IKwRfyU0xvEDbgQWzOp8C3a9PL7DsEbTWMTtG0vrnH
q2uaje4YkyVm+kvN5MlwHieu1sUdJdr1+t1gQV7PZTWko/9KMTMuryd9Ikcpdz2t
G9ojmufu/1SmX3QSQJhPDvELED2yrol4Aqfs8GzfMh2PK/YGjfwaew37GjOEr2EJ
/4SDG2wuIACy1Q1ndf6vvzcLk6AVJAcWMy0SlQMHnhKX2+R6FKqEUxmQBiEf0ukv
sc47UhQo81upm+ubR9Eb5S1xKitBCJgtQF80ITOAgCrPFwxv4CgKA0ydCQqVu3zq
r/ROXNo0+Sd/b5uEAwTKgxxtw73Wy9wNzDG2xV1YakQBDN2Px+Lwy4+nzp9+sjT8
IZjS6w52ynTmvEbq7SwA85HIj7GO9PM8i5YdFdHBmB0KSAWyFSy0n5rqXqIidS9B
TlQJl7TCe96mUJs6xgD8XhGYec+dakWIZF91hbFFed6EtajuEsjnSRiSmh9PiA9v
uUX9Rb155uhetC1HQhEu
=g0mg
-----END PGP SIGNATURE-----

--fjEAjMKpll6GDq3U--

--===============7210812673193660840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7210812673193660840==--
