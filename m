From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 05/14] drm/exynos: dsi: add pass TE host ops to
 support LCD I80 interface
Date: Mon, 14 Jul 2014 11:41:33 +0200
Message-ID: <20140714094130.GD9755@ulmo>
References: <1404779987-5337-1-git-send-email-yj44.cho@samsung.com>
 <1404779987-5337-6-git-send-email-yj44.cho@samsung.com>
 <20140709152207.GA17359@ulmo> <53BDE6FF.1000600@samsung.com>
 <20140710073826.GB17918@ulmo> <53C3A15F.4020401@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1246043264=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53C3A15F.4020401@samsung.com>
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


--===============1246043264==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LKTjZJSUETSlgu2t"
Content-Disposition: inline


--LKTjZJSUETSlgu2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2014 at 06:22:39PM +0900, YoungJun Cho wrote:
> Hi Thierry,
>=20
> Thank you for comment.
>=20
> On 07/10/2014 04:38 PM, Thierry Reding wrote:
> >On Thu, Jul 10, 2014 at 10:06:07AM +0900, YoungJun Cho wrote:
> >>On 07/10/2014 12:22 AM, Thierry Reding wrote:
> >>>On Tue, Jul 08, 2014 at 09:39:38AM +0900, YoungJun Cho wrote:
> >>>>To support LCD I80 interface, the DSI host calls this function
> >>>>to notify the panel tearing effect synchronization signal to
> >>>>the CRTC device manager to trigger to transfer video image.
> >>>>
> >>>>Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> >>>>Acked-by: Inki Dae <inki.dae@samsung.com>
> >>>>Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> >>>>---
> >>>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 11 +++++++++++
> >>>>  include/drm/drm_mipi_dsi.h              |  7 +++++++
> >>>>  2 files changed, 18 insertions(+)
> >>>>
> >>>>diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/dr=
m/exynos/exynos_drm_dsi.c
> >>>>index dad543a..76e34ca 100644
> >>>>--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>>>+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>>>@@ -24,6 +24,7 @@
> >>>>  #include <video/mipi_display.h>
> >>>>  #include <video/videomode.h>
> >>>>
> >>>>+#include "exynos_drm_crtc.h"
> >>>>  #include "exynos_drm_drv.h"
> >>>>
> >>>>  /* returns true iff both arguments logically differs */
> >>>>@@ -1041,10 +1042,20 @@ static ssize_t exynos_dsi_host_transfer(struc=
t mipi_dsi_host *host,
> >>>>  	return (ret < 0) ? ret : xfer.rx_done;
> >>>>  }
> >>>>
> >>>>+static void exynos_dsi_host_pass_te(struct mipi_dsi_host *host)
> >>>>+{
> >>>>+	struct exynos_dsi *dsi =3D host_to_dsi(host);
> >>>>+	struct drm_encoder *encoder =3D dsi->encoder;
> >>>>+
> >>>>+	if (dsi->state & DSIM_STATE_ENABLED)
> >>>>+		exynos_drm_crtc_te_handler(encoder->crtc);
> >>>>+}
> >>>>+
> >>>>  static const struct mipi_dsi_host_ops exynos_dsi_ops =3D {
> >>>>  	.attach =3D exynos_dsi_host_attach,
> >>>>  	.detach =3D exynos_dsi_host_detach,
> >>>>  	.transfer =3D exynos_dsi_host_transfer,
> >>>>+	.pass_te =3D exynos_dsi_host_pass_te,
> >>>>  };
> >>>>
> >>>>  static int exynos_dsi_poweron(struct exynos_dsi *dsi)
> >>>>diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> >>>>index 944f33f..3f21bea 100644
> >>>>--- a/include/drm/drm_mipi_dsi.h
> >>>>+++ b/include/drm/drm_mipi_dsi.h
> >>>>@@ -49,6 +49,12 @@ struct mipi_dsi_msg {
> >>>>   * @detach: detach DSI device from DSI host
> >>>>   * @transfer: send and/or receive DSI packet, return number of rece=
ived bytes,
> >>>>   * 	      or error
> >>>>+ * @pass_te: call the crtc te_handler() callback from DSI host.
> >>>>+ *	     The panel generates tearing effect synchronization signal be=
tween
> >>>>+ *	     MCU and FB to display video images. And the display controll=
er
> >>>>+ *	     should trigger to transfer video image at this signal. So th=
e panel
> >>>>+ *	     receives the TE IRQ, then calls this function to notify it t=
o the
> >>>>+ *	     display controller.
> >>>>   */
> >>>>  struct mipi_dsi_host_ops {
> >>>>  	int (*attach)(struct mipi_dsi_host *host,
> >>>>@@ -57,6 +63,7 @@ struct mipi_dsi_host_ops {
> >>>>  		      struct mipi_dsi_device *dsi);
> >>>>  	ssize_t (*transfer)(struct mipi_dsi_host *host,
> >>>>  			    struct mipi_dsi_msg *msg);
> >>>>+	void (*pass_te)(struct mipi_dsi_host *host);
> >>>
> >>>I've objected to this particular change before and that objection still
> >>>stands. I don't see how this is related to DSI. It seems like an
> >>>implementation detail of this particular setup and I think it should be
> >>>handled differently (within the Exynos DSI controller implementation
> >>>possibly).
> >>>
> >>
> >>Okay, I understand what you mean.
> >>As you know, this function is called by panel TE interrupt handler, so =
it
> >>could be accessed by panel.
> >>Do you have any good idea for panel to access exynos_drm_dsi directly
> >>without mipi_dis_host_ops?
> >
> >I've gone through the DSI specification again and the only mention of
> >the tearing effect is in section 8.12 "TE Signaling in DSI". That says
> >the following:
> >
> >	A Command Mode display module has its own timing controller and
> >	local frame buffer for display refresh. In some cases the host
> >	processor needs to be notified of timing events on the display
> >	module, e.g. the start of vertical blanking or similar timing
> >	information. In a traditional parallel-bus interface like DBI-2,
> >	a dedicated signal wire labeled TE (Tearing Effect) is provided
> >	to convey such timing information to the host processor. In a
> >	DSI system, the same information, with reasonably low latency,
> >	shall be transmitted from the display module to the host
> >	processor when requested, using the bidirectional Data Lane.
> >
> >My interpretation of that is that a DSI peripheral doesn't have a
> >dedicated TE signal. Now the panel that you want to support here seems
> >to have one, so I'm wondering if maybe it isn't a DSI panel at all but
> >rather DBI.
>=20
> Uhm, this panel is DSI panel right. It provides TE external pad to transf=
er
> TE pulse to host AP and it also provides TE relevant 3 DCS, so host AP co=
uld
> choose either of them.
> But I think it's better to use IRQ instead of polling method.

According to the specification you don't have to rely on polling. You
can simply pass control of the bus to the peripheral (via a BTA
sequence) and then wait for the peripheral to signal TE.

That said, I've been doing some research and it seems like we have a
somewhat similar feature on Tegra. What happens there is that there are
three GPIO pins that can be repurposed for TE signalling. But as opposed
to using them as interrupts the display controller can be configured to
use them, upon which it will automatically handle the TE signal by
sending the next frame.

So we have at least two very different implementations of this on two
different SoCs. Further the specification explicitly recommends using
the BTA sequence and DSI protocol to wait for TE. So I still think that
controllers that provide an additional, non-spec compliant method to
signal TE should handle it separately rather than within DSI. Otherwise
we essentially need to make the DSI "core" aware of all these quirks,
and I'd rather avoid that.

> As Inki commented before, I'll try to use remote-endpoint property of DSI
> device node in exynos DSIM driver and call FIMD notifier.

Sounds like it matches what I said above. I'm not a huge fan of
notifiers, but if it works for you I suppose that's fine. The
alternative would be to directly call a FIMD function, which is
somewhat more explicit than a notifier.

Thierry

--LKTjZJSUETSlgu2t
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTw6XKAAoJEN0jrNd/PrOhb6kP/0v/uGsev9NiY8KVfqcZTIJd
sBGXQ6D7aFACwozSlf63FI26sbkFD88XUV+ZrUxseI9DfEQIulrtfmCVpE4X1ch5
ep2+ZGBVPhKU3QyVePh6GaWINdQ8UifyuWhIqnijImatU0+RmBRbryRQUHrdtk/4
E/KUKQO/lFSQtCgq2FgsU5DY+sFKuCIZBswe44NVBYZlJfNe/KEZ89QnoZXeeQFg
2Qx0eMs+MV1skaJB27fFpvtocB3gr5I67+DR/ftvC2nyTOjiZZAngZ2SiqGexSIs
S/tqvz3kJwYjaAq0HmKisERvkyVBWFw++m54h35J1gfx6YBCeoIx2K+LExjGUMBw
/2vzSH7pKvjh+dJnCdOINJAD5B+QzlC1PFYL/xZrNpUbmDRfZNjUTyv6uB9RLLv8
Yw0TB+B4CNMqPpww9Mvq+lxRBM+RXq9cQdz3prA4qlqnWluEJAiE+F4xoS3uxT3F
Sj2z5mcowjVs61sRV9pUtQtMUfhZzBS2gpNOtoq0FmM8MiuhoOvXMIP0awnHqkqq
JFDNjfMhRmBNcKvdF2elEDXghhR+je+4253bZ2nd8PPCHLUJ+Vo2ZjTdcN7jk1bQ
1pljHCXoEQYIgSUzlOBcoPAS6k73G1jOMUYWN2WpUmpEr3LlH67CVZUgrV5G+7tE
Vmu/10M1UJEGqXC6o4ng
=RVR5
-----END PGP SIGNATURE-----

--LKTjZJSUETSlgu2t--

--===============1246043264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1246043264==--
