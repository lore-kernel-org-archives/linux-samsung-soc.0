From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v3] DMA: PL330: Merge PL330 driver into drivers/dma/
Date: Tue, 21 Feb 2012 21:51:55 +0530
Message-ID: <CABb+yY1E0_ZhTv8QvRAfgUvc=2Vz+ioYbsEczknP5dKcL2ZCbw@mail.gmail.com>
References: <1329341243-14314-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:65135 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751598Ab2BUQV5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Feb 2012 11:21:57 -0500
Received: by bkcjm19 with SMTP id jm19so5482189bkc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Feb 2012 08:21:56 -0800 (PST)
In-Reply-To: <1329341243-14314-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vinod.koul@intel.com>, Boojin Kim <boojin.kim@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>

On Thu, Feb 16, 2012 at 2:57 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> From: Boojin Kim <boojin.kim@samsung.com>
>
> Currently there were two part of DMAC PL330 driver for
> support old styled s3c-pl330 which has been merged into
> drivers/dma/pl330.c driver. Actually, there is no reason
> to separate them now.
>
> Basically this patch merges arch/arm/common/pl330.c into
> drivers/dma/pl330.c driver and removes useless exported
> symbol, externed function and so on.
>
> The newer pl330 driver tested on SMDKV310 and SMDK4212 boards
>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Vinod Koul <vinod.koul@intel.com>
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> Changes since v2:
> - Address comments from Russell King
> =C2=A0the 'asm/hardware/pl330.h' is moved to 'drivers/dma/pl330.h'
> =C2=A0which is used only in drivers/dma/
>
> =C2=A0arch/arm/common/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | =C2=A0 =C2=A03 -
> =C2=A0arch/arm/common/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A01 -
> =C2=A0arch/arm/common/pl330.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 1959 ---------------------------------
> =C2=A0arch/arm/include/asm/hardware/pl330.h | =C2=A0217 ----
> =C2=A0drivers/dma/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 -
> =C2=A0drivers/dma/pl330.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1892 +++++++++++++++++++++++++++++++-
> =C2=A0drivers/dma/pl330.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0251 +++++
> =C2=A0include/linux/amba/pl330.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 =C2=A01 -
> =C2=A08 files changed, 2142 insertions(+), 2183 deletions(-)
> =C2=A0delete mode 100644 arch/arm/common/pl330.c
> =C2=A0delete mode 100644 arch/arm/include/asm/hardware/pl330.h
> =C2=A0create mode 100644 drivers/dma/pl330.h
>
I repeat yet again, the drivers/dma/pl330.h is included _only_ by
drivers/dma/pl330.c so it'll be better to simply move its content
in the c file and reduce file count by 1.


> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index b8ec03e..65c5f24 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -1,4 +1,7 @@
> -/* linux/drivers/dma/pl330.c
> +/*
> + * Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com
> + * Boojin Kim <boojin.kim@samsung.com>
> =C2=A0*
I object.
If simply moving the code around grants you share of authorship, then
every person who contributed even a single actual bug fix or feature qu=
alifies
too.
Javi Merino from ARM Ltd contributed far more important patches to PL33=
0
and he never claimed authorship (though I think, if not me, he would ha=
ve
done the driver just as well or better).
