From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 4/9] drm/exynos: add exynos_dp_panel driver
 registration to drm driver
Date: Thu, 21 Aug 2014 11:28:13 +0200
Message-ID: <20140821092812.GB13733@ulmo>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-5-git-send-email-ajaykumar.rs@samsung.com>
 <20140422083311.GC17275@ulmo>
 <CAEC9eQPGfFFRNF4nOgci8KCc+9E=MQRmU-Cz=TGgEdiaOVqTMg@mail.gmail.com>
 <20140422152657.GB30048@ulmo>
 <CACP_E+KntYzVDjZrXcByU2LrCtzDbwW79LpSAazjHzbYbQrpDQ@mail.gmail.com>
 <20140821073631.GH4486@ulmo>
 <CACP_E++72CuDCf1yOKk8b0O49mOd1YvBUUGKnD5zpJW6BT7QtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0481606629=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACP_E++72CuDCf1yOKk8b0O49mOd1YvBUUGKnD5zpJW6BT7QtA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?utf-8?B?U3TDqXBoYW5l?= Marchesin <stephane.marchesin@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ludovic Desroches <ludovic.desroches@atmel.com>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0481606629==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Adding Boris and Ludovic since this topic came up in a different thread
as well.

On Thu, Aug 21, 2014 at 01:25:07AM -0700, St=C3=A9phane Marchesin wrote:
> On Thu, Aug 21, 2014 at 12:36 AM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Tue, Aug 19, 2014 at 09:02:39PM -0700, St=C3=A9phane Marchesin wrote:
> >> On Tue, Apr 22, 2014 at 8:26 AM, Thierry Reding
> >> <thierry.reding@gmail.com> wrote:
> >> > On Tue, Apr 22, 2014 at 08:33:23PM +0530, Ajay kumar wrote:
> >> >> Hi Thierry,
> >> >>
> >> >> On Tue, Apr 22, 2014 at 2:03 PM, Thierry Reding
> >> >> <thierry.reding@gmail.com> wrote:
> >> >> > On Tue, Apr 22, 2014 at 04:09:13AM +0530, Ajay Kumar wrote:
> >> >> >> Register exynos_dp_panel before the list of exynos crtcs and
> >> >> >> connectors are probed.
> >> >> >>
> >> >> >> This is needed because exynos_dp_panel should be registered to
> >> >> >> the drm_panel list via panel-exynos-dp probe, i.e much before
> >> >> >> exynos_dp_bind calls of_drm_find_panel().
> >> >> >>
> >> >> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> >> >> ---
> >> >> >> Changes since V1:
> >> >> >>       Added platform_driver_unregister(&exynos_dp_panel_driver) =
to
> >> >> >>       exynos_drm_platform_remove as per Jingoo Han's correction
> >> >> >>
> >> >> >>  drivers/gpu/drm/exynos/exynos_drm_drv.c |   15 +++++++++++++++
> >> >> >>  drivers/gpu/drm/exynos/exynos_drm_drv.h |    1 +
> >> >> >>  2 files changed, 16 insertions(+)
> >> >> >>
> >> >> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/g=
pu/drm/exynos/exynos_drm_drv.c
> >> >> >> index 1d653f8..2db7f67 100644
> >> >> >> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> >> >> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> >> >> >> @@ -530,12 +530,23 @@ static int exynos_drm_platform_probe(struc=
t platform_device *pdev)
> >> >> >>               goto err_unregister_ipp_drv;
> >> >> >>  #endif
> >> >> >>
> >> >> >> +#ifdef CONFIG_DRM_PANEL_EXYNOS_DP
> >> >> >> +     ret =3D platform_driver_register(&exynos_dp_panel_driver);
> >> >> >> +     if (ret < 0)
> >> >> >> +             goto err_unregister_dp_panel;
> >> >> >> +#endif
> >> >> >
> >> >> > No, this is not how you're supposed to use DRM panel drivers. The=
 idea
> >> >> > is that you write a standalone driver for a given panel.
> >> >> >
> >> >> > What you do here has a number of problems. For one it's a driver =
that's
> >> >> > tightly coupled to Exynos SoCs. But if I have a different SoC tha=
t uses
> >> >> > the same panel I want to be able to use the same driver, and not =
have to
> >> >> > rewrite the driver for my SoC.
> >> >> >
> >> >> > Another problem is that you're assuming here that the driver is b=
uilt in
> >> >> > and it will break if you try to build either Exynos DRM or the pa=
nel
> >> >> > driver as a module. This is perhaps nothing you care about right =
now,
> >> >> > but eventually people will want to ship a single kernel that can =
run on
> >> >> > a number of SoCs. But if we keep adding things like this, that ke=
rnel
> >> >> > will keep growing in size until it no longer fits in any kind of =
memory.
> >> >> >
> >> >> > Thierry
> >> >>
> >> >> I completely agree with you in this!
> >> >>
> >> >> Yes, this is not acceptable, but I want to know an "acceptable"
> >> >> workaround for the situation below:
> >> >> I register the driver using module_init().
> >> >> And, exynos_drm gets probed much before the panel driver probe happ=
ens.
> >> >> So, the panel driver hasn't probed yet, but exynos_dp via exynos_drm
> >> >> tries to call
> >> >> "of_drm_find_panel" which always returns NULL.
> >> >
> >> > That's a situation that your driver needs to be able to deal with. T=
he
> >> > driver registration order doesn't matter one bit. It may happen to w=
ork
> >> > most of the time, but as soon as one of the resources that your panel
> >> > driver needs isn't there when the panel is probed, then it won't be
> >> > registered and of_drm_find_panel() will still return NULL.
> >> >
> >> > Usually the right thing to do in that case would be to return (and
> >> > propagate) -EPROBE_DEFER so that your driver's probe is deferred and
> >> > retried when other drivers have been probed. That way it should
> >> > eventually get a non-NULL panel.
> >>
> >> So I just gave this (drm_panel + probe deferring) a shot on exynos,
> >> and correctly reacting to -EPROBE_DEFER postpones DP initialization by
> >> approximately 1.5 second. Is there a good way to handle that? As it
> >> stands, this isn't usable.
> >
> > How much is 1.5 seconds compared to the overall boot time of the device?
>=20
> 1.5s is 15-20% of my boot time (if you count the boot time from
> firmware start to login prompt, otherwise it's more). Note that on
> other platforms, we've seen this take as much as 5 or 6s, but for the
> exynos case it is "only" 1.5s.
>=20
> > What exactly is causing this 1.5 second delay?
>=20
> A regulator isn't ready, and then drm_panel returns defer. Then the
> whole drm driver init is deferred.

That is the correct way to do this currently. It's unfortunate that it
causes such long delays.

> > This really is a fundamental issue with deferred probing and the issue
> > has come up several times in the past. A couple of possible solutions
> > have been proposed, with the latest being here[0] I think. That ended in
> > a bit of a debacle, unfortunately, but on of the outcomes was that a lot
> > of the ordering problems could be fixed by using phandle references to
> > track dependencies. I'm not aware of anyone working on that right now,
> > presumably because everyone is busy getting features merged rather than
> > optimizing boot speed.
>=20
> Yes, I don't believe boot time ordering will ever happen upstream,

Maybe explicit boot time ordering won't happen upstream, but I don't
think anyone would object if you posted patches that decrease boot time
significantly, provided that they're still a generic solution. Tracking
dependencies parse from a device tree sounds like an option that would
be acceptable.

> but then the current implementation with EPROBE_DEFER isn't usable either.

"Isn't usable" is pretty strong. It does get you a working panel, right?
It's perhaps not optimized, but it gives you something that's guaranteed
to work (unless you have an actual bug somewhere), and something that
works in the general case, for everyone.

> Any ideas? ATM it seems like the only way out is to just write my
> own dt format for the panel and ignore drm_panel.

Well, since probe order is currently dependent on device instantiation
order, one possibility would be to rearrange the DT nodes in a way that
dependencies are listed first. So in your case I'd expect the regulator
provider to be listed first, followed by the panel and finally the "DRM"
device. Providing none of them trigger deferred probing themselves they
should probe in exactly that order.

Of course there are no guarantees that the probing order will stay that
way forever and you will only be solving this problem for one device at
a time rather than in general (which is the primary reason for deferred
probing in the first place).

One other possibility I guess would be not to rely on deferred probing
but to enable DRM/KMS to hotplug panels. Theoretically this should be
possible already but it comes at a cost. If I'm not mistaken that's what
Boris implemented for the Atmel HLCDC driver. However if the panel isn't
available at DRM driver ->load() time, then it relies on the hotplugging
mechanism to detect the panel later on, which can itself introduce more
delays. I suspect this could be improved in various ways, but one of the
more complicated issues is that it causes problems when you want to use
the framebuffer console. The issue is that the fbdev helper code is set
up very early and if no outputs with valid modes are found it will
default to a 1024x768 resolution for the framebuffer console. At the
same time it will prevent any outputs that are hotplugged later on to
increase the resolution again. This works fine for monitors which
usually support a number of different modes (1024x768 being standard
enough that probably every monitor in existence supports it). But for
panels this won't work, since they usually support only a single mode.

There are a number of ways that this could be solved I guess. One would
be to defer fbdev creation itself until all outputs have been detected.
This could prove difficult because it may not always be possible to
determine which outputs to wait for. Another solution would be to allow
the framebuffer console to be resized, but I've been told in the past
that it's impractical if not impossible.

Of course if you don't need a framebuffer console (you could use kmscon
or none at all), then things should work for you if you simply consider
the panel as hotpluggable monitor.

Thierry

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT9busAAoJEN0jrNd/PrOhNAcP/iZG8EHJo3o7D5pDe5pfwBxU
PCMO/IpDLSJ61O76S7eDQLUKNntVjKHH5eZV15k79osxVuvfSQoEzR6MA7sniNHK
MUjMQITkWOjxxG0zXUBuFCKZaDyj7ZJyKJJV3mxFQFn8b1MHvoyfr8+0xqq9ni/X
0lww5cdkr6G5eggjwrCrnlRYxP3mXbf6cJ4vM76hdAKb37xaTrmtq8VPRfduFUBs
FJYvsf1gVQMFk29NGtshV8NO2ExsDeh0cn4N7437EvyydCwmNBilaOwzfND4zABU
yj9pJi81e45pRPHub6RtdZ/LfGdYVZepXPMoPS/fhy21Kqc2OwgHVCrwp5LGdVi5
MMyAuOfwpA2DlLgO1YFmooZgr2m8LhaK5AIPKp73P8c5wLCkawBSLyYr774rbpTP
OCS4dEjGnUINA/kfjR/K3x26KzBMllMaqkD1YchUrP+pokqgStjcUJMDXx1vkE2F
5Gc8HuBTigGEJQ6GIcnbGdlganXyqa2LBImRBPN0CVIPEdaf47vQqdhHhKnRNIB+
5O2Xdxcr3DEt+mPkoEdMKR9VB0pvhsw6PeDAIOdleP3d51tL4ilSBtPL4xRSBBZj
RcH7Eeg9j7/jJrkdbJfyRCcjiUvImnxzNAF8JAN7VN3p0hyVP5bD/J/Jk2D0skp9
m3kaq1hY+VWrAEh056O9
=n1q1
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--

--===============0481606629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0481606629==--
