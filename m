Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2343F237717;
	Mon, 16 Jun 2025 08:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061606; cv=none; b=lxzt4BeGmJgurWwV6oFf61hAaqLqsmV6OsEL+Rpwp2Yo8TIQNvDm70Icr1Hcp1oxnnwHPpIrJ0k7dr1TM3GScFA/sRbW2wxp86plbC2Lx9zIQFN2OXTvLd+6KR5lCJr9duevFb2vgIZkBNeMv1t86MPZjlTTbyf2qfqPTL+Txig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061606; c=relaxed/simple;
	bh=Kq0/NHfiOW69ee8arNzKsB/koE+Zv0tWJzpNm2rPZOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrZEuZ7/yDqlSJyhoS6SrVyoPe+rIv88UM3Zxo7rRp//rAwNZi5k1yXrXzNej/oV7wlWuebLSIIw54TjO4JchQnId7OEA4fwNehTCSWHGI7XR+GNWFbVwJwtV2ekRrmfAZFiPrDhRucZQ8qh0Q0sW2c3SpC6gPGgPvN3ort7xM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btSDlZrf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btSDlZrf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36932C4CEEA;
	Mon, 16 Jun 2025 08:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750061605;
	bh=Kq0/NHfiOW69ee8arNzKsB/koE+Zv0tWJzpNm2rPZOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=btSDlZrfDdRNhNlsevRVgQ0IoCfm7JiXJj/a3cxwIHxADnClV6FcqpQvhAewK8Y5+
	 VYdOIRe4orlgsn2ITqZto6IBjWldF0fkA+3r0TsEE4GuHPfVtztid/vyWC4sWvsLGR
	 gh8G3nyh7XwycDqtgQcwtFQGjUgCMst+9nK6s92SMpL9ZpkbCKgljiyJxaaV6THUbz
	 pH11vfEv8PsuKTH3jlbSNTqPQa3ENY4sEMoC/JRG0LChCq2VJy5yiIELRbBD9l5I+W
	 2eRy5dA4+ZVZ0r0YOxdTjnf63lQIyIDxMyXf2BFx8Rti3etiCm46K/r6iQAHnDBPQu
	 ME3QN27i6z9og==
Date: Mon, 16 Jun 2025 10:13:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org, 
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, 
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com, 
	selvarasu.g@samsung.com
Subject: Re: [PATCH v3 3/9] arm64: dts: exynos: ExynosAutov920: add USB and
 USB-phy nodes
Message-ID: <20250616-remarkable-zealous-orangutan-7ace78@kuoka>
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055047epcas5p220b1cd1e9b2819997a3d4747c395d13d@epcas5p2.samsung.com>
 <20250613055613.866909-4-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613055613.866909-4-pritam.sutar@samsung.com>

On Fri, Jun 13, 2025 at 11:26:07AM GMT, Pritam Manohar Sutar wrote:
> Add USB controller and USB PHY controller nodes for this SoC.
> 
> The USB controller has following features:
> * Dual Role Device (DRD) controller
> * DWC3 compatible
> * Supports USB 3.0 host and USB 3.0 device interfaces but phy
>   controller capability is limited to USB 2.0.
> * Supports  full-speed (12 Mbps) and high-speed (480 Mbps) modes with
>   USB device 2.0 interface
> * Supports on-chip USB PHY transceiver
> * Supports up to 16 bi-directional endpoints (that includes control
>   endpoint 0)
> * Complies with xHCI 1.1 specification
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  .../boot/dts/exynos/exynosautov920-sadk.dts   |  37 ++++++
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 108 ++++++++++++++++++
>  2 files changed, 145 insertions(+)

DTS cannot be a dependency for driver changes. Organize your patchset
correctly or fix the dependency.

Best regards,
Krzysztof

