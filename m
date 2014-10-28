From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 3/4] regulator: max77686: Add suspend disable for some
 LDOs
Date: Tue, 28 Oct 2014 22:31:21 +0000
Message-ID: <20141028223121.GH18557@sirena.org.uk>
References: <1414411911-5539-1-git-send-email-k.kozlowski@samsung.com>
 <1414411911-5539-4-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="waAWgznbqtWOzvJZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1414411911-5539-4-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--waAWgznbqtWOzvJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 27, 2014 at 01:11:49PM +0100, Krzysztof Kozlowski wrote:

> @@ -247,6 +250,8 @@ static struct regulator_ops max77686_ldo_ops = {
>  	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
>  	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
>  	.set_suspend_mode	= max77686_ldo_set_suspend_mode,
> +	.set_suspend_disable	= max77686_set_suspend_disable,
> +	.set_suspend_enable	= max77686_enable,

This looks wrong, you're using the regular enable operation as suspend
enable.  How does that work without disrupting the current runtime
state?

--waAWgznbqtWOzvJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUUBk4AAoJECTWi3JdVIfQSJYH/RTYhHzyf/43tuvH9ge6Zqhr
8D17nEvNtEt6aaRrQ27Xn4eWcghsnCGIHVfm7T5zQRxQZTaK2p6eiHYnO51N86cg
orx2lmaIhvQvnW2aTFJFMlcc17buBmyT7sNBOUuZA6kHN1eu/IzJL2f62+aspp79
6gnfejrhgvDNkdCRYpLSJDuBWQCJTVTs/IzBHAfDw+yNvk5PsbKwrU9sXSx2/1+p
y6q7IWnqDTH6OW/5FSx8pIKQMiY6jLbaZZCl8X/aGk+5UFwo9Qr27q15DkhtGKwI
FMcatv+CZTtkCn+bG/V9pRbqu2KaY+osBsLP4TTfdXVkTlaTuoW7aGyLYoQj/vk=
=zgZa
-----END PGP SIGNATURE-----

--waAWgznbqtWOzvJZ--
