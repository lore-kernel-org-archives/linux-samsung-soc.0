Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD5F200B83;
	Wed, 27 Nov 2024 15:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732723045; cv=none; b=SRs/nKFpn0biVCHjwoaH5IrfFAut/4sayjZ3hIGGV2cgmSYFlDusIPlYJIn1jDk+IsDt/lw1Kvv8tW7bM0qelfhRtO6CuJAHMkCaPlw9U9mSNFStGwR7j1xzNN3mrL5EKzSUZRNqEaUGiTyC/2uYz5f+GTI1E32zgZwe7GN7w0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732723045; c=relaxed/simple;
	bh=WSGkgXaL4N5p2uwRcTTHYvq/3QczX507d7c/2vEeemg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXU/WyGo2CwIrpvDkJUJ9Np+u+6lEMW2CGcU/9J4607krTP8X11yNSRm8R88jbVHvOxyN4WTNrMisZC9bwPT5EGECp3IC6QmDjUTfiMQaxReeyLFfPP+B3XupT7iEjE04Cm64LEn5pjNb6JKx7w5UYunKRaK3iLYPM2YKJiPCM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XekDxYIg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XekDxYIg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC0EC4CECC;
	Wed, 27 Nov 2024 15:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732723044;
	bh=WSGkgXaL4N5p2uwRcTTHYvq/3QczX507d7c/2vEeemg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XekDxYIgmckQWV1NFhqDy2VJTp7NPCiygIgd3uwhCCLqARbnjTzUNlHeLRJmFVXuu
	 G8BrMiepbHsftZ1ahwYMYEkJda+0ttpBUdNqmA13Fvdb1QQbKp8ir+IjNKtJ7mRzcc
	 H/SP2D8S/UI/yMS52eOF3oH8YkaNFg6rZ5LFYKbMGwnnsviRvcb9LwPb9sGWvOAHQX
	 ceO1zo7F7MyUaVpqYZEza0FGCJLuLJRGhKPujjZDFlAqPCb8akifWpNY6tfdgN4VgH
	 gkMt2mSKVc8zGV2U0lkuIF8m3X20L/9yb4Ssrb7RqHM8q+pwe00W1hih/3nxkNvxIn
	 7jO4tsg9dNP2w==
Date: Wed, 27 Nov 2024 15:57:19 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagan Sridharan <badhri@google.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: usb: max33359: add max77759 flavor
Message-ID: <20241127-chloride-pantyhose-74f3d81e91f8@spud>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
 <20241127-gs101-phy-lanes-orientation-dts-v1-2-5222d8508b71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YAvHQQ/l8A2Bxt50"
Content-Disposition: inline
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-2-5222d8508b71@linaro.org>


--YAvHQQ/l8A2Bxt50
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 11:01:40AM +0000, Andr=E9 Draszik wrote:
> On the surface, Maxim's max77759 appears identical to max33359. It
> should still have a dedicated compatible, though, as it is a different
> IC. This will allow for handling differences in case they are
> discovered in the future.
>=20
> max77759 is used on Google Pixel 6 and Pixel 6 Pro.
>=20
> Add a dedicated compatible to allow for potential differences in the
> future.
>=20
> Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--YAvHQQ/l8A2Bxt50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0dBXgAKCRB4tDGHoIJi
0mj5AQCDzK12u7YaMkhu+D9SK/V2jSyYP8eYKIAjoZDcb9CwkQD/YdlfFSRpxyel
DUeDcV6Z54WafX5zftL10U6v86kzHgQ=
=vXaV
-----END PGP SIGNATURE-----

--YAvHQQ/l8A2Bxt50--
