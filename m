Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5167FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 10:40:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FF1061052
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 10:40:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbhJFKmn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 06:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhJFKmm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 06:42:42 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D783C061749
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 03:40:50 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id b20so8558843lfv.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2021 03:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=M4F1V85qiF7lbsOQ8cwMcgKQ6W4uTNvepfab7eY2riU=;
        b=bEerbZlNuoyo9JLb2iOIS7BhZiUc1jmJdvfKuvdN7JqbuwKR7dmIQlmHA9FSRHRcZl
         g6rbIbR9M0t9gBgcOZyI4F3ro7zlfu3cxvFmAaEHKZMmqoR/8dNtUkqu4nYShFECsVmN
         prRNlGWz97RLPNayWJjhPYUiXpitkjyb9ATdHFbH6kXlrQgwrbzB1yUMWYv5V85MBer7
         Q/lZvrsRkzB/kdc1WDqV78ACrBuARRzzcrYn09PGO2VHLyXVA4RBIQnzkZ7nLHwlpviS
         3/XAX8jNOWzqJ2ss86QXVBfRlr0BE01oMo5xbzZLULDIgunA91Dh9ZcT9HPiG8icomjO
         mqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=M4F1V85qiF7lbsOQ8cwMcgKQ6W4uTNvepfab7eY2riU=;
        b=Bdrdw0AOKutsnYfM7Fib6fvYSor/zk+KyALCANvCkgacREU9YN1WU6AqJotrPUsGG5
         ea4h/9OOqyLs5mr/U2l/7EKFge8VrhqKazKKFJTfR12o5jAKujFlSi9vCs0F5uvjem3v
         rD8LNF/QGZ1i9MZsMP5zfoNyA63P83XtYYf8Zr/AuNvPMQbSUlz1R9xnVkbVrbU/M5VJ
         FTtgoYtMeDhxvBlJ04DDlz7x4UNMHdviTc+8bQip670MMCiR0m42urTRwLnwIz6M5vKa
         fl/gYOkhoygnvc5qFM1nJZWuWcXZ3UW4/Bx4Sw4jKJDgsgf0JFLimo2WZv2OBoQbCkb7
         l+fw==
X-Gm-Message-State: AOAM533ACy4fbRIKOJSvxg+wZST/UzXzUhy1lejlggZ/UrmAWy2u0M11
        3qikErTPHfFaBJoIfrJBqebMW9Fcz2EPoKuuQaDZ8A==
X-Google-Smtp-Source: ABdhPJxfRnknmFQPv52ufkWEV5I9OW39tzYvGLeLrCAYWn1AZHvsFifUi8Talbr87f3v+FUwn34jVYGve2GbwUXzr40=
X-Received: by 2002:a2e:898c:: with SMTP id c12mr28328027lji.16.1633516848722;
 Wed, 06 Oct 2021 03:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <89888711-56BF-4E6C-92EE-2053E773B077@gmail.com>
 <CGME20210927111008epcas1p24778eabe0ab08ced2a200b48111c822b@epcas1p2.samsung.com>
 <CAJKOXPfUnLbhc6e_ccZxhVReV9jHsQ8aykkP=ghK-qURQLCdLA@mail.gmail.com>
 <fec1cc85-0c81-035b-fe89-1b6dedbb3bc5@samsung.com> <3f2c93f5-e207-ce9d-ee90-ec34ad6d39ea@samsung.com>
 <04ab2789-0218-42be-888d-a54ab2826e15@kernel.org> <043cf847-729d-07ca-2395-411edfdf66de@samsung.com>
In-Reply-To: <043cf847-729d-07ca-2395-411edfdf66de@samsung.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 6 Oct 2021 12:40:10 +0200
Message-ID: <CAPDyKFr0gbjzTPs1gxAg=1DPhe7tM6R9sGT9rSCX2BtFh2hekA@mail.gmail.com>
Subject: Re: BUG: Cannot boot Odroid XU4 from eMMC without this patch
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Jaehoon Chung <jh80.chung@samsung.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 4 Oct 2021 at 17:51, Marek Szyprowski <m.szyprowski@samsung.com> wr=
ote:
>
> Hi Krzysztof,
>
> On 04.10.2021 15:01, Krzysztof Kozlowski wrote:
> > On 04/10/2021 12:07, Marek Szyprowski wrote:
> >> On 01.10.2021 02:40, Jaehoon Chung wrote:
> >>> On 9/27/21 8:09 PM, Krzysztof Kozlowski wrote:
> >>>> On Mon, 13 Sept 2021 at 06:32, Christian Hewitt
> >>>> <christianshewitt@gmail.com> wrote:
> >>>>> https://protect2.fireeye.com/v1/url?k=3D6f7d4070-30e6793d-6f7ccb3f-=
0cc47aa8f5ba-2c8976d4b015314f&q=3D1&e=3D776d64d2-22f3-400a-a241-42af8b5f60d=
0&u=3Dhttps%3A%2F%2Fgithub.com%2Fchewitt%2Flinux%2Fcommit%2F8a4ebfb43a394e5=
dc5e9fafc92a50d5e81a4f258
> >>>>>
> >>>>> If I boot any recent kernel without the above patch, the emmc modul=
e on the XU4 is not detected, see:
> >>>>>
> >>>>> Without:
> >>>>>
> >>>>> [    3.227837] mmc0: tuning execution failed: -5
> >>>>> [    3.231229] mmc0: error -5 whilst initialising MMC card
> >>>>> [    3.536450] mmc0: tuning execution failed: -5
> >>>>> [    3.539680] mmc0: error -5 whilst initialising MMC card
> >>>>> [    3.794056] mmc0: tuning execution failed: -5
> >>>>> [    3.794212] mmc0: error -5 whilst initialising MMC card
> >>>>> [    4.111097] mmc0: tuning execution failed: -5
> >>>>> [    4.115356] mmc0: error -5 whilst initialising MMC card
> >>>>> [    4.426164] mmc0: tuning execution failed: -5
> >>>>> [    4.429678] mmc0: error -5 whilst initialising MMC card
> >>>>> [    4.756226] mmc0: tuning execution failed: -5
> >>>>> [    4.760641] mmc0: error -5 whilst initialising MMC card
> >>>>>
> >>>>> With:
> >>>>>
> >>>>> [    3.305461] mmc0: new HS400 MMC card at address 0001
> >>>>> [    3.307444] mmcblk0: mmc0:0001 8GME4R 7.28 GiB
> >>>>> [    3.308132] mmcblk0boot0: mmc0:0001 8GME4R 4.00 MiB
> >>>>> [    3.309172] mmcblk0boot1: mmc0:0001 8GME4R 4.00 MiB
> >>>>> [    3.310255] mmcblk0rpmb: mmc0:0001 8GME4R 512 KiB, chardev (246:=
0)
> >>>>> [    3.315963]  mmcblk0: p1 p2
> >>>>>
> >>>>> The patch is sourced from a Linux 5.4 patchset used by several retr=
o gaming distros for XU4 images shared in the HardKernel forums. I would be=
 happy to submit it, but the original patch has no description in the commi=
t message. Not being a coding developer myself I cannot explain whether it =
is correct or what it=E2=80=99s doing to add one. All I can do is confirm t=
hat it works, and is needed. SD card boot is not an issue.
> >>>>>
> >>>>> I=E2=80=99ve CC=E2=80=99d the original author (Marian) in case he r=
emembers the patch and can comment. It would be good to get this upstream.
> >>>> The patch might have sense but would require describing conditions -
> >>>> what MMC input and output clock settings work and which do not work.
> >>>> Also someone would need to test other Exynos5422 boards and other
> >>>> Exynos with HS200 and HS400 support (Exynos5433, Exynos7). I think
> >>>> this should not affect SD cards.
> >>> Thanks for adding me.
> >>> I didn't see XU4 booting fail with linux-5.15-rc1 kernel.
> >>>
> >>> [    4.561934] mmc1: new HS400 MMC card at address 0001
> >>> [    4.572401] mmcblk1: mmc1:0001 SDW16G 14.7 GiB
> >>> [    4.602555]  mmcblk1: p1 p2 p3 p4 < p5 p6 p7 >
> >>> [    4.623201] mmcblk1boot0: mmc1:0001 SDW16G 4.00 MiB
> >>> [    4.640465] mmcblk1boot1: mmc1:0001 SDW16G 4.00 MiB
> >>>
> >>> Which kernel version did you use?
> >> I came across this patch some time ago, but also didn't manage to
> >> reproduce the issue - in my case eMMC was always detected properly. It
> >> might be related to particular version or series of the eMMC modules.
> >>
> >> I've just checked that patch on XU3, XU4, PeachPi and TM2e boards. All
> >> are working properly with it.
> >>
> >> I've also tried to benchmark the impact of that change and in some cas=
e
> >> it causes some performance degradation.
> >>
> >> The main difference is clock configuration. Before this patch (XU4):
> >>
> >> # dmesg | grep mmc0
> >> mmc_host mmc0: Bus speed (slot 0) =3D 50000000Hz (slot req 400000Hz,
> >> actual 396825HZ div =3D 63)
> >> mmc_host mmc0: Bus speed (slot 0) =3D 200000000Hz (slot req 200000000H=
z,
> >> actual 200000000HZ div =3D 0)
> >> mmc_host mmc0: Bus speed (slot 0) =3D 50000000Hz (slot req 52000000Hz,
> >> actual 50000000HZ div =3D 0)
> >> mmc_host mmc0: Bus speed (slot 0) =3D 400000000Hz (slot req 200000000H=
z,
> >> actual 200000000HZ div =3D 1)
> >> mmc0: new HS400 MMC card at address 0001
> >> mmcblk0: mmc0:0001 SDW16G 14.7 GiB
> >> mmcblk0boot0: mmc0:0001 SDW16G 4.00 MiB
> >> mmcblk0boot1: mmc0:0001 SDW16G 4.00 MiB
> >> mmcblk0rpmb: mmc0:0001 SDW16G 4.00 MiB, chardev (245:0)
> >>
> >> After applying the patch (mmc device number is random depending on the
> >> boot):
> >>
> >> # dmesg | grep mmc1
> >> [    3.619177] mmc_host mmc1: Bus speed (slot 0) =3D 50000000Hz (slot =
req
> >> 400000Hz, actual 396825HZ div =3D 63)
> >> [    4.057167] mmc_host mmc1: Bus speed (slot 0) =3D 200000000Hz (slot=
 req
> >> 200000000Hz, actual 200000000HZ div =3D 0)
> >> [    4.070040] mmc_host mmc1: Bus speed (slot 0) =3D 50000000Hz (slot =
req
> >> 52000000Hz, actual 50000000HZ div =3D 0)
> >> [    4.089028] mmc_host mmc1: Bus speed (slot 0) =3D 266666666Hz (slot=
 req
> >> 200000000Hz, actual 133333333HZ div =3D 1)
> >> [    4.102296] mmc1: new HS400 MMC card at address 0001
> >> [    4.119072] mmcblk1: mmc1:0001 SDW16G 14.7 GiB
> >> [    4.173507] mmcblk1boot0: mmc1:0001 SDW16G 4.00 MiB
> >> [    4.196210] mmcblk1boot1: mmc1:0001 SDW16G 4.00 MiB
> >> [    4.215163] mmcblk1rpmb: mmc1:0001 SDW16G 4.00 MiB, chardev (245:0)
> >>
> >> The performance has been measured with:
> >>
> >> # dd if=3D/dev/mmcblk1p6 of=3D/dev/null bs=3D128k
> >> 31944+0 records in
> >> 31944+0 records out
> >> 4186963968 bytes (4.2 GB) copied, 36.6981 s, 114 MB/s
> >>
> >> Results (XU4 board):
> >>
> >> exynos_defconfig: 145 MB/s (before) vs 114 MB/s (after)
> >> exynos_defconfig + all devfreqs set to performance: 146 MB/s vs 115 MB=
/s
> >> exynos_defconfig + cpufreq & all devfreqs set to performance: 154 MB/s
> >> vs 139 MB/s
> >> exynos_defconfig + CONFIG_ARM_EXYNOS_BUS_DEVFREQ disabled: 130 MB/s vs
> >> 108 MB/s
> >> exynos_defconfig + CONFIG_CPUFREQ_DT disabled: 69 MB/s (no impact)
> >> exynos_defconfig + CONFIG_ARM_EXYNOS_BUS_DEVFREQ & CONFIG_CPUFREQ_DT: =
66
> >> MB/s (no impact)
> >>
> >>
> >> Maybe some other clock configuration (I mean the rate of the top-level
> >> clocks or even PLLS) will solve the issue without degrading the
> >> performance, but it is hard to judge that without reproducing the issu=
e.
> >>
> > Thanks for testing and performance measurements. The read speed seems t=
o
> > be a direct effect of lower mmc bus frequency (DIVRATIO changed from 2
> > to 3).
> >
> > What next? Except what Marek suggested, maybe compare MMC card
> > capabilities and try to find a difference? For example Marek's eMMC (at
> > least one with logs) is from Sandisk SDW16G. Christian's and Marian's
> > (Memeka / mihailescu2m) is apparently Samsung's 8GME4R.
>
> I have also eMMC modules with AJTD4R and 016G92 IDs. I can test them,
> but that won't happen soon due to remote work.
>
> > Because the patch reduces performance and not all users are affected, I
> > have some doubts. Maybe use by default lower clock (so as in this patch=
)
> > but if card is in list of known good cards go higher?
> >
> > Another idea is to use always slower bus because it is simply safer and
> > we do not have resources to test 100x of different eMMC modules...
> >
> > Any comments from you?
>
> I vote for the safer clock rates. Maybe we can add some dt-property for
> the higher rates for the boards with the known to be working properly
> eMMC modules.

We already have a common mmc DT property, "max-frequency". I think
that should fit well, as it allows us to cap the frequency on those
boards that need this, right?

Having a card quirk could be another option, but then we need to be
sure that it's actually the card that has the limitation.

Kind regards
Uffe
