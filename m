Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BAF29B773;
	Thu, 12 Jun 2025 15:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742129; cv=none; b=AA4LR8fpUfFR3c5CXM/I22kXdBjzdVN6195liavH7Pf7NwxHs3Nd4Wkk5DNSIAz9nZ8pxwX5APNA6KFLlvl36mYdSlsdrqOSl65gtoDHU9k0wnpT/DoI5bfDuyZFASPxVdVT5Xii0m40HZZ+j8Tx/A95k9qe/eAvvo9UYhV5mc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742129; c=relaxed/simple;
	bh=t7kFj3CUvv/CS73sWzGwnm3tHKJMaqfmiaX3ddssg0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mn34dc3f7uuDPxkvkZnuJ9iM7nyNLiwNgQ8rczeeM4TMErR0m2UuBZAzCV7MMGNFzxkIunAvEKgT1s+DmzCfSvnFAT5+Cu4nsSXEUDH8IOTordB689DGTwW2+M/X2M/eVDN+wWexn90S6a/6l2N/xEMpYErQZtxtrA0KC5BUrSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBJ1AJLi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBJ1AJLi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58504C4CEEA;
	Thu, 12 Jun 2025 15:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749742129;
	bh=t7kFj3CUvv/CS73sWzGwnm3tHKJMaqfmiaX3ddssg0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBJ1AJLi2/VBvcn8K3zZFaIdebMiKc4pC4pqU1oD174Nyic3I5Vc0tYsWBUagR3AR
	 dhN5uG49SFhLwzEphylzAUlEdaqgzBH9qYOpNbvbXJ84CycsJnzwvt1OMWLIBi+/sk
	 AelZxxiwy4IWq8CJ9KwdfplFJa1ffrGvIdnEov3hsqdrPZgOEbnQT3F0xN79BxCSxM
	 64O1AJCB+RBxUMbwUd5fdM9v2Bvbxt6vn90YdmeRBiat3KXXlYDWlG3U/INFGhf5hI
	 oJKLvjpF5D5LPgwG3pmKaH2CQcRlHkhj98dnUFeDAtcKm2u/VAOjF72WtKJvSvYIdT
	 PwREXpzfhGKKw==
Date: Thu, 12 Jun 2025 16:28:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: samsung,mipi-video-phy: document
 exynos7870 MIPI phy
Message-ID: <20250612-unpaid-slacker-edaf80ce160b@spud>
References: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
 <20250612-exynos7870-mipi-phy-v1-1-3fff0b62d9d3@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f30wP9juoNGzy1L/"
Content-Disposition: inline
In-Reply-To: <20250612-exynos7870-mipi-phy-v1-1-3fff0b62d9d3@disroot.org>


--f30wP9juoNGzy1L/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 08:39:29PM +0530, Kaustabh Chakraborty wrote:
> The Exynos7870 MIPI PHY device contains one DSIM PHY block and three
> CSIS PHY blocks. It also requires two sysregs, one for display, and the
> other for cameras. Document this device.
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--f30wP9juoNGzy1L/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEryKwAKCRB4tDGHoIJi
0mqJAP9DJbUlkADvUrHdf81purqcXzTVeDAzhbMUmKO+F21UFAD/QjLSgELcwtip
njn3vQB/7wZoDC6VzVfnBVgIdy1XAwg=
=Bir7
-----END PGP SIGNATURE-----

--f30wP9juoNGzy1L/--
