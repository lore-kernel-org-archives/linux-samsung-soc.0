From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v2 1/5] phy: Add driver for Exynos MIPI CSIS/DSIM DPHYs
Date: Thu, 27 Jun 2013 09:17:13 +0300
Message-ID: <20130627061713.GF15455@arwen.pp.htv.fi>
References: <1372170110-12993-1-git-send-email-s.nawrocki@samsung.com>
 <20130625150649.GA21334@arwen.pp.htv.fi>
 <51CB0212.3050103@samsung.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6860176405136476806=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51CB0212.3050103@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, jg1.han@samsung.com, dh09.lee@samsung.com, balbi@ti.com, kishon@ti.com, inki.dae@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, plagnioj@jcrosoft.com, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============6860176405136476806==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eDB11BtaWSyaBkpc"
Content-Disposition: inline

--eDB11BtaWSyaBkpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2013 at 05:00:34PM +0200, Sylwester Nawrocki wrote:
> Hi,
>=20
> On 06/25/2013 05:06 PM, Felipe Balbi wrote:
> >> +static struct platform_driver exynos_video_phy_driver =3D {
> >> > +	.probe	=3D exynos_video_phy_probe,
> >
> > you *must* provide a remove method. drivers with NULL remove are
> > non-removable :-)
>=20
> Actually the remove() callback can be NULL, it's just missing module_exit
> function that makes a module not unloadable.

look at the implementation of platform_drv_remove():

 499 static int platform_drv_remove(struct device *_dev)
 500 {
 501         struct platform_driver *drv =3D to_platform_driver(_dev->drive=
r);
 502         struct platform_device *dev =3D to_platform_device(_dev);
 503         int ret;
 504=20
 505         ret =3D drv->remove(dev);
 506         if (ACPI_HANDLE(_dev))
 507                 acpi_dev_pm_detach(_dev, true);
 508=20
 509         return ret;
 510 }

that's not a conditional call right :-)

--=20
balbi

--eDB11BtaWSyaBkpc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRy9jpAAoJEIaOsuA1yqRE7iEP/2xOEc7U01/33BpVtGYrsgR8
1Ze72R43SgVQFrvdYuUmZJZol4y0OaEV+6Yg2umXFKD2WVSX50F3SGCRR7qCtorE
5T+kdVCzb8f1K3ubc0NAit0S0srQxU7grX6lHlJYS2LuNCiZr2oa4TMad6OPbAvg
vKCYVKBHF4AEeo355HoOEkVyFSbgRR+W8tEkXD2pOguLT48KbVovrxelRSMRkC1Q
X/HgRV38DEn6xn0aABcgJVY1D3x0FtGXIh2mgeOsBhcn7j1yZ2fvkPDXrY/CYist
Q+r0Fwjv5Kr414FSqKAInBZCIBrnC+YqlK8xdLLquO20d5/OGTinh9P3zN3gz/zj
gKfrGZUjxlpsZ96M0p2PsVGopu5D6BFiX8JjSE62aP0w7ReDL+6l1kw2V8ctijir
XvmqL3zFFrYzmba2u7AY2btBdw5z10g0RqO7QekY51xismEzsOJQUdmtdTiJOaGk
RTuOhygtLly13WH6VdqbWulUlrkpcnCqE+UoxGAjbEEGf1HusEOemEYv3xIHT/OB
NKzlitpuQ+ABjafXQlUan6+tu6gDRYquvB9/KIuote60dGGoe40gXrn7/jOPA/h6
+51HYzMcCx62s/WVl6EPeaHApRPaficHGNpoLFaOFjdlMlkuWmdy/0hqaqUz+vP0
9iypsBXoJvgnctT5DTKm
=T5EP
-----END PGP SIGNATURE-----

--eDB11BtaWSyaBkpc--


--===============6860176405136476806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6860176405136476806==--
