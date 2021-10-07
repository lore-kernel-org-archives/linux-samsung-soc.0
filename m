Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52A2C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 04:36:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9937E61108
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 04:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhJGEi3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Oct 2021 00:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhJGEi3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 00:38:29 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F05C061746
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 21:36:35 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id p13so18431125edw.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2021 21:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=1ijjwOT7EZIyL6L+ZHdsPAJoYiBwzpnU73GJ5V/IAGk=;
        b=mMK7k0clphZneYqlrWrLku9PId4ofBMMHS+Rzx76TKK2SLsKAIJpvvn3pcY7acJKmV
         Rehdx7BICaD6Yx6zNaqZdZl2JXqBBR7zqoYEM+8aL7ganQtG8FV5nZnvUh+LLtpp5v/E
         NutDa5V6iRMAcV7T1Sk9Y7oHycfOF+S0YhjAfanpIHwNE79J8vsGq2373q9KJ4Qafhob
         La+EIG6vw6QD5mjgBId1NvlG0WH5Frvjcy4iM8qPaxSIa9q451igSqwmVCVusDea9ajm
         nN5GdmUAFPNZ18auxAUYDiZfiF8+RjsdUGsxyVoBkrPaZ/X8lPOYFHcPelebHYFWkCVM
         XxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=1ijjwOT7EZIyL6L+ZHdsPAJoYiBwzpnU73GJ5V/IAGk=;
        b=0k9ZV16TXlH19/WJsoDyXYj67IogQ4n9UWajyUyreiMavrxKys7kHb6HEtdUPay9io
         xbhRANBWxUM2rwnJoBSE3junzsY+ZAo3jnIYlOTA/CaGcyoiHpiPGkg8mTiu1bv1CT94
         9YUaIbRGkLwt1S8ZZWRnie6aLkyza8HmChklkxNoMeK9zEvsJ2rAxaxYuOqIF71ZWqPt
         sBAeAlU9fDeaVCasu0aQS1ilA7XnTTJZkAElZQ7vubWIZeGsdtu2gKCcsDA+FRbjiNcb
         N0GGZAAPD7/M4cMopVX62ae+DOgWic04guiZcVtmIw4djapCCKmvwhicXMyv1soSq2TX
         Ut0Q==
X-Gm-Message-State: AOAM530xKrp1HyzsGDDkLTdChSLtfqmca6q9lH5ghBTnrVQq8bMb8ogm
        1ZKUYwWTJnuUxNKk1Cp7uCI=
X-Google-Smtp-Source: ABdhPJyCqJbvcYT6ivPSDaqDu9J55OJM0pmCyxt4kke9yVJH+NwmshrBi2iL8Flra63O5m8p8gMUlw==
X-Received: by 2002:a50:d88a:: with SMTP id p10mr3160990edj.274.1633581394516;
        Wed, 06 Oct 2021 21:36:34 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id u18sm2626457edo.4.2021.10.06.21.36.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Oct 2021 21:36:34 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: BUG: Cannot boot Odroid XU4 from eMMC without this patch
From:   Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <103943b6-3567-a241-7308-890d218eeb0f@samsung.com>
Date:   Thu, 7 Oct 2021 08:36:31 +0400
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <922F76F9-2F1C-405D-A205-AE6C7B41DFF6@gmail.com>
References: <89888711-56BF-4E6C-92EE-2053E773B077@gmail.com>
 <CGME20210927111008epcas1p24778eabe0ab08ced2a200b48111c822b@epcas1p2.samsung.com>
 <CAJKOXPfUnLbhc6e_ccZxhVReV9jHsQ8aykkP=ghK-qURQLCdLA@mail.gmail.com>
 <fec1cc85-0c81-035b-fe89-1b6dedbb3bc5@samsung.com>
 <974A393B-EE0A-487F-8315-D4E0498DAA25@gmail.com>
 <103943b6-3567-a241-7308-890d218eeb0f@samsung.com>
To:     Jaehoon Chung <jh80.chung@samsung.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

>=20
> On 7 Oct 2021, at 2:16 am, Jaehoon Chung <jh80.chung@samsung.com> =
wrote:
>=20
> Hi,
>=20
> On 10/1/21 10:41 PM, Christian Hewitt wrote:
>>=20
>>> On 1 Oct 2021, at 4:40 am, Jaehoon Chung <jh80.chung@samsung.com> =
wrote:
>>>=20
>>> On 9/27/21 8:09 PM, Krzysztof Kozlowski wrote:
>>>> On Mon, 13 Sept 2021 at 06:32, Christian Hewitt
>>>> <christianshewitt@gmail.com> wrote:
>>>>>=20
>>>>> =
https://protect2.fireeye.com/v1/url?k=3D6f7d4070-30e6793d-6f7ccb3f-0cc47aa=
8f5ba-2c8976d4b015314f&q=3D1&e=3D776d64d2-22f3-400a-a241-42af8b5f60d0&u=3D=
https%3A%2F%2Fgithub.com%2Fchewitt%2Flinux%2Fcommit%2F8a4ebfb43a394e5dc5e9=
fafc92a50d5e81a4f258
>>>>>=20
>>>>> If I boot any recent kernel without the above patch, the emmc =
module on the XU4 is not detected, see:
>>>>>=20
>>>>> Without:
>>>>>=20
>>>>> [    3.227837] mmc0: tuning execution failed: -5
>>>>> [    3.231229] mmc0: error -5 whilst initialising MMC card
>>>>> [    3.536450] mmc0: tuning execution failed: -5
>>>>> [    3.539680] mmc0: error -5 whilst initialising MMC card
>>>>> [    3.794056] mmc0: tuning execution failed: -5
>>>>> [    3.794212] mmc0: error -5 whilst initialising MMC card
>>>>> [    4.111097] mmc0: tuning execution failed: -5
>>>>> [    4.115356] mmc0: error -5 whilst initialising MMC card
>>>>> [    4.426164] mmc0: tuning execution failed: -5
>>>>> [    4.429678] mmc0: error -5 whilst initialising MMC card
>>>>> [    4.756226] mmc0: tuning execution failed: -5
>>>>> [    4.760641] mmc0: error -5 whilst initialising MMC card
>>>>>=20
>>>>> With:
>>>>>=20
>>>>> [    3.305461] mmc0: new HS400 MMC card at address 0001
>>>>> [    3.307444] mmcblk0: mmc0:0001 8GME4R 7.28 GiB
>>>>> [    3.308132] mmcblk0boot0: mmc0:0001 8GME4R 4.00 MiB
>>>>> [    3.309172] mmcblk0boot1: mmc0:0001 8GME4R 4.00 MiB
>>>>> [    3.310255] mmcblk0rpmb: mmc0:0001 8GME4R 512 KiB, chardev =
(246:0)
>>>>> [    3.315963]  mmcblk0: p1 p2
>>>>>=20
>>>>> The patch is sourced from a Linux 5.4 patchset used by several =
retro gaming distros for XU4 images shared in the HardKernel forums. I =
would be happy to submit it, but the original patch has no description =
in the commit message. Not being a coding developer myself I cannot =
explain whether it is correct or what it=E2=80=99s doing to add one. All =
I can do is confirm that it works, and is needed. SD card boot is not an =
issue.
>>>>>=20
>>>>> I=E2=80=99ve CC=E2=80=99d the original author (Marian) in case he =
remembers the patch and can comment. It would be good to get this =
upstream.
>>>>=20
>>>> The patch might have sense but would require describing conditions =
-
>>>> what MMC input and output clock settings work and which do not =
work.
>>>> Also someone would need to test other Exynos5422 boards and other
>>>> Exynos with HS200 and HS400 support (Exynos5433, Exynos7). I think
>>>> this should not affect SD cards.
>>>=20
>>>=20
>>> Thanks for adding me.
>>> I didn't see XU4 booting fail with linux-5.15-rc1 kernel.
>>>=20
>>> [    4.561934] mmc1: new HS400 MMC card at address 0001
>>> [    4.572401] mmcblk1: mmc1:0001 SDW16G 14.7 GiB
>>> [    4.602555]  mmcblk1: p1 p2 p3 p4 < p5 p6 p7 >
>>> [    4.623201] mmcblk1boot0: mmc1:0001 SDW16G 4.00 MiB
>>> [    4.640465] mmcblk1boot1: mmc1:0001 SDW16G 4.00 MiB
>>>=20
>>> Which kernel version did you use?
>>=20
>> The original report is against 5.14.0, but I see the same with =
5.15-rc3
>>=20
>> dmesg: =
https://protect2.fireeye.com/v1/url?k=3D703ee5f5-2fa5dcb3-703f6eba-0cc47a3=
003e8-ad25e9061be78bbb&q=3D1&e=3Ddf3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=3D=
http%3A%2F%2Fix.io%2F3AuL
>> dmesg | grep mmc: =
https://protect2.fireeye.com/v1/url?k=3D5d2277f1-02b94eb7-5d23fcbe-0cc47a3=
003e8-b778cb8e233bbe4b&q=3D1&e=3Ddf3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=3D=
http%3A%2F%2Fix.io%2F3AuO
>>=20
>> And if I pick that patch to my kernel branch all is good:
>>=20
>> dmesg: =
https://protect2.fireeye.com/v1/url?k=3D8bcf7900-d4544046-8bcef24f-0cc47a3=
003e8-6124ad41dd642d56&q=3D1&e=3Ddf3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=3D=
http%3A%2F%2Fix.io%2F3Avf
>> dmesg | grep mmc: =
https://protect2.fireeye.com/v1/url?k=3D66ce5f96-395566d0-66cfd4d9-0cc47a3=
003e8-b9768331cc0e4416&q=3D1&e=3Ddf3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=3D=
http%3A%2F%2Fix.io%2F3Ave
>>=20
>> Here=E2=80=99s an SD (or eMMC) bootable image for an XU4 that =
exhibits the problem. You need to run =E2=80=9Csystemctl stop kodi=E2=80=9D=
 once the UART console is available else it attempts to run Kodi and =
Panfrost (the image is created for some Panfrost poking) currently =
wedges the board. Once the Kodi service is stopped =E2=80=9Csystemctl =
mask kodi=E2=80=9D will prevent it from running again.
>>=20
>> =
https://chewitt.libreelec.tv/testing/LibreELEC-Exynos.arm-10.0.0-odroid-xu=
4.img.gz
>>=20
>> Kernel defconfig for the image: =
https://protect2.fireeye.com/v1/url?k=3D806156b6-dffa6ff0-8060ddf9-0cc47a3=
003e8-b2bec8fd0863dc1b&q=3D1&e=3Ddf3dbd0f-ccc7-40e0-b96a-1d47883a7f71&u=3D=
http%3A%2F%2Fsprunge.us%2FG6uxty - basically the exynos config but with =
a wide variety of not-needed drivers (other SoCs, network cards, etc.) =
disabled.
>>=20
>> The board is booting from u-boot 2020.04 in case that matters.
>=20
> Thanks for sharing information. Sorry for replying late. I will check =
this problem on this week.=20
> It needs to satisfy all exynos5 SoCs. I just wonder why not working =
fine according to eMMC modules.

No problem, I=E2=80=99ve been watching the thread :)

This is the module I=E2=80=99m using =
https://www.hardkernel.com/shop/8gb-emmc-module-h2/ .. I can probably =
organise one to be shipped to you if needed.

Christian=
