Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B233CEAE;
	Thu,  4 Dec 2025 11:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764847373; cv=none; b=OG75sLVWnrxs0MvBbm5epyG4oY+2LIy8JqZglMhNoE18szvtrusAtTjTKJe4STJKPEC/Q966axMwRLC3+vaolrBEnCjSdE/3CiuR4hO5dZB4rNPqIc4GOceE8URwJXV4dCwElzVa+C75KhqdImHU+v+f7t8It3/UHSSmqeyhe78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764847373; c=relaxed/simple;
	bh=SZt1BFxKXA3f9l50WE1fkYB2IzPxlfIsJrbHpD/7+js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXTQsqDV9qY+Fkub+0WW+OGayQ5HxJZCij3JZOjoyenZpkB/lLWltdt2YCpOwWmDrvUpC4qSo7gYlkAJrYN+I3UI0Qt2Wx5uMzqv9B2Z9LGWb9r5ojqPjC2KXhlstsrPmsDZIlHFMWNz3wK5KKYlCP7GPk9jRyNJYnnus3vho0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=f1l+oW+U; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="f1l+oW+U"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id CF1B81C008F; Thu,  4 Dec 2025 12:22:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764847367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U4HN1ODRxsnTDmi4098i1Q+naahHnMBRsf+Px2cNeZU=;
	b=f1l+oW+Ujo9yqI4ZLtQ4rFS54wszz2IFaGz/gJnFhj8Yo3J2lvjV26d/vfTsN2l/08zcwi
	zWQTbkOnGdf4km4Z+hfMBdbiK9HtWzbZkaT3s6XKatraHD2r9YUFjQThShOAsrp1+q95gp
	xfIwC1H+8wmk3TV/u8WKzYDJh3Hek34=
Date: Thu, 4 Dec 2025 12:22:47 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v2 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
Message-ID: <aTFvBwjms8msxIae@duo.ucw.cz>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
 <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XH4lO7UPQqMRxwOD"
Content-Disposition: inline
In-Reply-To: <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>


--XH4lO7UPQqMRxwOD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2025-11-25 16:12:42, Lukas Timmermann wrote:
> From: Alexandre Marquet <tb@a-marquet.fr>
>=20
> Add an exception to let the secondary CPU boot.
>=20
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
>  arch/arm/mach-exynos/firmware.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmw=
are.c
> index a5e22678e27b..80e645b4d338 100644
> --- a/arch/arm/mach-exynos/firmware.c
> +++ b/arch/arm/mach-exynos/firmware.c
> @@ -61,10 +61,10 @@ static int exynos_cpu_boot(int cpu)
>  	 * Exynos3250 doesn't need to send smc command for secondary CPU boot
>  	 * because Exynos3250 removes WFE in secure mode.
>  	 *
> -	 * On Exynos5 devices the call is ignored by trustzone firmware.
> +	 * On most Exynos5 devices the call is ignored by trustzone firmware.
>  	 */
>  	if (!soc_is_exynos4210() && !soc_is_exynos4212() &&
> -	    !soc_is_exynos4412())
> +	    !soc_is_exynos4412() && !of_machine_is_compatible("samsung,nexus10-=
manta"))
>  		return 0;

Strange -- +       compatible =3D "google,manta", "samsung,exynos5250", "sa=
msung,exynos5";

Should this be google,manta or something?

Also please cc: phone-devel mailing list with phone related patches.

Best regards,
								Pavel

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--XH4lO7UPQqMRxwOD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTFvBwAKCRAw5/Bqldv6
8n+vAKCsQYO2dRBSz9dpzzGmMIKoUrmaTwCdGFG1KdJa3VKWcrHRT/yQ/yhaVno=
=V8Ni
-----END PGP SIGNATURE-----

--XH4lO7UPQqMRxwOD--
