From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: s3c: simplify s3c_irqwake_{e,}intallow definition
Date: Mon, 28 Dec 2015 10:02:57 +0900
Message-ID: <56808A41.2050105@samsung.com>
References: <16503982.4JeEM7ZXq8@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:33833 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751208AbbL1BDF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Dec 2015 20:03:05 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O01002MBMX19P00@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Dec 2015 01:03:01 +0000 (GMT)
In-reply-to: <16503982.4JeEM7ZXq8@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 18.12.2015 23:45, Arnd Bergmann wrote:
> For a long time, gcc has warned about odd configurations on s3c64xx:
> 
> In file included from arch/arm/plat-samsung/pm.c:34:0:
> arch/arm/mach-s3c64xx/include/mach/pm-core.h:61:0: warning: "s3c_irqwake_eintallow" redefined
>  #define s3c_irqwake_eintallow ((1 << 28) - 1)
> In file included from arch/arm/plat-samsung/pm.c:33:0:
> arch/arm/plat-samsung/include/plat/pm.h:49:0: note: this is the location of the previous definition
>  #define s3c_irqwake_eintallow 0
> 
> The definitions of s3c_irqwake_intallow and s3c_irqwake_eintallow are a bit consistent
> between the various platforms. Things have become easier now that it's only s3c24xx
> and s3c64xx that use them at all, so I've tried to rearrange the definitions to
> make it more obvious what is going on.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This fixes a very old and harmless warning, please apply to a cleanup branch
> if you agree.
> 

Looks correct and makes sense. Hoping you compiled it on all machs:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
