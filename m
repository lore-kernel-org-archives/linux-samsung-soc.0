Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340A5255F5E;
	Tue, 19 Aug 2025 15:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755616945; cv=none; b=vD25yHz7Dv+CIkZhnX+iWg9RGg08kpz8m1tlcxITrk1WqGHoaTL5ULaNlwzH6ZiqVVSbp+kr2Aa03INfgy2Xprk0PtQ7wRHUapJbMFAexblNcoGWge4LLTegFAArvI79RTgMzi+pz0cd76sdgbpu7jkAwxbZV8uJPVgqve2/aOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755616945; c=relaxed/simple;
	bh=Rz8fa5qMLAhdiq+ZkBx9/eGxPhzWcb2M5/+N2MOWSAs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GqIzogvTlczFwENPkT+Sidnp9S46ZX9/puWlS3qbJ2Fe1a7UA95Nf8bo7/DxT44PXsx16jFBYDJ4WD8OvE0HHNTum511W1jGtXxC1wOPYVTSZ5K5ytzAP63fYkFJuPH6pqp4jsETTUb/hLZeG2UlPiOGZprfRbPAYOxWZtZNh94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ju0NDliL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ju0NDliL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901CEC4CEF1;
	Tue, 19 Aug 2025 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755616944;
	bh=Rz8fa5qMLAhdiq+ZkBx9/eGxPhzWcb2M5/+N2MOWSAs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ju0NDliLS0nWdi/es0O77LLC44TZ9ZJKgJqV+IOpgC7jMTUdAt1Qt5Q7/ZUu8P/1s
	 tE8cGEe5EeDiWx/C+2ndbQUqqezSUHqIylbLiMlUWH6IA2XZhIHQuOWHDOwGkSm0Q3
	 iOSC/pcNasGRoV4NoCIkymxX0AYjCqJtIrLcmIR1WHel2L177AJsM68+8pnFOHwJBz
	 KF7JI4mfd7e9kxeL7QcAdkkXrDPFeTJ9sGlO0eQGSnMYVs4siWDPHAPP/NHXkwR9bB
	 s//05ZNWpo04Fw5K9j9KS+J/SaD+Tb5MMUG1oqj9tKMwjFI9xaDVPrkMdxVTgwFsp8
	 7r7eqxhvz32AA==
Date: Tue, 19 Aug 2025 10:22:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Will Deacon <will@kernel.org>, 
 kernel-team@android.com, Catalin Marinas <catalin.marinas@arm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
 willmcvicker@google.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org
To: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
References: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
Message-Id: <175561687189.581847.11419028447160198230.robh@kernel.org>
Subject: Re: [PATCH 0/3] arm64: dts: exynos: gs101: add cpufreq support


On Tue, 19 Aug 2025 12:10:19 +0000, Tudor Ambarus wrote:
> Define the CPU clocks and OPPs.
> 
> Bindings for the "google,gs101-acpm-dvfs-clocks" compatible are sent at:
> https://lore.kernel.org/linux-samsung-soc/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org/T/#me3cbe2a97485d19eaf505ad23202f20a21305dd8
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> Tudor Ambarus (3):
>       arm64: dts: exynos: gs101: add google,gs101-acpm-dvfs-clocks
>       arm64: dts: exynos: gs101: add CPU clocks
>       arm64: dts: exynos: gs101: add OPPs
> 
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 288 +++++++++++++++++++++++++++
>  1 file changed, 288 insertions(+)
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

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org:

Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:75.32-33 Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:75.32-33 syntax errorsyntax error
FATAL ERROR: FATAL ERROR: Unable to parse input tree
Unable to parse input tree
make[4]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/google/gs101-raven.dtb] Error 1
make[4]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb] Error 1
make[3]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos/google] Error 2
make[3]: Target 'arch/arm64/boot/dts/exynos/google/gs101-raven.dtb' not remade because of errors.
make[3]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos/google] Error 2
make[3]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/google/gs101-raven.dtb' not remade because of errors.
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1480: exynos/google/gs101-raven.dtb] Error 2
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1480: exynos/google/gs101-oriole.dtb] Error 2
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





