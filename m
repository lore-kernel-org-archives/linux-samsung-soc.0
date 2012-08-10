From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v4 0/5] usb: phy: samsung: Introducing usb phy driver for
 samsung SoCs
Date: Fri, 10 Aug 2012 10:40:55 +0300
Message-ID: <20120810074055.GD5755@arwen.pp.htv.fi>
References: <1344582631-13658-1-git-send-email-p.paneri@samsung.com>
 <20120810070623.GL1689@arwen.pp.htv.fi>
 <CAD6zSYPT_K9bTP=8k-Q+5N-yAVjDx86Haay27OLuPsqz38pczA@mail.gmail.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lc9FT7cWel8HagAv"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog123.obsmtp.com ([74.125.149.149]:59041 "EHLO
	na3sys009aog123.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751831Ab2HJHof (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Aug 2012 03:44:35 -0400
Received: by lahm15 with SMTP id m15so651612lah.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Aug 2012 00:44:33 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAD6zSYPT_K9bTP=8k-Q+5N-yAVjDx86Haay27OLuPsqz38pczA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Praveen Paneri <p.paneri@samsung.com>
Cc: balbi@ti.com, linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, gregkh@linuxfoundation.org, thomas.abraham@linaro.org, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, l.majewski@samsung.com, kyungmin.park@samsung.com, grant.likely@secretlab.ca, heiko@sntech.de


--lc9FT7cWel8HagAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 10, 2012 at 01:04:48PM +0530, Praveen Paneri wrote:
> On Fri, Aug 10, 2012 at 12:36 PM, Felipe Balbi <balbi@ti.com> wrote:
> > On Fri, Aug 10, 2012 at 12:40:26PM +0530, Praveen Paneri wrote:
> >> Changes from v3:
> >> Replaced susbsys_initcall()/module_exit() by module_platform_driver().
> >> Accordingly in the hsotg driver returned -EPROBE_DEFER until phy driver
> >> is registered
> >> Removed unnecessary devm_usb_put_phy() call from the hsotg driver remo=
ve.
> >>
> >> Changes from v2:
> >> Changed the driver filenames to samsung-usbphy
> >> Changed 's3c' to 'samsung' for platform device as well as platform data
> >> Moved platform data structure to a separate file
> >> Rectified coding style related errors
> >>
> >> Changes from v1:
> >> Rebased patches to latest usb-next branch
> >> Changed the name 'sec_usbphy' to 'samsung_usbphy'
> >>
> >> This patch set introduces a phy driver for samsung SoCs. It uses the e=
xisting
> >> transceiver infrastructure to provide phy control functions. Use of th=
is driver
> >> can be extended for usb host phy as well. Over the period of time all =
the phy
> >> related code for most of the samsung SoCs can be integrated here.
> >> Removing the existing phy code from mach-s3c64xx. Same can be done for=
 other SoCs
> >> when they start supporting this phy driver.
> >> This driver is tested with smdk6410 and Exynos4210(with DT).
> >>
> >> Praveen Paneri (5):
> >>   usb: phy: samsung: Introducing usb phy driver for hsotg
> >>   usb: s3c-hsotg: Adding phy driver support
> >>   ARM: S3C64XX: Removing old phy setup code
> >>   ARM: S3C64XX: Enabling samsung-usbphy driver
> >>   ARM: Exynos4210: Enabling samsung-usbphy driver
> >
> > just one idea. It looks like after introducing the PHY, you converted
> > all users to create the phy device. I wonder if you should have a
> Not all
> > patch 6/6 which will remove pdata->init support from s3c_hsotg.c and
> > stick to using phy driver.
> This will make the hsotg driver unusable for others (in mach-s5pv210
> and mach-exynos) which are not supported in the phy driver as of now.
> My idea was to drop the pdata->init when the last user gets the phy
> support. Need some time for that :-)

makes sense. wasn't aware there were more users. no problem then ;-)

--=20
balbi

--lc9FT7cWel8HagAv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQJLsHAAoJEIaOsuA1yqREgWQP/3FMXf2TeLZjWsltATtfepa/
zbmd9Rimic3D24WFVQSIo/7rs+jcR9ae0KxdEqL1hS+P5YigfPDvc3Nvuy+rzhtc
3nBXkZaPtU6VmN+iRVYR/mdHtTFXRwAfj/DpaDQtSiMkzN/E9L2EeYYRuvU2glUV
FAm5rlJEO1mLaVuEVVDNwRngUM8eqpewK8hWAuGoCirssJcvHigS2H3XlC4xnKhl
5kPFx3fpwVCss3WoIKnNgGSnS+P4QD8++rRByCYy99dcU67xQIwBYM3tbbo52Oqn
atdAsWEAm696py9uvA/C7FeFTx6PkOmILN2kjUei1+ZPn7uReZxcLA/325ku9ceS
Jak33g2pc6Xg0ctOxqSfv+HIiBE1piga4Z5SSY42b4k1nUoq2Lrmd2t8Jdcuvk1g
GQECA5Da5w32rWnHx51oJ68K5P/m4Mo3hI0PA2dK01RLotQJq9/d02JmJhLm7dEO
Ura89r/im3UNOim6ZU233Sk1vOQulidhPEfOD+6jO3kFHvCOLFw7JWu2pxqA/cuX
vqEB3dMAt+3GXz5ktkhIJJaztiFC2Hslxz1nRegGLgFfKuEpPZ1z9aJZ53eYBV+i
BOJlwPJ68sLboD3epEjEnlgMKDluv72lUIlsX8n0ZbCt+/z5JVI+iyvFtF7DSWF9
dfthb8UNDCJErtEMKMAz
=NI1z
-----END PGP SIGNATURE-----

--lc9FT7cWel8HagAv--
