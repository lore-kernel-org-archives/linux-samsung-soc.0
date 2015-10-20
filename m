From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 7/8] MAINTAINERS: add maintainers entry for
 drivers/soc/samsung
Date: Tue, 20 Oct 2015 09:07:05 +0900
Message-ID: <562585A9.1050300@samsung.com>
References: <1445255206-11148-1-git-send-email-pankaj.dubey@samsung.com>
 <1445255206-11148-8-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:23315 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751194AbbJTAHR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 20:07:17 -0400
In-reply-to: <1445255206-11148-8-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, p.fedin@samsung.com, thomas.ab@samsung.com

On 19.10.2015 20:46, Pankaj Dubey wrote:
> This patch adds maintainers entry for new driver folder
> drivers/soc/samsung
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 

Thanks!

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7ba7ab7..262bba6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1438,6 +1438,7 @@ F:	arch/arm/mach-exynos*/
>  F:	drivers/*/*s3c2410*
>  F:	drivers/*/*/*s3c2410*
>  F:	drivers/spi/spi-s3c*
> +F:	drivers/soc/samsung/*
>  F:	sound/soc/samsung/*
>  N:	exynos
>  
> 
