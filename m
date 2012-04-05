From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Fix compiler warning in dma.c file
Date: Thu, 05 Apr 2012 07:58:46 -0700
Message-ID: <4F7DB326.8030603@samsung.com>
References: <1333441841-2307-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:44492 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753780Ab2DEO6v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Apr 2012 10:58:51 -0400
Received: by dake40 with SMTP id e40so1722806dak.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Apr 2012 07:58:51 -0700 (PDT)
In-Reply-To: <1333441841-2307-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On 04/03/12 01:30, Sachin Kamat wrote:
> Fixes the following warning:
> warning: =E2=80=98dma_dmamask=E2=80=99 defined but not used [-Wunused=
-variable]
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/mach-exynos/dma.c |    2 --
>   1 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/dma.c b/arch/arm/mach-exynos/dma.c
> index 3983abe..69aaa45 100644
> --- a/arch/arm/mach-exynos/dma.c
> +++ b/arch/arm/mach-exynos/dma.c
> @@ -35,8 +35,6 @@
>   #include<mach/irqs.h>
>   #include<mach/dma.h>
>
> -static u64 dma_dmamask =3D DMA_BIT_MASK(32);
> -
>   static u8 exynos4210_pdma0_peri[] =3D {
>   	DMACH_PCM0_RX,
>   	DMACH_PCM0_TX,

Applied, thanks.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
