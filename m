Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F5E149C4D;
	Wed, 30 Jul 2025 12:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753877098; cv=none; b=K4v/MsKJ8525Avt+ahi3jM0HSGTckLTZjfXsFlcAzDVpGvS6JvxX/PHgecQXVb76b9jI34ty7lo7/8nTHu40F2ZPS5q/56DfiEYLwgMMAwIPV51CPHLk/WT/OFPhc/1a8n4dIS3uYtA97Ca03k0oe3FlFBaqnwEaUhnqjjxm8d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753877098; c=relaxed/simple;
	bh=fhubS5ePL6n0ha77CiCJRFvyxD4OLQrzCZO9cuiJiYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEIjxZLF0hxCBclOF+EYmWcXdwLQloZ8dDbskC3KEEBmfmFVcsFybWDc7Sl8n0tlp6MWhDpB1/6H8uB0S5XjbZXaHpepSQqYCaMiTsgxYdeOR53Q/1KW69UaKZ/QeDlafQ0WT71KT4e0jMYbDvFT21K7riM+sp9mNzj8gnh/8KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGH7f8yd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGH7f8yd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D13C4CEE7;
	Wed, 30 Jul 2025 12:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753877098;
	bh=fhubS5ePL6n0ha77CiCJRFvyxD4OLQrzCZO9cuiJiYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGH7f8ydXuzC5TyfEH7bYraXQzcFznm7WxBg37g65n6MN7MO+QPL0irJm76TFe9jr
	 dNqD7Pi5apkwR7pItb0LdTnRQZ7u7RbSLclPtyb1bZDg66IZELPDlWETmHajRtn2yD
	 39zqT7YnnXl/vzt1FblmnbhAHAbtDvnRHV7q9t37d2IAwM2Z+1UmNduvhm6YG28AUL
	 nQlBeaQ81pWDkfYSeLjGNPLjJjNxtglDUKyYcxy09aiiaUa1w0TBh6IBJIX4gWJ5mY
	 kBZzPU/dk8pITEWrB2hwojwBZha/t739bp2my3L85Vq2fFhMmuynV6pGZaUmSvYU9q
	 azEM/ArEaVo3Q==
Date: Wed, 30 Jul 2025 13:04:52 +0100
From: Mark Brown <broonie@kernel.org>
To: ew kim <ew.kim@samsung.com>
Cc: s.nawrocki@samsung.com, robh@kernel.org, krzk+dt@kernel.org,
	lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] ASoC: samsung: Add generic ABOX management driver
Message-ID: <80020ba1-cd00-4ce7-962f-04218559582c@sirena.org.uk>
References: <20250721023052.3586000-1-ew.kim@samsung.com>
 <CGME20250721024611epcas2p45ddc52c1644f5779c7da822573f03246@epcas2p4.samsung.com>
 <20250721023052.3586000-2-ew.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uncjgrThkp45R8LT"
Content-Disposition: inline
In-Reply-To: <20250721023052.3586000-2-ew.kim@samsung.com>
X-Cookie: Linux is obsolete


--uncjgrThkp45R8LT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 21, 2025 at 11:30:44AM +0900, ew kim wrote:

> This driver implements the *generic* (fixed) part of the ABOX management
> stack for Samsung Automotive SoCs. It does not directly control hardware
> but provides common interfaces and state needed by SoC-specific
> (variable) drivers.

> The abox generic driver manages child drivers and provides an interface
> that bridges the fixed and variable parts, connecting the two modules.

I think for such an unusual design we need a much clearer description of
what this is trying to do and why it's not following normal kernel
patterns.  I can't tell what the services this generic code is providing
are, nor why it's done this way.

--uncjgrThkp45R8LT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiKCmMACgkQJNaLcl1U
h9D1Ewf9EGxgcRMPdsLLc8+MwqZ2Yuy0gBJQAtKlLbDOH+w9EcU3zUusN2xBL5Wo
oZekF5oly3qup40QkqyV+6n9Kuc5XbCavzy/HP5SGHSG56YSjndwX9HAbPw4/5b9
z4PEvkzmLy60r2c8zrVVEEKv1dFQHjhnaCwgys/toyYL1ZjRVLtxYsJQLUsv5j5P
+sLoMU2qwtbjptp67QgGZ/sxXw3HJWIJSOLcz1OzEhqjj41numH1+pjjuVeUAmMh
FuEx4frWDrnfQzJEbiHGurYzPn/9wkCj4orly5bRr0g8jbRcDwjlfQZMEmDny1El
Ti4hdIAMod9r4VJc0yLURXHxOruIRA==
=/8UY
-----END PGP SIGNATURE-----

--uncjgrThkp45R8LT--
