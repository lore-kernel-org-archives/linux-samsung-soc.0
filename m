Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28188188713;
	Wed, 26 Nov 2025 22:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764197190; cv=none; b=tsHmmPTuCAPAYWOB1PJra+ghUyK8FtxaBK3R6vH/4kv53Qt9abc+h9xB391qgl9NENSPx4ljcCIg1HotApvEv1CE/RlEMJlcMs3DO/voqHJuYvTETflUCLQN9H35kj+gBQrCMrX5pvkcZm+icbHXfje5JhTyR0YwS4bbm5TGMsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764197190; c=relaxed/simple;
	bh=mpEgD7T+cSmzwIvW7UnTNgT/3UN7QoNuldwzSnsc2HQ=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=uqSrx/wQ3pZN3Ht5ZSYTIfXjF7+HUcdNWLwnt983jTAZTuC05lh+9+BFJat7dlAR9FfciQxdP7Ho0c/0CMfih7NbI9sMaCgX1/qMq/IGqut6NoFq34MEkHDt/0aCXBx/RQd1TeEMF81mM/8m4VkBAA3cIt2Ds7ROVAnkim0JDiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=syayuq00; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="syayuq00"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C91C4CEF7;
	Wed, 26 Nov 2025 22:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764197189;
	bh=mpEgD7T+cSmzwIvW7UnTNgT/3UN7QoNuldwzSnsc2HQ=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=syayuq003B1hcNtLi7XKLgfkbkpv/Kp4m008QzM5IfJYeIoj0X187jotHnrw8BH8r
	 K2AsNyyel45bff58zaTtmJCEE/z4YNwcwYCZekfLiIJ9G+sVMcBMhg+fcjyAWlNjdG
	 3if1NVNo/R7+L7SzZZTUapkp7vhabn7YM+VCTzIQt5r08IOs5e7uUkh0s+afHf5D7n
	 D0WvcY7/JrXdMXK4PiYiMRi8h442VXVuIpXigl8w4KKXOEgdfco2StDFAmZKSDh+Og
	 dP4K/EMlQNk8QDuY/G2sbkH0raPB9blpXbpxCnMOnsO2kUKVOWZ2aqNnXqnxWjTEdT
	 Krj8Zubrg9PTQ==
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Nov 2025 16:46:27 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
To: Lukas Timmermann <linux@timmermann.space>
In-Reply-To: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
Message-Id: <176419714377.2726224.15005423904347214785.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] Add support for exynos5250-manta (Google Nexus
 10)


On Tue, 25 Nov 2025 16:12:39 +0100, Lukas Timmermann wrote:
> This patch series adds initial support for the google-manta board, known
> as Google Nexus 10 to users. The device is powered by
> the Exynos 5250 SoC. The notification led driver (as3668) is already
> (tho not applied) in the kernel mailing list and can be found here:
> https://lore.kernel.org/linux-leds/20251125114015.355487-1-linux@timmermann.space/
> 
> The first two patches add the necessary device tree files and
> bindings, while the last patch makes a small modification to
> allow CPU1 to boot, as it requires a call to it's underlying firmware.
> 
> This first iteration only provides basic support to get the board
> up and running and usable via UART and with WiFi support. We will upstream additional
> features in future patches. All patches have been tested on real hardware.
> 
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
> Alexandre Marquet (3):
>       dt-bindings: ARM: samsung: Add Google Manta (Nexus 10)
>       ARM: dts: exynos: Add Google Manta (Nexus 10)
>       ARM: samsung: exynos5250: Allow CPU1 to boot
> 
>  .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
>  arch/arm/boot/dts/samsung/Makefile                 |   1 +
>  arch/arm/boot/dts/samsung/exynos5250-manta.dts     | 516 +++++++++++++++++++++
>  arch/arm/mach-exynos/firmware.c                    |   4 +-
>  4 files changed, 520 insertions(+), 2 deletions(-)
> ---
> base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
> change-id: 20251125-google-manta-79545e179d10
> 
> Best regards,
> --
> Lukas Timmermann <linux@timmermann.space>
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
 Base: 6a23ae0a96a600d1d12557add110e0bb6e32730c (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/samsung/' for 20251125-google-manta-v2-0-0f097cfff39c@timmermann.space:

arch/arm/boot/dts/samsung/exynos5250-manta.dtb: /soc/i2c@12c70000/led-controller@42: failed to match any schema with compatible: ['ams,as3668']
arch/arm/boot/dts/samsung/exynos5250-manta.dtb: rtc@101e0000 (samsung,s3c6410-rtc): clock-names: ['rtc'] is too short
	from schema $id: http://devicetree.org/schemas/rtc/s3c-rtc.yaml
arch/arm/boot/dts/samsung/exynos5250-manta.dtb: rtc@101e0000 (samsung,s3c6410-rtc): clocks: [[2, 337]] is too short
	from schema $id: http://devicetree.org/schemas/rtc/s3c-rtc.yaml





