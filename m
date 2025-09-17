Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22F75661;
	Wed, 17 Sep 2025 19:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758136863; cv=none; b=V0A2/IqYruu01+6qVFFSq80eJW18DYXQXZUMpbBFhckYtTotMnj0rmBIGBFxx7cwmmYszLWKiU9539mhGmkqqz1TU0u1KSt2BrLwQHaS7nMl3aAchvH0vcrS+rUIxVIXxXMpF+2QFHB6zKFYUX8AjjPV2KOekG2ErTNLIw1lzwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758136863; c=relaxed/simple;
	bh=y+1oflaYqWx1oZke1AYLzfl4If0XApi/pCR6vFyP6Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htMlF1iiPC1tto4zZ/LC8SWFJSEhyqXgUkN8wPSc0101LYmtXWHzsP3XUkdXauF9z/ryP/up/RXd/0IYvPnXMvgAmmXEtDhzWWxyxbL2ETi51CZGMpeKGg4vQA0daP8NosoBu617zwOIHSe/bJyzn4nQfDHVrpUk/YWki0yuDbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elVhVFs1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elVhVFs1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299D8C4CEE7;
	Wed, 17 Sep 2025 19:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758136862;
	bh=y+1oflaYqWx1oZke1AYLzfl4If0XApi/pCR6vFyP6Jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=elVhVFs1jX2+3kDoleBQyuWVNoG1a8y2VSothBaxVMJS9D5ibYWTKz4q+tXzYInKC
	 55z/W1t2Jb1zMwarTWYuGhb5qhN4bQPIP2fPQWNaIv6QZjSXWiKYwYhHo1COtzPgzk
	 CytdkEvA9UTB0LAMsCyFd2kM9DILrBXh7+oxZVYYdXMjnPjxulqV9bAIjA5PdtsJRF
	 bkkJjCor00KOuLH8e2/uPQZpY0GxpDnRPYJl1nal3oObv+zdx67FFeP1WpBM3PT/wP
	 UpkpViIoAvdnhOttHIVvP95NQIWAPk6RdUpHbgraHqkuhSU8sPL+5XIGdSB0VnhKjh
	 vFyfXteQdJhgA==
Date: Wed, 17 Sep 2025 20:20:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com,
	mturquette@baylibre.com, sboyd@kernel.org, alim.akhtar@samsung.com,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, ksk4725@coasia.com,
	smn1196@coasia.com, linux-arm-kernel@axis.com, krzk@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com, kenkim@coasia.com
Subject: Re: [PATCH 5/7] dt-bindings: arm: axis: Add ARTPEC-9 alfred board
Message-ID: <20250917-underrate-blurb-cd6a9aee014d@spud>
References: <20250917085005.89819-1-ravi.patel@samsung.com>
 <CGME20250917085045epcas5p2905ed7f307ca892997e14c33ad68f9fa@epcas5p2.samsung.com>
 <20250917085005.89819-6-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+jcr3yw54Dfe8FJr"
Content-Disposition: inline
In-Reply-To: <20250917085005.89819-6-ravi.patel@samsung.com>


--+jcr3yw54Dfe8FJr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--+jcr3yw54Dfe8FJr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsKFgAKCRB4tDGHoIJi
0hWoAQCXo+6cPmdH6YWPs9PyzigkwJ60BhAPlINjCbIJTksefwD/VzsJGao/I5xz
PPOC4KGvroyyyWVXBtRiAJbuIIL+nwA=
=76fH
-----END PGP SIGNATURE-----

--+jcr3yw54Dfe8FJr--
