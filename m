From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH 16/33] ARM: S3C24XX: mach-osiris: Use common macro to
 define resources
Date: Wed, 25 Apr 2012 20:53:38 +0400
Message-ID: <4F982C12.1020103@mvista.com>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org> <1335327163-11794-17-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:60601 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752528Ab2DYQyp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 12:54:45 -0400
Received: by lahj13 with SMTP id j13so259640lah.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Apr 2012 09:54:44 -0700 (PDT)
In-Reply-To: <1335327163-11794-17-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, Ben Dooks <ben-linux@fluff.org>, patches@linaro.org

Hello.

On 04/25/2012 08:12 AM, Tushar Behera wrote:

> CC: Ben Dooks<ben-linux@fluff.org>
> CC: Kukjin Kim<kgene.kim@samsung.com>
> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
> ---
>   arch/arm/mach-s3c24xx/mach-osiris.c |   12 ++----------
>   1 files changed, 2 insertions(+), 10 deletions(-)

> diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-s3c24xx/mach-osiris.c
> index c5daeb6..95d0772 100644
> --- a/arch/arm/mach-s3c24xx/mach-osiris.c
> +++ b/arch/arm/mach-s3c24xx/mach-osiris.c
> @@ -244,16 +244,8 @@ static struct s3c2410_platform_nand __initdata osiris_nand_info = {
>   /* PCMCIA control and configuration */
>
>   static struct resource osiris_pcmcia_resource[] = {
> -	[0] = {
> -		.start	= 0x0f000000,
> -		.end	= 0x0f100000,
> -		.flags	= IORESOURCE_MEM,
> -	},
> -	[1] = {
> -		.start	= 0x0c000000,
> -		.end	= 0x0c100000,
> -		.flags	= IORESOURCE_MEM,
> -	}
> +	[0] = DEFINE_RES_MEM(0x0f000000, SZ_1M),
> +	[1] = DEFINE_RES_MEM(0x0c000000, SZ_1M),

    You seem to be fixing the mistake in the original code where - 1 was missing 
in the '.end' initializers...

WBR, Sergei
