Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BF815199A;
	Wed, 30 Jul 2025 12:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753879590; cv=none; b=TYAXID7ZN+ZQfrgK0tvjAsVE1HFO2Kak1NB+BzdHXETMw7LYM/rv9zVSFfTfC/k28aFCssgCNVXiiu7vqpweTu/+2m/+2TrGahq5lqA5zMOl6yHvwaCoc2hU7nPcW3q+qq4ElnH3zkz3+T6foKYBxIPy4HljORrg86mCfo1UvIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753879590; c=relaxed/simple;
	bh=Lui6GKk4m26Q1KnLkBRH6igXI56M/yLQNw685PM8lqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axrADbaNKPaTXdB72ZO05oJSm4VKqSVF0OtY0pDtE/Kmoh1bDaptwYXkFmPiIy6Jvt0J42oi6/oamAlrXenn8duYsAEsQP4VHthYZshZ0wvBWzG6MdvPYbUzhmT5XgbIju9x+2bVGhO/vaD1C6b1pnvZdRTQ5sZ/DpiI6cYDbFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9Hx+Vyo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9Hx+Vyo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90364C4CEE7;
	Wed, 30 Jul 2025 12:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753879590;
	bh=Lui6GKk4m26Q1KnLkBRH6igXI56M/yLQNw685PM8lqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9Hx+VyozBE+6nbCPs7o2jtX/f6zv7/XaPbyPQB54clWIALi6VlboH526XPtNImPF
	 3kHmbwamTd7LsAwozYNX8YQFhXFv9CZEkml2QEa003Q64PAKAIeaEUu1vu68EsYyuL
	 8TL3zEbhcZ5QGxWikQjuQM/kji3uL2u8aiTkglI7gxSCFBTOncvHrEP5MapGRUwAFu
	 tntmnP3r+4k1Y/zoS4pId1Hya7XVxZ7qS1cDCmJeS/RrtY/vXZ83ZeYPM2++m06I5D
	 1VC5236EE2aW3w7GIa3acixfZIpj5GJup0/qjqJwQBttxmvBNEgWYPPZ0nJue2ejbN
	 +sqjGsfPiNtFw==
Date: Wed, 30 Jul 2025 13:46:24 +0100
From: Mark Brown <broonie@kernel.org>
To: ew kim <ew.kim@samsung.com>
Cc: s.nawrocki@samsung.com, robh@kernel.org, krzk+dt@kernel.org,
	lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Add ExynosAuto ABOX generic platform and PCM support
Message-ID: <f4a71a23-a3ca-42ec-97ee-03e70e369db4@sirena.org.uk>
References: <CGME20250721024611epcas2p43099e043aaa6f48c05eb0237065d31c7@epcas2p4.samsung.com>
 <20250721023052.3586000-1-ew.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lb7pF4nCCeJVaNeG"
Content-Disposition: inline
In-Reply-To: <20250721023052.3586000-1-ew.kim@samsung.com>
X-Cookie: Linux is obsolete


--Lb7pF4nCCeJVaNeG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 11:30:43AM +0900, ew kim wrote:
> This patch series adds the ABOX Generic audio management driver for
> Samsung ExynosAuto SoCs, along with IPC messaging and PCM frontend
> drivers, including their corresponding device tree bindings.
>=20
> ### ABOX Architecture Design: Fixed and Variable Structure
>=20
> The ABOX audio framework is designed with a clear split between:
> - **Fixed part** (common framework): reusable components across SoCs
>   - Generic ABOX platform driver
>   - IPC messaging handler
>   - PCM frontend with ALSA compressed audio support
>   - Solution manager for dynamic control
> - **Variable part** (SoC-specific): defined via device tree
>   - IRQ numbers, stream IDs, buffer sizes, and ADSP allocation
>   - Defined per PCM/IPC device node in DTS

This all sounds from a system integration point of view like a fairly
standard audio DSP.  Usually something like that would be structured
with the generic bits of DSP support done as a library which the drivers
for specific bits of hardware link to, the SOF code is the most obvious
example of this we have upstream but there's a few other simpler ones
like the Cirrus CODECs.  If there's a reason why this wouldn't work here
it's not clear to me from what you've posted thus far.

--Lb7pF4nCCeJVaNeG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiKFCAACgkQJNaLcl1U
h9AtLQf/WYJ1EIaoWIZAwVvNH9YQ4sTD4B2XT8JhFja1VlF2nccAJrayd9KIRtyL
KN98pq968BtDvoUfVqUZSMqCxGT9zFbHVnlcz7puPgx5+EaBD3MFetOu8QpQMUcR
spR6D/KBrtRr9e72xsoKqn4Z5h5CzBjMzmjGpAtfGWFjS8iJNHA+eJf4k3+X2VDx
jy6yqXkn6hQYyMmVk8lxuphugWVfhIK94Mnq9Wn59+Z99CiTDaLQue8y6GU+KCNI
46v3KKd2zQXqwS+1I54NIXvftpXBccxgLNhmiCg6Mq7Oh2FQv2Aw+Ha+yp59fRhY
iNQDBJ+7snNxHPIbY9F1EE6hzWiKAw==
=cIJ5
-----END PGP SIGNATURE-----

--Lb7pF4nCCeJVaNeG--
