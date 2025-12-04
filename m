Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D192BE632;
	Thu,  4 Dec 2025 11:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764849363; cv=none; b=i4KiciiP2LV1UqjhDr+dohAePgm7fZ4N5IOfh1wIE61JMmt7Vq4h0HPn13a+oDLbd8/vqsB8R+fLUogXy+OrcmRJACswDrH71HoYL8xq4khrCkL9rKgB8zeqBwAIs7S0GZAzjNi9SrBkK8ogc9rG9eqSsCpt/m6E7VM31ZxI/4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764849363; c=relaxed/simple;
	bh=b7yeyP7En8zuKjn2n3wkxsLfmLqMlCb8hcwP7ZbemrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAGlJTut1C3GcD13jTU89XoppDv5DSYEXj59snpmArnMg4GXmlgjhq14ilsMcf9ViWB2MwRlzzuhV1IHBr5RxMdjLcNV4aLroeEPEDSALVVoCGUREwndVSySEX+Yk45TZpZKI4WUT7n1uDE5YDh/avzRs8QMFMVy2BCqnqBZBmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=pXZMl6Vj; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="pXZMl6Vj"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id A6D641C008F; Thu,  4 Dec 2025 12:55:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764849359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wGNj8IW8jHaYznwbPEx41prvRlfnp+hRzprHRRiG2CM=;
	b=pXZMl6VjtzgJ5J6tIRPAxjCLpsNPe8yL6BbN+dB90MpxzmXX5i1HfdLrNJ7XhCO8BTjT0P
	kERKRuoNKMHGWztre45BvTQp9UIWvERZX004NIPUtsckf7MKqviNF6vSuZugvDE68uNp/1
	d1mpjlxg1g+P7lMfE1RspF8i+rkd6Vk=
Date: Thu, 4 Dec 2025 12:55:59 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lukas Timmermann <linux@timmermann.space>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v2 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
Message-ID: <aTF2z5HbvmEuu9Iy@duo.ucw.cz>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
 <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>
 <aTFvBwjms8msxIae@duo.ucw.cz>
 <73efeaeb-0cde-45af-af92-4fd7b5d4589c@kernel.org>
 <aTF2H0f9TJiwCLe5@duo.ucw.cz>
 <a68ee81f-1d2c-47f4-b86f-e0e803c1cfd3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DG6lTTxv+FnXjuf5"
Content-Disposition: inline
In-Reply-To: <a68ee81f-1d2c-47f4-b86f-e0e803c1cfd3@kernel.org>


--DG6lTTxv+FnXjuf5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2025-12-04 12:54:03, Krzysztof Kozlowski wrote:
> On 04/12/2025 12:53, Pavel Machek wrote:
> > On Thu 2025-12-04 12:51:36, Krzysztof Kozlowski wrote:
> >> On 04/12/2025 12:22, Pavel Machek wrote:
> >>> Also please cc: phone-devel mailing list with phone related patches.
> >>
> >> You don't have to. This list is not part of any upstream Linux kernel
> >> process (see `git grep`), it's not relevant to upstream kernel develop=
ment.
> >=20
> > Yes, you should. Its a relevant mailing list.
>=20
> git grep for it. Stop inventing rules.

Who is inventing rules here? Stop sabotaging review process.

"Many kernel-related lists are hosted on vger.kernel.org; you can find a
list of them at http://vger.kernel.org/vger-lists.html.  There are
kernel-related lists hosted elsewhere as well, though."

								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--DG6lTTxv+FnXjuf5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTF2zwAKCRAw5/Bqldv6
8rrPAJ9lGDWRx5W9QUQFpmyAjFKSSpllkgCgphu4OOQ4tBB+SOYbzXqPhFOforQ=
=g5vE
-----END PGP SIGNATURE-----

--DG6lTTxv+FnXjuf5--
