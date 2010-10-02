From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Fix build error on pm
Date: Sat, 02 Oct 2010 19:59:52 +0900
Message-ID: <014901cb6220$f2806f50$d7814df0$%kim@samsung.com>
References: <1285978797-7964-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:35137 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754711Ab0JBK7g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Oct 2010 06:59:36 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9N0068XT7AAE90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 02 Oct 2010 19:59:35 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9N009B5T7AIX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 02 Oct 2010 19:59:34 +0900 (KST)
In-reply-to: <1285978797-7964-1-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

Sangbeom Kim wrote:
> 
> This patch fixes build error by S3C2410 PM
> Suspend debug option due to undefined address
> 
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
>  arch/arm/mach-s5pv210/include/mach/map.h |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-
> s5pv210/include/mach/map.h
> index bd9afd5..9722042 100644
> --- a/arch/arm/mach-s5pv210/include/mach/map.h
> +++ b/arch/arm/mach-s5pv210/include/mach/map.h
> @@ -57,6 +57,9 @@
> 
>  #define S5P_SZ_UART		SZ_256
> 
> +#define S3C_VA_UARTx(x)		(S3C_VA_UART + (S3C_PA_UART &
> 0xfffff) \
> +				+ ((x) * S3C_UART_OFFSET))
> +

In the case of S5PV210, no need to plus '(S3C_PA_UART & 0xfffff)'.
It is needed to keep the UART virtual address aligned to an 1MiB boundary
for the boot process to work.

In here, already aligned..so no need it.

>  #define S5PV210_PA_SROMC	(0xE8000000)
> 
>  #define S5PV210_PA_CFCON	(0xE8200000)
> --
> 1.6.2.5

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
