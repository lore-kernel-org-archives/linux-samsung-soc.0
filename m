Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D224A3C;
	Thu,  4 Sep 2025 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756995431; cv=none; b=lxs+t2KKcoZUAiE5krlyQkPnwEFQOI7dB5PlPon/CORL84FV8nKnBLByKgkIsBvkRh+lypPhZrU8C1THdVYl6i9TaSPaxaGi9Pjfpkfeh3sfAWwvVO20m11MD7X15x+BJU0LidRM2tA3E1voQqjO9QprDEm/XUunQmKb0vPlbLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756995431; c=relaxed/simple;
	bh=ejGIkx8afYA1cykDAUIyzFsHzUPSCskfk2RxoKQ3LsU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mfn+EGZ7HMzXQJlRHkZbUVGDEi55tHvMpaaMaq/yyCSSpPb8LVdHCNoau7/fZtsMP4AyLqLXffFdi1L6BU9tcWZozQ3PRKMnnWgxjXt0TVOT7MPq9iyoUp47JACtdcJRtuQG4IYeUwGqoLJNtzPgqKN1n/3Xh/yF8Z6YWd45Gq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PU7y7ZPv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PU7y7ZPv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FEAC4CEF0;
	Thu,  4 Sep 2025 14:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756995430;
	bh=ejGIkx8afYA1cykDAUIyzFsHzUPSCskfk2RxoKQ3LsU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=PU7y7ZPvcIO89FIJIPqyrPdXX4XP2Py83uvM8umriHzBUA9mExfPQVemGWCJxL25n
	 zq5lHshGAmj3ySkKiHLdZcdClZadu8XTX4X6ukwGZACbYzEhwxg8G5vSzr4JQaQMFN
	 fjk3qag5IjfPF/CmKJkMHWf7ebvFO1JjYJ/684mc9QBMDCcKj0j2kKlbRw5WoJUNN9
	 spo7Z6ZRUa5RyPsnX0ssLt5NN9ivoz/elCiMlWm24DRP50YVzprthjxDyBnFXV+X+v
	 E9/wJmqtJB1GWMtfliobdlPP7Mct77/kvMFVOFhyXlD7+N/SAinZCUQFsSTVGPLjEX
	 C9ABexQos/lEQ==
Date: Thu, 04 Sep 2025 09:17:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, willmcvicker@google.com, 
 kernel-team@android.com, Will Deacon <will@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
References: <20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org>
Message-Id: <175699523574.4060004.693479596122414416.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] arm64: dts: exynos: gs101: add cpufreq support


On Wed, 03 Sep 2025 14:24:34 +0000, Tudor Ambarus wrote:
> Define the CPU clocks and OPPs.
> 
> Patch #2 has a dependency on the ACPM clock bindings sent at:
> https://lore.kernel.org/linux-samsung-soc/20250903-acpm-clk-v3-1-65ecd42d88c7@linaro.org/
> 
> The following error will be seen without the bindings patch:
> arch/arm64/boot/dts/exynos/google/gs101.dtsi:10:10: fatal error: dt-bindings/clock/google,gs101-acpm.h: No such file or directory
>    10 | #include <dt-bindings/clock/google,gs101-acpm.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Thanks,
> ta
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> Changes in v3:
> - the ACPM clock bindings were moved to their own file, update the
>   references accordingly.
> - Link to v2: https://lore.kernel.org/r/20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org
> 
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
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 285 +++++++++++++++++++++++++++
>  1 file changed, 285 insertions(+)
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

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250903-acpm-dvfs-dt-v3-0-f24059e5cd95@linaro.org:

In file included from arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi:15,
                 from arch/arm64/boot/dts/exynos/google/gs101-oriole.dts:11:
arch/arm64/boot/dts/exynos/google/gs101.dtsi:10:10: fatal error: dt-bindings/clock/google,gs101-acpm.h: No such file or directory
   10 | #include <dt-bindings/clock/google,gs101-acpm.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[4]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb] Error 1
make[3]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos/google] Error 2
make[3]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1480: exynos/google/gs101-oriole.dtb] Error 2
In file included from arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi:15,
                 from arch/arm64/boot/dts/exynos/google/gs101-raven.dts:11:
arch/arm64/boot/dts/exynos/google/gs101.dtsi:10:10: fatal error: dt-bindings/clock/google,gs101-acpm.h: No such file or directory
   10 | #include <dt-bindings/clock/google,gs101-acpm.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
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





