Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7ADDC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Sep 2021 11:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98C15610A2
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Sep 2021 11:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233956AbhI0LLl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Sep 2021 07:11:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:58118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233924AbhI0LLl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 07:11:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99121610E8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Sep 2021 11:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632741003;
        bh=1gUhLqZexzZWsTM8dXhyN2NUbmWTpD946Iuap//mDt0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=e13FnxGc+0mIJGw9sMR8090MF9edNVdpRoFhcUOIcXvU2Dab5ul1ssrebNIZ+hPR+
         3eBb/NZPTtvEB1JiJgduvauqCp5iOWMQbb5MRT7ZxljgQzLhte2QYjy55NZhHMHiOZ
         4R90RYWxr6dA7OKSmi6jKjSgJvOj8OKPraSH150H6pdfj9AJa1JM7hdZ760Po1fyJZ
         PAN4LpMfbTqE87Y1d00ll/bLBfQjkPJPJB4E/y9pwkW3CWMIvg6hkGETpwVq+4wj2+
         hwi99i6/d9zy34H/hBoX9RwijBu2Ki09i5VgFuwPGIUNCZH0yClIya3RW4Zus22nVR
         rPvulIZkL+T5Q==
Received: by mail-yb1-f170.google.com with SMTP id b82so22212401ybg.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Sep 2021 04:10:03 -0700 (PDT)
X-Gm-Message-State: AOAM532wIhGH1cL+EA9TB7wx/5I/3QEkLO3RHWvmeGC4RifAg4L/Y6ap
        p4rJUiXpngdhbWiTQKSrmI9lcUxpL8MBTgxk9Q4=
X-Google-Smtp-Source: ABdhPJy8RVrRCbeas9m6XZGk/kEPbEZHhRK2Zy0q4QomxKn7+uK2crxEubQQqdghLWsZMLygsi1XJDUOs3xxZdBPTGk=
X-Received: by 2002:a25:2a93:: with SMTP id q141mr18024189ybq.87.1632741002443;
 Mon, 27 Sep 2021 04:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <89888711-56BF-4E6C-92EE-2053E773B077@gmail.com>
In-Reply-To: <89888711-56BF-4E6C-92EE-2053E773B077@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Mon, 27 Sep 2021 13:09:50 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfUnLbhc6e_ccZxhVReV9jHsQ8aykkP=ghK-qURQLCdLA@mail.gmail.com>
Message-ID: <CAJKOXPfUnLbhc6e_ccZxhVReV9jHsQ8aykkP=ghK-qURQLCdLA@mail.gmail.com>
Subject: Re: BUG: Cannot boot Odroid XU4 from eMMC without this patch
To:     Christian Hewitt <christianshewitt@gmail.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 13 Sept 2021 at 06:32, Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> https://github.com/chewitt/linux/commit/8a4ebfb43a394e5dc5e9fafc92a50d5e8=
1a4f258
>
> If I boot any recent kernel without the above patch, the emmc module on t=
he XU4 is not detected, see:
>
> Without:
>
> [    3.227837] mmc0: tuning execution failed: -5
> [    3.231229] mmc0: error -5 whilst initialising MMC card
> [    3.536450] mmc0: tuning execution failed: -5
> [    3.539680] mmc0: error -5 whilst initialising MMC card
> [    3.794056] mmc0: tuning execution failed: -5
> [    3.794212] mmc0: error -5 whilst initialising MMC card
> [    4.111097] mmc0: tuning execution failed: -5
> [    4.115356] mmc0: error -5 whilst initialising MMC card
> [    4.426164] mmc0: tuning execution failed: -5
> [    4.429678] mmc0: error -5 whilst initialising MMC card
> [    4.756226] mmc0: tuning execution failed: -5
> [    4.760641] mmc0: error -5 whilst initialising MMC card
>
> With:
>
> [    3.305461] mmc0: new HS400 MMC card at address 0001
> [    3.307444] mmcblk0: mmc0:0001 8GME4R 7.28 GiB
> [    3.308132] mmcblk0boot0: mmc0:0001 8GME4R 4.00 MiB
> [    3.309172] mmcblk0boot1: mmc0:0001 8GME4R 4.00 MiB
> [    3.310255] mmcblk0rpmb: mmc0:0001 8GME4R 512 KiB, chardev (246:0)
> [    3.315963]  mmcblk0: p1 p2
>
> The patch is sourced from a Linux 5.4 patchset used by several retro gami=
ng distros for XU4 images shared in the HardKernel forums. I would be happy=
 to submit it, but the original patch has no description in the commit mess=
age. Not being a coding developer myself I cannot explain whether it is cor=
rect or what it=E2=80=99s doing to add one. All I can do is confirm that it=
 works, and is needed. SD card boot is not an issue.
>
> I=E2=80=99ve CC=E2=80=99d the original author (Marian) in case he remembe=
rs the patch and can comment. It would be good to get this upstream.

The patch might have sense but would require describing conditions -
what MMC input and output clock settings work and which do not work.
Also someone would need to test other Exynos5422 boards and other
Exynos with HS200 and HS400 support (Exynos5433, Exynos7). I think
this should not affect SD cards.

+Cc Marek, Sylwester, Jaehoon and Ulf.

Best regards,
Krzysztof
