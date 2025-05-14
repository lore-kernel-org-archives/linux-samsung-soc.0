Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C730E55B;
	Wed, 14 May 2025 08:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212166; cv=none; b=SVpoRK/Hp1WpbMzCVfVWrgA6xlW/QVnZA0RsHkY+4dskVdExljbYv214US9KwhFNjg4V8zrUrIpdKGA59nS0p5tt7eVwDHk+vhxaWFcNTOT3M5O7UlbdsnSCpyWAsLtnqjCllgG1Eqmo9wN74gjr9lQcaXYUkCYCXD3/UQas7Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212166; c=relaxed/simple;
	bh=huX/tfz1n6SVCqrMcxeGuPLIU7IfmSzg5HNLXYpyCjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBsATiKOKGztXbUYThzXy6z8LMCGcCYYaB4ecxXGhxvdapsNRTTfjpjKugIr6ldCNUTW8aSid/CQAoxSYIM5FIarknUrK0vtcRIbGF0NSYtMmfr+m+/QwfzEjAOUkWfxy3UJ+k1zOvxD2veS4l8FHyCFaey0EVUGzPBc8AForxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHBgj5Vx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHBgj5Vx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E9EC4CEE9;
	Wed, 14 May 2025 08:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747212165;
	bh=huX/tfz1n6SVCqrMcxeGuPLIU7IfmSzg5HNLXYpyCjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHBgj5VxstSFtIygnteUP8m0H/l2aACoxXCzfYpkbg7Tmjqeh306C4LKegIVk95ZX
	 0W+axqzUd712og2DBkARmvW3nzegaCnAdyu7k4sd4dLlhFQBvNrzV40dsAmABSE3Qd
	 XMY1aG1XY59JOWIpJYGn+gH4rx7llllC86K8tLLw/5Aua+50/v39oiGeENqFOPPfOz
	 MT7i7uXwXnnnJWA/gpS11AJMkXk1730Dzl7RBCBgApW6CtA+lYM3nWTQe8zDzQdG6p
	 elj2/Bl9Dro2aytn7YgMJ2gPfRk/2URR8q/TixZqyHDNIEgVZ/Pjj8pK/j7CJAmJ2o
	 Ggio9B0DwolFA==
Date: Wed, 14 May 2025 09:42:42 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/2] USB PHY support for Exynos990 SoCs
Message-ID: <aCRXgpD0Ld2W4lHE@vaman>
References: <20250420-usb-resends-april-v2-0-25dc7d2e6dd4@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-usb-resends-april-v2-0-25dc7d2e6dd4@mentallysanemainliners.org>

On 20-04-25, 21:28, Igor Belwon wrote:
> Hi all!
> 
> This patchset adds support for the USB 2.0 PHY of the Exynos990 SoC.
> This SoC has a combo PHY that supports highspeed, superspeed USB and
> DisplayPort, however due to my inability to test the superspeed part of
> the combo phy (device always enumerated as high-speed, even on the
> vendor kernels/bootloaders) only the highspeed part is brought up.
> 
> These changes have been tested and confirmed working (with the USB_ETH
> gadget and telnet/ssh in a ramdisk) on a device from the hubble family
> (x1s) and also a device from the canvas family (c1s).

I am missing the dt patch, can you pls report the whole series if you
would like me to review and apply this

-- 
~Vinod
