From: padma venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 0/7] ARM: SAMSUNG: Cleanup SPI platform specific code
Date: Fri, 1 Jul 2011 09:05:41 +0530
Message-ID: <BANLkTi=awBjrOugA6tp+Z47Y8A=eMhOrjw@mail.gmail.com>
References: <1309436723-662-1-git-send-email-padma.v@samsung.com>
	<005701cc3707$aa914e50$ffb3eaf0$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:39288 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750725Ab1GADfn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 23:35:43 -0400
Received: by wyg8 with SMTP id 8so1934369wyg.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2011 20:35:41 -0700 (PDT)
In-Reply-To: <005701cc3707$aa914e50$ffb3eaf0$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, kgene.kim@samsung.com, jassisinghbrar@gmail.com, sbkim73@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>

Hi Marek,

On Thu, Jun 30, 2011 at 2:55 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hello,
>
> On Thursday, June 30, 2011 2:25 PM Padmavathi Venna wrote:
>
>> This patchset does the following:
>>
>> 1. Move duplicated code to common place
>> [PATCH 1/7] ARM: SAMSUNG: Move SPI device definitions to plat-samsun=
g
>> SPI platform devices are defined in respective machine folder of
>> Samsung S3C64XX and S5P series SoCs.This is duplicated for every SoC=
=2E
>> So all SPI platform devices are moved to a common place.
>>
>> [PATCH 2/7] ARM: SAMSUNG: Define common macro for SPI physical addre=
ss
>>
>> [PATCH 3/7] ARM: SAMSUNG: Add SPI clock definitions for SAMSUNG SoCs
>> Each SoC has it's own set of clock sources for SPI.So they are defin=
ed in
>> respective machine folder.
>>
>> [PATCH 4/7] ARM: SAMSUNG: Create SPI device setup files in
>> respective machine folder
>>
>> [PATCH 5/7] ARM: SAMSUNG: Add SPI platform specific code
>> As SPI platform devices are moved to common place some platform spec=
ific
>> code need to be initialized in the respective machine file.
>>
>> [PATCH 6/7] SPI: S5PC100: Enable the SPI driver for S5PC100
>>
>> [PATCH 7/7] SPI: S5PV210: Enable the SPI driver for S5PV210
>
> These patch set improves a bit platform part of SPI driver, but I rea=
lly
> wonder if we really need to pass so many SoC version specific data
> with platform data. Are all these data (clock list, fifo parameters)
> specific to SoC version or particular board configuration/implementat=
ion?
>
> Maybe it will be much easier to convert the SPI driver to use driver =
id
> feature and use different platform id's for each SoC version? (please
> refer to drivers/video/s3c-fb.c and plat-samsung/include/plat/fb-core=
=2Eh
> for more information). This will remove the need for SoC specific
> parameters in platform data and will group all version dependent
> information in the driver.

Thanks for your suggestion. I will consider your comments for the
next patch set based on clkdev code.

Thanks&Regards
Padma
>
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
