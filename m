From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Wed, 17 Sep 2014 12:53:10 +0300
Message-ID: <2405684.4GKZfmgcCP@avalon>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <CAEC9eQOpmUsZKEJ_uK7Y73kn9Q5Rk8=n3jV9orBYwn2R4M0efA@mail.gmail.com>
 <20140730094053.GB29590@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140730094053.GB29590@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Doug Anderson <dianders@chromium.org>, sunil joshi <joshi@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Thierry,

On Wednesday 30 July 2014 11:40:54 Thierry Reding wrote:
> On Wed, Jul 30, 2014 at 11:54:00AM +0530, Ajay kumar wrote:
> > On Tue, Jul 29, 2014 at 5:17 PM, Thierry Reding wrote:
> > > On Tue, Jul 29, 2014 at 01:42:09PM +0200, Andreas F=E4rber wrote:
> > >> Am 29.07.2014 13:36, schrieb Thierry Reding:
> > >> > On Tue, Jul 29, 2014 at 01:21:48PM +0200, Andreas F=E4rber wrote:
> > >> >> Am 28.07.2014 08:13, schrieb Ajay kumar:
> > >> >>> On 7/27/14, Andreas F=E4rber <afaerber@suse.de> wrote:
> > >> >>>> Am 25.07.2014 21:22, schrieb Ajay Kumar:
> > >> >>>>> This series is based on exynos-drm-next branch of Inki Dae's t=
ree
> > >> >>>>> at:
> > >> >>>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exyn=
os.
> > >> >>>>> git
> > >> >>>>> =

> > >> >>>>> I have tested this after adding few DT changes for
> > >> >>>>> exynos5250-snow,
> > >> >>>>> exynos5420-peach-pit and exynos5800-peach-pi boards.
> > >> >>>> =

> > >> >>>> I'm trying to test this with a modified exynos5250-spring DT
> > >> =

> > >> [...]
> > >> =

> > >> >> Unfortunately the most I got on Spring with attached DT was a bla=
nk
> > >> >> screen with a white horizontal line in the middle.
> > >> >> =

> > >> >> Do I need to specify a specific panel model for Spring?
> > >> =

> > >> [...]
> > >> =

> > >> >> From 9172a26a8f0d0f0d170bd27e1c150ad204d8086a Mon Sep 17 00:00:00
> > >> >> 2001
> > >> >> From: =3D?UTF-8?q?Andreas=3D20F=3DC3=3DA4rber?=3D <afaerber@suse.=
de>
> > >> >> Date: Sun, 27 Jul 2014 21:58:06 +0200
> > >> >> Subject: [PATCH] ARM: dts: exynos5250: Add eDP/LVDS bridge to Spr=
ing
> > >> >> MIME-Version: 1.0
> > >> >> Content-Type: text/plain; charset=3DUTF-8
> > >> >> Content-Transfer-Encoding: 8bit
> > >> >> =

> > >> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > >> >> [AF: Redone for v6]
> > >> >> Signed-off-by: Andreas F??rber <afaerber@suse.de>
> > >> >> ---
> > >> >> =

> > >> >>  arch/arm/boot/dts/exynos5250-spring.dts | 32 +++++++++++++++++++=
++-
> > >> >>  1 file changed, 31 insertions(+), 1 deletion(-)
> > >> >> =

> > >> >> diff --git a/arch/arm/boot/dts/exynos5250-spring.dts
> > >> >> b/arch/arm/boot/dts/exynos5250-spring.dts index
> > >> >> 687dfab86bc8..517b1ff2bfdf 100644
> > >> >> --- a/arch/arm/boot/dts/exynos5250-spring.dts
> > >> >> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
> > >> >> @@ -64,10 +64,14 @@
> > >> >>            vdd_pll-supply =3D <&s5m_ldo8_reg>;
> > >> >>    };
> > >> >> =

> > >> >> +  panel: panel {
> > >> >> +          compatible =3D "simple-panel";
> > >> >> +  };
> > >> > =

> > >> > You can't do this. "simple-panel" isn't a valid panel model. It
> > >> > should probably be removed from the platform_of_match table in the
> > >> > driver.
> > >> =

> > >> Okay, that means the Snow DT is wrong, too:
> > >> https://patchwork.kernel.org/patch/4625441/
> > >> =

> > >> And the others specify it as fallback:
> > >> https://patchwork.kernel.org/patch/4625461/
> > >> https://patchwork.kernel.org/patch/4625451/
> > > =

> > > A quick grep shows that many (all?) devices that use DRM panels provi=
de
> > > simple-panel as fallback. That's probably fine as long as they also do
> > > provide the specific model. But given that simple-panel does not have=
 a
> > > mode or physical size, I don't think even that makes sense.
> > =

> > On snow, the bridge chip provides the display mode instead of the panel.
> > That is why display was working for me.
> =

> Okay, I suppose under some circumstances that might make sense. Although
> it's still always the panel that dictates the display timings, so the
> panel node needs to have a panel model specific compatible value with a
> matching entry in the panel-simple driver so that it can even be used in
> setups without a bridge.
> =

> One other thing: how does the bridge know which mode to drive? I suspect
> that it can drive more than one mode? Can it freely be configured or
> does it have a predefined set of modes? If the latter, then according to
> what you said above there needs to be a way to configure the bridge (via
> DT?) so that it reports the mode matching the panel. I wonder if that
> should be handled completely in code, so that for example a bridge has a
> panel attached it can use the panel's .get_modes() and select a matching
> mode among the set that it supports.

Yes, pretty please :-) I don't think it would be a good idea to duplicate m=
ode =

information in the bridge DT node, as that's not a property of the bridge. =

Querying the mode at runtime is in my opinion a much better option, and wou=
ld =

also allow switching between different modes at runtime when that makes sen=
se.

Now, I'm not sure whether it should be the bridge driver querying the panel =

driver directly, or the display controller driver doing it and then =

configuring the bridge accordingly. The latter seems more generic to me and =

doesn't rely on the assumption that the bridge output will always be direct=
ly =

connected to a panel.

-- =

Regards,

Laurent Pinchart
