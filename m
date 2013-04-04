From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 4/4] ARM: s3c24xx: Fix switching FIFO in
 arch_enable_uart_fifo function
Date: Thu, 04 Apr 2013 10:01:48 +0900
Message-ID: <26f001ce30cf$fbfb3170$f3f19450$%kim@samsung.com>
References: <1362216174-10478-1-git-send-email-shc_work@mail.ru>
 <1362216174-10478-4-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50021 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932245Ab3DDBBu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Apr 2013 21:01:50 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKP00CFNHH0NI90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Apr 2013 10:01:48 +0900 (KST)
In-reply-to: <1362216174-10478-4-git-send-email-shc_work@mail.ru>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Alexander Shiyan' <shc_work@mail.ru>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, 'Arnd Bergmann' <arnd@arndb.de>

Alexander Shiyan wrote:
> 
> When CONFIG_S3C_BOOT_UART_FORCE_FIFO symbol is set, we should
> enable FIFO but actually switch command is missing in the code.
> This patch adds this switch.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  arch/arm/plat-samsung/include/plat/uncompress.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/uncompress.h
> b/arch/arm/plat-samsung/include/plat/uncompress.h
> index 438b248..30fedd9 100644
> --- a/arch/arm/plat-samsung/include/plat/uncompress.h
> +++ b/arch/arm/plat-samsung/include/plat/uncompress.h
> @@ -130,6 +130,8 @@ static inline void arch_enable_uart_fifo(void)
>  			if (!(fifocon & S3C2410_UFCON_RESETBOTH))
>  				break;
>  		}
> +
> +		uart_wr(S3C2410_UFCON, S3C2410_UFCON_FIFOMODE);

Well, I think, if required, this should be moved into 'if (!(fifocon &
S3C2410_UFCON_FIFOMODE))'.

- Kukjin
