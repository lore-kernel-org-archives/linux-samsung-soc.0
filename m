From: padma venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 0/7] ARM: SAMSUNG: Cleanup SPI platform specific code
Date: Thu, 30 Jun 2011 14:57:43 +0530
Message-ID: <BANLkTimaMiFgKa95Zm4AtQVFdbSqukBfwg@mail.gmail.com>
References: <1309436723-662-1-git-send-email-padma.v@samsung.com>
	<BANLkTin2MAsTn3UhJDOLVvsams=xRR=REQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:37674 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751803Ab1F3J1o convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 05:27:44 -0400
Received: by wwe5 with SMTP id 5so2045265wwe.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2011 02:27:43 -0700 (PDT)
In-Reply-To: <BANLkTin2MAsTn3UhJDOLVvsams=xRR=REQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, kgene.kim@samsung.com, sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi,

On Thu, Jun 30, 2011 at 1:01 PM, Jassi Brar <jassisinghbrar@gmail.com> =
wrote:
> On Thu, Jun 30, 2011 at 5:55 PM, Padmavathi Venna <padma.v@samsung.co=
m> wrote:
>> This patchset does the following:
>>
>> 1. Move duplicated code to common place
>> [PATCH 1/7] ARM: SAMSUNG: Move SPI device definitions to plat-samsun=
g
>> SPI platform devices are defined in respective machine folder of
>> Samsung S3C64XX and S5P series SoCs.This is duplicated for every SoC=
=2E
>> So all SPI platform devices are moved to a common place.
>
> The machine specific code is put in machine specific location for som=
e reason.
> And the code is not duplicated, it's mostly data structures
> initialized with machine
> specific values.
>
> Have you considered if it would still be possible to build kernel
> image supporting
> more than 1 soc after your changes ?
I didn't consider the single image scenario. Because as far as I know,
the existing Samsung code doesn't have support for building a single ke=
rnel
image for multiple SoCs.

The intention behind my changes were
1) To reuse the dev-spi files for all the SoCs, as this reduces the cod=
e size.
Also future SoCs with SPI can use the same file.
2) To be in line with other IPs like i2c,sdhci etc

> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
Thanks&Regards
Padma
