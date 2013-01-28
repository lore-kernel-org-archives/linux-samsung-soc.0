From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/4] ARM: dts: Add #dma-cells for generic dma binding support
Date: Mon, 28 Jan 2013 14:47:33 +0000
Message-ID: <201301281447.33633.arnd@arndb.de>
References: <1358508824-20352-1-git-send-email-padma.v@samsung.com> <1358508824-20352-4-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:60597 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752130Ab3A1Orz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 09:47:55 -0500
In-Reply-To: <1358508824-20352-4-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: Padmavathi Venna <padma.v@samsung.com>, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, jassisinghbrar@gmail.com, kgene.kim@samsung.com, swarren@nvidia.com, boojin.kim@samsung.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com

On Friday 18 January 2013, Padmavathi Venna wrote:
> diff --git a/Documentation/devicetree/bindings/dma/arm-pl330.txt b/Documentation/devicetree/bindings/dma/arm-pl330.txt
> index 36e27d5..457a233 100644
> --- a/Documentation/devicetree/bindings/dma/arm-pl330.txt
> +++ b/Documentation/devicetree/bindings/dma/arm-pl330.txt
> @@ -8,6 +8,8 @@ Required properties:
>    - reg: physical base address of the controller and length of memory mapped
>      region.
>    - interrupts: interrupt number to the cpu.
> +  - #dma-cells: must be at least 1. used to represent the number of integer
> +    cells in the dmas property of client device.

The wording 'at least' seems wrong here: that is what we use in the
generic DMA binding, but in the part that is specific to one
driver, I would expect to see

	- #dma-cells: must be <1>

Since that is what this particular driver requires.

>  Client drivers (device nodes requiring dma transfers from dev-to-mem or
> @@ -27,7 +30,7 @@ as shown below.
>    [property name]  = <[phandle of the dma controller] [dma request id]>;
>  
>        where 'dma request id' is the dma request number which is connected
> -      to the client controller. The 'property name' is recommended to be
> -      of the form <name>-dma-channel.
> +      to the client controller. The 'property name' is 'dmas' as recommended
> +      by the generic dma device tree binding helpers.

s/recommended/required/

Also, the "dma-names" property is required as well.

	Arnd
