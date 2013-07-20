From: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH RESEND] ARM: plat-samsung: Fix switching FIFO in
 arch_enable_uart_fifo function
Date: Sat, 20 Jul 2013 22:22:04 +0400
Message-ID: <20130720222204.95d2626fbe133ab7fd3c3287@mail.ru>
References: <1372792593-7457-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fallback1.mail.ru ([94.100.176.18]:60675 "EHLO
	fallback1.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753901Ab3GTSWj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 20 Jul 2013 14:22:39 -0400
Received: from smtp2.mail.ru (smtp2.mail.ru [94.100.176.130])
	by fallback1.mail.ru (mPOP.Fallback_MX) with ESMTP id E3B192318D8E
	for <linux-samsung-soc@vger.kernel.org>; Sat, 20 Jul 2013 22:22:35 +0400 (MSK)
In-Reply-To: <1372792593-7457-1-git-send-email-shc_work@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

On Tue,  2 Jul 2013 23:16:33 +0400
Alexander Shiyan <shc_work@mail.ru> wrote:

> When CONFIG_S3C_BOOT_UART_FORCE_FIFO symbol is set, we should
> enable FIFO but actually switch command is missing in the code.
> This patch adds this switching.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  arch/arm/plat-samsung/include/plat/uncompress.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/uncompress.h b/arch/arm/plat-samsung/include/plat/uncompress.h
> index 4afc32f..f48dc0a 100644
> --- a/arch/arm/plat-samsung/include/plat/uncompress.h
> +++ b/arch/arm/plat-samsung/include/plat/uncompress.h
> @@ -145,6 +145,8 @@ static inline void arch_enable_uart_fifo(void)
>  			if (!(fifocon & S3C2410_UFCON_RESETBOTH))
>  				break;
>  		}
> +
> +		uart_wr(S3C2410_UFCON, S3C2410_UFCON_FIFOMODE);
>  	}
>  }
>  #else
> -- 
> 1.8.1.5

Ping.

-- 
Alexander Shiyan <shc_work@mail.ru>
