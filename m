From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v4 2/2] regulator: add device tree support for max8997
Date: Mon, 16 Apr 2012 19:51:53 +0100
Message-ID: <20120416185153.GH3219@opensource.wolfsonmicro.com>
References: <1332582590-16382-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3VRmKSg17yJg2MZg"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:58758 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751189Ab2DPSv5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Apr 2012 14:51:57 -0400
Content-Disposition: inline
In-Reply-To: <1332582590-16382-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, k.lewandowsk@samsung.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org, Rajendra Nayak <rnayak@ti.com>


--3VRmKSg17yJg2MZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 24, 2012 at 03:19:50PM +0530, Thomas Abraham wrote:
> Add device tree based discovery support for max8997.

I tried to apply this but it's collided with some other changes in the
driver which have arrived in the meantime and the rejects were too large
to fix up.  I suspect it's mostly just the change in parameters for
regulator_register().  Can you please regenerate against my current
topic/drivers branch?

--3VRmKSg17yJg2MZg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPjGoKAAoJEBus8iNuMP3d99gP/Asy1dmv69B1i0MvCJszqNH0
J9DvsKbigYPj2iUc0nqIvy84YPSB7ou7dYnFjKZGCswXkRwVL3io19/nyiqInwf+
uV84dlaoxuBvg3VMtYqC1hxMRO8hJzulXVgJEn2aMpdlgfayfzeV1OpSoXMAiDUJ
aQADob+fls8pHmbysRD+ErHlnCz9y/9iuwuQdD5fUEzD6iACA/YvBlQeT2Mxnc1r
/D98S5lmV5JJdYRWHMeBU42GwJoH3JMBFvGKgFYLZJMEjqvdLlBG9DJfr7IE7Lfb
gatZ9MTXg8MBl6Cju1EGOw6ERGVoT74F2SEqrTrTa6QAw1DFxYDr4MQQnXaZ9ljo
qmRLPdgCweVzidH1habeuq850RqgswWEu/SMYHzmKNZG8qJMX/KUXxzg/+ALaC4e
GqxpS3zCohQVnncmxsQczyXnfdSW6iyiUaTbHbQIp4UJLWm97/mxrNvtYLIvT6xG
eJeIqag+Mnb7PulV7j8vMjb85llWaRN7IUsm0UzLcvONLBfYwrDB98wNKqNbtDxb
S3kqy+/6tjKKHE72xb8+cDZ0pNpnp6tNIFuv9GrME+iQcI8/VyYKZjZR+CfWcjCF
/NorGpr0LDNerWMUla0KnBqcoaroxIiPQW7a8wCbDzxKKxsz0yFRjMdVHnPK0L1i
BKuZegRIejPsD28UvTlR
=bdae
-----END PGP SIGNATURE-----

--3VRmKSg17yJg2MZg--
