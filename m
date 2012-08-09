From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v3 2/5] usb: s3c-hsotg: Adding phy driver support
Date: Thu, 9 Aug 2012 12:29:39 +0300
Message-ID: <20120809092938.GK12174@arwen.pp.htv.fi>
References: <1344411661-17821-1-git-send-email-p.paneri@samsung.com>
 <1344411661-17821-3-git-send-email-p.paneri@samsung.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLauP2uySp+9cKYP"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog111.obsmtp.com ([74.125.149.205]:59840 "EHLO
	na3sys009aog111.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756548Ab2HIJdS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Aug 2012 05:33:18 -0400
Received: by lbbgg6 with SMTP id gg6so186266lbb.31
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Aug 2012 02:33:15 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1344411661-17821-3-git-send-email-p.paneri@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Praveen Paneri <p.paneri@samsung.com>
Cc: linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, gregkh@linuxfoundation.org, thomas.abraham@linaro.org, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, l.majewski@samsung.com, kyungmin.park@samsung.com, grant.likely@secretlab.ca, heiko@sntech.de


--SLauP2uySp+9cKYP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 08, 2012 at 01:10:58PM +0530, Praveen Paneri wrote:
> @@ -3689,6 +3706,9 @@ static int __devexit s3c_hsotg_remove(struct platfo=
rm_device *pdev)
>  	s3c_hsotg_phy_disable(hsotg);
>  	regulator_bulk_free(ARRAY_SIZE(hsotg->supplies), hsotg->supplies);
> =20
> +	if (hsotg->phy)
> +		devm_usb_put_phy(&pdev->dev, hsotg->phy);

unnecessary. This will be called for you when the platform_device object
is detroyed.

--=20
balbi

--SLauP2uySp+9cKYP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQI4MCAAoJEIaOsuA1yqREbL8QAIB9AfQJJzseM2wD3v2u6dWK
m6BjfOfDlRM5KVGAWlzbe6cOTIzcxfmw9IOE4lh3aVZDxTG95V4gYCcRoE9hYHR0
OElsR4gEvvFb97rciC4InWwrA+W6o06vx8Qm57P5dxoSonpV9cyEYg8vFsHglU5g
dsx5TyHDjtgug8MuwDc2ncrIjVxLLd8RFtDJ0Ntx/O1prkn/FGT/Jy6zIbT/jrJQ
6ZPNvGaTTYEuNMv38C4c9oVaumdHAMnhGfBavfA4K13uSPSHBCbYmd/XT3son/8s
+PVtPYCYsAy2Psl9az+Um43oWteJVaIbupxYBM71seik1n7atPwBfpgq61/JDtFh
KAtJB505FOGOUgX0KwkdgF2qySMsDZl7CGeG8nV1HUooZbMsrIjtg3IuY6HwOeiC
g9QC9JK38yWdROwlzCWO3lwhidnCPF85II3rchASYXyT8cnyzrCsuLjGiuKQHuYI
JZSNydFU8lAp/Xp2UPsYnaU6GA05subI/rD3CO+NNqe77gJ9WXOzaALh/kY5qqsF
cq0fMB6EjoXm3to3WpjEFMDzpwVZy+t0kVxr4FdvPXDZ1OD3lTqdc/4sRfySaiFX
TQqDIRPIrh5ZmrtFG30I8zG0KcKwU+BJrGJ5AkgXHk+JgKZk78tVyj88BPOTGzqb
25wphfQGn62semXxbqMn
=o1se
-----END PGP SIGNATURE-----

--SLauP2uySp+9cKYP--
