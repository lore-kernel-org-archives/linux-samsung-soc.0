From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Tue, 29 Jul 2014 13:47:39 +0200
Message-ID: <20140729114736.GB26346@ulmo.nvidia.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <53D5435B.8030305@suse.de>
 <CAEC9eQPW-Z4craCC15M7oTp8eSD09AGxdTFEWaAWqn3Up4eJUg@mail.gmail.com>
 <53D783CC.2080108@suse.de> <20140729113645.GB21732@ulmo.nvidia.com>
 <53D78891.4080703@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1385137477=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53D78891.4080703@suse.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, daniel.vetter@ffwll.ch, joshi@samsung.com, dri-devel@lists.freedesktop.org, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Ajay kumar <ajaynumb@gmail.com>, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1385137477==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2014 at 01:42:09PM +0200, Andreas F=C3=A4rber wrote:
> Am 29.07.2014 13:36, schrieb Thierry Reding:
> > On Tue, Jul 29, 2014 at 01:21:48PM +0200, Andreas F=C3=A4rber wrote:
> >> Hi Ajay,
> >>
> >> Am 28.07.2014 08:13, schrieb Ajay kumar:
> >>> On 7/27/14, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> >>>> Am 25.07.2014 21:22, schrieb Ajay Kumar:
> >>>>> This series is based on exynos-drm-next branch of Inki Dae's tree a=
t:
> >>>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
> >>>>>
> >>>>> I have tested this after adding few DT changes for exynos5250-snow,
> >>>>> exynos5420-peach-pit and exynos5800-peach-pi boards.
> >>>>
> >>>> I'm trying to test this with a modified exynos5250-spring DT
> [...]
> >> Unfortunately the most I got on Spring with attached DT was a blank
> >> screen with a white horizontal line in the middle.
> >>
> >> Do I need to specify a specific panel model for Spring?
> [...]
> >> From 9172a26a8f0d0f0d170bd27e1c150ad204d8086a Mon Sep 17 00:00:00 2001
> >> From: =3D?UTF-8?q?Andreas=3D20F=3DC3=3DA4rber?=3D <afaerber@suse.de>
> >> Date: Sun, 27 Jul 2014 21:58:06 +0200
> >> Subject: [PATCH] ARM: dts: exynos5250: Add eDP/LVDS bridge to Spring
> >> MIME-Version: 1.0
> >> Content-Type: text/plain; charset=3DUTF-8
> >> Content-Transfer-Encoding: 8bit
> >>
> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> [AF: Redone for v6]
> >> Signed-off-by: Andreas F??rber <afaerber@suse.de>
> >> ---
> >>  arch/arm/boot/dts/exynos5250-spring.dts | 32 ++++++++++++++++++++++++=
+++++++-
> >>  1 file changed, 31 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/d=
ts/exynos5250-spring.dts
> >> index 687dfab86bc8..517b1ff2bfdf 100644
> >> --- a/arch/arm/boot/dts/exynos5250-spring.dts
> >> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
> >> @@ -64,10 +64,14 @@
> >>  		vdd_pll-supply =3D <&s5m_ldo8_reg>;
> >>  	};
> >> =20
> >> +	panel: panel {
> >> +		compatible =3D "simple-panel";
> >> +	};
> >=20
> > You can't do this. "simple-panel" isn't a valid panel model. It should
> > probably be removed from the platform_of_match table in the driver.
>=20
> Okay, that means the Snow DT is wrong, too:
> https://patchwork.kernel.org/patch/4625441/
>=20
> And the others specify it as fallback:
> https://patchwork.kernel.org/patch/4625461/
> https://patchwork.kernel.org/patch/4625451/

A quick grep shows that many (all?) devices that use DRM panels provide
simple-panel as fallback. That's probably fine as long as they also do
provide the specific model. But given that simple-panel does not have a
mode or physical size, I don't think even that makes sense.

Any of the DTS files in the tree I have that list simple-panel as a
fallback are Tegra, so I'll go write a patch that removes the fallback.
I can't think of a reason why it would ever be needed or meaningful.

Thierry

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT14nYAAoJEN0jrNd/PrOhPusP/0MxFlMKt2iR9V7Tf5N6KaHT
pZFg8SfiYutBu3sBiJvzyOydccHJ1KCtuDvJ1UoTxpx0BWNi/y9i3ks6Pb/s8tXe
rYedxwEd7TAlFrjMtnohRKGNoutNF6ucn7bqwPVcLMuwDbTWRf1qNY0NYWxdxoES
4pFqohrGYskLT2pxn1Kc8N1jGbz/qNWgwZUrjlxVhcj5XSGp5OUf7RNh7FQZ5j8O
AAxxpcHZR1Y+8+7Tlh7Wt08Ub/ZXciRqNFcpQ2sz36prvKGumQKMjDr287SyVK7O
Fw6rpPoxOUFFLKGyPIRZbmwg5XPA1JBS5UMpHDPEn0sToS8Vd10q7ayBuuyKgQH0
4A+aT0vCKyJoBumbfhJQAlZjitOl1sxXQ+17i7xz95IwoOYEc/HCa0+lP5TH7UVJ
Jhup5dBqxAft4bFrXOlCMD3l+UHe6zd0F59615q+gV8d+n5vYP8fUSJ8Ft6GGn9t
si3QF8r4jL2iRvkVVEBakaA5gXK9KQc45zFNk7i2Dgy3DgNyxWSuuLmkfdRHkIBH
zEc1inbSs91AoHv3nHNe0NK1cBTN8/D16uEnceAwLXneTYbT6aNe7bNyItBTgY7E
xB4cCVimB4148+ERrFVYvPx+AJw8Q4D+CpdHUyrTRuhS+VdbU88eVIkxy6jDsNy+
4MpHgN/WTTsJP5gfW4E6
=OguT
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--

--===============1385137477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1385137477==--
