From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH RESEND] ARM: SAMSUNG: dma: Remove unnecessary code
Date: Thu, 04 Apr 2013 19:56:40 +0900
Message-ID: <515D5C68.3030906@samsung.com>
References: <1364902239-16704-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:39177 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757713Ab3DDK4t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 06:56:49 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz11so1434084pad.16
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2013 03:56:49 -0700 (PDT)
In-Reply-To: <1364902239-16704-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, kgene.kim@samsung.com, arnd@arndb.de, boojin.kim@samsung.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com, thomas.abraham@linaro.org

On 04/02/13 20:30, Padmavathi Venna wrote:
> This patch removes the usage of DMACH_DT_PROP and dt_dmach_prop
> from dma code as the new generic dma dt binding support has been
> added.
>
> Signed-off-by: Padmavathi Venna<padma.v@samsung.com>
> Acked-by: Arnd Bergmann<arnd@arndb.de>
> ---
>   arch/arm/mach-s3c24xx/include/mach/dma.h       |    1 -
>   arch/arm/mach-s3c64xx/include/mach/dma.h       |    1 -
>   arch/arm/plat-samsung/dma-ops.c                |   10 +---------
>   arch/arm/plat-samsung/include/plat/dma-ops.h   |    1 -
>   arch/arm/plat-samsung/include/plat/dma-pl330.h |    1 -
>   5 files changed, 1 insertions(+), 13 deletions(-)
>

OK, applied.

Thanks.

- Kukjin
