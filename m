Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3780F302CDC;
	Wed, 19 Nov 2025 22:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763591263; cv=none; b=oNeaaC0CsTpso+1CcbWMJDToiIVr4u3JmktjCNl9mZGOTCDtrYXCWbUxMETMVMh2tXmN/rEcfNpYJYodF/jryyYTF8oADLu//kxQKoV1j/KUh+NZGP7HtUWomsUqeO9EYGJY/ki3GNki/YjHgs+VRhi73GgqLgoVEC+XsJKCUOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763591263; c=relaxed/simple;
	bh=7TFTdEKpjq78Hov22dVDguk+sxIxp+FrI/cMgGdjvLI=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mgvR9xSaiGxU7epOJbsTU78iAcEUFitd7vCJZYNnoWVdh22HDcM2TRwTFYXrKxsrfIhvAlWYYaZDYxWXvGug0azyZgc16MjIbLPaTKqP8fg+5HPbRs55Esuf/4TUl5JEPv527sl3vQeNtjkjDfhoP0EcCFq/avvsqyxx8QrsdAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkI0Zwd8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkI0Zwd8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DADBC4CEF5;
	Wed, 19 Nov 2025 22:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763591262;
	bh=7TFTdEKpjq78Hov22dVDguk+sxIxp+FrI/cMgGdjvLI=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=UkI0Zwd8j6//AwKAXl45Gg8hKWsy2OKl4mT6FyGgQ8yPQ6HaiTtgFMHJaW6qJgFRL
	 fwQcnCa0NeF8bzClD3IfMyyfXTd6JSv/B8wClBbi7NqGZj29LPzMBDdXcENR1HmgkV
	 xUgg08GbaYBaZQdjfi2juzVmIIIqU5zW5bgWV2BJUKYEBSsEV7Gre0o0U2soLgZkx0
	 6N+qeBfOkJZQWd8S3i+MyqlSiGD86+DYqmayhUdWJTz7tfvTyuTyHymsWkCjSsRC5z
	 n4g4034LC3YAsVl8aY6dcyO8KrBow5b2pgI8D2Zmn/AnY6A9goUtHk6XNzXkwB9hag
	 XrIZH73RuRM9A==
From: Rob Herring <robh@kernel.org>
Date: Wed, 19 Nov 2025 16:27:40 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: kitak81.kim@samsung.com, gwk1013@coasia.com, lars.persson@axis.com, 
 bread@coasia.com, kenkim@coasia.com, smn1196@coasia.com, 
 devicetree@vger.kernel.org, hgkim05@coasia.com, jspark@coasia.com, 
 limjh0823@coasia.com, shradha.t@samsung.com, linux-kernel@vger.kernel.org, 
 krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, conor+dt@kernel.org, 
 swathi.ks@samsung.com, linux-arm-kernel@axis.com, krzk+dt@kernel.org, 
 alim.akhtar@samsung.com, mingyoungbo@coasia.com, pjsin865@coasia.com, 
 ksk4725@coasia.com, lightwise@coasia.com, jesper.nilsson@axis.com
To: Ravi Patel <ravi.patel@samsung.com>
In-Reply-To: <20251119131302.79088-1-ravi.patel@samsung.com>
References: <CGME20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714@epcas5p4.samsung.com>
 <20251119131302.79088-1-ravi.patel@samsung.com>
Message-Id: <176359122535.3467795.541782777241212587.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] Add basic device tree support for the Axis
 ARTPEC-9 SoC


On Wed, 19 Nov 2025 18:42:59 +0530, Ravi Patel wrote:
> Add basic device tree support for the Axis ARTPEC-9 SoC
> which contains 6-core Cortex-A55 CPU and other several IPs.
> This SoC is an Axis-designed chipset used in surveillance camera products.
> 
> This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
> Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
> 
> This patch series includes below changes:
> - Bindings document update for ARTPEC-9 board (patch #1)
> - Device tree for ARTPEC-9 board (patch #2 and #3)
> 
> The patch series has been tested on the ARTPEC-9 EVB with
> Linux Samsung SoC tree (for-next branch) and intended
> to be merged via the `arm-soc` tree.
> 
> Pinctrl and UART DT-bindings are present in another patches which are listed below:
> - https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git/commit/?id=e671a1bb5d1cf9ca4dbab61b9a3e1e77579f99ba
> - https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=85f17e130dc7189acf03eb0f8e2455c4ea2c4f9e
> 
> ---
> Changes in v2:
> - Decouple the device tree related patches which was present in v1 (Patch #5 to #7)
>   Device tree related patches will be sent in separate series.
> 
> Link to v1: https://lore.kernel.org/linux-samsung-soc/20250917085005.89819-1-ravi.patel@samsung.com/
> ---
> 
> Ravi Patel (2):
>   dt-bindings: arm: axis: Add ARTPEC-9 alfred board
>   arm64: dts: axis: Add ARTPEC-9 Alfred board support
> 
> SungMin Park (1):
>   arm64: dts: exynos: axis: Add initial ARTPEC-9 SoC support
> 
>  .../devicetree/bindings/arm/axis.yaml         |   6 +
>  arch/arm64/boot/dts/exynos/axis/Makefile      |   3 +-
>  .../boot/dts/exynos/axis/artpec9-alfred.dts   |  36 +++
>  .../boot/dts/exynos/axis/artpec9-pinctrl.dtsi | 115 ++++++++
>  arch/arm64/boot/dts/exynos/axis/artpec9.dtsi  | 277 ++++++++++++++++++
>  5 files changed, 436 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
> 
> --
> 2.17.1
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
 Base: attempting to guess base-commit...
 Base: tags/next-20251119 (exact match)
 Base: tags/next-20251119 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20251119131302.79088-1-ravi.patel@samsung.com:

In file included from arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts:12:
arch/arm64/boot/dts/exynos/axis/artpec9.dtsi:12:10: fatal error: dt-bindings/clock/axis,artpec9-clk.h: No such file or directory
   12 | #include <dt-bindings/clock/axis,artpec9-clk.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[4]: *** [scripts/Makefile.dtbs:141: arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb] Error 1
make[3]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos/axis] Error 2
make[3]: Target 'arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb' not remade because of errors.
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1500: exynos/axis/artpec9-alfred.dtb] Error 2
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
make: Target 'exynos/axis/artpec9-alfred.dtb' not remade because of errors.
make: Target 'exynos/axis/artpec8-grizzly.dtb' not remade because of errors.
make: Target 'exynos/exynos7870-a2corelte.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2e.dtb' not remade because of errors.
make: Target 'exynos/exynos7870-j6lte.dtb' not remade because of errors.





