Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966030;
	b=KmqgSdTA9DEFVHz6RDVoidgOk4Z7sipRcs4/oIcxC8hKYprCHvhsl+mn9d9nn4AyYKB7
	 OB7/Kb/viG7DLW9h+q+7D6VyvQ7E9TEftYsip9ZaPtkis/JBToYZBY7J1ks1N8lHH2LXO
	 8zveXAzPc9Bjxx8DbeDjufongU87cnjup5XSK+5kCJCjPyzHdwUM+8w1UUa0MU+tpim6r
	 44FT77T6ZUOuB/+nEEUY9/jYnVY/1LEPN5kxc3qQFpb8eK5gHphS8Bx5O1ekInO4O7l/o
	 3huwHXIFdttacuteCPuTtV71t7lEE3o/hAbsdw2NnPT92MbGIpVPJkG8sulqiqkAICA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966030;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=rTSm4m0YE9cOhTEt8W9/Vkw9tzJ9/0MuQoBec6owO/8=;
	b=fuX6daKa0q2ngS5fJ8D6ia10mI+hYaDDIxCJHhBQDFiMcG8kzH80u2KmCdDTp0flHUzG
	 FshE/MHDn8ls4JXn8n6VZxbvqYT8ogLZ57h2Qfdb/f31FwVny1fN+JPYIEyLTLV5Ml8Xq
	 ZV2vRelSZCe13y8rkVVkPpI+n1uaEoyPP52hHDTYq7VoZ61O7HqsM+K3/MYRkHdsU4xEt
	 nnMiEuhrpF1lyScv6XKtlm9BFHeXgssbxwUR5MadpTg6aJWarYjiNZIrnZzv3lm7gpBYJ
	 CsX2HNK9vkl2sVJdAoI3d2Bolagz81DeWXMjjYn7AFHaCYTZMsdqyAAZetfSLa5FzNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HifvEE0L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2B0606A326;
	Fri,  6 Nov 2026 11:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HifvEE0L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5146A1F0089F;
	Fri,  6 Nov 2026 11:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793966029;
	bh=rTSm4m0YE9cOhTEt8W9/Vkw9tzJ9/0MuQoBec6owO/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HifvEE0LMMeU67Ovf1WhYf7dYmkS0z4/qTxDUMOrS4AEs7uNnsEWqWvkNUHiNAB+m
	 1CbOcAQmz68rOtj5ETQmfINwWDzB7+POgZWT/2rpOvB0EiVYJtroX6zLq4GekCAKiv
	 Izy+4iP4Ibcr2Ems8GW0XYQwRZyTvnvOL0sp8gzaf5g391bzE60Oq/e+m3TkDQo1nW
	 /TD41TsJTOP/eNvq3ediQlDbEMZ/aXviSygVvLyl/DJXcewSu2pmk8iRdYUhTgFYAi
	 ec26t+0ji1cDLr7xukpUXUE8FpaNXQrO9bzF8FGouQ26sf8PmhcEidEeGTzWQYtd5f
	 LDpbJT8EWFQKw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id C72A127E907A; Fri, 06 Nov 2026 11:53:44 +0000 (GMT)
Date: Fri, 6 Nov 2026 11:53:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <356c5681-137f-40d3-88f0-b321ac1c092a@sirena.org.uk>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auy4Qbxg-pW_X37E@google.com>
 <9fa9add9-6bba-4cd9-9f15-d6ca222a1a23@app.fastmail.com>
 <au2kBlSsypdsdQve@opensource.cirrus.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F3w/WJqkylAFYNc8"
Content-Disposition: inline
In-Reply-To: <au2kBlSsypdsdQve@opensource.cirrus.com>
X-Cookie: Whoever dies with the most toys wins.


--F3w/WJqkylAFYNc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2026 at 09:55:18AM +0000, Charles Keepax wrote:
> On Thu, Nov 05, 2026 at 06:24:48PM +0100, Arnd Bergmann wrote:

> > I assume Charles can comment on how important the testing still
> > is for the codec above, or if there is other hardware that could
> > be used for testing the arizona and wm8994 drivers in case the
> > other ones are in fact as obsolete as they appear.

> Without wanting to put words into Mark's mouth (please do shout
> at me if I am off course here), I assume his use of Cragganmore
> is less about testing specific parts and more about it being a
> very flexible complex audio system with good debug, allowing
> testing parts of the core frameworks that would be hard to hit
> with off the shelf hardware.

Yes, exactly - especially relatively exotic configurations targeted at
mobile phones.  Even when those appear on obtainable boards they're
rarely wired up in a way that exposes all the functionality.  I'm not
so interested in the specific parts as I am in what they can provide in
terms of testing generic code.

--F3w/WJqkylAFYNc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau2/yAAKCRAv73Ows9A4
iRfRAP9nkL6GVcpRmfrpN7j6mExyCDTb/Sqd2UOTl+QNdMpBIwD7BoAX7/1bumaU
DNdoPGJp9b9Jq7qCcHIBIw+32vKWuAw=
=TBrU
-----END PGP SIGNATURE-----

--F3w/WJqkylAFYNc8--
