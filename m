From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3] DMA: PL330: Merge PL330 driver into drivers/dma/
Date: Thu, 23 Feb 2012 02:29:58 +0900
Message-ID: <4F452616.30806@samsung.com>
References: <1329341243-14314-1-git-send-email-kgene.kim@samsung.com>	<CABb+yY1E0_ZhTv8QvRAfgUvc=2Vz+ioYbsEczknP5dKcL2ZCbw@mail.gmail.com>	<00f401ccf0f8$0db84ec0$2928ec40$%kim@samsung.com>	<CABb+yY0j0j7Qw4MCwP_F+DKzmpdmZ3x0QC2Ktj2qmGnL=Ocx0Q@mail.gmail.com>	<011c01ccf107$5624d020$026e7060$%kim@samsung.com>	<CABb+yY1aeZ9=2GiHni3bZuRjW66Mxz7K0M753Lc-6UdxaVpBzA@mail.gmail.com>	<1329906421.24656.93.camel@vkoul-udesk3>	<4F451D24.1040009@samsung.com> <CABb+yY0Zy3Xx4OZTobo2y-J4NXokGCV47PdPyKs+aOnqtng7pQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:47628 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752209Ab2BVRaG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Feb 2012 12:30:06 -0500
Received: by pbcun15 with SMTP id un15so384509pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2012 09:30:05 -0800 (PST)
In-Reply-To: <CABb+yY0Zy3Xx4OZTobo2y-J4NXokGCV47PdPyKs+aOnqtng7pQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, linux-samsung-soc@vger.kernel.org, Boojin Kim <boojin.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org

On 02/23/12 02:20, Jassi Brar wrote:
> On Wed, Feb 22, 2012 at 10:21 PM, Kukjin Kim<kgene.kim@samsung.com>  wrote:
>>
>> * Copyright (c) 2012 Samsung Electronics Co., Ltd.
>> *               http://www.samsung.com
>> *
>> * Copyright (C) 2010 Samsung Electronics Co. Ltd.
>> *       Jaswinder Singh<jassi.brar@samsung.com>
>> *
> The following is more appropriate
>
> -  * Copyright (C) 2010 Samsung Electronics Co. Ltd.
> + * Copyright (C) 2010 - 2012 Samsung Electronics Co. Ltd.
>     *       Jaswinder Singh<jassi.brar@samsung.com>
>
Well, as I know, I don't have to change/update original your copyright. 
If required, you should do it, next time.

>
>> * Based on:
>> *       arch/arm/common/pl330.c, arch/arm/include/asm/hardware/pl330.h
>> *       Copyright (C) 2010 Samsung Electronics Co Ltd.
>>
> Doesn't make any sense because arch/arm/common/pl330.c
> and arch/arm/include/asm/hardware/pl330.h wouldn't exist anymore,
> and the changelog already provides that info.

OK, will not add above 'based on'.

I think you can agree following. Let's finish this talking.

* Copyright (c) 2012 Samsung Electronics Co., Ltd.
*		http://www.samsung.com
*
and 'original copyright'...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
