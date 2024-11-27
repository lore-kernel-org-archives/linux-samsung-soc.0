Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA11200130;
	Wed, 27 Nov 2024 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732723358; cv=none; b=Hxa9Ckr5vdFkxBGE3VwpD4aLuccn9cixgR6QPxTBE77imkFkdWTl5CqeZIBruxYAT3V3rVOM0AUdg6mMWiIWMLWhucPYmADUJCRM7eTwEqIRJvgw3lfnti7pFBIrh5LHo3y1Mdh0M1wBrmbCaCtL8Kae/bnZMa8axTlKaLFyYvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732723358; c=relaxed/simple;
	bh=TL+I7JUh7Aq1InjR6Z5JlWDmp5BdWL7K2gWShIAH5n4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqSo06L5wikSZp6g8JEG6udpeESXEbEpU2vVDg1+hf9tug8a/V6WN6xrfbnqV1pWOxOh9VphqsbfSzD8OPTZVkPpplpsGtNI00dfZTftOVY6KYtP1VN+6hKMvwUdIY4unExoLmoxrQ8CyL/hTWiBj18oyP241aZWVipuPZe0TOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QP/WO6fF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QP/WO6fF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687FBC4CECC;
	Wed, 27 Nov 2024 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732723357;
	bh=TL+I7JUh7Aq1InjR6Z5JlWDmp5BdWL7K2gWShIAH5n4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QP/WO6fF1/JucbsBoAFCrhfNdZNn/vJDCSkL5EJUDHbD4Q9W6J5PIX49asB5E3UC2
	 sZUunSdX7ixSk1o5R9DiiFZDGfX6WAtLtUvkuE7hqdc87MSUvvEJRK9V9AiGgzsqXe
	 LVA7woAMlL1n5vVE2go2T/tCQ7LSxkQzqujgAPQGZpBo0jpPvSAqh2Cja/LKDi8B1p
	 4dbn8lQihck31K332LiyQ6CWqlD8QNFWFu3A7FLxfHh3JXC1lU60aamuoeCDgBwaCg
	 sMDH6NT+qc466C8dtKzwYfxUzo4lNyLQtrBEW0ayK68UOrUNfh/uXEs7q2+izeiaPK
	 fPQAVxr+7iFxA==
Date: Wed, 27 Nov 2024 16:02:32 +0000
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
Message-ID: <20241127-pushing-baboon-4afafcf8322f@spud>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-2-1b7fce24960b@linaro.org>
 <20241127-unturned-powdered-d9d1b695732d@spud>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IhBg84JsEwDLC8Yb"
Content-Disposition: inline
In-Reply-To: <20241127-unturned-powdered-d9d1b695732d@spud>


--IhBg84JsEwDLC8Yb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 04:00:59PM +0000, Conor Dooley wrote:
> On Wed, Nov 27, 2024 at 10:58:12AM +0000, Andr=E9 Draszik wrote:
> > orientation-switch is the standard declaration to inform the Type-C mux
> > layer that a remote-endpoint is capable of processing orientation
> > change messages.
> >=20
> > Add as an optional since not all versions of this phy currently support
> > or even need the orientation-switch.
> >=20
> > Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Actually, this patch unconditionally adds the property to the binding.
Is it valid for !gs101?

--IhBg84JsEwDLC8Yb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0dCmAAKCRB4tDGHoIJi
0tYAAQCWP68TjQ4VMdnkNOjU/mfYGe+iMPyKEG8O7I36Qm4hGwEA00p1NoQKRQ8X
g2sEFghrV9k7tx8dNqsT6X7yI8Ehrgs=
=PrlU
-----END PGP SIGNATURE-----

--IhBg84JsEwDLC8Yb--
