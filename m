From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] ASoC: Convert S3C24XX I2S driver to gpiolib API
Date: Thu, 12 Jul 2012 17:19:33 +0100
Message-ID: <20120712161933.GD7256@opensource.wolfsonmicro.com>
References: <1341059876-29460-1-git-send-email-sylvester.nawrocki@gmail.com>
 <4FFED794.9050800@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T7mxYSe680VjQnyC"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:50005 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934077Ab2GLQTf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 12:19:35 -0400
Content-Disposition: inline
In-Reply-To: <4FFED794.9050800@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: alsa-devel@alsa-project.org, sbkim73@samsung.com, lrg@ti.com, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>


--T7mxYSe680VjQnyC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 12, 2012 at 03:56:36PM +0200, Sylwester Nawrocki wrote:

> These are the only two patches (out of 15) that are now needed to remove
> some obsolete s3c2410_gpio_* API. 1/2 was tested on Micro2440 board
> and 2/2 is an identical change which wasn't tested on a real H/W since=20
> I don't have any s3c2412 based board. I'm a bit lost through which tree
> should these be merged. Could someone please pick these patches up ?

If you send them to the relevant maintainers that'd probably help...

--T7mxYSe680VjQnyC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP/vioAAoJEBus8iNuMP3dbrkP/0uNdHRFQB4plZQIngvcY2Co
iBL8zUd9h5hMrZGCiT3tiS7xE80xGLlRxOnCAjTkecX44WxbWRFltMIVE9B1X+1z
cXcuw/1nIDejB1RoJmbwtxYZelOQRl8hrXqU2FcRLE3poTaDjlOT1jMxMXpYBhM3
AUus2SbqG3KVRZWslRXz80lfcpfjGVwhQk3msGanyRdCIHRIvXZ4pOTv8AVx8Bsb
cS93edbrF6Pl+z329q8WmvpkO2TidOTrR2hulRv8u4R8kNN80qEWqWzSvqQu9u+W
jquJE0kSQcgRcIfXn+q97X0Wy9ENwj+Kzker0KOTFwVXMQA9oaSWUfXgGaf3b/jW
lUwytO5nJ7Hlr/9mnzWBc024k0adERQ+cRr2d6qK4IYiseJNI64VdtZ4itIAYbT0
OG6d4k/ITBtvftRIuV6qZVK7wt/OudTZmOLQGFak8a9JQBOB/QgYTsJnjNSu2O9b
+9Kd6uoYU2PzUBCF01Amzkq8zaD6daEtqDoyGI38eQR2ualQ0x9plIv9SKmQ3rQ7
Nd6M7q0VlvpW6BZpKmK0GBrDvKe29LyktY58qyBm8oQ82ahpyHhlVLnefkrSvE5x
tQ9kZ1WBWKABVrbOhOH/SEvHcg2Kj2f0iJQUZ/TFKZD6hZg3zlsGwyTeCvW1uFFv
2ZsfNSq5+lRl/Cot8Oed
=140s
-----END PGP SIGNATURE-----

--T7mxYSe680VjQnyC--
