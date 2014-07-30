From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Wed, 30 Jul 2014 11:40:54 +0200
Message-ID: <20140730094053.GB29590@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <53D5435B.8030305@suse.de>
 <CAEC9eQPW-Z4craCC15M7oTp8eSD09AGxdTFEWaAWqn3Up4eJUg@mail.gmail.com>
 <53D783CC.2080108@suse.de> <20140729113645.GB21732@ulmo.nvidia.com>
 <53D78891.4080703@suse.de> <20140729114736.GB26346@ulmo.nvidia.com>
 <CAEC9eQOpmUsZKEJ_uK7Y73kn9Q5Rk8=n3jV9orBYwn2R4M0efA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1127332615=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQOpmUsZKEJ_uK7Y73kn9Q5Rk8=n3jV9orBYwn2R4M0efA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Prashanth G <prashanth.g@samsung.com>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1127332615==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 11:54:00AM +0530, Ajay kumar wrote:
> Hi Thierry,
>=20
> On Tue, Jul 29, 2014 at 5:17 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Tue, Jul 29, 2014 at 01:42:09PM +0200, Andreas F=C3=A4rber wrote:
> >> Am 29.07.2014 13:36, schrieb Thierry Reding:
> >> > On Tue, Jul 29, 2014 at 01:21:48PM +0200, Andreas F=C3=A4rber wrote:
> >> >> Hi Ajay,
> >> >>
> >> >> Am 28.07.2014 08:13, schrieb Ajay kumar:
> >> >>> On 7/27/14, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> >> >>>> Am 25.07.2014 21:22, schrieb Ajay Kumar:
> >> >>>>> This series is based on exynos-drm-next branch of Inki Dae's tre=
e at:
> >> >>>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos=
=2Egit
> >> >>>>>
> >> >>>>> I have tested this after adding few DT changes for exynos5250-sn=
ow,
> >> >>>>> exynos5420-peach-pit and exynos5800-peach-pi boards.
> >> >>>>
> >> >>>> I'm trying to test this with a modified exynos5250-spring DT
> >> [...]
> >> >> Unfortunately the most I got on Spring with attached DT was a blank
> >> >> screen with a white horizontal line in the middle.
> >> >>
> >> >> Do I need to specify a specific panel model for Spring?
> >> [...]
> >> >> From 9172a26a8f0d0f0d170bd27e1c150ad204d8086a Mon Sep 17 00:00:00 2=
001
> >> >> From: =3D?UTF-8?q?Andreas=3D20F=3DC3=3DA4rber?=3D <afaerber@suse.de>
> >> >> Date: Sun, 27 Jul 2014 21:58:06 +0200
> >> >> Subject: [PATCH] ARM: dts: exynos5250: Add eDP/LVDS bridge to Spring
> >> >> MIME-Version: 1.0
> >> >> Content-Type: text/plain; charset=3DUTF-8
> >> >> Content-Transfer-Encoding: 8bit
> >> >>
> >> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> >> [AF: Redone for v6]
> >> >> Signed-off-by: Andreas F??rber <afaerber@suse.de>
> >> >> ---
> >> >>  arch/arm/boot/dts/exynos5250-spring.dts | 32 +++++++++++++++++++++=
++++++++++-
> >> >>  1 file changed, 31 insertions(+), 1 deletion(-)
> >> >>
> >> >> diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boo=
t/dts/exynos5250-spring.dts
> >> >> index 687dfab86bc8..517b1ff2bfdf 100644
> >> >> --- a/arch/arm/boot/dts/exynos5250-spring.dts
> >> >> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
> >> >> @@ -64,10 +64,14 @@
> >> >>            vdd_pll-supply =3D <&s5m_ldo8_reg>;
> >> >>    };
> >> >>
> >> >> +  panel: panel {
> >> >> +          compatible =3D "simple-panel";
> >> >> +  };
> >> >
> >> > You can't do this. "simple-panel" isn't a valid panel model. It shou=
ld
> >> > probably be removed from the platform_of_match table in the driver.
> >>
> >> Okay, that means the Snow DT is wrong, too:
> >> https://patchwork.kernel.org/patch/4625441/
> >>
> >> And the others specify it as fallback:
> >> https://patchwork.kernel.org/patch/4625461/
> >> https://patchwork.kernel.org/patch/4625451/
> >
> > A quick grep shows that many (all?) devices that use DRM panels provide
> > simple-panel as fallback. That's probably fine as long as they also do
> > provide the specific model. But given that simple-panel does not have a
> > mode or physical size, I don't think even that makes sense.
> On snow, the bridge chip provides the display mode instead of the panel.
> That is why display was working for me.

Okay, I suppose under some circumstances that might make sense. Although
it's still always the panel that dictates the display timings, so the
panel node needs to have a panel model specific compatible value with a
matching entry in the panel-simple driver so that it can even be used in
setups without a bridge.

One other thing: how does the bridge know which mode to drive? I suspect
that it can drive more than one mode? Can it freely be configured or
does it have a predefined set of modes? If the latter, then according to
what you said above there needs to be a way to configure the bridge (via
DT?) so that it reports the mode matching the panel. I wonder if that
should be handled completely in code, so that for example a bridge has a
panel attached it can use the panel's .get_modes() and select a matching
mode among the set that it supports.

Thierry

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2L2lAAoJEN0jrNd/PrOh1IcP/3X9wC59aJVO0OFx/YXWJdPR
+Xjq/QqZGT32GKOja2q4TLvQgXh/kjtw9BRufXotb4GtdpdvKiBtm11oqU3OQrJU
orZooJp987UnF9DAPep93JofWmLEuFI8EPApU7R9pxvtimcmU2SsKCW0QNaB0rYW
IZ/g5rsxiMNegUq1Xd382ekgYAj9ak4u6zruZPSHZeEU/0za7IApFYqMwyAruJFd
NYZ5kcvcWSzp1I8D5HPsFA81CSSA2urUtqVArnVotk5vS9YGIP4uXRsr9Nq+uWVD
bIhDDoqJTflF99KvdlF9jEa1fz++8Ge3xFX3KqZYfATzUAxwyzXdsGHzRVDu8Ba+
ablU1j6B2CzHA7oZxRERSS5BNcnsh64QecSGR70+rXPBmCwL4p/eosrObCcB1axg
NCctKCtY3m9DdTarx4vP9+ksFfsj4CrdptXg1sNUKkGqNY7P1Ssi4FwnagYsmVRP
AWWtAYtEDJtQ9SPi2duSI7Hzoi939UE6ZpqrOBCD+sLDUs3p7Tehf5u4WKnpBN+N
wIIIYTAwNk1VdflyZUVSpJUU3tvu/iZmAJ4CpYeLfReQYc+0veNh3hy2u3EFLCUv
kZQMbH5WqXU8TpU7SXDQVOHOsJJtD4k7tdftZy+lSvTId98Gw2xrrE0IJp+qt5x/
Avv2Vpm8o3qUM+nszkuq
=+4V+
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--

--===============1127332615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1127332615==--
