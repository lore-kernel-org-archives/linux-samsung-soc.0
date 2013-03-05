From: Dinh Nguyen <dinguyen@altera.com>
Subject: Re: [PATCH 2/2] Arm: socfpga: pl330: Add #dma-cells for generic dma
 binding support
Date: Tue, 5 Mar 2013 17:12:21 -0600
Message-ID: <1362525141.8920.8.camel@linux-builds1>
References: <1362375268-29405-1-git-send-email-padma.v@samsung.com>
	 <1362375268-29405-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]:7426
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752721Ab3CEXLR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 18:11:17 -0500
In-Reply-To: <1362375268-29405-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, arnd@arndb.de, vinod.koul@intel.com, boojin.kim@samsung.com, robherring2@gmail.com

On Mon, 2013-03-04 at 11:04 +0530, Padmavathi Venna wrote:
> This patch adds #dma-cells property to PL330 DMA controller nodes for
> supporting generic dma dt bindings on SOCFPGA platform. #dma-channels
> and #dma-requests are not required now but added in advance.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
> 
> Based on Torvalds tree
> 
>  arch/arm/boot/dts/socfpga.dtsi |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> index 936d230..7e8769b 100644
> --- a/arch/arm/boot/dts/socfpga.dtsi
> +++ b/arch/arm/boot/dts/socfpga.dtsi
> @@ -75,6 +75,9 @@
>  				compatible = "arm,pl330", "arm,primecell";
>  				reg = <0xffe01000 0x1000>;
>  				interrupts = <0 180 4>;
> +				#dma-cells = <1>;
> +				#dma-channels = <8>;
> +				#dma-requests = <32>;

Acked-by: Dinh Nguyen <dinguyen@altera.com?

Thanks..
Dinh
>  			};
>  		};
>  
