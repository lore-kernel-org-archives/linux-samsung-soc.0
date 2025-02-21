Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A012E201017;
	Fri, 21 Feb 2025 09:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130580; cv=none; b=eRM/IF2inA3rgCnDC388UAkWJ7IY6rYHSLvGpPGOUrND9aONZZlaBppQD+aIGanL/VMvK4lK01MrXoRKWAi31vtbQsStZWSl1g7mKMGpOZNIBRrFwCrQgzlOsyIDSH6Yjua69GqZJtnCKzxKBmYtpFwmWeMVssGLh/+xkwbYoAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130580; c=relaxed/simple;
	bh=2JYtZqX939Y+D87kR0xAmcGyGqDeR/SDLpu7Ha5+6ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJTzXXAfQ91WIN0A2PofrlXoR8c2CtGzOtFmyHYLnFHA1oeIyBwpTyRDsQ+1ZSrInC9JUEKzooUvrhJ/bWaQCiCYGkooMqM3RxmxqDUDd0FMIeKA/+g+BFQ86F4a5j0OOyjOekmQXldH4naAtyNTg4XHRE4ISJRcz3Xq74ruOlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAWlb8BW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAWlb8BW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1AFAC4CED6;
	Fri, 21 Feb 2025 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740130580;
	bh=2JYtZqX939Y+D87kR0xAmcGyGqDeR/SDLpu7Ha5+6ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TAWlb8BWw0ZkWQSpCua6PtYzLZmlyMoBOktuhHneAneNEbrKIOzBF8duUu9GRVTiJ
	 cnIumZ/AOh10dWag5FO33bxpV6CyO1USpCBsRc6shfTKZVV5l3ct92KO7q2qi0rac9
	 zZT3E7549u6k9bLw9sQcaU1vBmcuOu8V3Xccd7p25yjnYkUPoQEfFt/dO2wdQg7Tu8
	 98KIQWkNzXv3MTOhKyCjQvKGjfUCgkLgye69mjup0i51Mm6wlWDZbEHiBaDVqkkbUk
	 wDHEmwbC47+A5gbP36yjoJGrLfF08N6Uvk9jV9mEUQ9yWHg9vW66TkG+1qHSgzXr1A
	 oRGfOBnZCpLKQ==
Date: Fri, 21 Feb 2025 10:36:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 0/7] Add support for the Exynos7870 SoC, along with
 three devices
Message-ID: <20250221-able-quoll-of-storm-1cd6aa@krzk-bin>
References: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>

On Wed, Feb 19, 2025 at 12:33:10AM +0530, Kaustabh Chakraborty wrote:
> Samsung Exynos 7870 (codename: Joshua) is an ARM-v8 system-on-chip that was
> announced in 2016. The chipset was found in several popular mid-range to
> low-end Samsung phones, released within 2016 to 2019.
> 
> This patch series aims to add support for Exynos 7870, starting with the
> most basic yet essential components such as CPU, GPU, clock controllers,
> PMIC, pin controllers, etc.
> 
> Moreover, the series also adds support for three Exynos 7870 devices via
> devicetree. The devices are:
>  * Samsung Galaxy J7 Prime	- released 2016, codename on7xelte
>  * Samsung Galaxy J6		- released 2018, codename j6lte
>  * Samsung Galaxy A2 Core	- released 2019, codename a2corelte
> 

You have some dependencies here, so you must always clearly mention
them.

> Additional features implemented in this series include:
>  * I2C	- touchscreen, IIO sensors, etc.
>  * UART	- bluetooth and serial debugging
>  * MMC	- eMMC, Wi-Fi SDIO, SDCard
>  * USB	- micro-USB 2.0 interface
> 
> Here is a list of all sub-series:
>  * bootmode	  	- https://lore.kernel.org/all/20250204-exynos7870-bootmode-v1-1-0f17b3033c2d@disroot.org/
>  * gpu			R https://lore.kernel.org/all/20250204-exynos7870-gpu-v1-1-0db4c163a030@disroot.org/
>  * i2c	      		A https://lore.kernel.org/all/20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org/
>  * mmc			- https://lore.kernel.org/all/20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org/
>  * pinctrl	  	- https://lore.kernel.org/all/20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org/
>  * pmic-regulators	- https://lore.kernel.org/all/20250219-exynos7870-pmic-regulators-v2-0-1ea86fb332f7@disroot.org/
>  * pmu-clocks		- https://lore.kernel.org/all/20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org/
>  * uart			- https://lore.kernel.org/all/20250219-exynos7870-uart-v2-1-c8c67f3a936c@disroot.org/
>  * usb			- https://lore.kernel.org/all/20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org/
>  * usbphy		- https://lore.kernel.org/all/20250219-exynos7870-usbphy-v2-0-b8ba4e7a72e9@disroot.org/

These are not dependencies. Weirdly, you link related patches but you do
not even mention the actual dependency.

Best regards,
Krzysztof

