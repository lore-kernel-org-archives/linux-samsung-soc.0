Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173C62500BD;
	Tue,  3 Dec 2024 07:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211454; cv=none; b=sW0zwkPXgEbOlMp/cOyyriZLOYl5yTnNJnSmjKZMClM7mgxEB8dbK0bfPvbT3gZq+x1HqwvkNB7lLR6XKCIU4+PsK1NLl99IUyyq9fTdcn1yI4fBs23+r73mOwPuhpWjRHg0tw+OLe5iqDR4Hwv8gOb6P08lA9422ZMbfdnGSVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211454; c=relaxed/simple;
	bh=rEGPx2pnXM75vPiO0vxKOrSNAyrijtXiX5PobHe/ZkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7eC8aeW51ukfWupGLc08PQRShkgH5FqEFA8PsoRQjVnZpJjqooNnpRDJYHsK5oMAUROS2XMsawYXTqJ9JHyyIsCaroRAtowJ16Bc/N4rQm33u0y5eU082Ajtzcj6t2zhdBWSwnLGAmbBsHbw3AVjK22JNClhXnzzl4wND6D0Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfnrlCUb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfnrlCUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5734C4CECF;
	Tue,  3 Dec 2024 07:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733211453;
	bh=rEGPx2pnXM75vPiO0vxKOrSNAyrijtXiX5PobHe/ZkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kfnrlCUb87kOU8ibUZM3b+Y1HdcnNr2X9xmflkWNiqoS7PaL/yQLwV6S73r3spawD
	 n7fFDUAkG7pXBPGleCHXbmAXN/pGvs6E14bY9ve5MZAbMkyvF2aEXa3bbWLbieezv7
	 N25wcZ0g2Lrg6eoVSAJemgaCdtItJWeuBHmxhewOJ8Vkw8T0D04FNTa/LloapjUJQU
	 aHdrZqFgwNmJVUSQa8YPPa7cVvVURkKLuLRANjwMXV8viJNJs2IpjcmL7NNFWRtE8O
	 2vj6anb9b8fgkgbNEad3nTl5iQP99M1Xh4e55Zf6RmkqeoPhnsaVzmRJkAAJZVSOEk
	 u1QYUwmmvtOzg==
Date: Tue, 3 Dec 2024 08:37:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v3 2/4] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S20 Series boards (hubble)
Message-ID: <p43dwymjwjhxur7v7x6dl5fl6fq2bt2oxh2zjhoonmqadgj2io@zc6s6bdcqrff>
References: <20241202162158.5208-1-umer.uddin@mentallysanemainliners.org>
 <20241202162158.5208-3-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202162158.5208-3-umer.uddin@mentallysanemainliners.org>

On Mon, Dec 02, 2024 at 04:21:56PM +0000, Umer Uddin wrote:
> Add initial support for the Samsung Galaxy S20 Series (hubble) phones.
> They were launched in 2020, and are based on the Exynos 990 SoC.
> The devices have multiple RAM configurations,
> starting from 8GB going all the way up to 16GB for the S20 Ultra devices.
> 
> This device tree adds support for the following:
> 
> - SimpleFB
> - 8GB RAM (Any more will be mapped in device trees)
> - Buttons
> 
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
> ---
>  .../dts/exynos/exynos990-hubble-common.dtsi   | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi

Filename matching boards, so:
exynos990-x1s-common.dtsi

Best regards,
Krzysztof

