Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A4428640A;
	Wed, 28 May 2025 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435845; cv=none; b=OJgffo5nEFlO1yAVZ2XZJEDUgogqKiEv+JEtxklj1gRwcYdV840Y3P9wv/gS13TH4RB/hM1W6eNPq+AzzxyafcJEVi13eHDN1MgwZXOkbOv8f5I+8AiywOAngM7OOXybrxFpuhvwvSyGtPUxKq73e6YjGb/M4SC++cU5vDJBlhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435845; c=relaxed/simple;
	bh=eUA0BDfpbYKOu7zRQ2U4yKvk2szX91xJ+8ngKIX4azc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ih9ivjZCFobunAgOMAHUJTxbw9XydlFkkYdaZcp4f0gYbldGGnoFX5V5F0PRlaJhPNsznrpaDlZPhKiDd6+nK7p0H4pzwB299/Aj8GAw4wPHjHqllmQ77/S3XhquxXXxTS7S8lTl/BXR9FuDQMATsxT9C3xSCu5C3M5ufFbVIj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jazg0UmC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jazg0UmC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DBEC4CEE7;
	Wed, 28 May 2025 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748435844;
	bh=eUA0BDfpbYKOu7zRQ2U4yKvk2szX91xJ+8ngKIX4azc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jazg0UmCvQ2wV++PyxuX/XABwG1uLNgiyt9I+MfXiFIAD6pOYtbF4Vr79wA4pE8hH
	 fEWhbdCgSvmh43nXEUtRK0Amq7+8UrVQ1mNv9fnTcHQ8tHwLWG1Rrj3tdHYIv1KcEe
	 7gzDcSAYWtZR9gz0Pd9Y8qEHAVXKt5H2eB6SegyOgbvfntjP49qrHfgqsS3DJa6WOa
	 QKi4t8b5Ve9hmIIBvuIbFEp0EoEYmPdepve4eFn0mlP/GGxKoLr4JyvAnBW05UvBXG
	 lTngUL4DUoFWPpS2hgMdeijYRw64b6suDmK5eGzP5kMCIIUqvS5fAhHHZUHQJ+YEvq
	 QlfAE5S3nVhjg==
Date: Wed, 28 May 2025 07:37:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>
In-Reply-To: <20250528105821.158140-1-umer.uddin@mentallysanemainliners.org>
References: <20250528105821.158140-1-umer.uddin@mentallysanemainliners.org>
Message-Id: <174843567453.3636707.847885249011261450.robh@kernel.org>
Subject: Re: [PATCH v1 0/1] Enable CMU_HSI1 for Exynos990


On Wed, 28 May 2025 11:58:20 +0100, Umer Uddin wrote:
> Hi all.
> 
> This series enables a new clock block (CMU_HSI1) for the Exynos990
> SoC. This clock block provides clocks for the DesignWare MMC
> Controller, PCIE subsystem and UFS subsystem.
> 
> This patch depends on the following series:
> 
> [CMU_HSI1] https://lore.kernel.org/linux-samsung-soc/20250528105252.157533-1-umer.uddin@mentallysanemainliners.org/
> 
> Best regards,
> Umer Uddin.
> 
> Umer Uddin (1):
>   arm64: dts: exynos990: Add CMU_HSI1 node
> 
>  arch/arm64/boot/dts/exynos/exynos990.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> --
> 2.47.2
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
 Base: tags/next-20250528 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250528105821.158140-1-umer.uddin@mentallysanemainliners.org:

arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/clock-controller@13000000: failed to match any schema with compatible: ['samsung,exynos990-cmu-hsi1']
arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/clock-controller@13000000: failed to match any schema with compatible: ['samsung,exynos990-cmu-hsi1']
arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/clock-controller@13000000: failed to match any schema with compatible: ['samsung,exynos990-cmu-hsi1']
arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/clock-controller@13000000: failed to match any schema with compatible: ['samsung,exynos990-cmu-hsi1']





