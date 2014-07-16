From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 05/14] drm/exynos: dsi: add pass TE host ops to
 support LCD I80 interface
Date: Wed, 16 Jul 2014 09:54:58 +0200
Message-ID: <20140716075457.GH7978@ulmo>
References: <1404779987-5337-6-git-send-email-yj44.cho@samsung.com>
 <20140709152207.GA17359@ulmo> <53BDE6FF.1000600@samsung.com>
 <20140710073826.GB17918@ulmo> <53C3A15F.4020401@samsung.com>
 <20140714094130.GD9755@ulmo> <53C3B4C8.1070601@samsung.com>
 <20140714110326.GA31460@ulmo> <53C49336.5050909@samsung.com>
 <53C5E20D.5010704@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1223882680=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53C5E20D.5010704@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============1223882680==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8/pVXlBMPtxfSuJG"
Content-Disposition: inline


--8/pVXlBMPtxfSuJG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 11:23:09AM +0900, YoungJun Cho wrote:
> Hi Inki,
>=20
> On 07/15/2014 11:34 AM, Inki Dae wrote:
> >On 2014=EB=85=84 07=EC=9B=94 14=EC=9D=BC 20:03, Thierry Reding wrote:
> >>On Mon, Jul 14, 2014 at 07:45:28PM +0900, YoungJun Cho wrote:
> >>>On 07/14/2014 06:41 PM, Thierry Reding wrote:
> >>[...]
> >>>>That said, I've been doing some research and it seems like we have a
> >>>>somewhat similar feature on Tegra. What happens there is that there a=
re
> >>>>three GPIO pins that can be repurposed for TE signalling. But as oppo=
sed
> >>>>to using them as interrupts the display controller can be configured =
to
> >>>>use them, upon which it will automatically handle the TE signal by
> >>>>sending the next frame.
> >>>
> >>>Could you explain more detail how the Tegra display controller could be
> >>>configured with this GPIO pins?
> >>>I have no idea except that the display controller registers this GPIO =
as an
> >>>IRQ.
> >>
> >>On Tegra the display controller has a special register that can be
> >>programmed to use one of the three GPIOs as TE signal. Then the display
> >>controller can be configured in one-shot (non-continuous) mode, which
> >>means that software needs to explicitly set a trigger bit to tell the
> >>display controller to send a new frame. If TE signalling is enabled,
> >>then the display controller will not immediately send a new frame when
> >>triggered but wait for signalling of this GPIO.
> >>
> >>>>So we have at least two very different implementations of this on two
> >>>>different SoCs. Further the specification explicitly recommends using
> >>>>the BTA sequence and DSI protocol to wait for TE. So I still think th=
at
> >>>>controllers that provide an additional, non-spec compliant method to
> >>>>signal TE should handle it separately rather than within DSI. Otherwi=
se
> >>>>we essentially need to make the DSI "core" aware of all these quirks,
> >>>>and I'd rather avoid that.
> >>>
> >>>You mean, the DSI specification guides to use BTA, so it's better to u=
se
> >>>display controller rather than DSIM, right?
> >>
> >>What I'm saying is that there's nothing about a side-band TE wire in the
> >>DSI spec. In fact the spec explicitly says that this mechanism of an
> >>external TE wire from older protocols (DBI) was replaced by the BTA
> >>sequence over the protocol.
> >>
> >>Now, my understanding is that using the BTA sequence over the DSI
> >>protocol would introduce some latency and that forces some panel vendors
> >>to still provide a side-band TE wire even in DSI compliant panels. But
> >>since this is not part of the specification there is no standard way to
> >>do this (as evidenced by Tegra and Exynos). Therefore putting such
> >>functionality into the core DSI code is bad.
> >>
> >>But that doesn't mean that you have to put this functionality into the
> >>display controller driver on Exynos. What I'm saying is that it should
> >>be handled by the SoC driver rather than the core. Where exactly
> >>probably depends on the particular case.
> >>
> >>>>>As Inki commented before, I'll try to use remote-endpoint property o=
f DSI
> >>>>>device node in exynos DSIM driver and call FIMD notifier.
> >>>>
> >>>>Sounds like it matches what I said above. I'm not a huge fan of
> >>>>notifiers, but if it works for you I suppose that's fine. The
> >>>>alternative would be to directly call a FIMD function, which is
> >>>>somewhat more explicit than a notifier.
> >>>
> >>>Yes, I also like explicit call, so I want to use dsi_host_ops and call=
s it
> >>>in panel. But there is an objection to use dis_host_ops, we think noti=
fier
> >>>in exynos dsim for fimd(display controller).
> >>
> >>There are other ways to explicitly call into the display controller. You
> >>could for example get access to the CRTC that DSIM is currently
> >>connected to (via exynos_dsi.encoder->crtc) and then cast that to a
> >>struct exynos_drm_crtc and call a function to trigger a new frame to be
> >>sent (for example exynos_drm_crtc_send_frame()). This assumes that you
> >>can safely cast struct drm_crtc * to struct exynos_drm_crtc *, but that
> >>shouldn't be a problem.
> >>
> >>With the above, you could make the DSIM handle the TE signal interrupts
> >>and trigger the DC using the new exynos_drm_crtc_send_frame() function.
> >>
> >
> >It seems better than the use of notifier. Actually, original patch used
> >this way except TE event.
> >Mr. Cho, let's use remote-endpoint property and this way instead of
> >notifier.
> >
>=20
> The struct exynos_dsi has panel_node, which is valid by
> exynos_dsi_host_attach() is called from panel, we could use it instead of
> getting new remote-endpoint node.
>=20
> So after called exynos_dsi_host_attach(), the dsi driver could know that =
the
> panel supports mipi command mode or video mode,
> and if the panel is for mipi command mode one, dsi driver gets panel te g=
pio
> and registers its irq.

Why does the TE GPIO even need to be in the panel's device tree node?
Wouldn't it make more sense for it to be in the DSIM node? After all
that's what the GPIO is connected to, right? Well, at least logically
if not physically.

Thierry

--8/pVXlBMPtxfSuJG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTxi/RAAoJEN0jrNd/PrOhFBwP/0I8+O8e5l6BhhXE1t9+lfdE
/s/OmPJe+IiAiDafSV98O2AV5pI6f2UcX52hAgPLVU1E6tZ0dYlR6I675ndeCKSv
+7QHp4+AXtz/9sP3iGKsbVdQtS4Ie89eNgQxMGV4vSyhgy+WoAZRBHtej4b/jxXl
fgp/2LXko6e7Tf6k9+7Eex7p7gXoNfLkbNomyFr7tewaNS0rNlRbWVgDp8MRZWWt
Ouq48GpUcICxJ+8/KIEvt9dyFAiSGNS7aqMkypsbDdDI174041PIxMls53HNiO/o
G4U1eacp3/wtldd2B6bGuiy5y0r1UePlHOpCxuy7iEQkDFxMMl6EouBlVYXiraxW
M5RCrjdMLVVIMf9LgTm/aRVK84edf71p9EQVQLJJuNW/KpeCSyKeuQJVlnMVIWJX
RLS6WufZRGHrCu97Ee1Yq9/PaqfJorK0nVc2INQHgDs7ylU8uIJH6YZhlR4SXxu7
diYfvdg1AlNB3ZfoqNhw0aWgDpYA6QdZhogZs6JtY/HWPFqAGQ46xDzj5OIVkjFt
K9CpGY3Oh3Hi3TVHC7RyHTHytsVyl3heOzdlty+35/sxrdGR1mecLx2j3Off4q6+
H9dDI4NmByOmxO6MJlrqZaTYx/Vo9CDtT4ARzavZu1aVEtN+2V8ZK27HY1t/dFo2
cC3IBJBAXraLUXbeIeQ1
=v39U
-----END PGP SIGNATURE-----

--8/pVXlBMPtxfSuJG--

--===============1223882680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1223882680==--
