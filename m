From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/3] ARM: S3C24XX: dma cleanups for s3c2412 and s3c2443
Date: Tue, 23 Apr 2013 01:59:25 +0900
Message-ID: <51756C6D.9020500@samsung.com>
References: <201304212002.31082.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:33141 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753763Ab3DVQ7a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 12:59:30 -0400
Received: by mail-pd0-f178.google.com with SMTP id w11so3728211pde.37
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Apr 2013 09:59:29 -0700 (PDT)
In-Reply-To: <201304212002.31082.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 04/22/13 03:02, Heiko St=C3=BCbner wrote:
> The s3c2412 uses the same dma channel selection-type as the s3c2443 a=
nd later
> but introduced the notion of a receive channel to keep the spi channe=
ls,
> together that are separate in hardware.
>
> This series split the spi channels like later socs do (the s3c24xx-sp=
i driver
> does not use dma at all) and removes this type of special handling.
>
> Heiko Stuebner (3):
>    ARM: S3C24XX: split s3c2412 spi dma channels
>    ARM: S3C24XX: dma-s3c2443 - do not write into arbitary bits
>    ARM: S3C24XX: remove obsolete s3c2412 specific dma settings
>
>   arch/arm/mach-s3c24xx/dma-s3c2412.c              |   56 ++++++-----=
-----------
>   arch/arm/mach-s3c24xx/dma-s3c2443.c              |    3 +-
>   arch/arm/mach-s3c24xx/dma.c                      |    3 -
>   arch/arm/plat-samsung/include/plat/dma-s3c24xx.h |    5 --
>   4 files changed, 17 insertions(+), 50 deletions(-)
>
Applied, thanks.

- Kukjin
