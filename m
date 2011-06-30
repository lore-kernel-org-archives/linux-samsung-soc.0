From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 0/7] ARM: SAMSUNG: Cleanup SPI platform specific code
Date: Thu, 30 Jun 2011 15:44:08 +0530
Message-ID: <BANLkTi=P=-eJFV8vQbcLKoFe3hto7tNGRw@mail.gmail.com>
References: <1309436723-662-1-git-send-email-padma.v@samsung.com>
	<BANLkTin2MAsTn3UhJDOLVvsams=xRR=REQ@mail.gmail.com>
	<BANLkTimaMiFgKa95Zm4AtQVFdbSqukBfwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:34922 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751405Ab1F3KOK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 06:14:10 -0400
Received: by bwd5 with SMTP id 5so1691781bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2011 03:14:09 -0700 (PDT)
In-Reply-To: <BANLkTimaMiFgKa95Zm4AtQVFdbSqukBfwg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma venkat <padma.kvr@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, kgene.kim@samsung.com, sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, Jun 30, 2011 at 2:57 PM, padma venkat <padma.kvr@gmail.com> wrote:
> Hi,
>
> On Thu, Jun 30, 2011 at 1:01 PM, Jassi Brar <jassisinghbrar@gmail.com> wrote:
>> On Thu, Jun 30, 2011 at 5:55 PM, Padmavathi Venna <padma.v@samsung.com> wrote:
>>> This patchset does the following:
>>>
>>> 1. Move duplicated code to common place
>>> [PATCH 1/7] ARM: SAMSUNG: Move SPI device definitions to plat-samsung
>>> SPI platform devices are defined in respective machine folder of
>>> Samsung S3C64XX and S5P series SoCs.This is duplicated for every SoC.
>>> So all SPI platform devices are moved to a common place.
>>
>> The machine specific code is put in machine specific location for some reason.
>> And the code is not duplicated, it's mostly data structures
>> initialized with machine
>> specific values.
>>
>> Have you considered if it would still be possible to build kernel
>> image supporting
>> more than 1 soc after your changes ?
> I didn't consider the single image scenario. Because as far as I know,
> the existing Samsung code doesn't have support for building a single kernel
> image for multiple SoCs.

Samsung did use to support during 24xx days. Unfortunately not much with
new generation SoCs.
This patch-set only takes us further away from having multiple SoCs
supported in a single kernel image some day.

>
> The intention behind my changes were
> 1) To reuse the dev-spi files for all the SoCs, as this reduces the code size.
I already decided in favor of being able to support multiple SoCs in
single image.

> Also future SoCs with SPI can use the same file.
Only if they have _exactly_ same SPI block. Then most probably they'll have most
other blocks identical too (not sure if I can name such examples in public) and
can be supported under the same SoC name.
Otherwise different SoCs spanning last 5yrs are already supported by
the same SPI
driver. We must provide SoC specific bits to the driver either via one
place or the other.

-j
