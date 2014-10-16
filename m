From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH v2 0/2] serial: samsung: add support for early console
Date: Thu, 16 Oct 2014 18:58:23 +0530
Message-ID: <CAGOxZ50h2_+UoqO6yQjFyub+hExsQs3r2M19HCOhJcJgVF+wCw@mail.gmail.com>
References: <1411638892-13702-1-git-send-email-m.szyprowski@samsung.com> <CAGOxZ509Sfd77FQFSKPgp7piDFa-o2zdFuHy9EzfXULkpJHGrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f50.google.com ([209.85.213.50]:50562 "EHLO
	mail-yh0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751704AbaJPN3F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Oct 2014 09:29:05 -0400
Received: by mail-yh0-f50.google.com with SMTP id a41so1893391yho.37
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2014 06:29:04 -0700 (PDT)
In-Reply-To: <CAGOxZ509Sfd77FQFSKPgp7piDFa-o2zdFuHy9EzfXULkpJHGrg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alim Akhtar <alim.akhtar@samsung.com>, Thomas P Abraham <thomas.ab@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robherring2@gmail.com>

Hi Marek,

On Sat, Sep 27, 2014 at 4:58 AM, Alim Akhtar <alim.akhtar@gmail.com> wrote:
> HI Marek,
>
> On Thu, Sep 25, 2014 at 3:24 PM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> This patchset adds support for early console defined in device tree. As
>> an example, DTS files for all Exynos4 based machines are updated with
>> the correct value for common chosen/sdtout property.
>>
>> To get it fully functional on ARM architecture, additional improvements
>> (support for early_ioremap) are needed in early console code.
>>
>> Best regards
>> Marek Szyprowski
>> Samsung R&D Institute Poland
>>
>> Change log:
>>
>> v2:
>> - added support for command line based initialization
>>
>> v1: http://www.spinics.net/lists/linux-samsung-soc/msg37094.html
>> - initial version
>>
>>
>> Patch summary:
>>
>> Tomasz Figa (2):
>>   serial: samsung: Add support for early console
>>   ARM: dts: exynos4: Add stdout-path properties
>>
>>  Documentation/kernel-parameters.txt             |  10 +++
>>  arch/arm/boot/dts/exynos4210-origen.dts         |   1 +
>>  arch/arm/boot/dts/exynos4210-smdkv310.dts       |   1 +
>>  arch/arm/boot/dts/exynos4210-trats.dts          |   1 +
>>  arch/arm/boot/dts/exynos4210-universal_c210.dts |   1 +
>>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi |   4 +
>>  arch/arm/boot/dts/exynos4412-origen.dts         |   1 +
>>  arch/arm/boot/dts/exynos4412-smdk4412.dts       |   1 +
>>  arch/arm/boot/dts/exynos4412-tiny4412.dts       |   4 +
>>  arch/arm/boot/dts/exynos4412-trats2.dts         |   1 +
>>  drivers/tty/serial/Kconfig                      |   1 +
>>  drivers/tty/serial/samsung.c                    | 103 ++++++++++++++++++++++++
>>  12 files changed, 129 insertions(+)
>
> Tested this on ARM64 based exynos7 platform, both command line and DT
> ways. Both works well.
> Compile tested on ARM.
> Not sure if my ACK matters here, but you certainly have my
>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Tested-by: Alim Akhtar <alim.akhtar@samsung.com>
>
> I think this is good to go in with a minor comment addressed on 1st patch.
> Thanks!

A gentle ping.

>>
>> --
>> 1.9.2
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> Regards,
> Alim



-- 
Regards,
Alim
