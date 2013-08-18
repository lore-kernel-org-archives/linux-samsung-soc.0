From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH RESEND] ARM: plat-samsung: Fix switching FIFO in arch_enable_uart_fifo
 function
Date: Mon, 19 Aug 2013 05:17:21 +0900
Message-ID: <52112BD1.6090505@samsung.com>
References: <1372792593-7457-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:65450 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754955Ab3HRUR0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Aug 2013 16:17:26 -0400
Received: by mail-pb0-f50.google.com with SMTP id uo5so4166822pbc.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Aug 2013 13:17:26 -0700 (PDT)
In-Reply-To: <1372792593-7457-1-git-send-email-shc_work@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

On 07/03/13 04:16, Alexander Shiyan wrote:
> When CONFIG_S3C_BOOT_UART_FORCE_FIFO symbol is set, we should
> enable FIFO but actually switch command is missing in the code.
> This patch adds this switching.
>
> Signed-off-by: Alexander Shiyan<shc_work@mail.ru>
> ---
>   arch/arm/plat-samsung/include/plat/uncompress.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/plat-samsung/include/plat/uncompress.h b/arch/arm/plat-samsung/include/plat/uncompress.h
> index 4afc32f..f48dc0a 100644
> --- a/arch/arm/plat-samsung/include/plat/uncompress.h
> +++ b/arch/arm/plat-samsung/include/plat/uncompress.h
> @@ -145,6 +145,8 @@ static inline void arch_enable_uart_fifo(void)
>   			if (!(fifocon&  S3C2410_UFCON_RESETBOTH))
>   				break;
>   		}
> +
> +		uart_wr(S3C2410_UFCON, S3C2410_UFCON_FIFOMODE);
>   	}
>   }
>   #else

Sorry for late response, applied.

Thanks,
Kukjin
