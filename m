From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3] ARM: S3C24XX DMA resume regression fix
Date: Sat, 03 Mar 2012 08:57:27 +0900
Message-ID: <4F515E67.20500@samsung.com>
References: <077201ccf767c6d1ec05475c40$%kim@samsung.com> <1330610031-2237-1-git-send-email-dron0gus@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:58471 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965617Ab2CBX5g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Mar 2012 18:57:36 -0500
Received: by dajr28 with SMTP id r28so2536374daj.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Mar 2012 15:57:36 -0800 (PST)
In-Reply-To: <1330610031-2237-1-git-send-email-dron0gus@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gusakov Andrey <dron0gus@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, heiko@sntech.de

On 03/01/12 22:53, Gusakov Andrey wrote:
> s3c2410_dma_suspend suspends channels from 0 to dma_channels.
> s3c2410_dma_resume resumes channels in reverse order. So
> pointer should be decremented instead of being incremented.
>
> Signed-off-by: Gusakov Andrey<dron0gus@gmail.com>
> Reviewed-by: Heiko Stuebner<heiko@sntech.de>
> ---
>   arch/arm/plat-s3c24xx/dma.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/plat-s3c24xx/dma.c b/arch/arm/plat-s3c24xx/dma.c
> index 57abec9..16510d5 100644
> --- a/arch/arm/plat-s3c24xx/dma.c
> +++ b/arch/arm/plat-s3c24xx/dma.c
> @@ -1249,7 +1249,7 @@ static void s3c2410_dma_resume(void)
>   	struct s3c2410_dma_chan *cp = s3c2410_chans + dma_channels - 1;
>   	int channel;
>
> -	for (channel = dma_channels - 1; channel>= 0; cp++, channel--)
> +	for (channel = dma_channels - 1; channel>= 0; cp--, channel--)
>   		s3c2410_dma_resume_chan(cp);
>   }
>

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
