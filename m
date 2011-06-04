From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3 0/3] Fixes for breakage resulting from syscore_ops
 patch on s3c24xx
Date: Fri, 03 Jun 2011 17:49:47 -0700
Message-ID: <4DE9812B.6010005@samsung.com>
References: <201106021254.57644.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:38411 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752800Ab1FDAtv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jun 2011 20:49:51 -0400
Received: by pwi15 with SMTP id 15so1225334pwi.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jun 2011 17:49:50 -0700 (PDT)
In-Reply-To: <201106021254.57644.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, rjw@sisk.pl, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 06/02/11 03:54, Heiko St=FCbner wrote:
> The syscore_ops patch from Rafael J. Wysocki introduced some small
> glitches for the S3C24XX cpus resulting in compile errors.
>
> Changes since v1: add missing Signed-off-by lines
> Changes since v2: fix mangled tabs
>
> Heiko Stuebner (3):
>    Fix missing struct for s3c2410_dma_chan in s3c2410_dma_suspend_cha=
n
>    Move s3c24xx_irq_syscore_ops to plat-s3c24xx/irq.c
>    remove the now empty mach-s3c2410/irq.c
>
>   arch/arm/mach-s3c2410/Makefile |    1 -
>   arch/arm/mach-s3c2410/irq.c    |   34 -----------------------------=
-----
>   arch/arm/plat-s3c24xx/dma.c    |    2 +-
>   arch/arm/plat-s3c24xx/irq.c    |    6 ++++++
>   4 files changed, 7 insertions(+), 36 deletions(-)
>   delete mode 100644 arch/arm/mach-s3c2410/irq.c

Looks OK, will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
