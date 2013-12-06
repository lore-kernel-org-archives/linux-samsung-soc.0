From: Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: samsung: Provide helper for DMA
 init
Date: Fri, 6 Dec 2013 11:27:08 +0000
Message-ID: <20131206112708.GD29268@sirena.org.uk>
References: <1386253559-18262-1-git-send-email-broonie@kernel.org>
 <CAAgF-BdD_DONQYPOenMwBmc6N+EOJQ3TwJz1hpG2qZVfzhR63Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UXdImcDs+Jp8Skh3"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:35516 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753212Ab3LFL1P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Dec 2013 06:27:15 -0500
Content-Disposition: inline
In-Reply-To: <CAAgF-BdD_DONQYPOenMwBmc6N+EOJQ3TwJz1hpG2qZVfzhR63Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org


--UXdImcDs+Jp8Skh3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 06, 2013 at 10:44:33AM +0530, Padma Venkat wrote:

> This is done in your earlier patch " ASoC: samsung: Ensure DMA data is
> initialised for secondary DAI ". Was it done on purpose or by mistake
> in this patch?

It's intentional - notice that the function has changed, this is why I
kept asking you about mainline.  Mainline doesn't have the wrapper
function that abstracts the difference between s3c-dma and dmaengine,
this is why I'm saying these two will need to be rebased on top of the
mainline fix.

> I think you also told to include a patch for reinitialization of the
> dma_data in i2s_hw_params. If you are in the process of debugging some
> bug as you mentioned earlier you can ignore this comment. Otherwise it
> is just a reminder.

Hrm, forgot to commit that bit.

--UXdImcDs+Jp8Skh3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIbBAEBAgAGBQJSobSJAAoJELSic+t+oim9j6cP8QEU250j/qab9xMZXQ4qJiwW
myuzFZAo52RI8/4Iq211efDEb5m3LjlsZShGfMyoDimEhSqdcGhDXmn9nCoxm865
9vgBBC0E8gWGur9FmLjqvpV7q/upKvZ9Ox+oOrqIXl4gsh+yRuMpK8iDnoqQizGf
QPsXTjhCpvfiuTmlWoZxtTIG5YAbrS1tMSKvufL+BSxfYNH/6iS1H0REglTKL38C
nepofSqx3suU3z8/qlIgUONslc7OetIO0kjT6giGOAfV8GX63XiQAItXYiycZh/I
Da+U3Vps1n2A6BeNCizN63fhIkq4hG5g3KMpmI7+s1kVphwvlmPWwh6nIdHl3+Px
qPwHtgQosXPIscvR7n/gQ8IoSfdA2s+kplU1D7m3mQqvtDMuNvluhozG8F/1N9Fx
ztU/09GGCS3UBnQjTuvOFxzEBXFeG5ySPO2YW2Hv+U0P94bzjX9lgJjq9aPY9cNj
U0P5YN/ufT+HrbGsPIC9DVOfqo7hpfnfNvzMMrcpXVf5q6Hop7fOgfc7SwaHvmd6
DOoUXSWlC2cHMaJ+tznLIwW4YfwfqcBJkJxzeEZk2TbO5GvvbKXvpXyTNyxojUIw
qGQW7vb7xCxOVhoYSZD+C+J80HrWHDvKS6J5LY8DahEU4WPZiroHy3r2Ql9JqRVr
zHXbUbSnvPBT+Nba6qE=
=D7dn
-----END PGP SIGNATURE-----

--UXdImcDs+Jp8Skh3--
