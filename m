From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v4 2/4] usb: host: xhci-plat: Get PHYs for xhci's hcds
Date: Wed, 16 Jul 2014 09:46:28 -0500
Message-ID: <20140716144628.GC1365@saruman.home>
References: <CAODwPW_h2EBKtA+XwEvjCtS=FrcdHOjybwALGugd-ccQ-_vMWw@mail.gmail.com>
 <1405498900-13473-1-git-send-email-gautam.vivek@samsung.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2289642746942846408=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1405498900-13473-1-git-send-email-gautam.vivek@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: pratyush.anand@st.com, linux-samsung-soc@vger.kernel.org, sergei.shtylyov@cogentembedded.com, mathias.nyman@intel.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com, kgene.kim@samsung.com, heikki.krogerus@linux.intel.com, jwerner@chromium.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============2289642746942846408==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Content-Disposition: inline

--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 01:51:40PM +0530, Vivek Gautam wrote:
> The host controller by itself may sometimes need to handle PHY
> and/or calibrate some of the PHY settings to get full support out
> of the PHY controller. The PHY core provides a calibration
> funtionality now to do so.
> Therefore, facilitate getting the two possible PHYs, viz.
> USB 2.0 type (UTMI+) and USB 3.0 type (PIPE3).
>=20
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> ---
>=20
> Changes from v3:
>  - Modified error message as per review comments from Julius.
>=20
>  drivers/usb/host/xhci-plat.c |   19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 1a0cf9f..b1c0364 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -16,6 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/phy/phy.h>
>  #include <linux/slab.h>
>  #include <linux/usb/xhci_pdriver.h>
> =20
> @@ -180,6 +181,15 @@ static int xhci_plat_probe(struct platform_device *p=
dev)
>  			goto put_hcd;
>  	}
> =20
> +	/* Get possile USB 2.0 type PHY (UTMI+) available with xhci */
> +	hcd->gen_phy =3D devm_phy_get(&pdev->dev, "usb2-phy");
> +	if (IS_ERR(hcd->gen_phy)) {
> +		ret =3D PTR_ERR(hcd->gen_phy);
> +		if (ret !=3D -ENOSYS && ret !=3D -ENODEV)
> +			dev_warn(&pdev->dev,
> +				 "Error retrieving usb2 phy: %d\n", ret);
> +	}

should you treat -EPROBE_DEFER differently here ?

--=20
balbi

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTxpBEAAoJEIaOsuA1yqREx1wP/iNhqLpglq0SZRPjO4LozUUv
+09YZ5L5kjzUacYi9Brqw8nADLB2wmdujfHrF0ezB/VqduFpP/i+XAfhQx2ZkaFR
Pp9qclEAetygR393laychLfeOS06mMgzUH1/+LOfjNaqLy8Tg1e9bAnaK2ON0lIj
b3Fh+fbStuNUvTbRR4pTVvhTJnB5Dv7oUHPnRJuMgEE1zJyX47r9HPPDg3jlnExM
8AB6rwXO8cBwj4ugDk2hm91w/jPL/wydCETvxQNGku5fgKztxF1zsBnvUcWjhpro
n38nfLYkBXQOCCpPnrjH+yxWCRIHIiy1jZ/EqfwmKlq09JbCPIemHgPOpO9E3fiH
C8DsL03jNQZZZKbFeGpBeJg3uldlTjO7yInIa7poqfeeH3PKzWtSP2YQz6O9z1nR
nHlYvVIJTy9ir9edTPfqU2JzPXoMxrofZbyKGyBo4R6yRe80IxvQe7CLtNvGcNno
OhpwnRLZFeVUtiCBriGFFn6N+jxE4eyttZ/w/0c/dFSY6goJwXaSa+cIld04V7aj
R2MBQAJdIOQguOj2HHD1D6EXne5gMC0dbcVCzu2AV5tmgWxrLIHaifChwOkCTn6k
5aqtMqcH2R4WFSjlUV4JPzJZH8UojIkd+nc566XKN6hiT+BzBF+Cerd74JaDi1MZ
a+70M9jNuM9CtMnWH7X7
=FRfZ
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--


--===============2289642746942846408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2289642746942846408==--
