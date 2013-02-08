From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Fix early uart output in fifo mode
Date: Fri, 08 Feb 2013 14:48:11 -0800
Message-ID: <1a6001ce064e$607f3c10$217db430$@samsung.com>
References: <1360328454-20321-1-git-send-email-agalakhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59477 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760370Ab3BHWs2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Feb 2013 17:48:28 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHX00B8CBCOKA70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:48:27 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHX005T1BCPMXB0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:48:26 +0900 (KST)
In-reply-to: <1360328454-20321-1-git-send-email-agalakhov@gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Alexey Galakhov' <agalakhov@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Russell King' <linux@arm.linux.org.uk>

Alexey Galakhov wrote:
> 
> Enabling UART FIFO in bootloader caused the kernel infinite
> loop on S5PV210 due to uninitialized fifo_max and fifo_mask global
> variables. This patch adds the correct initialization.
> 
> Signed-off-by: Alexey Galakhov <agalakhov@gmail.com>
> ---
>  arch/arm/mach-s5pv210/include/mach/uncompress.h |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/mach-s5pv210/include/mach/uncompress.h
> b/arch/arm/mach-s5pv210/include/mach/uncompress.h
> index 08ff2fd..ef977ea 100644
> --- a/arch/arm/mach-s5pv210/include/mach/uncompress.h
> +++ b/arch/arm/mach-s5pv210/include/mach/uncompress.h
> @@ -19,6 +19,8 @@
>  static void arch_detect_cpu(void)
>  {
>  	/* we do not need to do any cpu detection here at the moment. */
> +	fifo_mask = S5PV210_UFSTAT_TXMASK;
> +	fifo_max = 63 << S5PV210_UFSTAT_TXSHIFT;
>  }
> 
>  #endif /* __ASM_ARCH_UNCOMPRESS_H */
> --
> 1.7.10.4

Applied, thanks.

- Kukjin
