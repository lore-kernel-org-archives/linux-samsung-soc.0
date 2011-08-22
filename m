From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] DMA: PL330: Merge PL330 drivers
Date: Mon, 22 Aug 2011 16:22:04 +0530
Message-ID: <CABb+yY1gBJDPgZFPjfTk4Q6Lcp0JRViprOGb2RS+Bw5+wpHn7Q@mail.gmail.com>
References: <1313988751-29538-1-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:58761 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751539Ab1HVKwG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 06:52:06 -0400
Received: by bke11 with SMTP id 11so3562164bke.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Aug 2011 03:52:04 -0700 (PDT)
In-Reply-To: <1313988751-29538-1-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <dan.j.williams@intel.com>, Russell King <linux@arm.linux.org.uk>

On Mon, Aug 22, 2011 at 10:22 AM, Boojin Kim <boojin.kim@samsung.com> w=
rote:
> This patch merges 'arch/arm/common/pl330.c' with 'driver/dma/pl330.c'
>
> NOTE: this patch is made on following patches.
> - [PATCH v6] To use DMA generic APIs for Samsung DMA
> - [PATCH v4] amba: consolidate PrimeCell magic
This doesn't make sense in changelog. Such notes usually go below
the '---' line below last SOB

>
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> ---
> =C2=A0arch/arm/common/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | =C2=A0 =C2=A03 -
> =C2=A0arch/arm/common/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A01 -
> =C2=A0arch/arm/common/pl330.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 1931 -------------------------------
> =C2=A0arch/arm/include/asm/hardware/pl330.h | =C2=A0217 ----
> =C2=A0drivers/dma/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 -
> =C2=A0drivers/dma/pl330.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 2036 +++++++++++++++++++++++++++++++++
> =C2=A0include/linux/amba/pl330.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 11 +-
> =C2=A07 files changed, 2046 insertions(+), 2154 deletions(-)
> =C2=A0delete mode 100644 arch/arm/common/pl330.c
> =C2=A0delete mode 100644 arch/arm/include/asm/hardware/pl330.h

=2E...

> diff --git a/arch/arm/include/asm/hardware/pl330.h b/arch/arm/include=
/asm/hardware/pl330.h
> deleted file mode 100644
> index 575fa81..0000000
> --- a/arch/arm/include/asm/hardware/pl330.h
> +++ /dev/null
> @@ -1,217 +0,0 @@
> -/* linux/include/asm/hardware/pl330.h
> - *
> - * Copyright (C) 2010 Samsung Electronics Co. Ltd.
> - * =C2=A0 =C2=A0 Jaswinder Singh <jassi.brar@samsung.com>

While at it, please also modify the instances of author id to
      'Jassi Brar <jassisinghbrar@gmail.com>
I think we can accommodate the trivial change.
