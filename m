From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3 12/12] ARM: dts: add initial dts file for EXYNOS5250,
 SMDK5250
Date: Tue, 13 Mar 2012 20:56:55 -0700
Message-ID: <20120314035655.GB2531@quad.lixom.net>
References: <1331652643-12626-1-git-send-email-kgene.kim@samsung.com>
 <1331652643-12626-13-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:59395 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752224Ab2CND4y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 23:56:54 -0400
Received: by iagz16 with SMTP id z16so1728716iag.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Mar 2012 20:56:54 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1331652643-12626-13-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, Thomas Abraham <thomas.abraham@linaro.org>, Grant Likely <grant.likely@secretlab.ca>

On Tue, Mar 13, 2012 at 08:30:43AM -0700, Kukjin Kim wrote:
> This patch adds initial dts file for EXYNOS5250 SoC. This dts
> file is including the SoC specific devices and properties. And
> adds the dts file for SMDK5250 board which uses the EXYNOS5250
> dts file. Its board specific properites will be added later.
> 
> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |   26 ++
>  arch/arm/boot/dts/exynos5250.dtsi         |  413 +++++++++++++++++++++++++++++
>  2 files changed, 439 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos5250-smdk5250.dts
>  create mode 100644 arch/arm/boot/dts/exynos5250.dtsi
> 
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> new file mode 100644
> index 0000000..491539a
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -0,0 +1,26 @@
> +/*
> + * SAMSUNG SMDK5250 board device tree source
> + *
> + * Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/dts-v1/;
> +/include/ "exynos5250.dtsi"
> +
> +/ {
> +	model = "SAMSUNG SMDK5250 board based on EXYNOS5250";
> +	compatible = "samsung,smdk5250", "samsung,exynos5250";
> +
> +	memory {
> +		reg = <0x40000000 0x80000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "root=/dev/ram0 rw ramdisk=8192 rootfstype=squashfs initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";

Having these specific bootargs in the include file rarely makes sense, it's
better to have firmware update from the settings in firmware and just have a very
simple fallback here.

In particular initrd is quite custom to hardcode like that.

> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -0,0 +1,413 @@
> +/*
> + * SAMSUNG EXYNOS5250 SoC device tree source
> + *
> + * Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * SAMSUNG EXYNOS5250 SoC device nodes are listed in this file.
> + * EXYNOS5250 based board files can include this file and provide
> + * values for board specfic bindings.
> + *
> + * Note: This file does not include device nodes for all the controllers in
> + * EXYNOS5250 SoC. As device tree coverage for EXYNOS5250 increases,
> + * additional nodes can be added to this file.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/include/ "skeleton.dtsi"
> +
> +/ {
> +	compatible = "samsung,exynos5250";
> +	interrupt-parent = <&gic>;
> +
> +	gic:interrupt-controller@10490000 {
> +		compatible = "arm,cortex-a9-gic";
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		reg = <0x10490000 0x1000>, <0x10480000 0x100>;
> +	};
> +
> +	watchdog@101D0000 {

lowercase hex here and elsewhere in these files, please.

Also, technically no need to specify a unit address (@<foo>) in the device node
name unless you need it to tell more than one entry apart, but it's become
customary to always add them on ARM for some reason.


-Olof
