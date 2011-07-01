From: padma venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 3/7] ARM: SAMSUNG: Add SPI clock definitions for SAMSUNG SoCs
Date: Fri, 1 Jul 2011 09:01:24 +0530
Message-ID: <BANLkTikv=1c+TmjPOAy8RhGeV3h+CAP=bw@mail.gmail.com>
References: <1309436723-662-1-git-send-email-padma.v@samsung.com>
	<1309436723-662-4-git-send-email-padma.v@samsung.com>
	<20110630093024.GT21898@n2100.arm.linux.org.uk>
	<BANLkTi=u7hrqZwo2kCp-iNgnwWUcw_uBog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:42394 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750725Ab1GADbZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 23:31:25 -0400
Received: by wwe5 with SMTP id 5so2830650wwe.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2011 20:31:24 -0700 (PDT)
In-Reply-To: <BANLkTi=u7hrqZwo2kCp-iNgnwWUcw_uBog@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Padmavathi Venna <padma.v@samsung.com>, kgene.kim@samsung.com, sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Russell,Jassi

On Thu, Jun 30, 2011 at 3:13 PM, Jassi Brar <jassisinghbrar@gmail.com> =
wrote:
> On Thu, Jun 30, 2011 at 3:00 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
>> On Thu, Jun 30, 2011 at 08:25:19AM -0400, Padmavathi Venna wrote:
>>> SPI Clocks were defined in dev-spi.c of machine specific folder.
>>> To make SPI devices common across all SoCs,dev-spi.c is moved
>>> from machine specific folder to plat-samsung. So SPI clock
>>> definitions has been moved from dev-spi.c to SoC specific machine
>>> folder for S3C64XX,S5P64X0,S5PC100 and S5PV210
>>
>> This just shows how sick the Samsung code is by abusing the clk API.
>> If it stopped that abuse and switched over to clkdev none of this wo=
uld
>> be necessary.
> I am anyways not for the patch set.
> Though this 'sickness' predates clkdev, and I agree it should be chan=
ged now.

I will prepare new set of patches based on clkdev code and send for rev=
iew.

Thanks&Regards
Padma

> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
