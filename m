Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899188;
	b=Bc7c1fh5m0U5VgsoEk0uDGTeOQzDekYbbf4xtp7vFiR8pkf0SQoLLMh+Dyfgg6QOsvul
	 ApwWYUeersK3hw/kTnPfYfAuOy4k/JrT8C4hwJQNqsJIpxquZVoT3xmLA31bBce+dNdni
	 SyYkWkQO0CVAssT9trRUN2Lh9v5uasOErlV5C9JGOT+FNMr0eC+gNdgjGEJ+WgZMDUWnN
	 wDL/0rpWVIx1vKU7E8hDAuIiIVVCczrx/C3qZW/1KLJ7AZ6GHaWWuvHi+ZviT82X7bF9e
	 TM4GMmBjbfy4seb+aKnKj62my3eJbi1LXsM86dOqn++JUpFw3qw+vU2wtkRkEzYDd/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899188;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=CPGOJ2OzZCLwqROp1NUYVMqMRDVCWw4oJpH7cZZh6Mc=;
	b=EKTr7mqo0EVzTyE3h/4+8MXVXNeFCNZ4FlHe7qZ9ldDnTKfotGeixpOz54AeJ7WxI2dM
	 1951PHfj0cmNIjmDUDjUIUNMe/WtH95XbYL/ool9oiLEDzRm8Tavjwgz482N0jFrktglZ
	 ZmRmtAVvPbtsTXWRwE/Z5+sApQNVqUOipAULYznIn9s8XoGwS+i7lZhFxvLFD1k6EPr6Q
	 +xqJLRijH+RPicelRo0viVODR+BfEYfWA7QD9y1Hd8oMur332c8bn60udh9tiXGiTUmyr
	 RfWSw3sFtT/JBNwGKa1rtIvh1y0u1tQBuD5o95QfRn3TvzkkpVzacr7rj/kHN0jFCvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fm8MOX0s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C326606A334;
	Thu,  5 Nov 2026 17:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fm8MOX0s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD341F00919;
	Thu,  5 Nov 2026 17:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793899188;
	bh=CPGOJ2OzZCLwqROp1NUYVMqMRDVCWw4oJpH7cZZh6Mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fm8MOX0sI7hx/5Q8eXTpbcaxm1ZPilJM2ZIeMhZeQAdXDVWkXNMqcJJyD4f9vYdu4
	 WloDAfIcSWr4+1iuC6TI4ORMdbm1RCDI8Zi1clVvdoVenUuW6DH5K5mr3UkTuPDJ01
	 6xQTESmMA9JMlteO9RXIt8MboKOgZAljnyadisT1/uPpV/YQ/9ejdQxtJ9KA8T7VvM
	 1PkDQ8lfiYteDS9CrYiF2lOq8ib8Ab2Y7VFC8Qw9ZCt/HviQv09gNYHxHGxO58nr9I
	 blzYTdqTlJMrsFedyk3mHtCpxkqdblKM/bKsWKxeqoHoNN80MdkOxUwg/LApCh72Na
	 /pwytX29neYlQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 9F837279AD71; Thu, 05 Nov 2026 17:19:30 +0000 (GMT)
Date: Thu, 5 Nov 2026 17:19:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <ad9ec396-aab1-4950-8ea6-dd72d8938464@sirena.org.uk>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auy4Qbxg-pW_X37E@google.com>
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
	protocol="application/pgp-signature"; boundary="w7cXv/WC+DmTcwM4"
Content-Disposition: inline
In-Reply-To: <auy4Qbxg-pW_X37E@google.com>
X-Cookie: Whoever dies with the most toys wins.


--w7cXv/WC+DmTcwM4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 05, 2026 at 09:12:38AM -0800, Dmitry Torokhov wrote:
> On Thu, Nov 05, 2026 at 02:43:17PM +0100, Arnd Bergmann wrote:

> > As far as I understand the situation, wm831x was used on the
> > reference board (Samsung smdk6410, removed in 2019) in addition
> > to crag6410 but never anywhere else upstream. The question
> > then is whether we'll ever see a DT conversion of crag6410.
> > This would require finding someone willing to actually do
> > the work, and coming up with a way to handle the autodetection
> > in mach-crag6410-module.c so the correct spi/i2c codec
> > child devices are probed.

> So I guess the question then: do we need to keep this board at all? Or
> it is time for it to go the way of the dodo? And then we could drop some
> more drivers as well.

I don't really have a great replacement for it.

> My goal for the series was to move along legacy gpio API conversions, as
> well as move away from the GPIO lookup tables (ideally I want them gone
> now that we have software nodes supporting describing GPIOs).

It is a bit hard to get enthused about software nodes :/

--w7cXv/WC+DmTcwM4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCauy6ngAKCRAv73Ows9A4
iTKhAPwI2ULhK3tpsErRZO3ELlTybyWNIgeB8iu2NvTH+QIwIwEA8R3w7L7qubU2
NiYBEc511xJMvFHpPgyePVyrG/nPgws=
=pKD9
-----END PGP SIGNATURE-----

--w7cXv/WC+DmTcwM4--
