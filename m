From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v7 2/5] usb: s3c-hsotg: Adding phy driver support
Date: Wed, 31 Oct 2012 16:05:48 +0200
Message-ID: <20121031140548.GE10998@arwen.pp.htv.fi>
References: <1351573057-22249-1-git-send-email-p.paneri@samsung.com>
 <1351573057-22249-3-git-send-email-p.paneri@samsung.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1245203276462370120=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1351573057-22249-3-git-send-email-p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============1245203276462370120==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7mjWZ9NKzhEjSVTm"
Content-Disposition: inline

--7mjWZ9NKzhEjSVTm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 30, 2012 at 10:27:34AM +0530, Praveen Paneri wrote:
> @@ -3501,20 +3511,27 @@ static int __devinit s3c_hsotg_probe(struct platf=
orm_device *pdev)
>  	int ret;
>  	int i;
> =20
> -	plat =3D pdev->dev.platform_data;
> -	if (!plat) {
> -		dev_err(&pdev->dev, "no platform data defined\n");
> -		return -EINVAL;
> -	}
> -
>  	hsotg =3D devm_kzalloc(&pdev->dev, sizeof(struct s3c_hsotg), GFP_KERNEL=
);
>  	if (!hsotg) {
>  		dev_err(dev, "cannot get memory\n");
>  		return -ENOMEM;
>  	}
> =20
> +	plat =3D pdev->dev.platform_data;
> +	if (!plat) {
> +		/* Fallback for transceiver */
> +		phy =3D devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
> +		if (IS_ERR_OR_NULL(phy)) {
> +			dev_err(&pdev->dev, "no platform data or transceiver defined\n");
> +			return -EPROBE_DEFER;
> +		} else {
> +			hsotg->phy =3D phy;
> +		}
> +	} else {
> +		hsotg->plat =3D plat;
> +	}

I think this should be the other way around, meaning you try to grab the
phy, if you can't, then you fallback to pdata.

--=20
balbi

--7mjWZ9NKzhEjSVTm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQkTA8AAoJEIaOsuA1yqREIe4QAJ6TPXWkQS+U6Wsxf4byCPll
hr49J/EMhfKL7Giey/ojyEe9vgrkIzmPUmnylo6Q2Fns4wBZY6ueFbL5oBWOlsMw
WRFxg/pIpBjTP0fU2Fgln5Gyxtyn5a1W+z4A7NUXEw88YLHasqFQGyBjdOXc8a6d
ypLIm8zzKTfdVL7rqgw9tuDoBG9hWXE/qqVRk12Hi0MmlyL/V7kYcSwNqmmHu3eu
mCYgHUX/CRQpu0gERLe1cLyvlsR8LCHtMH5JwTQhBQMMcNUAqKopXwfwA09WX9hc
QhBSHS95GTSo50kNFr9uqYiqZPZbPRRQSEvmsz5j3YpUqVs4mhrf676u27xlh8dq
eR6BqvE1zQUi5bRsTQLgbA8sYShlo4ZL0djfsnoVYeNC1IK4AQvaHq+4Oq0T9rgH
6LX6C5HCyxdHPLL0wejguv9hmZk/hDdpKWrk/gB2gw38eiJnlz+Mv+jQf0K1rc8H
IHzlT7sxkxLU+5wxHOABGmDzaqQBChIwiwHH1sg/Yjz2Lc4mQJx0XHpKdnSTmetU
CvPXZh46lhb014rKbX+NVYXwFKwTpTlhLMrsImpY4Eg/6+jUkM6rpH62vwka2pkQ
bTqjUhG7lweHZM0sMOxxTRuDzkAXvnLko1yX6yJnvW/Fp/54nbrHx6+FYnmRa8d/
OJEXCdA7G3JRN4euwz64
=0mYI
-----END PGP SIGNATURE-----

--7mjWZ9NKzhEjSVTm--

--===============1245203276462370120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1245203276462370120==--
