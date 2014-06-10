From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [RESEND PATCH v2 2/2] ASoC: samsung: drop support for legacy
 S3C24XX DMA API
Date: Tue, 10 Jun 2014 17:26:04 +0200
Message-ID: <5397238C.10004@samsung.com>
References: <1401642958-6236-1-git-send-email-anarsoul@gmail.com>
 <1401642958-6236-2-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44861 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751686AbaFJP0V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 11:26:21 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N6Y0054JLJHF040@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jun 2014 16:26:05 +0100 (BST)
In-reply-to: <1401642958-6236-2-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>

Hi,

On 01.06.2014 19:15, Vasily Khoruzhick wrote:
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
> v2: No changes
> 
>  sound/soc/samsung/Kconfig  |   3 -
>  sound/soc/samsung/Makefile |   2 -
>  sound/soc/samsung/dma.c    | 460 ---------------------------------------------
>  3 files changed, 465 deletions(-)
>  delete mode 100644 sound/soc/samsung/dma.c
> 

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
