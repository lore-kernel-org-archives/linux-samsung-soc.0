Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A6C19ABD8;
	Mon, 15 Sep 2025 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757958232; cv=none; b=ZQWuu2oS1LaQ2L27uQf1h5RrFWwZg+/WfXCitxbhkp7EhH6wpRcEo1Ql+RHVWHgBpzO9EAz4UdZP0E5D3eIhamDTcNnesiFTWBakeFpyEJF2r2b1JHBlu+m/0FHFHpI+l8Cqpa3O2CrXI/285xnC/wfQq35sWvjp1LhxtnqabUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757958232; c=relaxed/simple;
	bh=jIHjYy9MPal6/9qXbHTPdPwKbC3QYVHFvSMNKq1Vnwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzNeDsFNqrVlYpIGL6Vq6tiJpBT45UqP+hDVmv/pDvgbbPqpQFSiKXLaW5AxmoOmTTOyN5j4OouW9PYbaV9Aj+f0WWmPWH6eRhblqFt9rKQLiLEiqk/gkV6ju7q32bVHO+1Pt2JCTUmDJqTwqOptt1bzA+ZKD2XTjTyBXrhHrbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cC5xM/cL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cC5xM/cL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48EA0C4CEF1;
	Mon, 15 Sep 2025 17:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757958231;
	bh=jIHjYy9MPal6/9qXbHTPdPwKbC3QYVHFvSMNKq1Vnwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cC5xM/cL6gwwAZ+iNGdKH8/RVD0UpA+Nla/T92mR9y8Mcp/bwb4yWeINIAFdZxXWj
	 W3nnAxIoBvsqNEMzbMUM6RVKsIyf0LN/d0iAsaxifeIMH0W/3+b0oW9hxKA2sASu60
	 XTnP/KhUm58xSmqQlO6xt9TYABZWDdk9jS8qAH/CBUbivM195swvDjPypbivo6QfDT
	 TZv4+OKbMTPHjva0hV7p89QT6z5pDX+Fj7FVZQADvONHIyQs3PHhS/9j1qmr5fXi9x
	 xVTZV3a5s4FbnpxXE3rwt7GzfsMhgBxrxd2AcF9dFMZ5CnxnwnNiSO6ocYmQSMlh3+
	 0Fej5zQX9v/FA==
Date: Mon, 15 Sep 2025 18:43:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: regulator: document max77838 pmic
Message-ID: <20250915-bagful-spoon-e50a4314ab21@spud>
References: <20250914130230.2622030-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914130230.2622030-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ud7yy9Bdd/y/bhk9"
Content-Disposition: inline
In-Reply-To: <20250914130230.2622030-2-ivo.ivanov.ivanov1@gmail.com>


--ud7yy9Bdd/y/bhk9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ud7yy9Bdd/y/bhk9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhQVAAKCRB4tDGHoIJi
0hkOAQDFxhqjjUY1b+e0pxynn03LwtR2DjFzqCE6dEm+iKQIFAEAzF2TkrbMWVnF
ggy5jtGHseSIHA9rvYBxwnKWOBZDnQY=
=aIVb
-----END PGP SIGNATURE-----

--ud7yy9Bdd/y/bhk9--
