From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Add DMA masks to hsotg device
Date: Fri, 29 Jan 2010 12:56:19 +0300
Message-ID: <4B62B0C3.2090705@ru.mvista.com>
References: <1264738459-1972-1-git-send-email-ben-linux@fluff.org>
	<1264738459-1972-2-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1264738459-1972-2-git-send-email-ben-linux@fluff.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello.

Ben Dooks wrote:

> Add the required DMA masks to the hs-otg device definition to allow DMA
> to work with it.
>
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> ---
>  arch/arm/plat-samsung/dev-usb-hsotg.c |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/plat-samsung/dev-usb-hsotg.c b/arch/arm/plat-samsung/dev-usb-hsotg.c
> index e2f604b..d8b7870 100644
> --- a/arch/arm/plat-samsung/dev-usb-hsotg.c
> +++ b/arch/arm/plat-samsung/dev-usb-hsotg.c
> @@ -33,9 +33,15 @@ static struct resource s3c_usb_hsotg_resources[] = {
>  	},
>  };
>  
> +static u64 s3c_hsotg_dmamask = 0xffffffffUL;
> +
>   

   Shouldn't this be DMA_BIT_MASK(32)?

>  struct platform_device s3c_device_usb_hsotg = {
>  	.name		= "s3c-hsotg",
>  	.id		= -1,
>  	.num_resources	= ARRAY_SIZE(s3c_usb_hsotg_resources),
>  	.resource	= s3c_usb_hsotg_resources,
> +	.dev		= {
> +		.dma_mask		= &s3c_hsotg_dmamask,
> +		.coherent_dma_mask	= 0xffffffffUL,
>   

   Same here...

WBR, Sergei
