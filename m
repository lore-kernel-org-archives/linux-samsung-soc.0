Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB721AE868
	for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Jul 2024 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722427829; cv=none; b=gPLLR9/1KZOc/SlUTWC33g8b91jsomcUpKxeN+v9BJNhMdf1UYZuZ0SGetPN446hYT3D5rm4hD8ZanDeWyKz9QvUiQPC5K5Qhk6s3HqM3dMdXtsdtdrBjXuzK73aaQfQJAqojOabiyd/AFdlc4mJ9TNdLjCOAnoAxNa336eWFUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722427829; c=relaxed/simple;
	bh=rkWgzrrPt+dOSsSepG4wRRSNktPHJkVEwqddP5JZ4r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k225liZjPDehKFf/EopHaAVXw6rN8kdJ15esOpDCwXY4mF0vFemBP1W59NSlh+rRGiNwIf6fZde7H4F435ISwNXDQDb9qZQ7sYIGUUxbGmuX7FUCe3+0vnJ7ZTamOF8mbVxdIYCJDzn3IlJs9DWdVyR0lXzZBGSLUTVkjNJ/CX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUULM952; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUULM952"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289F3C116B1;
	Wed, 31 Jul 2024 12:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722427829;
	bh=rkWgzrrPt+dOSsSepG4wRRSNktPHJkVEwqddP5JZ4r8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GUULM952WU7HNPQu875E90LxEKinxkwqkbOJ91hKYK+F29pdYi09j6Jq8Qr/7/6TP
	 /2xooTgGBjvZVo6LqWfUPFXaOef4r+ot4wYV0EEYu87Hgm1ADBbYgwOTSSMpIHTXnP
	 ZQdAMbsqBZtEevW9sxQM8Pn7+WJ08fzZ7IMlBDa4IvnHN63w+PT1TT6SysFm3DbNgS
	 1lNFwfbSkcxUBw/6ncTzrU4hihEKmg0xQWrryKHYBsusZOe/gUCzPPCVP1dMaiZudQ
	 DhEwrM+PibgKCSP62FpZbn3MUm7b0IVNF5K+yBYPl5l4320itNeX3kfeG/FN+ZWTDz
	 wATiue7DtZflw==
Date: Wed, 31 Jul 2024 13:10:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: mach-crag6410.c staying or going?
Message-ID: <3aa5c9d9-2b19-4797-964d-97e2dd325f3e@sirena.org.uk>
References: <ZqmkfEijDcE--F0L@google.com>
 <f71e9bfd-2407-4f16-a94c-d80715777b1b@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JWcxrsxV8rosNjuH"
Content-Disposition: inline
In-Reply-To: <f71e9bfd-2407-4f16-a94c-d80715777b1b@app.fastmail.com>
X-Cookie: You are number 6!  Who is number one?


--JWcxrsxV8rosNjuH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 31, 2024 at 02:06:00PM +0200, Arnd Bergmann wrote:
> On Wed, Jul 31, 2024, at 04:42, Dmitry Torokhov wrote:

> > I would like to remove platform data suppirt from samsung-keypad driver;
> > mach-crag6410.c is the only user of samsung_keypad_platdata structure.

> Unfortunately we are a bit stuck here and there is no good answer
> for it. I think this board file is holding up more cleanups than
> any other and I'd love to get rid of it, but Mark is still using
> the machine, and probably relies on it more than anyone else
> needs the other board files.

While I am using the device I don't care at all about the keypad driver,
I don't use the keypad at all so that could just be removed as far as
I'm concerned.

--JWcxrsxV8rosNjuH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaqKbAACgkQJNaLcl1U
h9CBCQf/StvRQmsNoFtDCNs3WavXS5InaM2R8eleULdPvOdrN2RLt4hpubo7k3WN
08+IcAEQfYzuDILYo+xPmM1R25lpz7wxyACHxxXd3v/g/PC6jZCCn0b0LlIOcdvN
tDJ6iAcaXIqnFga3xjJ9el0RMoz5SAUuBeIg2WJZFtmIKOa0VpWmXDk7PzYj0YfI
5eAc33lQJUEi8kiEPTy12dAqmQIt41ffU8Y7R3Kr8y2fuX4JWpWsj/469V6CXzbR
ytSz9OQ1xCJu2EmEUleF2dIX2QJ2Keyjbn8TDTroTgXTV+eQSXJxmhbXfMwVUC2P
w26xV9najJZpnfufKGOOmH3omHI+qA==
=CVse
-----END PGP SIGNATURE-----

--JWcxrsxV8rosNjuH--
