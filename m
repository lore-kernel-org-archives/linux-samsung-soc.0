Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5556D45C14;
	Mon,  4 Aug 2025 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754311008; cv=none; b=dmJIvQzcLoBUHnVfTjXpPBU5aNleZCREtjbgoCL1IaDXkIPPnk/XO/N5RZKnJCrHMrb8LE5Lv92cpHnTbjvchyuhD874dcxqJtLmCC9c4tpDP4z6o3xE8BtgiSP1CZxqC0LJwzn5FxLQRM9xJrfjR2pKN65m/5qQYRfZGC/8PIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754311008; c=relaxed/simple;
	bh=pzlCwWnn3o5vFXHTupjp1TmlOp0v5jeNK85Nzj184ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5066v/5iAcjWqHB62amAHI4/oADU+zZCEuIqqPtjxMcTetHw3PkQ6+h0CsfecvpOhzcUkt2QaJ0FbIVJDX4Ji6JUpe6Q3HrD/wzE6yEbO0lbKvut7TFnWWQPFUuRghI7f3rr39N34ToixXMA57lFwRPunvSxSkCujNHBDZeFwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXZ+TWQ/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXZ+TWQ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D50C4CEE7;
	Mon,  4 Aug 2025 12:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754311008;
	bh=pzlCwWnn3o5vFXHTupjp1TmlOp0v5jeNK85Nzj184ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NXZ+TWQ/oWKeDnl+HwXouGAOm/rWemZktPmaxmrnrLoIAWISMo2FNba4efuicV1KS
	 JhHSVbx+mqcD+dQ4B9ca4NRljZ/XqHieVdhHd2FcZXs/QIk2LBoaeyhrKxQNpCkyTI
	 vLz/uvXxOvmFBSe7ly22EaYQFJaxqAty+zZ463gks7dZFc+ZXRlODJGEufRIj8EZSw
	 W3V/jpbKEpvP3OAbHFoA09xP+FxLNneWgw6IeAY0byHFGuuIrWgJJ+p5r/4dkEWlAl
	 7GYkZ0RHdFiCrHAGFHO/rrWbfhBiIil1cW1EkGlbFga/uwjKYVtJE1cDn2OnpyzwC0
	 1cM7Y4x6ldu2A==
Date: Mon, 4 Aug 2025 13:36:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7] regulator: add s2dos05 regulator support
Message-ID: <489609c7-3f11-4254-b5e3-6df5ec75b043@sirena.org.uk>
References: <20250802-starqltechn_integration_upstream-v7-1-98ed0e1e1185@gmail.com>
 <dc1482a7-a69e-40ec-83ee-98ecc2e57bf1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GyhI1YsioTt8RPbf"
Content-Disposition: inline
In-Reply-To: <dc1482a7-a69e-40ec-83ee-98ecc2e57bf1@kernel.org>
X-Cookie: Shading within a garment may occur.


--GyhI1YsioTt8RPbf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 03, 2025 at 10:22:33AM +0200, Krzysztof Kozlowski wrote:
> On 02/08/2025 13:22, Dzmitry Sankouski wrote:

> > +	for (i = 0; i < rdev_num; i++) {
> > +		struct regulator_dev *regulator;
> > +
> > +		regulator = devm_regulator_register(&pdev->dev,
> > +						&regulators[i], &config);
> > +		if (IS_ERR(regulator)) {
> > +			ret = PTR_ERR(regulator);
> > +                     dev_err(&pdev->dev, "regulator init failed for %d\n",
> > +                             i);
> > +             }
> > +     }
> > +
> > +	return ret;

> I do not understand your logic here and I already commented on issues
> with 'ret'. If 1st regulator fails, but the last one succeeds, you
> return 0. If 1st succeeds, but the last one fails, you return failure
> failing the probe.

No, ret is assigned within the IS_ERR() check so it only records
failures - it'll take the return value from the last regulator that
failed, or otherwise return 0 if they all registered OK.  It'd be as
well to just return immediately and save the bother of winding and
unwinding the later regulator setups but the error reporting should
work.

Should be a dev_err_probe() though.

--GyhI1YsioTt8RPbf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiQqVoACgkQJNaLcl1U
h9C/Qwf9EZ8/lNClhCJENr7YQRiLfxAkVXu8VXIYLdwXe3WwMv/DpmgvFlk1vIxO
tURo7sQdQBFIBERnRysAOXBvtEXxfwTv5TgRjFJM5480ywDKJmlPUvd82xV2JEMp
CCJjjrvrw+P3LQXzHUGohQEmaHe5GhTt+crlGTKacEmeQl7q3kK6vi8eI0bcvNe8
MXbBC+JYhf2z0sWCSgvV5fQ3owzXhR4cJC0cj/0Rsxu6rGgt0wB3CH6tkXRi6hKv
Pi+DNj9WQdR/zc+yuqhuwBRRo+wBExMDnM2/Gc/zarh+Yc2XcoE5jKkv5aQQnQno
n7iSXKCUa6FhF9mCny99t51Gc0mBmQ==
=RUG8
-----END PGP SIGNATURE-----

--GyhI1YsioTt8RPbf--
