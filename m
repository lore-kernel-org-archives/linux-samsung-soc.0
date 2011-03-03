From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH] ARM: S5PC210: add support for i2c PMICs on Universal_C210 board
Date: Thu, 3 Mar 2011 11:40:26 +0900
Message-ID: <AANLkTimHPzbWpqFMXr2D46VXxLeHaAVTtpeCSaByweu8@mail.gmail.com>
References: <1297767555-13326-1-git-send-email-m.szyprowski@samsung.com>
	<20110215113504.GF4152@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:65469 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932179Ab1CCCk1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Mar 2011 21:40:27 -0500
Received: by yxs7 with SMTP id 7so204044yxs.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Mar 2011 18:40:26 -0800 (PST)
In-Reply-To: <20110215113504.GF4152@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com

On Tue, Feb 15, 2011 at 8:35 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Tue, Feb 15, 2011 at 11:59:15AM +0100, Marek Szyprowski wrote:
>> =A0#include <mach/map.h>
>> +#include <mach/gpio.h>
>
> Need I say anything about this?

Hi Russell,

How about to prevent it as compiler error? It's frequent mistake.

At each mach/gpio.h

#ifndef __LINUX_GPIO_H
#error "You should include <linux/gpio.h> instead of <mach/gpio.h>."
#endif

Thank you,
Kyungmin Park

> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
