Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE8545C14;
	Wed, 19 Feb 2025 00:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739925739; cv=none; b=iDdtzwStNawu/NsdEuD/3yNo9yfosC+srtULt4ip6Iknw9LRj1JUEiH+1qcMW4Ix2UGLv5RewcZ+fALsLPlYivra0+T+WvBcq8GhTm2NVDC7+nYDlRkU6f8TQRVVGRsKixXp5T4uDecvxTgZn8V3XtiQRYsN3vFJVQdblHdjPjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739925739; c=relaxed/simple;
	bh=zG+3d+jK2sUhaf8drQjlMDVNhtlQCiLoKQFWapDKXGA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=nAwQcagq7l5caXkXSl9TxLAVTPCqW3kka7tKRc1pbYAa/7ZdACq6LE19Zk4bgpeNAD9HPIVoYLpFTwMlTKdltsA7lZDi6Dw5icHMdmWpb55IWlT2/MJpPdlbutJg713+RvOM00k8bg3ZOesvb8+r4KdQYBURhsm5Icx+zlADaBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kg5wj8at; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kg5wj8at"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F67C4CEE6;
	Wed, 19 Feb 2025 00:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739925738;
	bh=zG+3d+jK2sUhaf8drQjlMDVNhtlQCiLoKQFWapDKXGA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kg5wj8at0QfyxVSxM5v0s37Toag4HrP7YhdZGI4jyeTWCytxNB+gLfkwGHou8Iu/7
	 /1nkDrJ3uMvZXZDHubtlZS6VxK1SGBALtfzmA3cJIMx7xsBMmbQHrVX+kwI4wS6Nkz
	 jwm2qsTyPdnhFQyjFJCUCHWKk7xcsjk3itb9fz0cTkPGKKj54faHYW8RjTZRZkMLUz
	 xZweDRxsQ74XODQUx1EQulOdLuGy/hUPlXlomXX4Q0QrhQSPbEGSmhfX8dMlCabEWv
	 zOYJF0WyprOtCZ6DScEOvg0owrlwsm3DinhDAtKZaLDxaQjYF1ZQzeDsFwOLRJpJJB
	 AqF0cWswNDBRg==
Date: Tue, 18 Feb 2025 18:42:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
Message-Id: <173992515772.2065079.17786828935224873560.robh@kernel.org>
Subject: Re: [PATCH v1 0/3] arm64: dts: exynos: add initial support for
 Samsung Galaxy S22+


On Sat, 15 Feb 2025 15:04:57 +0200, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds device tree files for Exynos 2200 and Samsung
> Galaxy S22+.
> 
> Exynos 2200 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy S22
> (r0s), S22+ (g0s), S22 Ultra (b0s) Add minimal support for that SoC,
> including psci, pmu, chipid, architecture timer and mct, pinctrl,
> clocks and usb.
> 
> The devices using this SoC suffer from an issue caused by the stock
> Samsung bootloader, as it doesn't configure CNTFRQ_EL0. Hence it's
> needed to hardcode the adequate frequency in the timer node,
> otherwise the kernel panics.
> 
> Another issue is that cpu2 and cpu3 fail to come up consistently, which
> leads to a hang later in the boot process. As A510 cores are clustered
> by two, it makes sense for both of these cpus to fail if there is a
> power issue. Disable them until the problem is figured out.
> 
> Samsung Galaxy S22+ (SM-S906B), codenamed g0s, is a mobile phone from
> 2022. It features 8GB RAM, 128/256GB UFS 3.1, Exynos 2200 SoC and a
> 1080x2340 Dynamic AMOLED display.
> 
> Further platform support will be added over time.
> 
> I expect [1], [2], [3], [4], [5], [6] to be merged before this patchset
> because it relies on the aforementioned series for drivers and device
> tree bindings.
> 
> [1] https://lore.kernel.org/all/20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com/
> [2] https://lore.kernel.org/all/20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com/
> [3] https://lore.kernel.org/all/20250215115433.161091-1-ivo.ivanov.ivanov1@gmail.com/
> [4] https://lore.kernel.org/all/20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com/
> [5] https://lore.kernel.org/all/20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com/
> [6] https://lore.kernel.org/all/20250215123922.163630-1-ivo.ivanov.ivanov1@gmail.com/
> 
> Best regards,
> Ivaylo
> 
> Ivaylo Ivanov (3):
>   dt-bindings: arm: samsung: document g0s board binding
>   arm64: dts: exynos: add initial support for exynos2200 SoC
>   arm64: dts: exynos: add initial support for Samsung Galaxy S22+
> 
>  .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
>  arch/arm64/boot/dts/exynos/Makefile           |    1 +
>  arch/arm64/boot/dts/exynos/exynos2200-g0s.dts |  178 ++
>  .../boot/dts/exynos/exynos2200-pinctrl.dtsi   | 1765 +++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi    |  560 ++++++
>  5 files changed, 2510 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi
> 
> --
> 2.43.0
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com:

In file included from arch/arm64/boot/dts/exynos/exynos2200-g0s.dts:9:
arch/arm64/boot/dts/exynos/exynos2200.dtsi:8:10: fatal error: dt-bindings/clock/samsung,exynos2200.h: No such file or directory
    8 | #include <dt-bindings/clock/samsung,exynos2200.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb] Error 1
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynos2200-g0s.dtb] Error 2
make: *** [Makefile:251: __sub-make] Error 2
make: Target 'exynos/exynos8895-dreamlte.dtb' not remade because of errors.
make: Target 'exynos/exynos2200-g0s.dtb' not remade because of errors.
make: Target 'exynos/exynos850-e850-96.dtb' not remade because of errors.
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
make: Target 'exynos/exynos5433-tm2e.dtb' not remade because of errors.





