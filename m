From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 05/14] drm/exynos: dsi: add pass TE host ops to
 support LCD I80 interface
Date: Wed, 9 Jul 2014 17:22:08 +0200
Message-ID: <20140709152207.GA17359@ulmo>
References: <1404779987-5337-1-git-send-email-yj44.cho@samsung.com>
 <1404779987-5337-6-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1439631575=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1404779987-5337-6-git-send-email-yj44.cho@samsung.com>
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


--===============1439631575==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2014 at 09:39:38AM +0900, YoungJun Cho wrote:
> To support LCD I80 interface, the DSI host calls this function
> to notify the panel tearing effect synchronization signal to
> the CRTC device manager to trigger to transfer video image.
>=20
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 11 +++++++++++
>  include/drm/drm_mipi_dsi.h              |  7 +++++++
>  2 files changed, 18 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dsi.c
> index dad543a..76e34ca 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -24,6 +24,7 @@
>  #include <video/mipi_display.h>
>  #include <video/videomode.h>
> =20
> +#include "exynos_drm_crtc.h"
>  #include "exynos_drm_drv.h"
> =20
>  /* returns true iff both arguments logically differs */
> @@ -1041,10 +1042,20 @@ static ssize_t exynos_dsi_host_transfer(struct mi=
pi_dsi_host *host,
>  	return (ret < 0) ? ret : xfer.rx_done;
>  }
> =20
> +static void exynos_dsi_host_pass_te(struct mipi_dsi_host *host)
> +{
> +	struct exynos_dsi *dsi =3D host_to_dsi(host);
> +	struct drm_encoder *encoder =3D dsi->encoder;
> +
> +	if (dsi->state & DSIM_STATE_ENABLED)
> +		exynos_drm_crtc_te_handler(encoder->crtc);
> +}
> +
>  static const struct mipi_dsi_host_ops exynos_dsi_ops =3D {
>  	.attach =3D exynos_dsi_host_attach,
>  	.detach =3D exynos_dsi_host_detach,
>  	.transfer =3D exynos_dsi_host_transfer,
> +	.pass_te =3D exynos_dsi_host_pass_te,
>  };
> =20
>  static int exynos_dsi_poweron(struct exynos_dsi *dsi)
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 944f33f..3f21bea 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -49,6 +49,12 @@ struct mipi_dsi_msg {
>   * @detach: detach DSI device from DSI host
>   * @transfer: send and/or receive DSI packet, return number of received =
bytes,
>   * 	      or error
> + * @pass_te: call the crtc te_handler() callback from DSI host.
> + *	     The panel generates tearing effect synchronization signal between
> + *	     MCU and FB to display video images. And the display controller
> + *	     should trigger to transfer video image at this signal. So the pa=
nel
> + *	     receives the TE IRQ, then calls this function to notify it to the
> + *	     display controller.
>   */
>  struct mipi_dsi_host_ops {
>  	int (*attach)(struct mipi_dsi_host *host,
> @@ -57,6 +63,7 @@ struct mipi_dsi_host_ops {
>  		      struct mipi_dsi_device *dsi);
>  	ssize_t (*transfer)(struct mipi_dsi_host *host,
>  			    struct mipi_dsi_msg *msg);
> +	void (*pass_te)(struct mipi_dsi_host *host);

I've objected to this particular change before and that objection still
stands. I don't see how this is related to DSI. It seems like an
implementation detail of this particular setup and I think it should be
handled differently (within the Exynos DSI controller implementation
possibly).

Laurent also asked you to split this up into two patches, one for the
core part, the other for the Exynos driver parts, yet this patch
contains both changes.

Thierry

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTvV4fAAoJEN0jrNd/PrOho7kP/0uscxU3Sn2h4p31rafuykSe
II1J94ePzmd9+WWwKb7RWPfuJD3rQMIj6+sSx+4uBstcrT518QeJ5qKTfavfQtcO
zVwCgsZt/3hYzF+YVSO/ECf+nin3QN7sF8+o1fDcoYtqS5VbAB8QOWKuu/BCeJb8
pHTxZPNbmtkFaAuiJSN2FrbPCZtdadaQl8DIH7y36SXXfKsDqmSq/QfGHA0xsrwu
piQ4unHnuheo2UMiD8qHBJ438Ji3EYql0VhmzLCp3nIqk+8TAXZZ/xhuHuU4Z9vf
e+2Z2ASAmTiEMqIKtZWaFRjAyJ+5gpNX5VCrw9PXvOrRj9ySpsQSeQ52xu0FiYbP
ZFNENguhkyTcw1esFGNo7Y17ZwGu/kJhR4OkhnvsthblWsUQMvLF+S8UXfTI0nb3
XL0NV4pm/AaFev+WDcKYFdXZRfngeGJsGXKEQs3YbC+c9P5kxNcsdhLQhxmOLw+k
bAHxG5ArndljkfQvfuvjce1y3DgH9YjYggHXJ5eq+Zc0kGlegEeOPCWm4AdgSnVi
e9F6jSNf6j3gzdQ6H1RZbb0a1W6txmnBvyyLVEFuUAcbvUXCcAa1hFSwGPUzhjwg
dgkD6WHn8LNrN0Gk3kgzTb7SkH030qbf1SOglj2+mXxDNvRcyrGmQyRjnixD9sIo
RZSkorrhYW3A4N2IJh1C
=2jaq
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--

--===============1439631575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1439631575==--
