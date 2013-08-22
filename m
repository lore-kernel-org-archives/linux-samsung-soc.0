From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Fix build error with dma function rename
Date: Thu, 22 Aug 2013 14:28:24 +0100
Message-ID: <20130822132824.GN26118@sirena.org.uk>
References: <1377175502-6169-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MEtH+zcSjJxXgQVV"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:56917 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752256Ab3HVN21 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 09:28:27 -0400
Content-Disposition: inline
In-Reply-To: <1377175502-6169-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org


--MEtH+zcSjJxXgQVV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2013 at 06:15:02PM +0530, Tushar Behera wrote:
> commit 85ff3c29d720 ("ASoC: samsung: Rename DMA platform registration
> functions") renames the DMA registration functions. Fix the places where
> it was left out.

Applied, thanks.

--MEtH+zcSjJxXgQVV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSFhH1AAoJELSic+t+oim92uYP/jvFkRsHHJT9tOu30Pma9Adv
QAx8T+xD950T0q3a7ZQ1CVVzilnNLmYZeGCE3YXYqV7SgTCOPVTSsW5kjOieqD19
fOYwA4wJcZJLSPqRC7gmPypjTuLVTm10AsL7mcgudPeaFampMZfp4s39wsgcFXd6
hY3qX0aPWLNKEpg1miFtK1Zcx1EjtG6Oy1z0iraQcQNTv5a1lq8+i8hJxm0ygbtW
IKn+kQSJtRnRMB510ijkdBOx6Bje/8QvrJKf0jfjLpoiz4MoLusDbIfAnv/OYVMr
d09QZSnjtsislJnOwX0LnFX2ILCQRwfqYQXf3tHuqAGBdt1hkTv3imFIKKqlwOnP
jpGhjKoJgMSJF0k+OeCJt1YEdrAEpE7wUIpFthzfe7jq3Qnub3d+IUXmm7Bgl+YG
wCLsQxaGQ0/N6/WpH5tWP/7JBWCJHFzcwMhdtuqk/lYQZRW4tCw/8cNEGuw59tAX
d/zHC8oUgBRgBIoNBnRvWvHHL9mTG62y9dMYx3CEzsnbNIZHZXf5wQc99lPPKCmP
Bwz+K8xCqUDjZn0zdkqckZ8AJ61BXy0LYKh9QvMz/9cjcH9F4elgMMe40GA0PSAc
rMNdHLTRA7+yL4Gp0iD1rPbNhFYs4W7nWXfpxzVaKnHzyE/bpU6y6LE7Gj7H4uhu
60lt4YUDgUj/0oZyxr3Z
=gAFL
-----END PGP SIGNATURE-----

--MEtH+zcSjJxXgQVV--
