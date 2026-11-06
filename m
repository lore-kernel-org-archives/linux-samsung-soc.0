Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974061;
	b=rsorPETMQ9cIE6pNxQbmEQREi47zCGtAx/NjBSCBeGeBjWnnA8bB62lSddipidmEgktM
	 1MQ0f8Cl8/yjPiQuP4+QZGETZSN3kOgQcqPTJMFz/0nrNOGqMNTefhxLI0Z9Q3QzYy0B7
	 38gJi5Z9Emrif/RHxOMz9Y/44xGYAnwtDkGmJQOb27YEGJe8dgaKAg0u0OW3B7vu/dT7z
	 Tkf+J2A9j3rIMAi/bZKlf+UsWww/69gY9aXjYRphmG9jDGDCWHc9ILGDA/rgBpbCeZVU5
	 N5IMSruePXSxpo/WZo/rXXaqM2buO1bQ+N25nD5V40xBLYrhoNJaXhVdVKH67w+WHxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974061;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=QzOeMyW9XoRvbL1S4yq9b+nOF7kq8iH2OCoxesNStc0=;
	b=R/v6AEz4NSEucJ7FWGBf2j5G9pTO9goRctVf3A/jcXbbpuMPBx8EQS12fQc+z3qC3F0L
	 Bkw2YsG56jbq/yWz6b2ZXG0mm+gfTYBpeESM2vPWsKb/8QnIdoZ9ULDVvWOk+yOgik1Il
	 +1jLBt+weC5J9DMWSiIRzofYlLM9TzzsySPFn7n4wJrL+TKEf6xlCcCiM7KibQT/uxJqD
	 lkEwNqzlH64eRn1J2janjMryepPVcfyyi+ABVI39wdcLginaK7nkQWHry0HKC1t/RVEiF
	 GwQbe9iKA3PMT/h9nLKXrGinzuHJX0uyfxQwBv9LS2HGmQBYeyDmD4yBOIo5+h2CYuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qhno8iJx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAB2606A326;
	Fri,  6 Nov 2026 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qhno8iJx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7731F0089F;
	Fri,  6 Nov 2026 14:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974060;
	bh=QzOeMyW9XoRvbL1S4yq9b+nOF7kq8iH2OCoxesNStc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qhno8iJxw2PadLSFZky+/AlnZ7Q017lTPrVDL4fbT2GTUeVao5XPwtcZB2VCgWfhc
	 MBRRIYCwqMu0/IoTN09+hRzXBRaUw0UBz2V1T2wx96q9sfp9jGAZLOYLr8FiIM+2mz
	 nasuwKznXigrY+jESlC7T7o4DgaVeyn7W/PMPbucwWG+8T6ipieOurAtwQIq+Qgos7
	 6VqhUgNCRHeWo65aKfH1OozZK64et5f+BNt5//V53/V8MlRLSoJrI8t3T6/wrhSvfk
	 ETcY8XsjE8FnJCoSaY2A8IHQGbEJRNMxDnbsrIvzDJQ7Jmyt/Iq7LpNXLDWEIczxNH
	 /pRtG8PiDOhLA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id C8ED22808F5E; Fri, 06 Nov 2026 14:07:31 +0000 (GMT)
Date: Fri, 6 Nov 2026 14:07:31 +0000
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
Message-ID: <c159ace7-17b8-46ae-9551-d0eec6e051be@sirena.org.uk>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auy4Qbxg-pW_X37E@google.com>
 <ad9ec396-aab1-4950-8ea6-dd72d8938464@sirena.org.uk>
 <auzFQkIPZScADEeb@google.com>
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
	protocol="application/pgp-signature"; boundary="ThW1+an2rN+EXP3+"
Content-Disposition: inline
In-Reply-To: <auzFQkIPZScADEeb@google.com>
X-Cookie: Whoever dies with the most toys wins.


--ThW1+an2rN+EXP3+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 05, 2026 at 10:07:06AM -0800, Dmitry Torokhov wrote:

> Hopefully you do not need to pay too much attention to them as they are
> hidden in the legacy board code.

Which does get reduced error checking and questionable readability
benefits :/

> The benefit is that using them makes the driver exercise the same code
> paths as it would on DT system (unless you insist that the driver is
> very special and should only use of_* API) and allows dropping support
> for bespoke platform data (in most cases).

IIRC all those drivers handle DT by parsing it into a platform data
struct or just don't have DT bindings anyway, and it's worth being aware
that ACPI has some rather different ideas about how audio should look to
DT.

--ThW1+an2rN+EXP3+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau3fIwAKCRAv73Ows9A4
ifRsAP4tUq7tN/TDsRfXjjcTur1dwpJtgrTdWOmPwnkeVlQY3gD/QkqMpRqix/0Z
tBrIqRL9sg0hSaLIScndH+eFnbaH1g4=
=t+xL
-----END PGP SIGNATURE-----

--ThW1+an2rN+EXP3+--
