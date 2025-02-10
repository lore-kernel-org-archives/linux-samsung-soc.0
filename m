Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689D92580DF;
	Mon, 10 Feb 2025 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204563; cv=none; b=Z0Dr169XqnRtJnA/SYmy8sEUTbZb3QCTsHUOkVw9HTgB7MO95JYiJ7M8iOvM66y1/dTGo6ast+xR7fViOtwrnzmXrxwJLlGMnNAX/RkiXlRMDcqqfhTVMIbW5//LzfHJ6clTfpm3R396RQ64jIJW5xpmMVNLT9bYbwILUsTe9mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204563; c=relaxed/simple;
	bh=Y1OOCtRvUNohjRycrQGn3/19JARUQT+ztyHsw66KdYU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ARqIDQ2V7POwCk29r125+X/pMAkhbUfVQnVTXhR6Iy9j4BTKh8xPtsRjfhm0j2wmM97u8HaPp930U2V/HEMuyGuNwtGVSAD11Ch+USDOKiFhaiKSgtuQ4lz1LNynOqeuLOX84dH+mdcoT4VEBi+Mtk/ppZ6UbOdw9zkYa1+K7vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MT53VQ63; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MT53VQ63"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9480BC4CEE9;
	Mon, 10 Feb 2025 16:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204562;
	bh=Y1OOCtRvUNohjRycrQGn3/19JARUQT+ztyHsw66KdYU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MT53VQ63spjltB3IjE28c+jp5XYU5yyjmOq/2XWN6kNxuPSrycJdosq4l9xGt+pyS
	 RaKJQlQeXnS3rHYyk+pua3uZDvHLcTAz3D2WE7TNnx7JgdgeCTBvEDDDkLpSHnA8XE
	 BvASKbClyz5cwfK0Z+/5LngpaN1cinqMpYDzcstAyhMs4Z7DVRL4zHLHKKUC5LkLpX
	 TTRv5M3yf/9f6lvxldzHUAMzIElRa6fW9LzKJ0gl5KcFKrub05ooecGZZqzBTo/umv
	 ofRzkBszwaDsKzAAA/hTp6pIsmAfGru6kNcFd8tbrBsVvJ0w98dpy4o7rU+dgGP67N
	 wnNaayei6oANg==
Date: Mon, 10 Feb 2025 10:22:41 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com>
Message-Id: <173920411901.476943.11749535762195189252.robh@kernel.org>
Subject: Re: [PATCH v1] arm64: dts: exynos: update all samsung,mode
 constants


On Sun, 09 Feb 2025 15:20:43 +0200, Ivaylo Ivanov wrote:
> Update all samsung,mode property values to account for renaming USI_V2
> constants to USI_MODE in the bindings.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
> Patch picked from [1] and rebased on linux-next
> 
> [1] https://lore.kernel.org/all/20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com/
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 14 +++---
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 48 +++++++++----------
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi |  2 +-
>  .../dts/exynos/google/gs101-pixel-common.dtsi |  4 +-
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  2 +-
>  5 files changed, 35 insertions(+), 35 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com:

Error: arch/arm64/boot/dts/exynos/exynos850.dtsi:654.20-21 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynos850-e850-96.dtb] Error 1
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos850-e850-96.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynos850-e850-96.dtb] Error 2
Error: arch/arm64/boot/dts/exynos/exynosautov920.dtsi:309.20-21 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb] Error 1
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynosautov920-sadk.dtb] Error 2
Error: arch/arm64/boot/dts/exynos/exynosautov9.dtsi:445.20-21 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb] Error 1
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynosautov9-sadk.dtb] Error 2
Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:828.20-21 syntax error
FATAL ERROR: Unable to parse input tree
make[4]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb] Error 1
make[3]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos/google] Error 2
make[3]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/google/gs101-oriole.dtb] Error 2
make: *** [Makefile:251: __sub-make] Error 2
make: Target 'exynos/exynos8895-dreamlte.dtb' not remade because of errors.
make: Target 'exynos/exynos850-e850-96.dtb' not remade because of errors.
make: Target 'exynos/exynos7885-jackpotlte.dtb' not remade because of errors.
make: Target 'exynos/exynos990-x1slte.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2.dtb' not remade because of errors.
make: Target 'exynos/exynos990-r8s.dtb' not remade because of errors.
make: Target 'exynos/exynos7-espresso.dtb' not remade because of errors.
make: Target 'exynos/google/gs101-oriole.dtb' not remade because of errors.
make: Target 'exynos/exynosautov920-sadk.dtb' not remade because of errors.
make: Target 'exynos/exynosautov9-sadk.dtb' not remade because of errors.
make: Target 'exynos/exynos990-c1s.dtb' not remade because of errors.
make: Target 'exynos/exynos9810-starlte.dtb' not remade because of errors.
make: Target 'exynos/exynos990-x1s.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2e.dtb' not remade because of errors.





