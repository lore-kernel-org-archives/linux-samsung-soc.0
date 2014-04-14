From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] regulator: s5m8767: Use same binding for external
 control as in s2mps11
Date: Mon, 14 Apr 2014 22:11:06 +0100
Message-ID: <20140414211106.GC12304@sirena.org.uk>
References: <1397462949-22379-1-git-send-email-k.kozlowski@samsung.com>
 <1397462949-22379-5-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1397462949-22379-5-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 14, 2014 at 10:09:09AM +0200, Krzysztof Kozlowski wrote:

> -	- s5m8767,pmic-ext-control-gpios: (optional) GPIO specifier for one
> +	- samsung,ext-control-gpios: (optional) GPIO specifier for one
>  		GPIO controlling this regulator (enable/disable); This is
>  		valid only for buck9.

This is an incompatible change.  It's OK to deprecate the old property
but it's bad form to just remove it.

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTTE7nAAoJELSic+t+oim9wnQP/j1E9nH/Vo2WkPVYslXz7ClG
FZcO7kNtYcc7FEHgs/KB+yOCY7qtp9Iu7HcdkJCdaYbTU5QHuGqprPmaFYWFEMPO
DX4Yyh0qWUXy7hKWJKaD8cpEi/UhwLKaaEsCqFSCKvET8N7GHiRXP6WAeQDdW+LW
gGQevoqC0cr+5dIPbxhKmuS+79FS1dOpvWW2YvGxYe5TPC43hLfNr3MKI/wnozgW
PuOsyw43QSvw2LLJfynx2KQHnYL0r65+aqxcfI9Rjhv+bcnukPdQk3uPV2C4Obf/
TdNGbVvBq97hEDVZHBkFoXqgKtd5b/YXYBudn2Oo3CQtExGUKFrSjnDnFdMTIBqB
vJjEA+fvhdpj5bb1p+OhwtiUK1/M8QsdY6HmWeGU4ppwoADPaMU7ew9MvInotfnY
1N+zWZ1ai8rzuzr7zxQ+jaa6oLrSV6IQZlk5gEdWQwAPb5TktYFVSiFPOzaKknEU
JO5pXd3pnl0rTTRnc0FXWBk/DA8ESD3UdghZdSehP+xC/fpXPruKZT/oC+68VNLk
A882ZxMILnBlmXjGN9C8XXsPNbS6oJZ3EpE7Na6X6RNn7BuBGjrENR+Bk7/PZUyM
xKHMOO4MAH0l9ThJmuHnwsoeH9+Nl6EI85y+RL6DZLU7WXjG45pRTIDq2EqL4rV6
OZyukAI8U7NKPwCKfN4y
=ddaJ
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
