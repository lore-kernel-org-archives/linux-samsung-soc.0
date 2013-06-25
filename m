From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 3/5] video: exynos_mipi_dsim: Use generic PHY driver
Date: Tue, 25 Jun 2013 18:08:13 +0300
Message-ID: <20130625150813.GB21334@arwen.pp.htv.fi>
References: <1372170110-12993-1-git-send-email-s.nawrocki@samsung.com>
 <1372170110-12993-3-git-send-email-s.nawrocki@samsung.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3509253931607399251=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1372170110-12993-3-git-send-email-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============3509253931607399251==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline

--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 25, 2013 at 04:21:48PM +0200, Sylwester Nawrocki wrote:
> Use the generic PHY API instead of the platform callback to control
> the MIPI DSIM DPHY. The 'phy_label' field is added to the platform
> data structure to allow PHY lookup on non-dt platforms.
>=20
> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

this is awesome :-)

Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

--=20
balbi

--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRybJdAAoJEIaOsuA1yqREvw4QAJNdJCiPv3WGbVora7qyh0zc
Ch97HxJ1pgzjJOKK8f/WjuXaYK1HCl1Ly/PxWSRsERPk7l83HkQImebOCJl3XwFj
R63wGnO10FoHo2ygw1Rw7MwiLl8L/1FPkVct75Z4IPPPuMIRrE0AEsvYomUEwCzp
hv6M1mEc37So1u0Dcsc5bc25vbHp5U8hxCTB7/W9mUcWkwgvHoPShGQFQlCDyc7A
jDoQc5KghJaQ9hinTfx8aoBdrJhl+nKPz1eeyuXJq9rHxh8UMayxzaIGeQTYakaq
FHQwkXfQPd0ZHFSLjNkQAzQ0GGUDNWqiOgWnpE7lGeu+MPZd6w3MoJ9kBWZdq0UE
h8uAcJd4dVZtzwWargRjHUWYhvaupUAJM5GWLE6Eum4Y18jNN1bOjoWOIH2oDhCo
fOVhwL+uCYKAfeJdkvGisON5UPs8GixHVXGyOk9kdLl5e5sA5orOIfJLGMaXrCmB
31l/C9fA2oSyDfgYyUFJ8pXAO+IFwU7gr12AMVYqIK8+gfwta75f5XY1NuesoOw+
kWrKqE82ey6N+puR8O2Z+RZHxI4Z0Wh7BBag8qQjgh7dDfWfAIRsSclvm6SNENs+
smC5NViiIsg7NkWGMl/zawaJMG/qs0Z18zWJmhAnuuiT9jPX9LUCd0NNtw16YeeN
oHA+ftgU7Vgr7lMjwb/H
=AUJ2
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--

--===============3509253931607399251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3509253931607399251==--
