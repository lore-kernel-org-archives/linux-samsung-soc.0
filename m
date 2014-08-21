From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 4/9] drm/exynos: add exynos_dp_panel driver
 registration to drm driver
Date: Thu, 21 Aug 2014 11:37:57 +0200
Message-ID: <20140821093756.GC13733@ulmo>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-5-git-send-email-ajaykumar.rs@samsung.com>
 <20140422083311.GC17275@ulmo>
 <CAEC9eQPGfFFRNF4nOgci8KCc+9E=MQRmU-Cz=TGgEdiaOVqTMg@mail.gmail.com>
 <20140422152657.GB30048@ulmo>
 <CACP_E+KntYzVDjZrXcByU2LrCtzDbwW79LpSAazjHzbYbQrpDQ@mail.gmail.com>
 <20140821073631.GH4486@ulmo>
 <CACP_E++72CuDCf1yOKk8b0O49mOd1YvBUUGKnD5zpJW6BT7QtA@mail.gmail.com>
 <CAEC9eQM7R6qy_cVnmFhRTQO+VPT1v25oXW+KSU84G7qGQe-wfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1106602166=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQM7R6qy_cVnmFhRTQO+VPT1v25oXW+KSU84G7qGQe-wfw@mail.gmail.com>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1106602166==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
Content-Disposition: inline


--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2014 at 02:57:21PM +0530, Ajay kumar wrote:
> On Thu, Aug 21, 2014 at 1:55 PM, St=C3=A9phane Marchesin
> <stephane.marchesin@gmail.com> wrote:
> > On Thu, Aug 21, 2014 at 12:36 AM, Thierry Reding
> > <thierry.reding@gmail.com> wrote:
> >> On Tue, Aug 19, 2014 at 09:02:39PM -0700, St=C3=A9phane Marchesin wrot=
e:
> >>> On Tue, Apr 22, 2014 at 8:26 AM, Thierry Reding
> >>> <thierry.reding@gmail.com> wrote:
> >>> > On Tue, Apr 22, 2014 at 08:33:23PM +0530, Ajay kumar wrote:
> >>> >> Hi Thierry,
> >>> >>
> >>> >> On Tue, Apr 22, 2014 at 2:03 PM, Thierry Reding
> >>> >> <thierry.reding@gmail.com> wrote:
> >>> >> > On Tue, Apr 22, 2014 at 04:09:13AM +0530, Ajay Kumar wrote:
> >>> >> >> Register exynos_dp_panel before the list of exynos crtcs and
> >>> >> >> connectors are probed.
> >>> >> >>
> >>> >> >> This is needed because exynos_dp_panel should be registered to
> >>> >> >> the drm_panel list via panel-exynos-dp probe, i.e much before
> >>> >> >> exynos_dp_bind calls of_drm_find_panel().
> >>> >> >>
> >>> >> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >>> >> >> ---
> >>> >> >> Changes since V1:
> >>> >> >>       Added platform_driver_unregister(&exynos_dp_panel_driver)=
 to
> >>> >> >>       exynos_drm_platform_remove as per Jingoo Han's correction
> >>> >> >>
> >>> >> >>  drivers/gpu/drm/exynos/exynos_drm_drv.c |   15 +++++++++++++++
> >>> >> >>  drivers/gpu/drm/exynos/exynos_drm_drv.h |    1 +
> >>> >> >>  2 files changed, 16 insertions(+)
> >>> >> >>
> >>> >> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/=
gpu/drm/exynos/exynos_drm_drv.c
> >>> >> >> index 1d653f8..2db7f67 100644
> >>> >> >> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> >>> >> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> >>> >> >> @@ -530,12 +530,23 @@ static int exynos_drm_platform_probe(stru=
ct platform_device *pdev)
> >>> >> >>               goto err_unregister_ipp_drv;
> >>> >> >>  #endif
> >>> >> >>
> >>> >> >> +#ifdef CONFIG_DRM_PANEL_EXYNOS_DP
> >>> >> >> +     ret =3D platform_driver_register(&exynos_dp_panel_driver);
> >>> >> >> +     if (ret < 0)
> >>> >> >> +             goto err_unregister_dp_panel;
> >>> >> >> +#endif
> >>> >> >
> >>> >> > No, this is not how you're supposed to use DRM panel drivers. Th=
e idea
> >>> >> > is that you write a standalone driver for a given panel.
> >>> >> >
> >>> >> > What you do here has a number of problems. For one it's a driver=
 that's
> >>> >> > tightly coupled to Exynos SoCs. But if I have a different SoC th=
at uses
> >>> >> > the same panel I want to be able to use the same driver, and not=
 have to
> >>> >> > rewrite the driver for my SoC.
> >>> >> >
> >>> >> > Another problem is that you're assuming here that the driver is =
built in
> >>> >> > and it will break if you try to build either Exynos DRM or the p=
anel
> >>> >> > driver as a module. This is perhaps nothing you care about right=
 now,
> >>> >> > but eventually people will want to ship a single kernel that can=
 run on
> >>> >> > a number of SoCs. But if we keep adding things like this, that k=
ernel
> >>> >> > will keep growing in size until it no longer fits in any kind of=
 memory.
> >>> >> >
> >>> >> > Thierry
> >>> >>
> >>> >> I completely agree with you in this!
> >>> >>
> >>> >> Yes, this is not acceptable, but I want to know an "acceptable"
> >>> >> workaround for the situation below:
> >>> >> I register the driver using module_init().
> >>> >> And, exynos_drm gets probed much before the panel driver probe hap=
pens.
> >>> >> So, the panel driver hasn't probed yet, but exynos_dp via exynos_d=
rm
> >>> >> tries to call
> >>> >> "of_drm_find_panel" which always returns NULL.
> >>> >
> >>> > That's a situation that your driver needs to be able to deal with. =
The
> >>> > driver registration order doesn't matter one bit. It may happen to =
work
> >>> > most of the time, but as soon as one of the resources that your pan=
el
> >>> > driver needs isn't there when the panel is probed, then it won't be
> >>> > registered and of_drm_find_panel() will still return NULL.
> >>> >
> >>> > Usually the right thing to do in that case would be to return (and
> >>> > propagate) -EPROBE_DEFER so that your driver's probe is deferred and
> >>> > retried when other drivers have been probed. That way it should
> >>> > eventually get a non-NULL panel.
> >>>
> >>> So I just gave this (drm_panel + probe deferring) a shot on exynos,
> >>> and correctly reacting to -EPROBE_DEFER postpones DP initialization by
> >>> approximately 1.5 second. Is there a good way to handle that? As it
> >>> stands, this isn't usable.
> >>
> >> How much is 1.5 seconds compared to the overall boot time of the devic=
e?
> >
> > 1.5s is 15-20% of my boot time (if you count the boot time from
> > firmware start to login prompt, otherwise it's more). Note that on
> > other platforms, we've seen this take as much as 5 or 6s, but for the
> > exynos case it is "only" 1.5s.
> >
> >> What exactly is causing this 1.5 second delay?
> >
> > A regulator isn't ready, and then drm_panel returns defer. Then the
> > whole drm driver init is deferred.
> >
> >>
> >> This really is a fundamental issue with deferred probing and the issue
> >> has come up several times in the past. A couple of possible solutions
> >> have been proposed, with the latest being here[0] I think. That ended =
in
> >> a bit of a debacle, unfortunately, but on of the outcomes was that a l=
ot
> >> of the ordering problems could be fixed by using phandle references to
> >> track dependencies. I'm not aware of anyone working on that right now,
> >> presumably because everyone is busy getting features merged rather than
> >> optimizing boot speed.
> >
> > Yes, I don't believe boot time ordering will ever happen upstream, but
> > then the current implementation with EPROBE_DEFER isn't usable either.
> > Any ideas? ATM it seems like the only way out is to just write my
> > own dt format for the panel and ignore drm_panel.
> Something like this:
> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeo=
s-3.8/drivers/gpu/drm/exynos/exynos_dp_core.c
>=20
> With this way also, we would expect the regulator to come up early(before=
 drm).

Well, that's pretty much what St=C3=A9phane proposed. You don't use DRM pan=
el
at all and instead rely on some "platform data" to get the information
that you need. You're basically throwing everything we've been working
towards with DT for the past three years out the door. Also as soon as
you encounter the first device that's not covered by lcd_vdd, vcd_led
regulators and lcd_en, led_en GPIOs you have a problem. There's also no
reuse across SoCs whatsoever.

Really, we should be finding ways to fix problems, not work around them
in every driver because the real fixes look too daunting at the moment.

Thierry

--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT9b30AAoJEN0jrNd/PrOh+oYQAJYUQc56yqrwHG/TZalRjMEI
ey8OdL1NKBkyifHyZFmAEXwJkEqtTqZUKX6NbBIIIUl86SlKYC7YnzjfJT1HkLY8
edyUG9l/5L5aNoXwCWeEHrG1UPdZOsnvgf0hf9pXwmYSmHKFK6zMnfgpCS6bW7ep
L09SghklWUFqdzWIuhyWJ7XzyTaLbdcnbCCcBK4BIk1s6kxdjxPw9hzKeAZrtF2w
zgJjwTra0xDxAGx080aCCnVDUagZrLLCmV0/xGF2cFMGx/B19lgize+BzBzxt9+g
3ilOJBdyvweSmIjTaHfEAco5OKh2cw47tAfkWWxpG2Wl+ybp+Y4tIRG7dDySB0UX
QseVAuSLsUHjfgY15ZP2Nz8bx7/4fwx+YnTbMAb/qYKh66TNESQ9v+v6ps4qybm0
wM8zKKjtYtcL8730qoUuifqswf8x8Cg6P6BMGV/Z4DXQHbscssxArmYp9cB93Dw+
LL9r/sC2olLT7ag+SHbsPubrXRnRzZwo+kKfE4LIbNMZIjlU/Fr7ATDjHAg1YRUE
3dQGXMGRZQCk2UX6UCXq2NMgiQBs7SIUXmmDyVkHtRlCjVPqZasGqld7Q/Y4A+yE
WcnZMN2uFdGVU+S8nnWE5S2gGFfibBr8bpz/yxcXKRMZQ4f8QFDJQd2Ky+wJ/oeF
JijjuCpp6xIsDZ17v+X9
=1SiQ
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--

--===============1106602166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1106602166==--
