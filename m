Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F36311979;
	Wed, 27 Aug 2025 23:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756336736; cv=none; b=PwdMiOvZojBWDjPvWN62HPS+58xP+DEKsA0feSSdypmkNWFftiPsqz0/umz3DW6GOUHTjJq6yXrN1pdQrTSAI+aYKDwqKnwJzLXXs47RGg/oAMwm9jiSguwjRy7FxdeFX81HIm4fCHML9G9bBoHxIVozqVNxrYxMf5YVAUcGqDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756336736; c=relaxed/simple;
	bh=j8waJiGPLOxyz6bi8Ol4G/oClugFmBhM7jsST0ztxBs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=fYOJeSyxcnBdV/GJl2ghTFu3ZIUsGa+3fSoTzqwnr2DllQr4ehLcS0Mx9Ui03iJxs9DWMvTAX+hPhkr/tHJtjV+BU9br1zwWT7XDQSEY/jucRPbqNKuGWsK4hbBTc90gfXyG2IdSaXe1YrGjD5nY8ZKHZDhY/9tmNohQ3eEKfnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8cyyx/r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8cyyx/r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC86DC4CEF6;
	Wed, 27 Aug 2025 23:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756336735;
	bh=j8waJiGPLOxyz6bi8Ol4G/oClugFmBhM7jsST0ztxBs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=E8cyyx/rwL8EQRPsXH7QQFMg+Bii0icmcov7ZtMo654C+ZEw1jaff3nwGrb5nbU6u
	 u7f+FLe6L17U3cdW5dVzQ1hwlEF/X679YTv03jter5rBP00nHbKxkoQ0Ls/bF6PP54
	 o6KHm6mwGYxNKBtfYMjjdyRwFeAIRdIaD8e5P2yJd+nk92Gb/pr1fz8hmOYtEhrDME
	 tlNxpPgCsxDUvlKa9piu9E0+ykq6h1IAFxlTIj+KkKbuRupvsGkwSBle3F/MlwIvIV
	 +hgBMXbXir10OUizCPspCRXqmfkXAeu7ouF34xWf+KFzRPi5cBpLGSwJmzeoap+Gy9
	 5TBGoYzI5ptUQ==
Date: Wed, 27 Aug 2025 18:18:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
 willmcvicker@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org>
References: <20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org>
Message-Id: <175633665113.3746832.15304875656374701987.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: exynos: gs101: add cpufreq support


On Wed, 27 Aug 2025 12:59:45 +0000, Tudor Ambarus wrote:
> Define the CPU clocks and OPPs.
> 
> The patch set depends on the bindings sent at:
> https://lore.kernel.org/linux-samsung-soc/20250827-acpm-clk-v2-1-de5c86b49b64@linaro.org/T/#u
> 
> The following error will be seen without the bindings patch:
> arch/arm64/boot/dts/exynos/google/gs101.dtsi:75.24-25 syntax error
> FATAL ERROR: Unable to parse input tree
> 
> Thanks,
> ta
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> Changes in v2:
> - acpm node becomes a clock provider.
> - reword commit message, extend cover letter with info about dependency
>   on a bindings patch.
> - Link to v1: https://lore.kernel.org/r/20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org
> 
> ---
> Tudor Ambarus (3):
>       arm64: dts: exynos: gs101: add #clock-cells to the ACPM protocol node
>       arm64: dts: exynos: gs101: add CPU clocks
>       arm64: dts: exynos: gs101: add OPPs
> 
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 284 +++++++++++++++++++++++++++
>  1 file changed, 284 insertions(+)
> ---
> base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
> change-id: 20250819-acpm-dvfs-dt-06bc794bdccd
> 
> Best regards,
> --
> Tudor Ambarus <tudor.ambarus@linaro.org>
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


This patch series was applied (using b4) to base:
 Base: using specified base-commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org:

Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:75.24-25 syntax error
FATAL ERROR: Unable to parse input tree
make[4]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb] Error 1
make[3]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos/google] Error 2
make[3]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1480: exynos/google/gs101-oriole.dtb] Error 2
Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:75.24-25 syntax error
FATAL ERROR: Unable to parse input tree
make[4]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/google/gs101-raven.dtb] Error 1
make[3]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos/google] Error 2
make[3]: Target 'arch/arm64/boot/dts/exynos/google/gs101-raven.dtb' not remade because of errors.
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/google/gs101-raven.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1480: exynos/google/gs101-raven.dtb] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'exynos/exynos8895-dreamlte.dtb' not remade because of errors.
make: Target 'exynos/exynos2200-g0s.dtb' not remade because of errors.
make: Target 'exynos/exynos850-e850-96.dtb' not remade because of errors.
make: Target 'exynos/exynos7870-on7xelte.dtb' not remade because of errors.
make: Target 'exynos/exynos7885-jackpotlte.dtb' not remade because of errors.
make: Target 'exynos/exynos990-x1slte.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2.dtb' not remade because of errors.
make: Target 'exynos/exynos990-r8s.dtb' not remade because of errors.
make: Target 'exynos/exynos7-espresso.dtb' not remade because of errors.
make: Target 'exynos/google/gs101-oriole.dtb' not remade because of errors.
make: Target 'exynos/google/gs101-raven.dtb' not remade because of errors.
make: Target 'exynos/exynosautov920-sadk.dtb' not remade because of errors.
make: Target 'exynos/exynosautov9-sadk.dtb' not remade because of errors.
make: Target 'exynos/exynos990-c1s.dtb' not remade because of errors.
make: Target 'exynos/exynos9810-starlte.dtb' not remade because of errors.
make: Target 'exynos/exynos990-x1s.dtb' not remade because of errors.
make: Target 'exynos/exynos7870-a2corelte.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2e.dtb' not remade because of errors.
make: Target 'exynos/exynos7870-j6lte.dtb' not remade because of errors.





