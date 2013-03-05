From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] dma: of-dma: return error when 'dma-cells' not found
Date: Tue, 05 Mar 2013 03:43:52 -0600
Message-ID: <5135BE58.4040105@gmail.com>
References: <1362475531-32260-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:38779 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755417Ab3CEJoE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 04:44:04 -0500
Received: by mail-pb0-f49.google.com with SMTP id xa12so4220211pbc.36
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Mar 2013 01:44:03 -0800 (PST)
In-Reply-To: <1362475531-32260-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, arnd@arndb.de, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com

On 03/05/2013 03:25 AM, Padmavathi Venna wrote:
> This patch returns error when 'dma-cells' property not found
> in the corresponding device node. With out this change there
> is a crash in the generic dma incompatible platforms.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>

NAK.

#dma-cells should be optional. It is not needed for platforms supporting
memory to memory transfers only and should therefore be optional. You
cannot assume the dtb can be updated and kernel changes need to work
with old dtbs. I've submitted patches to address this and fix the crash:

https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-February/028769.html

Rob
> ---
> 
> Based on Vinod Koul next branch.
> 
>  drivers/dma/of-dma.c |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/dma/of-dma.c b/drivers/dma/of-dma.c
> index 69d04d2..46aca0d 100644
> --- a/drivers/dma/of-dma.c
> +++ b/drivers/dma/of-dma.c
> @@ -92,6 +92,7 @@ int of_dma_controller_register(struct device_node *np,
>  				void *data)
>  {
>  	struct of_dma	*ofdma;
> +	const	 __be32 *ip;
>  	int		nbcells;
>  
>  	if (!np || !of_dma_xlate) {
> @@ -103,7 +104,12 @@ int of_dma_controller_register(struct device_node *np,
>  	if (!ofdma)
>  		return -ENOMEM;
>  
> -	nbcells = be32_to_cpup(of_get_property(np, "#dma-cells", NULL));
> +	ip = of_get_property(np, "#dma-cells", NULL);
> +	if (!ip)
> +		return -ENXIO;
> +
> +	nbcells = be32_to_cpup(ip);
> +
>  	if (!nbcells) {
>  		pr_err("%s: #dma-cells property is missing or invalid\n",
>  		       __func__);
> 
