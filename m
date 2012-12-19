From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V5 2/2] ASoC: SAMSUNG: Add DT support for i2s
Date: Wed, 19 Dec 2012 13:24:14 +0000
Message-ID: <20121219132414.2CF653E0AD7@localhost>
References: <1355395373-22058-1-git-send-email-padma.v@samsung.com> <1355395373-22058-3-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:56324 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752489Ab2LSNYS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Dec 2012 08:24:18 -0500
Received: by mail-wi0-f180.google.com with SMTP id hj13so1205160wib.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Dec 2012 05:24:17 -0800 (PST)
In-Reply-To: <1355395373-22058-3-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>padma.v@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: jassisinghbrar@gmail.com, kgene.kim@samsung.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, tiwai@suse.de, ben-linux@fluff.org, lrg@ti.com

On Thu, 13 Dec 2012 16:12:53 +0530, Padmavathi Venna <padma.v@samsung.com> wrote:
> Add support for device based discovery.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  .../devicetree/bindings/sound/samsung-i2s.txt      |   75 +++++++
>  sound/soc/samsung/dma.c                            |    1 +
>  sound/soc/samsung/dma.h                            |    1 +
>  sound/soc/samsung/i2s.c                            |  233 ++++++++++++++++----
>  4 files changed, 269 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
> new file mode 100644
> index 0000000..bff47b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
> @@ -0,0 +1,75 @@
> +* Samsung I2S controller
> +
> +Required SoC Specific Properties:
> +
> +- compatible : "samsung,samsung-i2s"

Isn't that kind of redundant?  :-)

The format of the compatible strings should be "<vendor>,<part-number>-i2s". 
Please be specific about the part number that you're doing the binding
for. For example; use "samsung,exynos4210-i2s" instead of "samsung,exynos-i2s".

> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +
> +[PRELIMINARY: the dma channel allocation will change once there are
> +official DMA bindings]
> +
> +- tx-dma-channel-secondary: The dma channel specifier for secondary tx
> +  operations. The format of the dma specifier depends on the dma
> +  controller.
> +- tx-dma-channel: The dma channel specifier for tx operations. The format of
> +  the dma specifier depends on the dma controller.
> +- rx-dma-channel: The dma channel specifier for rx operations. The format of
> +  the dma specifier depends on the dma controller.
> +
> +Optional SoC Specific Properties:
> +
> +- samsung,supports-6ch: If the I2S Primary sound source has 5.1 Channel
> +  support, this flag is enabled.
> +- samsung,supports-rstclr: This flag should be set if I2S software reset bit
> +  control is required. When this flag is set I2S software reset bit will be
> +  enabled or disabled based on need.
> +- samsung,supports-secdai:If I2S block has a secondary FIFO and internal DMA,
> +  then this flag is enabled.
> +- samsung,idma-addr: Internal DMA register base address of the audio
> +  sub system(used in secondary sound source).
> +
> +Required Board Specific Properties:
> +
> +- gpios: The gpio specifier for data out,data in, LRCLK, CDCLK and SCLK
> +  interface lines. The format of the gpio specifier depends on the gpio
> +  controller.
> +  The syntax of samsung gpio specifier is
> +	<[phandle of the gpio controller node]
> +	 [pin number within the gpio controller]
> +	 [mux function]
> +	 [flags and pull up/down]
> +	 [drive strength]>
> +
> +Aliases:
> +
> +- All the I2S controller nodes are represented in the aliases node using
> +  the following format 'i2s{n}' where n is a unique number for the alias.

Are the aliases actually being used now? If not, then drop this section.
I don't see any references in this patch.

Otherwise the binding looks good to me.

g.
