From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 5/6] ARM: EXYNOS: Add support for Exynos secure firmware
Date: Wed, 10 Oct 2012 09:00:27 -0700
Message-ID: <20121010160027.GA582@quad.lixom.net>
References: <1348496913-25422-1-git-send-email-t.figa@samsung.com>
 <1348496913-25422-6-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:59049 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752483Ab2JJQAN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Oct 2012 12:00:13 -0400
Received: by mail-pa0-f46.google.com with SMTP id hz1so749209pad.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Oct 2012 09:00:12 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1348496913-25422-6-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, m.szyprowski@samsung.com

Hi,

On Mon, Sep 24, 2012 at 04:28:32PM +0200, Tomasz Figa wrote:
> Some Exynos-based boards contain secure firmware and must use firmware
> operations to set up some hardware.
> 
> This patch adds firmware operations for Exynos secure firmware and a way
> for board code and device tree to specify that they must be used.
> 
> Example of use:
> 
> In board code:
> 
> 	...MACHINE_START(...)
> 		/* ... */
> 		.init_early	= exynos_firmware_init,
> 		/* ... */
> 	MACHINE_END
> 
> In device tree:
> 
> 	/ {
> 		/* ... */
> 
> 		firmware {
> 			compatible = "samsung,secure-firmware";
> 		};
> 
> 		/* ... */
> 	};
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  .../devicetree/bindings/arm/samsung-boards.txt     |  8 ++++
>  arch/arm/mach-exynos/Makefile                      |  1 +
>  arch/arm/mach-exynos/common.h                      |  2 +
>  arch/arm/mach-exynos/firmware.c                    | 54 ++++++++++++++++++++++
>  arch/arm/mach-exynos/mach-exynos4-dt.c             |  1 +
>  5 files changed, 66 insertions(+)
>  create mode 100644 arch/arm/mach-exynos/firmware.c
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung-boards.txt b/Documentation/devicetree/bindings/arm/samsung-boards.txt
> index 0bf68be..f447059 100644
> --- a/Documentation/devicetree/bindings/arm/samsung-boards.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung-boards.txt
> @@ -6,3 +6,11 @@ Required root node properties:
>      - compatible = should be one or more of the following.
>          (a) "samsung,smdkv310" - for Samsung's SMDKV310 eval board.
>          (b) "samsung,exynos4210"  - for boards based on Exynos4210 SoC.
> +
> +Optional:
> +    - firmware node, specifying presence and type of secure firmware, currently
> +        supported value of compatible property is "samsung,secure-firmware":
> +
> +	firmware {
> +		compatible = "samsung,secure-firmware";
> +	};

If you require the binding to specify the memory area, then you at least allow
for future work to move to a dynamic mapping without updating the binding and
all device trees. So, please do that even if the code is hardcoded to the
static address today.

For extra credit, make sure that the reg property is matching the static mapping
when you setup your firmware interface on your platform.


[...]

> +static int exynos_cpu_boot_reg(int cpu, void __iomem **ptr)
> +{
> +	*ptr = S5P_VA_SYSRAM_NS + 0x1c + 4*cpu;
> +	return 0;
> +}

It would be nice to get a memory map for the SMC area in documentation
somewhere, but that can be done separately later.


-Olof
