Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEFA32C317;
	Thu,  4 Dec 2025 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851891; cv=none; b=fY+sIx5VK4qe14HxdaUb2CkwceX4NpzruO8bAwfjr7+yIPRPH78x1LXB5/RSVd4t/L7MOew3byVcJXLBcV241KYH+fXJ7UkBbwOwUW8LS1ZDGuKJM6imtMeWo4tdQDEdNFdXqFzwHae0mV/Oz8A5iey1H6LU3KMYh0ESQ5fnB9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851891; c=relaxed/simple;
	bh=aXa9bs/fgQva0i/5IoMKbRBiOVII1CFWztcx920Dkf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/NVJ3m7YP64obkCnVbRH2jrt9FpQLb207XPNizixl62aA0Cy3YtxS66Buc+e8mYsZhkONUteSApPB8TJ2oAizPEpcGI+IF+8mu1GicNZ0q8JkHA5kvQ54OH/AlxSVVxEQguF5UzcKBv1jJcl0CBbBTzyjLPCIt9NYtNhYEKpkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=Qy81Kbu3; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="Qy81Kbu3"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 2C1761C008F; Thu,  4 Dec 2025 13:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764851887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9WGtrfu3GuTI9Wqc1fIfjBwAoYn0B6GSnlgu0ZqZYFA=;
	b=Qy81Kbu3tlE7YgdGOaWZdYNsKPtKfmyIoX1OZ95HzWM5MYfloBrBmxjGPk/9tnKceBBVco
	BArlNXNMk0A/p0kiD4s6CYci1Cjtm33TJdfFTNTFwmpqA+lE0jTQkP2h55ttnxMmv3iQmV
	aKiUn5rwVV7pZT4190yRUzDoOFHgTzc=
Date: Thu, 4 Dec 2025 13:38:06 +0100
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
Message-ID: <aTGAruX7N/7ZT0ur@duo.ucw.cz>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
 <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>
 <aTFvBwjms8msxIae@duo.ucw.cz>
 <73efeaeb-0cde-45af-af92-4fd7b5d4589c@kernel.org>
 <aTF2H0f9TJiwCLe5@duo.ucw.cz>
 <a68ee81f-1d2c-47f4-b86f-e0e803c1cfd3@kernel.org>
 <aTF2z5HbvmEuu9Iy@duo.ucw.cz>
 <39ac918c-0394-495b-b717-dfa0fd35d7dc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IZAWxPHhTjLaLg0o"
Content-Disposition: inline
In-Reply-To: <39ac918c-0394-495b-b717-dfa0fd35d7dc@kernel.org>


--IZAWxPHhTjLaLg0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2025-12-04 13:02:00, Krzysztof Kozlowski wrote:
> On 04/12/2025 12:55, Pavel Machek wrote:
> > On Thu 2025-12-04 12:54:03, Krzysztof Kozlowski wrote:
> >> On 04/12/2025 12:53, Pavel Machek wrote:
> >>> On Thu 2025-12-04 12:51:36, Krzysztof Kozlowski wrote:
> >>>> On 04/12/2025 12:22, Pavel Machek wrote:
> >>>>> Also please cc: phone-devel mailing list with phone related patches.
> >>>>
> >>>> You don't have to. This list is not part of any upstream Linux kernel
> >>>> process (see `git grep`), it's not relevant to upstream kernel devel=
opment.
> >>>
> >>> Yes, you should. Its a relevant mailing list.
> >>
> >> git grep for it. Stop inventing rules.
> >=20
> > Who is inventing rules here? Stop sabotaging review process.
>=20
> You invented rule that some specific list of your interest has to be
> CCed, even though no one knows about that list and it is nowhere document=
ed.

No. I'm asking people to please cc the mailing list so that interested
people can see the patches. It is you blabbering nonsense about "git
grep" and "get_maintainer" as if those were rules.

> > "Many kernel-related lists are hosted on vger.kernel.org; you can find a
> > list of them at http://vger.kernel.org/vger-lists.html.  There are
> > kernel-related lists hosted elsewhere as well, though."
>=20
> This proves nothing. There are just some lists there. No one has to cc
> whatever list there just because Pavel Machek asks them. Kernel process
> defines it or not. Not you.

And not you.

Kernel process is to cc relevant people, and relevant mailing lists,
SubmittingPatches points you to http://vger.kernel.org/vger-lists.html
=2E If people are interested in the patch (for example because they
reacted to previous version), you should cc them. People in
phone-devel expressed interest in phone-related kernel development, so
you should cc them.

								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--IZAWxPHhTjLaLg0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTGArgAKCRAw5/Bqldv6
8lfNAJ432b08VuCapDRQakftJA9JEIYhzQCfScFdiAFfVXRbIz9O1NPJ+TJ09hE=
=qAGG
-----END PGP SIGNATURE-----

--IZAWxPHhTjLaLg0o--
