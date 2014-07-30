From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Wed, 30 Jul 2014 15:16:09 +0200
Message-ID: <20140730131608.GL29590@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <53D5435B.8030305@suse.de>
 <CAEC9eQPW-Z4craCC15M7oTp8eSD09AGxdTFEWaAWqn3Up4eJUg@mail.gmail.com>
 <53D783CC.2080108@suse.de> <20140729113645.GB21732@ulmo.nvidia.com>
 <53D78891.4080703@suse.de> <20140729114736.GB26346@ulmo.nvidia.com>
 <CAEC9eQOpmUsZKEJ_uK7Y73kn9Q5Rk8=n3jV9orBYwn2R4M0efA@mail.gmail.com>
 <20140730094053.GB29590@ulmo>
 <CAEC9eQM6DkhP_k77uo6_GNgQMNWr_TVPC6ePUBgyzOr=V1A78Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1617581263=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQM6DkhP_k77uo6_GNgQMNWr_TVPC6ePUBgyzOr=V1A78Q@mail.gmail.com>
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


--===============1617581263==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="64LDleNqNegJ4g97"
Content-Disposition: inline


--64LDleNqNegJ4g97
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 03:54:13PM +0530, Ajay kumar wrote:
> On Wed, Jul 30, 2014 at 3:10 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Wed, Jul 30, 2014 at 11:54:00AM +0530, Ajay kumar wrote:
> >> Hi Thierry,
> >>
> >> On Tue, Jul 29, 2014 at 5:17 PM, Thierry Reding
> >> <thierry.reding@gmail.com> wrote:
> >> > On Tue, Jul 29, 2014 at 01:42:09PM +0200, Andreas F=C3=A4rber wrote:
> >> >> Am 29.07.2014 13:36, schrieb Thierry Reding:
> >> >> > On Tue, Jul 29, 2014 at 01:21:48PM +0200, Andreas F=C3=A4rber wro=
te:
> >> >> >> Hi Ajay,
> >> >> >>
> >> >> >> Am 28.07.2014 08:13, schrieb Ajay kumar:
> >> >> >>> On 7/27/14, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> >> >> >>>> Am 25.07.2014 21:22, schrieb Ajay Kumar:
> >> >> >>>>> This series is based on exynos-drm-next branch of Inki Dae's =
tree at:
> >> >> >>>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exy=
nos.git
> >> >> >>>>>
> >> >> >>>>> I have tested this after adding few DT changes for exynos5250=
-snow,
> >> >> >>>>> exynos5420-peach-pit and exynos5800-peach-pi boards.
> >> >> >>>>
> >> >> >>>> I'm trying to test this with a modified exynos5250-spring DT
> >> >> [...]
> >> >> >> Unfortunately the most I got on Spring with attached DT was a bl=
ank
> >> >> >> screen with a white horizontal line in the middle.
> >> >> >>
> >> >> >> Do I need to specify a specific panel model for Spring?
> >> >> [...]
> >> >> >> From 9172a26a8f0d0f0d170bd27e1c150ad204d8086a Mon Sep 17 00:00:0=
0 2001
> >> >> >> From: =3D?UTF-8?q?Andreas=3D20F=3DC3=3DA4rber?=3D <afaerber@suse=
=2Ede>
> >> >> >> Date: Sun, 27 Jul 2014 21:58:06 +0200
> >> >> >> Subject: [PATCH] ARM: dts: exynos5250: Add eDP/LVDS bridge to Sp=
ring
> >> >> >> MIME-Version: 1.0
> >> >> >> Content-Type: text/plain; charset=3DUTF-8
> >> >> >> Content-Transfer-Encoding: 8bit
> >> >> >>
> >> >> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> >> >> [AF: Redone for v6]
> >> >> >> Signed-off-by: Andreas F??rber <afaerber@suse.de>
> >> >> >> ---
> >> >> >>  arch/arm/boot/dts/exynos5250-spring.dts | 32 ++++++++++++++++++=
+++++++++++++-
> >> >> >>  1 file changed, 31 insertions(+), 1 deletion(-)
> >> >> >>
> >> >> >> diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/=
boot/dts/exynos5250-spring.dts
> >> >> >> index 687dfab86bc8..517b1ff2bfdf 100644
> >> >> >> --- a/arch/arm/boot/dts/exynos5250-spring.dts
> >> >> >> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
> >> >> >> @@ -64,10 +64,14 @@
> >> >> >>            vdd_pll-supply =3D <&s5m_ldo8_reg>;
> >> >> >>    };
> >> >> >>
> >> >> >> +  panel: panel {
> >> >> >> +          compatible =3D "simple-panel";
> >> >> >> +  };
> >> >> >
> >> >> > You can't do this. "simple-panel" isn't a valid panel model. It s=
hould
> >> >> > probably be removed from the platform_of_match table in the drive=
r.
> >> >>
> >> >> Okay, that means the Snow DT is wrong, too:
> >> >> https://patchwork.kernel.org/patch/4625441/
> >> >>
> >> >> And the others specify it as fallback:
> >> >> https://patchwork.kernel.org/patch/4625461/
> >> >> https://patchwork.kernel.org/patch/4625451/
> >> >
> >> > A quick grep shows that many (all?) devices that use DRM panels prov=
ide
> >> > simple-panel as fallback. That's probably fine as long as they also =
do
> >> > provide the specific model. But given that simple-panel does not hav=
e a
> >> > mode or physical size, I don't think even that makes sense.
> >> On snow, the bridge chip provides the display mode instead of the pane=
l.
> >> That is why display was working for me.
> >
> > Okay, I suppose under some circumstances that might make sense. Although
> > it's still always the panel that dictates the display timings, so the
> > panel node needs to have a panel model specific compatible value with a
> > matching entry in the panel-simple driver so that it can even be used in
> > setups without a bridge.
> Well, I am okay with adding the compatible value for specific panel model
> because "simple-panel" alone cannot provide width/height of the panel.
>=20
> > One other thing: how does the bridge know which mode to drive? I suspect
> > that it can drive more than one mode? Can it freely be configured or
> > does it have a predefined set of modes? If the latter, then according to
> > what you said above there needs to be a way to configure the bridge (via
> > DT?) so that it reports the mode matching the panel. I wonder if that
> > should be handled completely in code, so that for example a bridge has a
> > panel attached it can use the panel's .get_modes() and select a matching
> > mode among the set that it supports.
> ptn3460 supports a standard list of "edid-emulation" ids.
> As of now, we receive that as a DT entry.
> And, these are the list of emulation ids supported:
>=20
>                 | Value | Resolution | Description
>                 |   0   |  1024x768  | NXP Generic
>                 |   1   |  1920x1080 | NXP Generic
>                 |   2   |  1920x1080 | NXP Generic
>                 |   3   |  1600x900  | Samsung LTM200KT
>                 |   4   |  1920x1080 | Samsung LTM230HT
>                 |   5   |  1366x768  | NXP Generic
>                 |   6   |  1600x900  | ChiMei M215HGE
>=20
> As you can see, the same resolutions have different emulator ids.
> May be, it depends on panel vendor also. I am really not sure if we can d=
o this.
> For snow(which has 1366x768 panel), we set edid-emulation as 5.

Well, modes 1, 2 and 4 as well as modes 3 and 6 must differ in some
ways, otherwise there wouldn't be much point in using different IDs for
them. You could try to match on more than just the active horizontal and
vertical resolution.

The reason behind this is that it would allow us to keep the device tree
content to a minimum and determine the proper emulation ID at runtime.
But if it's too difficult to implement I won't object to keeping the
edid-emulation property in DT. It just means that the device tree will
contain some duplicate information that needs to be kept in sync.

Thierry

--64LDleNqNegJ4g97
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2PAYAAoJEN0jrNd/PrOhkZ8P/0Lbon1gwoMUCa3XBz6KxzmG
kaM37wRQtv6Xw9xlFL8bg6U1gZ1HAlZ7TfXNzzQ2z47xh6dA0gK1iSoBJpI8JIR1
yetpsovUxdV9Z9t2b3JpQPlVQasSbAT19Z/MWHXX+qnv3W3Vinx4B2+Ok5WPcTUs
xlout9j51wRGWohZye1VADoUfz5BDf9vI7S0A0dllJ/8+fBM2b+bPhxGja8axGvm
xKe+BO/72HiBxoy1PuGLwpeYa895rGYeeNzxpZZCZQ7aAqd0g60KqeyBaXLW0XcQ
JdzkyQ8zAL8kPLD8UXeRNHsVgs5YvNJ+qdOPSLyIre7yBVe8oPvVAUsMFJZcMV2i
DyJjNdrvEFdq7tl4JBQTmiS0fCHpHPuNDoSf3e5nq6lhYrt7CNUojX+GflQ/6nyB
NLVK3zhs5alCc1vD8C1TzIhzC6N2y7m+zw8tvlICbldeKxUg8+YDo6yBDO5hKXdd
H8IsEgIWZ8Cjmu8vGLE7arexsDu9/FROGTmKVBVX0jlqPD44qSYt4tDuKma63BkF
knaKh+MHA+fRroD5XdNNMUQ99uLjpZWe+wpT4jHIkfnGp2sVEUl2qCfiEr22MHiF
OIvRdTDD5kMwQA692SmDb4ktXg+egtJdr5ds49p6mG3GPcfuC0nm0MhWLTdabOiK
aZ7Y5jYqyYWr2bfgry2K
=kqpE
-----END PGP SIGNATURE-----

--64LDleNqNegJ4g97--

--===============1617581263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1617581263==--
