From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: Update number of VIC for S5P6442 and S5PC100
Date: Sat, 11 Sep 2010 08:40:33 +0900
Message-ID: <000101cb5141$922985f0$b67c91d0$%kim@samsung.com>
References: <1284120193-23291-1-git-send-email-kgene.kim@samsung.com>
 <1284120193-23291-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:22294 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754721Ab0IJXkV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Sep 2010 19:40:21 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L8K00C4Y1R7OV00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 11 Sep 2010 08:40:19 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L8K00CAP1R78G@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 11 Sep 2010 08:40:19 +0900 (KST)
In-reply-to: <1284120193-23291-3-git-send-email-kgene.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Russell King' <rmk@arm.linux.org.uk>

Kukjin Kim wrote:
> 
> Update the number of IVC to handle the 3 VICs of the
> S5P6442 and S5PC100.
> 
Oh, need to fix typo :-)

Update the number of VIC to handle the 3 VICs of the
S5P6442 and S5PC100.

> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Russell King <rmk@arm.linux.org.uk>
> ---
>  arch/arm/common/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/common/Kconfig b/arch/arm/common/Kconfig
> index 0ac3d81..6480685 100644
> --- a/arch/arm/common/Kconfig
> +++ b/arch/arm/common/Kconfig
> @@ -7,6 +7,7 @@ config ARM_VIC
>  config ARM_VIC_NR
>  	int
>  	default 4 if ARCH_S5PV210
> +	default 3 if ARCH_S5P6442 || ARCH_S5PC100
>  	default 2
>  	depends on ARM_VIC
>  	help
> --
> 1.6.2.5


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
