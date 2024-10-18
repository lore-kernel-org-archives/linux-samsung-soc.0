Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E293126AD9;
	Fri, 18 Oct 2024 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729255948; cv=none; b=p9HX1Wrhe52M/nWQlhJDu9gkvD+w7NP7jvbbajmlJUvLUX/fWuhX0CfMeqVyDZsjKidfePa9zInCKr1Mh9S8lfguS16w302rA4B62ob5ARD29rSRW2xPT8hpouEhr6yDRkwpIJuHqvC1vQwou3NEj+L0ROzSAwBdmVOShpQxbLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729255948; c=relaxed/simple;
	bh=vP+jMSjKUvnHMJ/iKyhbOa3zhqw3yY28FVC5prTQw+0=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=O/CBE0KLDfKyfDMygSVPB1FGsCt6MmWuSK2VTt06oLGw3iYkunQai+qBCYQr78D1aP93GLRmBlFJwf4TbtXqq2YYm1v8yt1N+ayYhkoB7WROTbEKCC58X4bxdyz7YpaxJcNxwhlFAY9DUSFwKfMy8ZpFMnOE/ni1z2+dt6ttlC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNXn9uuL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNXn9uuL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BA7C4CEC3;
	Fri, 18 Oct 2024 12:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729255947;
	bh=vP+jMSjKUvnHMJ/iKyhbOa3zhqw3yY28FVC5prTQw+0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=mNXn9uuLSq8XI7FeB/Jde6ThBp6a0wXmKQppVR2qodqu68rvSdVl8d3DpYaE7uVat
	 4883UUmgps4wex81yc1VnYND9nvewJB0Xe6dyKE+nDygj9c6+ToaLPOJ+DjLPfr509
	 vfc4eFhUK/4cxN1mZES0Q+/o2BsCjKJSh4bo3h6WJKt3BzlYSZnHn5C+fc5nhpVUaG
	 CnRxeqDVmOTwcgEb5OuGL6x1ftHOstIWD5MwfnyfzTjwj5WNxI+xFh8T7Hu07hWVMv
	 tB6vbVfRn8v6EHCNc7mS+1ik+3z8kSdvvaDAiK9upiDL04/hlZvM3DBgVqroibR5GB
	 0Xl6QPeEB/Ghg==
Date: Fri, 18 Oct 2024 07:52:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 igor.belwon@mentallysanemainliners.org, linux-samsung-soc@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20241017164328.17077-1-umer.uddin@mentallysanemainliners.org>
References: <20241017164328.17077-1-umer.uddin@mentallysanemainliners.org>
Message-Id: <172925539756.17638.2832259722479628481.robh@kernel.org>
Subject: Re: [PATCH v2 0/4] Add minimal Samsung Galaxy S20 Series board,
 SM-G981B and SM-G980F support


On Thu, 17 Oct 2024 17:43:23 +0100, Umer Uddin wrote:
> Hi folks,
> 
> This series adds initial support for the Samsung Galaxy S20 Series, also
> initial board support for the Samsung Galaxy S20 5G (SM-G981B)
> codenamed x1s and the Samsung Galaxy S20 (SM-G980F) codenamed
> x1slte.
> 
> The S20 Series feature a lot of similarities in their configuration
> and internally Samsung named the common devicetrees in their
> downstream kernel 'hubble', please note hubble excludes the
> S20 FE series and Note20 series.
> The device trees have been tested with dtbs_check W=1
> and results in no warnings.
> 
> This initial bringup consists of:
>  * pinctrl
>  * gpio-keys
>  * simple-framebuffer
> 
> This is enough to reach a shell in an initramfs. More platform support
> will be added in the future.
> 
> Just like SM-N981B, the preferred way to boot the upstream kernel is
> by using a shim bootloader, called uniLoader [1], which works around
> some issues with the stock, non-replacable Samsung S-LK bootloader.
> For example, the stock bootloader leaves the decon trigger control
> unset, which causes the framebuffer not to refresh.
> 
> Device functionality depends on the patch series from Igor Belwon:
> "Add minimal Exynos990 SoC and SM-N981B support"
> 
> [1] https://github.com/ivoszbg/uniLoader
> 
> Changes in v2:
>  - Add Samsung Galaxy S20 into device tree bindings
>  - Add support for Samsung Galaxy S20 as well as the 5G variant now
>  - Fix typo in Samsung Galaxy S20 5G commit message
> 
> Kind regards,
> Umer
> 
> Umer Uddin (4):
>   dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B
>     and SM-G980F board
>   arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series
>     boards (hubble)
>   arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G
>     (x1s)
>   arm64: dts: exynos: Add initial support for Samsung Galaxy S20
>     (x1slte)
> 
>  .../bindings/arm/samsung/samsung-boards.yaml  |   2 +
>  arch/arm64/boot/dts/exynos/Makefile           |   2 +
>  .../dts/exynos/exynos990-hubble-common.dtsi   | 109 ++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos990-x1s.dts  |  23 ++++
>  .../boot/dts/exynos/exynos990-x1slte.dts      |  17 +++
>  5 files changed, 153 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts
> 
> --
> 2.47.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y exynos/exynos990-x1s.dtb exynos/exynos990-x1slte.dtb' for 20241017164328.17077-1-umer.uddin@mentallysanemainliners.org:

arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /: failed to match any schema with compatible: ['samsung,x1slte', 'samsung,exynos990']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /: failed to match any schema with compatible: ['samsung,x1slte', 'samsung,exynos990']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /: failed to match any schema with compatible: ['samsung,x1s', 'samsung,exynos990']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /: failed to match any schema with compatible: ['samsung,x1s', 'samsung,exynos990']





