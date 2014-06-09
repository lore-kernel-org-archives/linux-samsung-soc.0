From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/5] mfd: Add driver for Maxim 77802 Power Management IC
Date: Mon, 9 Jun 2014 12:56:43 +0100
Message-ID: <20140609115643.GZ5099@sirena.org.uk>
References: <1402306670-17041-1-git-send-email-javier.martinez@collabora.co.uk>
 <1402306670-17041-2-git-send-email-javier.martinez@collabora.co.uk>
 <1402309361.17650.14.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kpwIYr1TmOiRZuUu"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33409 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751715AbaFIL5R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jun 2014 07:57:17 -0400
Content-Disposition: inline
In-Reply-To: <1402309361.17650.14.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Doug Anderson <dianders@chromium.org>, linux-samsung-soc@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Daniel Stone <daniels@collabora.com>


--kpwIYr1TmOiRZuUu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 09, 2014 at 12:22:41PM +0200, Krzysztof Kozlowski wrote:
> On pon, 2014-06-09 at 11:37 +0200, Javier Martinez Canillas wrote:

> > +static const struct max77802_irq_data max77802_irqs[] = {
> > +	DECLARE_IRQ(MAX77802_PMICIRQ_PWRONF,	PMIC_INT1, 1 << 0),
> > +	DECLARE_IRQ(MAX77802_PMICIRQ_PWRONR,	PMIC_INT1, 1 << 1),

> Why just not use two regmap_irq_chips (for PMIC and RTC blocks)
> replacing whole max77802-irq.c file?

If they share the same primary IRQ line something like what the arizona
drivers do should handle things well enough.

--kpwIYr1TmOiRZuUu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTlaD4AAoJELSic+t+oim9z70QAJymnz4t4+N/+kU+5Te1yMe/
RUZSVhZ+pJarOShf3lGi8ubqMfqS597X8V25QLJZuo0EpdBuCs8XE1ZlvSTLgYCT
jh8mI97Fipa+KfRs1JPiAAfjqbvXsbO1OBPMuGQNd6iexDK79/FHgUlXAEd9sRtx
OI+SWLWklZ3dunc/CjEXd0o9MicqnclXXcvBOJ4EU/6U0ev6a0k63AoEpc1wX4r9
ULrVVe9e7K8NsXR5rHw3NBWDQPr4gnpYKy48fl5NHBcew4nE8E8m7P77OjEqtEx9
ByaS1RDVQCUKSF4ddSJ6o5zKi8jDJf2JdowhqkOtmZlRXRhs41sbRpR/vJmEKGu9
Ng5eoVo4cTDhUQGk5Qz0NSoiicCciJMf6FwSC+SluTxd619xWBpAPC42wW9/lnUS
K2BbANak/JKLaZyOJMqlu4xuIyWf/tvB4oaOm6G+0N/i/gvHdrxu7g3QxXisMhbb
sR5oVaXMYUdsmS22i2GjRIzVWDb+Oech4bTi24cU2WXwPIBK3gzOKlbWD8kGKnA/
X7SknMV3qEBCaB/YgCdlTEULy/NMDGz4zIoThR9dRpU1RvzQPDdJUZbfcn/L0ruZ
LSXl100W6hopEY1kf6WhDTGxa+xQLJ4g+GXnX/U7KT3VbHsrEs59SRI0j3meocid
09+2rZJoMyZUpB70ioW3
=m/aG
-----END PGP SIGNATURE-----

--kpwIYr1TmOiRZuUu--
