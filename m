From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH RESEND] ARM: plat-samsung: Fix switching FIFO in
 arch_enable_uart_fifo function
Date: Mon, 22 Jul 2013 19:10:41 +0200
Message-ID: <1786279.J430QToqzW@amdc1227>
References: <1372792593-7457-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:15947 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757780Ab3GVRKr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 13:10:47 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQC008QDL1SL650@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Jul 2013 18:10:45 +0100 (BST)
In-reply-to: <1372792593-7457-1-git-send-email-shc_work@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>

On Tuesday 02 of July 2013 23:16:33 Alexander Shiyan wrote:
> When CONFIG_S3C_BOOT_UART_FORCE_FIFO symbol is set, we should
> enable FIFO but actually switch command is missing in the code.
> This patch adds this switching.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  arch/arm/plat-samsung/include/plat/uncompress.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/uncompress.h
> b/arch/arm/plat-samsung/include/plat/uncompress.h index 4afc32f..f48dc0a
> 100644
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

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
