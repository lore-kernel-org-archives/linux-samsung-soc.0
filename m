Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767F3C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Oct 2021 13:41:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BE11619F6
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Oct 2021 13:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353771AbhJANnW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 1 Oct 2021 09:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353905AbhJANnH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Oct 2021 09:43:07 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C81FBC0613E6
        for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Oct 2021 06:41:22 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id ba1so34999701edb.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Oct 2021 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=dpqrj9UQ61JeP64CiYYmvZqBFTg8BYcLuzBfSctij60=;
        b=dNl7rDd9AS2NSu5/IljpMfdAuke1+r3Xajm1bMW0w26SyizOfMBnmgAs+Ol2g0gEtt
         U0WNmMmCrstFUS/qVqa90Vvb25YFBXSlgZhHu74snTm3H4kt6Nku5/lP5QTSsoNFMlSM
         Guz2IWVZy0rzjF8Vhdh+mPspq4v/MvaDXPBBWr5KMHTCL+d/XTzWbRtwZ1FEe+bycd2o
         cQ2oDfGzU+X8iuYz5b/L6NKhN20yJyyzaXUBLpU9Tr3jzSkXA/YewsYikQDsyi8Chrlf
         fJxc16maMaJi/jgDVdBamzbF+bp3maIHfBbv6oYpfQwBhUwW2mJ5c8G+qjeLIAx3X+HC
         IL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=dpqrj9UQ61JeP64CiYYmvZqBFTg8BYcLuzBfSctij60=;
        b=YfjI5yKSnWcKcgEPy59D7l/SN3YP9FsljdGq7v4QsPwvTJz76Jyod8aZg1xsa4abxO
         o288xr5n9qDJy9DW9WszE4tA69liKTmFmJ205oYDKgPrPNd0ByT3kCQU5pwUJLsQvebm
         mtV3BKxnQQ7Rpat/RpkYC0CEbz3p6TRB3B3dQ9tZd4eDH2IpvSQ7LA6+4eTN1y4JSWic
         mS4+ZOgbsj8UeqdFaf0MGm7FkcSxnxDGYHVUGPUpn3Gqp1017lU/GSw+Twh4Q6X+2bdD
         H40554V7G1JxcBCvA0SnQvXNp0ZXKyHLg4Chov0YfAbkxdFYPD0/WV7fpXhpy9IyyTgJ
         sTWw==
X-Gm-Message-State: AOAM530g3wh7sTEUsByEvrhzikr6qEYo8XTkusNsm3aPTfVJRHCxJwKu
        21aP9GP6LD3uaFx3mnLJK1Q=
X-Google-Smtp-Source: ABdhPJzYG0Yfmu0eJ3zsH/2XAMil1P4hyTFKRiUT7t2TvxdHa1/JNrwsNJPkS/hCSssWMEh0eoQ3Wg==
X-Received: by 2002:a50:9d49:: with SMTP id j9mr14044852edk.39.1633095681278;
        Fri, 01 Oct 2021 06:41:21 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id cq11sm2911977edb.4.2021.10.01.06.41.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Oct 2021 06:41:20 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: BUG: Cannot boot Odroid XU4 from eMMC without this patch
From:   Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <fec1cc85-0c81-035b-fe89-1b6dedbb3bc5@samsung.com>
Date:   Fri, 1 Oct 2021 17:41:17 +0400
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <974A393B-EE0A-487F-8315-D4E0498DAA25@gmail.com>
References: <89888711-56BF-4E6C-92EE-2053E773B077@gmail.com>
 <CGME20210927111008epcas1p24778eabe0ab08ced2a200b48111c822b@epcas1p2.samsung.com>
 <CAJKOXPfUnLbhc6e_ccZxhVReV9jHsQ8aykkP=ghK-qURQLCdLA@mail.gmail.com>
 <fec1cc85-0c81-035b-fe89-1b6dedbb3bc5@samsung.com>
To:     Jaehoon Chung <jh80.chung@samsung.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


> On 1 Oct 2021, at 4:40 am, Jaehoon Chung <jh80.chung@samsung.com> =
wrote:
>=20
> On 9/27/21 8:09 PM, Krzysztof Kozlowski wrote:
>> On Mon, 13 Sept 2021 at 06:32, Christian Hewitt
>> <christianshewitt@gmail.com> wrote:
>>>=20
>>> =
https://protect2.fireeye.com/v1/url?k=3D6f7d4070-30e6793d-6f7ccb3f-0cc47aa=
8f5ba-2c8976d4b015314f&q=3D1&e=3D776d64d2-22f3-400a-a241-42af8b5f60d0&u=3D=
https%3A%2F%2Fgithub.com%2Fchewitt%2Flinux%2Fcommit%2F8a4ebfb43a394e5dc5e9=
fafc92a50d5e81a4f258
>>>=20
>>> If I boot any recent kernel without the above patch, the emmc module =
on the XU4 is not detected, see:
>>>=20
>>> Without:
>>>=20
>>> [    3.227837] mmc0: tuning execution failed: -5
>>> [    3.231229] mmc0: error -5 whilst initialising MMC card
>>> [    3.536450] mmc0: tuning execution failed: -5
>>> [    3.539680] mmc0: error -5 whilst initialising MMC card
>>> [    3.794056] mmc0: tuning execution failed: -5
>>> [    3.794212] mmc0: error -5 whilst initialising MMC card
>>> [    4.111097] mmc0: tuning execution failed: -5
>>> [    4.115356] mmc0: error -5 whilst initialising MMC card
>>> [    4.426164] mmc0: tuning execution failed: -5
>>> [    4.429678] mmc0: error -5 whilst initialising MMC card
>>> [    4.756226] mmc0: tuning execution failed: -5
>>> [    4.760641] mmc0: error -5 whilst initialising MMC card
>>>=20
>>> With:
>>>=20
>>> [    3.305461] mmc0: new HS400 MMC card at address 0001
>>> [    3.307444] mmcblk0: mmc0:0001 8GME4R 7.28 GiB
>>> [    3.308132] mmcblk0boot0: mmc0:0001 8GME4R 4.00 MiB
>>> [    3.309172] mmcblk0boot1: mmc0:0001 8GME4R 4.00 MiB
>>> [    3.310255] mmcblk0rpmb: mmc0:0001 8GME4R 512 KiB, chardev =
(246:0)
>>> [    3.315963]  mmcblk0: p1 p2
>>>=20
>>> The patch is sourced from a Linux 5.4 patchset used by several retro =
gaming distros for XU4 images shared in the HardKernel forums. I would =
be happy to submit it, but the original patch has no description in the =
commit message. Not being a coding developer myself I cannot explain =
whether it is correct or what it=E2=80=99s doing to add one. All I can =
do is confirm that it works, and is needed. SD card boot is not an =
issue.
>>>=20
>>> I=E2=80=99ve CC=E2=80=99d the original author (Marian) in case he =
remembers the patch and can comment. It would be good to get this =
upstream.
>>=20
>> The patch might have sense but would require describing conditions -
>> what MMC input and output clock settings work and which do not work.
>> Also someone would need to test other Exynos5422 boards and other
>> Exynos with HS200 and HS400 support (Exynos5433, Exynos7). I think
>> this should not affect SD cards.
>=20
>=20
> Thanks for adding me.
> I didn't see XU4 booting fail with linux-5.15-rc1 kernel.
>=20
> [    4.561934] mmc1: new HS400 MMC card at address 0001
> [    4.572401] mmcblk1: mmc1:0001 SDW16G 14.7 GiB
> [    4.602555]  mmcblk1: p1 p2 p3 p4 < p5 p6 p7 >
> [    4.623201] mmcblk1boot0: mmc1:0001 SDW16G 4.00 MiB
> [    4.640465] mmcblk1boot1: mmc1:0001 SDW16G 4.00 MiB
>=20
> Which kernel version did you use?

The original report is against 5.14.0, but I see the same with 5.15-rc3

dmesg: http://ix.io/3AuL
dmesg | grep mmc: http://ix.io/3AuO

And if I pick that patch to my kernel branch all is good:

dmesg: http://ix.io/3Avf
dmesg | grep mmc: http://ix.io/3Ave

Here=E2=80=99s an SD (or eMMC) bootable image for an XU4 that exhibits =
the problem. You need to run =E2=80=9Csystemctl stop kodi=E2=80=9D once =
the UART console is available else it attempts to run Kodi and Panfrost =
(the image is created for some Panfrost poking) currently wedges the =
board. Once the Kodi service is stopped =E2=80=9Csystemctl mask kodi=E2=80=
=9D will prevent it from running again.

=
https://chewitt.libreelec.tv/testing/LibreELEC-Exynos.arm-10.0.0-odroid-xu=
4.img.gz

Kernel defconfig for the image: http://sprunge.us/G6uxty - basically the =
exynos config but with a wide variety of not-needed drivers (other SoCs, =
network cards, etc.) disabled.

The board is booting from u-boot 2020.04 in case that matters.

Christian

