From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v3] DMA: PL330: Merge PL330 driver into drivers/dma/
Date: Wed, 22 Feb 2012 22:50:29 +0530
Message-ID: <CABb+yY0Zy3Xx4OZTobo2y-J4NXokGCV47PdPyKs+aOnqtng7pQ@mail.gmail.com>
References: <1329341243-14314-1-git-send-email-kgene.kim@samsung.com>
	<CABb+yY1E0_ZhTv8QvRAfgUvc=2Vz+ioYbsEczknP5dKcL2ZCbw@mail.gmail.com>
	<00f401ccf0f8$0db84ec0$2928ec40$%kim@samsung.com>
	<CABb+yY0j0j7Qw4MCwP_F+DKzmpdmZ3x0QC2Ktj2qmGnL=Ocx0Q@mail.gmail.com>
	<011c01ccf107$5624d020$026e7060$%kim@samsung.com>
	<CABb+yY1aeZ9=2GiHni3bZuRjW66Mxz7K0M753Lc-6UdxaVpBzA@mail.gmail.com>
	<1329906421.24656.93.camel@vkoul-udesk3>
	<4F451D24.1040009@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:45875 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751334Ab2BVRUa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Feb 2012 12:20:30 -0500
Received: by bkcjm19 with SMTP id jm19so294066bkc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2012 09:20:29 -0800 (PST)
In-Reply-To: <4F451D24.1040009@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Vinod Koul <vinod.koul@intel.com>, linux-samsung-soc@vger.kernel.org, Boojin Kim <boojin.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org

On Wed, Feb 22, 2012 at 10:21 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
>
> * Copyright (c) 2012 Samsung Electronics Co., Ltd.
> * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung=
=2Ecom
> *
> * Copyright (C) 2010 Samsung Electronics Co. Ltd.
> * =C2=A0 =C2=A0 =C2=A0 Jaswinder Singh <jassi.brar@samsung.com>
> *
The following is more appropriate

-  * Copyright (C) 2010 Samsung Electronics Co. Ltd.
+ * Copyright (C) 2010 - 2012 Samsung Electronics Co. Ltd.
   * =C2=A0 =C2=A0 =C2=A0 Jaswinder Singh <jassi.brar@samsung.com>


> * Based on:
> * =C2=A0 =C2=A0 =C2=A0 arch/arm/common/pl330.c, arch/arm/include/asm/=
hardware/pl330.h
> * =C2=A0 =C2=A0 =C2=A0 Copyright (C) 2010 Samsung Electronics Co Ltd.
>
Doesn't make any sense because arch/arm/common/pl330.c
and arch/arm/include/asm/hardware/pl330.h wouldn't exist anymore,
and the changelog already provides that info.
