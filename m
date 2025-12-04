Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C017E0FF;
	Thu,  4 Dec 2025 11:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764849188; cv=none; b=nanHzSGGiyizZR5xzXRC0jtZCZmFEXq1b45JZKrHL3tV8oYTSgf5AAfA+IpocbKzb46+PnqVG+O2jG9h3oae8FjDVDEfFzNy0PweORdRW1SZOq0ZdkrT3DejU55HUpIjZE04SgD+AqC2LqBg4Am7h8v9vl6Bqc5btIOeYY1DcIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764849188; c=relaxed/simple;
	bh=fRp1ik2IPkIcElhKApAGvsVWOAnckh8SNFnFizUJUlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0gQDOH54ZWNOLMMqU6ZQC5MLiyb2ctf/AbAf7A6uGeY0DScFmtvxsQ6TGorHO3pvqQcbSU3Bt14VJtaqHYOrJq/r0cvvidNEmrcVVYeb9qUgkLZVql65jbWHTNPtpFquuWTbbJ/K5dUh7F21V5ICdgvFfEfewKF8dcTJbTJoPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=d2S2qRoC; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="d2S2qRoC"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id D720A1C008F; Thu,  4 Dec 2025 12:53:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764849183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3YiWp5Rpe9QSFpOXsVgq6DquQsYE/tbMh3WbVFGnqzE=;
	b=d2S2qRoC0mvnlLrZcctaPXXhEaDOuoEDIxRdLjv/bAa0L/BVO88oa4ODTgyFUtxbpUvBGk
	UXV0e6I2ZPd3AGjIIy9iw+msR9Pl2X28EJw2JuOyK9x/KGtI6Xf+Ze/RlloKzgqEQY+0CJ
	rB789gef8wShENrnhCT8TN9Tr2o3PQU=
Date: Thu, 4 Dec 2025 12:53:03 +0100
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
Message-ID: <aTF2H0f9TJiwCLe5@duo.ucw.cz>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
 <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>
 <aTFvBwjms8msxIae@duo.ucw.cz>
 <73efeaeb-0cde-45af-af92-4fd7b5d4589c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FDzyy11ZIpYXyD8g"
Content-Disposition: inline
In-Reply-To: <73efeaeb-0cde-45af-af92-4fd7b5d4589c@kernel.org>


--FDzyy11ZIpYXyD8g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2025-12-04 12:51:36, Krzysztof Kozlowski wrote:
> On 04/12/2025 12:22, Pavel Machek wrote:
> > Also please cc: phone-devel mailing list with phone related patches.
>=20
> You don't have to. This list is not part of any upstream Linux kernel
> process (see `git grep`), it's not relevant to upstream kernel developmen=
t.

Yes, you should. Its a relevant mailing list.

								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--FDzyy11ZIpYXyD8g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTF2HwAKCRAw5/Bqldv6
8lwrAJ9/Cr/FM+w6FTvbAKsLqeRHWYEmvwCdHC8XdJFQ4MlX96QTh3SJJVAogCE=
=BgPn
-----END PGP SIGNATURE-----

--FDzyy11ZIpYXyD8g--
