Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2E428150F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2026 00:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788396095; cv=none; b=PSvWQekZwPgJOO0+JOBvYsERlS/eYbSuGbZg/XXUW168QOEItFAOFRhQ41hKfhyh5Brg4xqVHLQaPHbOzb6Hf0T9XH62KhYgwGvSi+hXZtkNkwmyyy9A7S/t7xHqzTM4NujEI4qLgDNk7Kpyx7NXG2avNuB9E8NRXGknxhkTEPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788396095; c=relaxed/simple;
	bh=jMwOBwGiRU8fETlBy0Qnu3oQ54CAs0gRdMT8qbU+v98=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sUVdUPdkY6WlBRnsy433Vq6F9M0inFAS2y5buymjQsUVbeG6AcGI/tioQ5vPy0KWyXgTD7fkRwiGOkHfykHQpqqoM5VmD+6WYTRBRpIrQSARi7bP6XExh1MoLvj88wmX2AxENvUOOtYDj9C45Ie4MujXGoP9sUC6Wmr64yslRvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=q/l4gws5; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="q/l4gws5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1788396074; x=1788655274;
	bh=u+EzJoDEG9W5tYl5Q0IYEK/9+yw3B8m1JuHAL+Fe8n4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=q/l4gws5khHQ9usVFhNy0enBWgX0xFWS+I2k5m6cemWpTllDUVh3FPqKFH8kVKUFv
	 iJCxo5xmaJF+T33gO56nzM7+LirON14zZOmfgnX9JdJBdMq8YRUi7Dl9PINoAXXBDA
	 CHyjVhOvu9EFUqZf3EzDPcGbjjys17oJptaYdcENSeL1uWc5x4/mMpDFTVfAUC1tOf
	 AXs7UG7ZU3NxoN1+Jvc6c94MFtb1zh2t3Qz2FiHVehtm4DKGHsJu7CfVsE8VPshLVE
	 BTwxh8DLOlnd2/zxsGGvi7jYMIV7Wj0nl6XWHZsxLKJ9agb+4coRDXNwH8Gtyc66aj
	 nbozTG5nVArDA==
Date: Thu, 03 Sep 2026 00:41:10 +0000
To: aidenisik@member.fsf.org
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Aiden Isik <aidenisik+git@member.fsf.org>
Subject: Re: [PATCH 2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy Watch FE
Message-ID: <4nry_0LYAWEUI1glONRapkF3AXjNNot6Rl4lQ91urHXgWoZKDAnfgn-VhZFPFqp9NPpuKAzYiaH9r2sVCcDgrp4hP6lsUWtcQuEB4vU5Vnc=@protonmail.com>
In-Reply-To: <20260817-for-next-lucky7-v1-2-42ffb2b71ba2@member.fsf.org>
References: <20260817-for-next-lucky7-v1-0-42ffb2b71ba2@member.fsf.org> <20260817-for-next-lucky7-v1-2-42ffb2b71ba2@member.fsf.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 84627e5c69c68b7676b45132793d9da796719d27
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, August 17th, 2026 at 11:37 AM, Aiden Isik via B4 Relay <devnull+=
aidenisik.member.fsf.org@kernel.org> wrote:

> From: Aiden Isik <aidenisik@member.fsf.org>
>=20
> The Samsung Galaxy Watch FE (SM-R861/SM-R866), codenamed lucky7, is a
> smartwatch developed by Samsung and released in 2024. It has 1.5GiB RAM,
> 16GiB of eMMC storage, an Exynos5515 (W920) SoC, and a 396x396 display.
>=20
> Support for the following is added by this device tree:
> - Bootloader framebuffer
> - Memory
>=20
> Only the lowest 490MiB and highest 512MiB of memory are used for now.
> The 488MiB between the addresses of 0x9ea00000 and 0xbe680000 is excluded
> from the memory node due to a bug where if the kernel even knows about
> the existence of this memory, one or both cores will lock up and cause
> an RCU stall.

This used to work fine on my 7.0 and 7.1-based branches, so I did a bit
of bisecting and found that the issue was introduced in commit
7b9f263909a57e2463c6a543d72651e00a3fd0d6
(of: reserved_mem: only support one <base size> entry in reg property).

This explains why hiding the memory from the kernel worked, I *was*
reserving this memory but in a way which this commit discontinued.

I initially thought this was some randomly-occurring "heisenbug", which
is why I submitted the memory-hiding fix instead as it definitely worked,
but now I know the real problem I will fix the reserved-memory node.

I will fix this in the next version of this patchset, next merge window.

>=20
> Signed-off-by: Aiden Isik <aidenisik+git@member.fsf.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts | 106 +++++++++++++++++=
++++++
>  1 file changed, 106 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts b/arch/arm6=
4/boot/dts/exynos/exynos5515-lucky7.dts
> new file mode 100644
> index 000000000000..f91ea7e44cf8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Samsung Galaxy Watch FE (lucky7/SM-R861/SM-R866) device tree source
> + *
> + * Copyright (c) 2026 Aiden Isik <aidenisik+git@member.fsf.org>
> + */
> +
> +/dts-v1/;
> +#include "exynos5515.dtsi"
> +
> +/ {
> +=09compatible =3D "samsung,lucky7", "samsung,exynos5515";
> +=09chassis-type =3D "watch";
> +=09model =3D "Samsung Galaxy Watch FE (SM-R861/SM-R866)";
> +
> +=09chosen {
> +=09=09ranges;
> +=09=09#address-cells =3D <2>;
> +=09=09#size-cells =3D <1>;
> +
> +=09=09framebuffer@9e0cf000 {
> +=09=09=09compatible =3D "simple-framebuffer";
> +=09=09=09reg =3D <0x0 0x9e0cf000 (396 * 396 * 4)>;
> +=09=09=09format =3D "a8r8g8b8";
> +=09=09=09height =3D <396>;
> +=09=09=09stride =3D <(396 * 4)>;
> +=09=09=09width =3D <396>;
> +=09=09};
> +=09};
> +
> +=09memory@80000000 {
> +=09=09/*
> +=09=09 * Use the lowest 490MiB and highest 512MiB of memory.
> +=09=09 * The 488MiB between the addresses of 0x9ea00000 and
> +=09=09 * 0xbe680000 is currently unused due to any memory accesses
> +=09=09 * in several ranges between those addresses causing the core
> +=09=09 * performing the accesses to stall.
> +=09=09 */
> +=09=09reg =3D <0x0 0x80000000 0x1ea00000>,
> +=09=09      /* Crashing memory at 0x9ea00000-0xbe680000 */
> +=09=09      /* Memory hole at 0xbe680000-0xc0000000 */
> +=09=09      <0x0 0xc0000000 0x20000000>;
> +=09=09device_type =3D "memory";
> +=09};
> +
> +=09reserved-memory {
> +=09=09ranges;
> +=09=09#address-cells =3D <2>;
> +=09=09#size-cells =3D <1>;
> +
> +=09=09framebuffer@9e0cf000 {
> +=09=09=09reg =3D <0x0 0x9e0cf000 (396 * 396 * 4)>;
> +=09=09=09no-map;
> +=09=09};
> +
> +=09=09misc-rmem {
> +=09=09=09/*
> +=09=09=09 * Some of these regions belong to memory-mapped
> +=09=09=09 * devices, and will be assigned to drivers as support
> +=09=09=09 * is added.
> +=09=09=09 *
> +=09=09=09 * Other regions belong to the TrustZone firmware
> +=09=09=09 * and should never be touched.
> +=09=09=09 */
> +=09=09=09reg =3D <0x0 0x87000000 0x200000>,
> +=09=09=09      <0x0 0x87fff000 0x1000>,
> +=09=09=09      <0x0 0x8a000000 0x31000>,
> +=09=09=09      <0x0 0x8d800000 0x180000>,
> +=09=09=09      <0x0 0x8ffff000 0x33000>,
> +=09=09=09      <0x0 0x90100000 0x200000>,
> +=09=09=09      <0x0 0x98a00000 0x600000>,
> +=09=09=09      <0x0 0x9a000000 0xc00000>,
> +=09=09=09      <0x0 0x9b000000 0x400000>,
> +=09=09=09      <0x0 0x9bd00000 0x208000>,
> +=09=09=09      <0x0 0x9c000000 0x20000>,
> +=09=09=09      <0x0 0xa0000000 0x10000>,
> +=09=09=09      <0x0 0xa0010000 0x400000>,
> +=09=09=09      <0x0 0xa0510000 0x1000>,
> +=09=09=09      <0x0 0xa0900000 0x2000>,
> +=09=09=09      <0x0 0xa0902000 0x1000>,
> +=09=09=09      <0x0 0xa0910000 0x3c000>,
> +=09=09=09      <0x0 0xb0000000 0x200000>,
> +=09=09=09      <0x0 0xb1000000 0x200000>,
> +=09=09=09      <0x0 0xbbfff000 0x1000000>,
> +=09=09=09      <0x0 0xbcfff000 0x1000>,
> +=09=09=09      <0x0 0xbd430000 0x1250000>,
> +=09=09=09      <0x0 0xd0000000 0x5d00000>,
> +=09=09=09      <0x0 0xdc444000 0x2bbc000>,
> +=09=09=09      <0x0 0xdf005000 0x1000>,
> +=09=09=09      <0x0 0xdf008000 0x1000>,
> +=09=09=09      <0x0 0xdf009000 0x12000>,
> +=09=09=09      <0x0 0xdf01b000 0x21000>,
> +=09=09=09      <0x0 0xdf03c000 0x1000>,
> +=09=09=09      <0x0 0xdf03d000 0xfc3000>;
> +=09=09=09no-map;
> +=09=09};
> +=09};
> +};
> +
> +&oscclk {
> +=09clock-frequency =3D <26000000>;
> +};
> +
> +&watchdog {
> +=09status =3D "okay";
> +};
>=20
> --
> 2.54.0
>=20
>=20
> 
