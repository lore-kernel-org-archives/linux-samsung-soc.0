From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: dts: add initial dts file for ORIGEN4QUAD
Date: Mon, 26 Nov 2012 20:52:12 +0900
Message-ID: <CAH9JG2VSnA3zJCP9OiBbrdaV1GqVKL0x4fn331D7YJxQs8VwMg@mail.gmail.com>
References: <1353929538-24173-1-git-send-email-kh.choi@insignal.co.kr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:46799 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753584Ab2KZLwO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 06:52:14 -0500
Received: by mail-ee0-f46.google.com with SMTP id e53so4410640eek.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Nov 2012 03:52:12 -0800 (PST)
In-Reply-To: <1353929538-24173-1-git-send-email-kh.choi@insignal.co.kr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: chlrbgh0@gmail.com, Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kyuho Choi <kh.choi@insignal.co.kr>, kgene.kim@samsung.com

Hi,

On 11/26/12, chlrbgh0@gmail.com <chlrbgh0@gmail.com> wrote:
> From: Kyuho Choi <kh.choi@insignal.co.kr>
>
> This patch adds initial dts file for ORIGEN4QUAD board.
> ORIGEN4QUAD board based on Samsung EXYNOS4412 SoC.
> More properties will be added later.
>
> Signed-off-by: Kyuho Choi <kh.choi@insignal.co.kr>
> ---
>  arch/arm/boot/dts/exynos4412-origen4quad.dts |   45
> ++++++++++++++++++++++++++
>  1 files changed, 45 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos4412-origen4quad.dts
>
> diff --git a/arch/arm/boot/dts/exynos4412-origen4quad.dts
> b/arch/arm/boot/dts/exynos4412-origen4quad.dts
> new file mode 100644
> index 0000000..390a2ab
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos4412-origen4quad.dts
> @@ -0,0 +1,45 @@
> +/*
> + * Samsung's Exynos4412 based Origen4Quad board device tree source
> + *
> + * Copyright (c) 2012-2013 Isnignal Co., Ltd.
> + *		http://www.insignal.co.kr
> + *
> + * Device tree source file for Insignal's Origen4Quad board which is based
> on
> + * Samsung's Exynos4412 SoC.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/dts-v1/;
> +/include/ "exynos4412.dtsi"
> +
> +/ {
> +	model = "Insignal Origen4Quad board based on Exynos4412";
> +	compatible = "insignal,origen4quad", "samsung,exynos4412";
> +
> +	memory {
> +		reg = <0x40000000 0x40000000>;
> +	};
does it test to boot with this dts file?
does it support 1GiB memory section?

Thank you,
Kyungmin Park
> +
> +	chosen {
> +		bootargs ="root=/dev/ram0 rw ramdisk=32768 initrd=0x41000000,32M
> console=ttySAC2,115200 init=/linuxrc";
> +	};
> +
> +	serial@13800000 {
> +		status = "okay";
> +	};
> +
> +	serial@13810000 {
> +		status = "okay";
> +	};
> +
> +	serial@13820000 {
> +		status = "okay";
> +	};
> +
> +	serial@13830000 {
> +		status = "okay";
> +	};
> +};
> --
> 1.7.5.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
