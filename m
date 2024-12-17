Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AF450276;
	Tue, 17 Dec 2024 07:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734421132; cv=none; b=Bug1cpIX4CfN15tIpzdbqbO1obkjo/1fz8ipM0nC/S4OSo89DCmQIx5xlw7CfOVjdUWAv0xeTVY4Sk/o8EL2ugoA/AV2ymIcksjwCOPNXGlgKwY1Gzboacfy98TjlehWR4rgAJ7BzRvIzhRQ36htZpb67DvYvHPK0KfjeRHoNqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734421132; c=relaxed/simple;
	bh=tNHnx9DVG5hJfoO2tUFgXbCyMPBkjZoAyxqDuz8uz6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s36R1Nii8CAiqCnzcRihKoXHD+xWvTY38/98nnfXkW5EGXkoAcNdulsaX7nFhOuIpn7T9P+VpIDLCtdAx7xxIU5eq2GiQ+z+GOFuw/OxXUxtP/edlIZeA6XxdGLX/1swkG2u7XmcfuVzXk8fUUilq4VLY1AsjxPVjh5rwS+Rd8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0evr5sG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0evr5sG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D886C4CED3;
	Tue, 17 Dec 2024 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734421132;
	bh=tNHnx9DVG5hJfoO2tUFgXbCyMPBkjZoAyxqDuz8uz6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0evr5sGGa5QqC5BW9/gKXf1MZE2aOZ9mU4WpN+8BCRd/iJGFbWiiUuHAe7irkost
	 Lg5P4mDLIKVyOY4wODXqHaOKe2D6G2Zm2loLKKZGIta5HuqPOmFanAxOSxpDWPvVcN
	 ZmuOfy6U02IiKuI4TVCw9cnWfKn+a2rz5BZin6cPp38y7aDGilU7e5cMYQcNIBrPY7
	 24yWFECXtMF17Mk3oPRH97CI6GuZQV2kNRiBEAo+glLQA6clbHigr7TewOUxw9Zzj1
	 6NB1TnXhJGGb0sxien9H999MPOudYCA0brnO0zUKNZfFtEluUA/tZLka9WQERCxbNC
	 S+uP5kjD79bTg==
Date: Tue, 17 Dec 2024 08:38:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: exynos: gs101-oriole: move common Pixel6
 & 6Pro parts into a .dtsi
Message-ID: <fw2a6taf4kd3sggmyppeym2uxkuyotxy7ugj3bh73vetnra4m6@jllekadordju>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
 <20241216-gs101-simplefb-v1-3-8ccad1830281@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241216-gs101-simplefb-v1-3-8ccad1830281@linaro.org>

On Mon, Dec 16, 2024 at 01:06:28PM +0000, Andr=C3=A9 Draszik wrote:
> In order to support Pixel 6 (Oriole) and Pixel 6 Pro (Raven) properly,
> we have to be able to distinguish them properly as we add support for
> more features.
>=20
> For example, Raven has a larger display. There are other differences,
> like battery design capacity, etc.
>=20
> Move all the parts that are common for now into a gs101-raviole.dtsi,
> and just leave the display related things in gs101-oriole.dts.
>=20
> Raviole was chosen as the name because Google uses that when referring
> to the combination of Oriole & Raven, keeping the familiar terminology.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> ---
> Note: MAINTAINERS doesn't need updating, it covers this whole directory
> ---
>  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 290 +--------------=
-----
>  .../boot/dts/exynos/google/gs101-raviole.dtsi      | 297 +++++++++++++++=
++++++
>  2 files changed, 305 insertions(+), 282 deletions(-)
>=20

This looks like move of the code, so -M/-B/-C format patch arguments
would create better diff.

Best regards,
Krzysztof

