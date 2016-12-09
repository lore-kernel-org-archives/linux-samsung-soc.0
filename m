From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: mainline boot: 179 boots: 1 failed, 168 passed with 10 offline (v4.9-rc8-78-g318c8932ddec)
Date: Fri, 09 Dec 2016 15:03:16 -0800
Message-ID: <m2h96caeob.fsf@baylibre.com>
References: <5849e989.0209c20a.75a7.6441@mx.google.com>
        <m2shpyarc8.fsf@baylibre.com> <20161209125802.GA4229@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:33443 "EHLO
        mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751987AbcLIXDS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2016 18:03:18 -0500
Received: by mail-pf0-f180.google.com with SMTP id d2so5313549pfd.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Dec 2016 15:03:18 -0800 (PST)
In-Reply-To: <20161209125802.GA4229@kozik-lap> (Krzysztof Kozlowski's message
        of "Fri, 9 Dec 2016 14:58:02 +0200")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "kernelci.org bot" <bot@kernelci.org>, kernel-build-reports@lists.linaro.org, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On Thu, Dec 08, 2016 at 04:17:27PM -0800, Kevin Hilman wrote:
>> + Exynos maintainers (for new regresion on exynos5250-snow)
>> 
>> kernelci.org bot <bot@kernelci.org> writes:
>> 
>> > mainline boot: 179 boots: 1 failed, 168 passed with 10 offline (v4.9-rc8-78-g318c8932ddec)
>> >
>> > Full Boot Summary: https://kernelci.org/boot/all/job/mainline/kernel/v4.9-rc8-78-g318c8932ddec/
>> > Full Build Summary: https://kernelci.org/build/mainline/kernel/v4.9-rc8-78-g318c8932ddec/
>> >
>> > Tree: mainline
>> > Branch: local/master
>> > Git Describe: v4.9-rc8-78-g318c8932ddec
>> > Git Commit: 318c8932ddec5c1c26a4af0f3c053784841c598e
>> > Git URL: http://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> > Tested: 57 unique boards, 21 SoC families, 29 builds out of 207
>> >
>> > Boot Regressions Detected:
>> >
>> > arm:
>> >
>> >     multi_v7_defconfig+CONFIG_SMP=n:
>> >         exynos5250-snow:
>> >             lab-collabora: new failure (last pass: v4.9-rc8-51-gbc3913a5378c)
>> >
>> > Boot Failure Detected:
>> >
>> > arm:
>> >
>> >     multi_v7_defconfig+CONFIG_SMP=n
>> >         exynos5250-snow: 1 failed lab
>
> Nothing was happening recently around Exynos code (at least mach/dts).
> Was the 318c8932ddec5c1c26a4af0f3c053784841c598e pointed out by bisect?

The bisect[1] pointed to this, but that doesn't smell right, and I
wasn't able to dig into it any further:

2513940989fa2c56d0aeb4f5792d22804d92ab4c is the first bad commit
commit 2513940989fa2c56d0aeb4f5792d22804d92ab4c
Author: Michael Ellerman <mpe@ellerman.id.au>
Date:   Fri Nov 25 09:45:28 2016 +1100

Full bisect log is here[1].

Kevin

[1] https://ci.linaro.org/view/people/job/tbaker-boot-bisect-bot/171/console
