From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 RESEND] arm: dts: Exynos5: Use pmu_system_controller
 phandle for dp phy
Date: Mon, 24 Nov 2014 11:56:58 +0100
Message-ID: <20141124105656.GA32478@ulmo.nvidia.com>
References: <1416807683-2257-1-git-send-email-gautam.vivek@samsung.com>
 <20141124103249.GA26217@ulmo.nvidia.com>
 <CAFp+6iE22FnHeXJZQyhytzGDNfnP4sdnYZuyFtmfzP_JVTVNPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1200114237=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAFp+6iE22FnHeXJZQyhytzGDNfnP4sdnYZuyFtmfzP_JVTVNPQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Vivek Gautam <gautamvivek1987@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Jingoo Han <jg1.han@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vivek Gautam <gautam.vivek@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1200114237==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2014 at 04:17:18PM +0530, Vivek Gautam wrote:
> Hi,
>=20
>=20
> On Mon, Nov 24, 2014 at 4:02 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Mon, Nov 24, 2014 at 11:11:23AM +0530, Vivek Gautam wrote:
> >> DP PHY now require pmu-system-controller to handle PMU register
> >> to control PHY's power isolation. Adding the same to dp-phy
> >> node.
> >>
> >> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> >> Reviewed-by: Jingoo Han <jg1.han@samsung.com>
> >> Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> >> Cc: Kukjin Kim <kgene@kernel.org>
> >> ---
> >>  arch/arm/boot/dts/exynos5250.dtsi |    2 +-
> >>  arch/arm/boot/dts/exynos5420.dtsi |    4 ++--
> >>  2 files changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exy=
nos5250.dtsi
> >> index 0a588b4..bebd099 100644
> >> --- a/arch/arm/boot/dts/exynos5250.dtsi
> >> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> >> @@ -732,7 +732,7 @@
> >>
> >>       dp_phy: video-phy@10040720 {
> >>               compatible =3D "samsung,exynos5250-dp-video-phy";
> >> -             reg =3D <0x10040720 4>;
> >> +             samsung,pmu-syscon =3D <&pmu_system_controller>;
> >>               #phy-cells =3D <0>;
> >>       };
> >>
> >> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exy=
nos5420.dtsi
> >> index 8617a03..1353a09 100644
> >> --- a/arch/arm/boot/dts/exynos5420.dtsi
> >> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> >> @@ -503,8 +503,8 @@
> >>       };
> >>
> >>       dp_phy: video-phy@10040728 {
> >> -             compatible =3D "samsung,exynos5250-dp-video-phy";
> >> -             reg =3D <0x10040728 4>;
> >> +             compatible =3D "samsung,exynos5420-dp-video-phy";
> >> +             samsung,pmu-syscon =3D <&pmu_system_controller>;
> >>               #phy-cells =3D <0>;
> >>       };
> >>
> >
> > It seems like these nodes have been in the Linux tree since 3.12 and
> > 3.17, respectively and these changes break backwards-compatibility. Has
> > anyone thought about the possible consequences?
>=20
> Sorry for my ignorance, but i have a doubt.
> If the bindings and device node both are being changed in the same kernel
> version (as fixes),
> so that the stable will have both; then the only scenerio of backward
> compatibility comes when kernel is upgraded but not dtbs.

Correct.

> Does such upgradation makes sense for distros ?

Yes. Back at the time a decision was made that device trees need to be
stable ABI because eventually they'd be shipped with the device rather
than the distribution. As such it may not at all be possible to update
them (they could be in some sort of ROM).

For that reason new kernels need to keep working with old DTBs unless an
argument can be made that would justify breaking things. I don't think I
have ever seen anyone win such an argument. One of the rare exceptions
that I know of is if you can prove that a given hardware block has never
been used in an upstream kernel, then changing the DTB in backwards-
incompatible ways would be okay because you wouldn't be breaking things
for existing users.

Thierry

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUcw74AAoJEN0jrNd/PrOhSM8P+gMnYlhj7fxVAgVZF9oPtZPq
yQUNcoggLyI+BshlnT1lpTBkzNBufP10Xkg1EF2Ydcxan4KxjJE2xUrxqLKi0RbW
cdvKii6JZHwiCDeSzYj+AnbMXT9742b/x38yVUwYMJrUN8quf1EJZZ/LOfgp+HfB
XpaAoLiQHkktrg/f2v9qdXaeIAfsniLf+bB8iIp6saqmRXlBK/AViwBRcCyYV03/
A15m9so+JnK7giEM/ka4+5T+Vha6JF/TYJyle7uF4AF+sQJC/Cy+EEWq66vYi+AJ
WxGDFoMPyK6rkUl1PgiteK+8J9BKF8/9djkJqKHHdzOS+hqjD6F/0lKakac8hg3l
PMMXnqWtwauwiHG185ovO+FA9bvJWDs2OEM5lY54pc319JwBljSxXUZuTrNN+l0m
3KA07XI8moyelhpY4X9A+HTN/yT4ykiNMV/jbF2lXgx/xl33zKovJZrur08f7w8O
IJQuqApCzSfYQSeiFJyQGj430iRc2sd1pR7t4UrmkwO4gJG4j+lABsdG5Dr9Urst
5YH0sF2TzfnYVcGtFkrjvzEtfqHIx6lHs+9/mSxLmVT3OesxGwrIgZ/ba0kaHkm4
faHPvrqswY57LdmWAUEhJKyelQN0Mbzykh3eM5NrbOl/xYktrqkiFYgClNCgtS/F
TVNYELJq1bLp30TXfaxZ
=hybH
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--

--===============1200114237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1200114237==--
