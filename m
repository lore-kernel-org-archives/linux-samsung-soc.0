From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: S5PV210: Fix compiler warning in dma.c file
Date: Tue, 10 Apr 2012 09:54:35 -0700
Message-ID: <4F8465CB.8060403@samsung.com>
References: <1333945597-28243-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:44731 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751707Ab2DJQyi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Apr 2012 12:54:38 -0400
Received: by dake40 with SMTP id e40so6046dak.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Apr 2012 09:54:38 -0700 (PDT)
In-Reply-To: <1333945597-28243-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Sachin Kamat wrote:
> Fixes the following warning:
>
> warning: =E2=80=98dma_dmamask=E2=80=99 defined but not used [-Wunused=
-variable]
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/mach-s5pv210/dma.c |    2 --
>   1 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv210/dma.c b/arch/arm/mach-s5pv210/dma.=
c
> index 86ce62f..b8337e2 100644
> --- a/arch/arm/mach-s5pv210/dma.c
> +++ b/arch/arm/mach-s5pv210/dma.c
> @@ -33,8 +33,6 @@
>   #include<mach/irqs.h>
>   #include<mach/dma.h>
>
> -static u64 dma_dmamask =3D DMA_BIT_MASK(32);
> -
>   static u8 pdma0_peri[] =3D {
>   	DMACH_UART0_RX,
>   	DMACH_UART0_TX,

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
