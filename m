Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3291A2CCC0;
	Wed, 27 Nov 2024 16:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732723265; cv=none; b=pVL+jEJapL17fGhbtNQVf9HA8MkoLqtz8JmPJi4ZTbOAtamHshY0lRv0GKYtQBdEjqQZTENw4ilUidRG+CuF25wguHqHkRL++F+6fKAhFRyTHYu5p3B8In6mwo4Pts12xsNb75q1VOvUd1gEkJCURbUjiSZWBiobZzFnmzx7sMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732723265; c=relaxed/simple;
	bh=M4M6enDTU22SNfTcxSEVD3rydp3BImCdb+4g0awKJZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kowb9U6RbnSZpvoRPrYtUJJ82MMcI3uvFiDAC7Jii5PaHuLWxO8vXjkkBNPUWdF7MNVnP/NWi7dlrDFUcmLyYmidASfiRtdlaSsi7WKXFatrc6zT4vQHG7OUpF9VBR4J08EZn6F7p+0Qwag9jUOrC/+aibiwo+niTBojE0d+Tx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvIC2dvQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvIC2dvQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A377C4CECC;
	Wed, 27 Nov 2024 16:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732723264;
	bh=M4M6enDTU22SNfTcxSEVD3rydp3BImCdb+4g0awKJZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GvIC2dvQOfcpqRNRSWrZjx7szrZxab8KBhgVklQCkJRs62rN/IbYxrS0cQHAyO7BM
	 aSL6LoNc78LPGwriQJ3Q2V25qeHrhsXQxrSK/VZYebr+zSk0vijH8iKuOUuWxeH1H6
	 NxXQqM53JDaOugceU/Tc42yWYRSrhN+KWp8fSQtTclLULu9DBiD1HmF8vHaHWYf5vC
	 EB2F8J6NAEKmuXxgWO7uKcnq1zeba5WZzhrbeR2vbW05L5Tz9NY26DXtckClQOIuEc
	 BWE0J2C+UB3nvnlB8kVhrycnRi7XOMNRKsYVziZo4bjVFfjYWJg1Gejx6PDTEyLiEC
	 Mld4Rxlp+OwOg==
Date: Wed, 27 Nov 2024 16:00:59 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: phy: samsung,usb3-drd-phy: add optional
 orientation-switch
Message-ID: <20241127-unturned-powdered-d9d1b695732d@spud>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-2-1b7fce24960b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tx/fOhQTJ3HpCf6w"
Content-Disposition: inline
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-2-1b7fce24960b@linaro.org>


--Tx/fOhQTJ3HpCf6w
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 10:58:12AM +0000, Andr=E9 Draszik wrote:
> orientation-switch is the standard declaration to inform the Type-C mux
> layer that a remote-endpoint is capable of processing orientation
> change messages.
>=20
> Add as an optional since not all versions of this phy currently support
> or even need the orientation-switch.
>=20
> Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Tx/fOhQTJ3HpCf6w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0dCOgAKCRB4tDGHoIJi
0mROAQCOFefWLQAVOt/TEa+0oQfLTwQShkoYl/YCu/c7vWNwcAEAu9WuT8ESwSD2
YQdYtCGtqVtkqoOWtMJh9sjaJ2XwPQw=
=hKKJ
-----END PGP SIGNATURE-----

--Tx/fOhQTJ3HpCf6w--
