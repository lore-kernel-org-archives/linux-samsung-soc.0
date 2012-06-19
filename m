From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: S5PC100: Remove unused variable in dma.c file
Date: Tue, 19 Jun 2012 17:51:55 +0900
Message-ID: <01a201cd4df8$c72a78d0$557f6a70$%kim@samsung.com>
References: <1338871415-24956-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48165 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753531Ab2FSIw2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jun 2012 04:52:28 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5U00BYKWJAA3C0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:51:55 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5U00GRCWMJ4380@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:51:55 +0900 (KST)
In-reply-to: <1338871415-24956-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: jaswinder.singh@linaro.org, patches@linaro.org

Sachin Kamat wrote:
>=20
> Fixes the following warning:
> arch/arm/mach-s5pc100/dma.c:36:12: warning: =E2=80=98dma_dmamask=E2=80=
=99 defined but not
> used [-Wunused-variable]
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-s5pc100/dma.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/mach-s5pc100/dma.c b/arch/arm/mach-s5pc100/dma.=
c
> index afd8db2..b141840 100644
> --- a/arch/arm/mach-s5pc100/dma.c
> +++ b/arch/arm/mach-s5pc100/dma.c
> @@ -33,8 +33,6 @@
>  #include <mach/irqs.h>
>  #include <mach/dma.h>
>=20
> -static u64 dma_dmamask =3D DMA_BIT_MASK(32);
> -
>  static u8 pdma0_peri[] =3D {
>  	DMACH_UART0_RX,
>  	DMACH_UART0_TX,
> --
> 1.7.4.1

OK, will apply this into cleanup branch.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
