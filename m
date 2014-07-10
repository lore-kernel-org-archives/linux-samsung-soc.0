From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 05/14] drm/exynos: dsi: add pass TE host ops to
 support LCD I80 interface
Date: Thu, 10 Jul 2014 09:38:27 +0200
Message-ID: <20140710073826.GB17918@ulmo>
References: <1404779987-5337-1-git-send-email-yj44.cho@samsung.com>
 <1404779987-5337-6-git-send-email-yj44.cho@samsung.com>
 <20140709152207.GA17359@ulmo> <53BDE6FF.1000600@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1430772247=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53BDE6FF.1000600@samsung.com>
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


--===============1430772247==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2014 at 10:06:07AM +0900, YoungJun Cho wrote:
> On 07/10/2014 12:22 AM, Thierry Reding wrote:
> >On Tue, Jul 08, 2014 at 09:39:38AM +0900, YoungJun Cho wrote:
> >>To support LCD I80 interface, the DSI host calls this function
> >>to notify the panel tearing effect synchronization signal to
> >>the CRTC device manager to trigger to transfer video image.
> >>
> >>Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> >>Acked-by: Inki Dae <inki.dae@samsung.com>
> >>Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> >>---
> >>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 11 +++++++++++
> >>  include/drm/drm_mipi_dsi.h              |  7 +++++++
> >>  2 files changed, 18 insertions(+)
> >>
> >>diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/=
exynos/exynos_drm_dsi.c
> >>index dad543a..76e34ca 100644
> >>--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>@@ -24,6 +24,7 @@
> >>  #include <video/mipi_display.h>
> >>  #include <video/videomode.h>
> >>
> >>+#include "exynos_drm_crtc.h"
> >>  #include "exynos_drm_drv.h"
> >>
> >>  /* returns true iff both arguments logically differs */
> >>@@ -1041,10 +1042,20 @@ static ssize_t exynos_dsi_host_transfer(struct =
mipi_dsi_host *host,
> >>  	return (ret < 0) ? ret : xfer.rx_done;
> >>  }
> >>
> >>+static void exynos_dsi_host_pass_te(struct mipi_dsi_host *host)
> >>+{
> >>+	struct exynos_dsi *dsi =3D host_to_dsi(host);
> >>+	struct drm_encoder *encoder =3D dsi->encoder;
> >>+
> >>+	if (dsi->state & DSIM_STATE_ENABLED)
> >>+		exynos_drm_crtc_te_handler(encoder->crtc);
> >>+}
> >>+
> >>  static const struct mipi_dsi_host_ops exynos_dsi_ops =3D {
> >>  	.attach =3D exynos_dsi_host_attach,
> >>  	.detach =3D exynos_dsi_host_detach,
> >>  	.transfer =3D exynos_dsi_host_transfer,
> >>+	.pass_te =3D exynos_dsi_host_pass_te,
> >>  };
> >>
> >>  static int exynos_dsi_poweron(struct exynos_dsi *dsi)
> >>diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> >>index 944f33f..3f21bea 100644
> >>--- a/include/drm/drm_mipi_dsi.h
> >>+++ b/include/drm/drm_mipi_dsi.h
> >>@@ -49,6 +49,12 @@ struct mipi_dsi_msg {
> >>   * @detach: detach DSI device from DSI host
> >>   * @transfer: send and/or receive DSI packet, return number of receiv=
ed bytes,
> >>   * 	      or error
> >>+ * @pass_te: call the crtc te_handler() callback from DSI host.
> >>+ *	     The panel generates tearing effect synchronization signal betw=
een
> >>+ *	     MCU and FB to display video images. And the display controller
> >>+ *	     should trigger to transfer video image at this signal. So the =
panel
> >>+ *	     receives the TE IRQ, then calls this function to notify it to =
the
> >>+ *	     display controller.
> >>   */
> >>  struct mipi_dsi_host_ops {
> >>  	int (*attach)(struct mipi_dsi_host *host,
> >>@@ -57,6 +63,7 @@ struct mipi_dsi_host_ops {
> >>  		      struct mipi_dsi_device *dsi);
> >>  	ssize_t (*transfer)(struct mipi_dsi_host *host,
> >>  			    struct mipi_dsi_msg *msg);
> >>+	void (*pass_te)(struct mipi_dsi_host *host);
> >
> >I've objected to this particular change before and that objection still
> >stands. I don't see how this is related to DSI. It seems like an
> >implementation detail of this particular setup and I think it should be
> >handled differently (within the Exynos DSI controller implementation
> >possibly).
> >
>=20
> Okay, I understand what you mean.
> As you know, this function is called by panel TE interrupt handler, so it
> could be accessed by panel.
> Do you have any good idea for panel to access exynos_drm_dsi directly
> without mipi_dis_host_ops?

I've gone through the DSI specification again and the only mention of
the tearing effect is in section 8.12 "TE Signaling in DSI". That says
the following:

	A Command Mode display module has its own timing controller and
	local frame buffer for display refresh. In some cases the host
	processor needs to be notified of timing events on the display
	module, e.g. the start of vertical blanking or similar timing
	information. In a traditional parallel-bus interface like DBI-2,
	a dedicated signal wire labeled TE (Tearing Effect) is provided
	to convey such timing information to the host processor. In a
	DSI system, the same information, with reasonably low latency,
	shall be transmitted from the display module to the host
	processor when requested, using the bidirectional Data Lane.

My interpretation of that is that a DSI peripheral doesn't have a
dedicated TE signal. Now the panel that you want to support here seems
to have one, so I'm wondering if maybe it isn't a DSI panel at all but
rather DBI.

The specification goes into further detail about how to perform the TE
reporting in DSI. Essentially it consists of giving the peripheral
control of the bus via a BTA and then waiting for the peripheral to
report back with the TE event.

It would really help if somebody could find a datasheet for the panel so
that we don't have to keep guessing what the actual interface is and how
it's supposed to work.

Thierry

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTvkLyAAoJEN0jrNd/PrOh498QAKhfUS2PIekWGlAv50Y1ctDZ
vUYfcIKEHlBjBIhDFTI3DUZEhS6MRxpgnJ29eHBGED4yc0cWobtEWLvZhd94j3nh
UjOqPXFrXHsIPoi2N0emcPR/Giiy25ofMUhnpSZ3sI1sNP7QTIo8fSNFLidaafRT
4bOM4A0tS/yJ7MLF1cwHASicnIqCyNeg9ToblJLrLa+sAd5yZagXJiFSOKChc3tq
ps9pwM3Nrq1bWNXfuKDcKZVoSLeQm5xlfZDKAS63heUXfm44yrInNVpWJH+Drtfv
rmjfxwdxA41rLuZ1jTDR3GUGOoRzHadOFub0h1zvRmygHDbzKiOovFHRpjvx5Ad8
vacRGLbTRallAOK3xHn6u78kVe1hDk1toEMZNfShqJ/jrFMAlM/S8dXyMlWdCqb2
GoO7f1vzNRRBayaFKNaPga6xliyYjoi5hqwbQ1l07pvwxNhgdt18FAzm0uwihBcG
HdT/UnGI5qBSkmwvXKIe5hmIuBn4YquZ6pTV1+HjwD6wwgmeP0W2ueLr2RMFwmf9
fq3ZG89pscFxZ0OD2SC6SWfRYTj0FdGD+ZGsFtxoG6lJ2skFSQcWF73ycR9ZlKsY
MHjSsiYDKQZhKrSCmcdFU1dcuA5N6NxKz4woJGV0anV/k78oquiiVQtoe6f/S1CZ
xudd54ysmlnIEQepnBUr
=3/sx
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--

--===============1430772247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1430772247==--
