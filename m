From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 06/11] ARM: EXYNOS: add support uart for EXYNOS4 and
 EXYNOS5
Date: Thu, 16 Feb 2012 14:24:20 +0900
Message-ID: <054701ccec6b$3c563440$b5029cc0$%kim@samsung.com>
References: <1328981685-8602-1-git-send-email-kgene.kim@samsung.com>
 <1328981685-8602-7-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33993 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752009Ab2BPFYW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 00:24:22 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZH00F6E0BZV2L0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 Feb 2012 14:24:20 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZH009Y90CK5O80@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 16 Feb 2012 14:24:20 +0900 (KST)
In-reply-to: <1328981685-8602-7-git-send-email-kgene.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net

Kukjin Kim wrote:

[...]

> +struct s3c24xx_uart_resources exynos4_uart_resources[] __initdata = {
> +	[0] = {
> +		.resources	= exynos4_uart0_resource,
> +		.nr_resources	= ARRAY_SIZE(exynos4_uart0_resource),
> +	},
> +	[1] = {
> +		.resources	= exynos4_uart1_resource,
> +		.nr_resources	= ARRAY_SIZE(exynos4_uart0_resource),

Ooops, should be...

		.nr_resources	= ARRAY_SIZE(exynos4_uart1_resource),


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
