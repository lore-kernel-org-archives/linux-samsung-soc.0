From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 05/14] drm/exynos: dsi: add pass TE host ops to
 support LCD I80 interface
Date: Mon, 14 Jul 2014 13:03:27 +0200
Message-ID: <20140714110326.GA31460@ulmo>
References: <1404779987-5337-1-git-send-email-yj44.cho@samsung.com>
 <1404779987-5337-6-git-send-email-yj44.cho@samsung.com>
 <20140709152207.GA17359@ulmo>
 <53BDE6FF.1000600@samsung.com>
 <20140710073826.GB17918@ulmo>
 <53C3A15F.4020401@samsung.com>
 <20140714094130.GD9755@ulmo>
 <53C3B4C8.1070601@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:57392 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753756AbaGNLDc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 07:03:32 -0400
Content-Disposition: inline
In-Reply-To: <53C3B4C8.1070601@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2014 at 07:45:28PM +0900, YoungJun Cho wrote:
> On 07/14/2014 06:41 PM, Thierry Reding wrote:
[...]
> >That said, I've been doing some research and it seems like we have a
> >somewhat similar feature on Tegra. What happens there is that there are
> >three GPIO pins that can be repurposed for TE signalling. But as opposed
> >to using them as interrupts the display controller can be configured to
> >use them, upon which it will automatically handle the TE signal by
> >sending the next frame.
>=20
> Could you explain more detail how the Tegra display controller could be
> configured with this GPIO pins?
> I have no idea except that the display controller registers this GPIO as =
an
> IRQ.

On Tegra the display controller has a special register that can be
programmed to use one of the three GPIOs as TE signal. Then the display
controller can be configured in one-shot (non-continuous) mode, which
means that software needs to explicitly set a trigger bit to tell the
display controller to send a new frame. If TE signalling is enabled,
then the display controller will not immediately send a new frame when
triggered but wait for signalling of this GPIO.

> >So we have at least two very different implementations of this on two
> >different SoCs. Further the specification explicitly recommends using
> >the BTA sequence and DSI protocol to wait for TE. So I still think that
> >controllers that provide an additional, non-spec compliant method to
> >signal TE should handle it separately rather than within DSI. Otherwise
> >we essentially need to make the DSI "core" aware of all these quirks,
> >and I'd rather avoid that.
>=20
> You mean, the DSI specification guides to use BTA, so it's better to use
> display controller rather than DSIM, right?

What I'm saying is that there's nothing about a side-band TE wire in the
DSI spec. In fact the spec explicitly says that this mechanism of an
external TE wire from older protocols (DBI) was replaced by the BTA
sequence over the protocol.

Now, my understanding is that using the BTA sequence over the DSI
protocol would introduce some latency and that forces some panel vendors
to still provide a side-band TE wire even in DSI compliant panels. But
since this is not part of the specification there is no standard way to
do this (as evidenced by Tegra and Exynos). Therefore putting such
functionality into the core DSI code is bad.

But that doesn't mean that you have to put this functionality into the
display controller driver on Exynos. What I'm saying is that it should
be handled by the SoC driver rather than the core. Where exactly
probably depends on the particular case.

> >>As Inki commented before, I'll try to use remote-endpoint property of D=
SI
> >>device node in exynos DSIM driver and call FIMD notifier.
> >
> >Sounds like it matches what I said above. I'm not a huge fan of
> >notifiers, but if it works for you I suppose that's fine. The
> >alternative would be to directly call a FIMD function, which is
> >somewhat more explicit than a notifier.
>=20
> Yes, I also like explicit call, so I want to use dsi_host_ops and calls it
> in panel. But there is an objection to use dis_host_ops, we think notifier
> in exynos dsim for fimd(display controller).

There are other ways to explicitly call into the display controller. You
could for example get access to the CRTC that DSIM is currently
connected to (via exynos_dsi.encoder->crtc) and then cast that to a
struct exynos_drm_crtc and call a function to trigger a new frame to be
sent (for example exynos_drm_crtc_send_frame()). This assumes that you
can safely cast struct drm_crtc * to struct exynos_drm_crtc *, but that
shouldn't be a problem.

With the above, you could make the DSIM handle the TE signal interrupts
and trigger the DC using the new exynos_drm_crtc_send_frame() function.

Thierry

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTw7j+AAoJEN0jrNd/PrOhzZsP/1PBlLZiqSrS0g+G3r3gFW+U
cGwTEclk46jYQ197eRBFhKkh6LE/y9QGwUJEvpaviFicOpYntk2SD5RhAPppL7Mn
6ABk4j9DXPd1Zb9Wd3WtlmGpixsVAe4Pz6cGP8GoPPJU67TjpaauVcrA+c4ZeZ+4
jY6u/AsBQZJOHOCVS7XxgTj440oaYgfJpcBzebE7c5EoWIGnwfEG4J3B0ErpHvk/
GrckOEdDRrnnO6qpMHpFGaVn66AHmyUnfXJ3OC99Mnm2k3H5R3NEP/MfzCapBMbS
HRxfD9Pa8eMt0dhQWCrW6yZSFo8Imswwa+eTbutgBe+eyPIS007lYwnwVBwGBVgj
lMYC0Tc1CXKV2fTnY2YWSZjqVTI+h100tSRjmkVc5P7wTOmcNLRwpf8FVf4kjIrE
2CfsB2svtjx+aE6o455VMbYu1rvDXy/SsSSVbeviHVEt/7uszouVeoaGZzEbjOqD
vuudmVsK4GU6vaSo9Q8ZFAGjwnB9URSXIm64gE2CQGtlgiYHFwFHU4+wpVmFHhg8
AUu286LBgsMmpmwwSgBdvP8/8YC197+HBtHwzkW9xYT5Gwv9GmQFlTogJurS2425
4QcQUy8FhLc94rv9JIL+GdifzSiHuZWjH7RQwoHhCc/h0QWe3NvV7z8R2gjeYKJk
ZvPwX8/Q9apncLOcYUY3
=SSUB
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
