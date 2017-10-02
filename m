From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/3] ARM: dts: exynos: Add support for Hardkernel's Odroid
 HC1 board
Date: Mon, 2 Oct 2017 08:44:53 +0200
Message-ID: <CAJKOXPek9ZOZaWzD=pP2pJDdKzmdF3ZQJLL=R-AVKOTMCEJyTQ@mail.gmail.com>
References: <1506684783-9722-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170929113314eucas1p250037030204ab9d0f936afa6f660923f@eucas1p2.samsung.com>
 <1506684783-9722-3-git-send-email-m.szyprowski@samsung.com>
 <20170930172320.trklynm33x2ra75g@kozik-lap> <5166bb0e-41f9-a010-70ae-161abb26382d@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750773AbdJBGo4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 02:44:56 -0400
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBFEB218C7
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Oct 2017 06:44:55 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id b189so4611761wmd.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Oct 2017 23:44:55 -0700 (PDT)
In-Reply-To: <5166bb0e-41f9-a010-70ae-161abb26382d@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Mon, Oct 2, 2017 at 8:34 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hi Krzysztof,
>
> On 2017-09-30 19:23, Krzysztof Kozlowski wrote:
>>
>> On Fri, Sep 29, 2017 at 01:33:02PM +0200, Marek Szyprowski wrote:
>>>
>>> Odroid HC1 board is based on Odroid XU4 board, but it has no HDMI,
>>> no eMMC, no build-in USB3.0 hub, no extension port pins, and no GPIO
>>> button. USB3.0 ports are used for build-in JMicron USB to SATA bridge
>>> and Gigabit R8152 ethernet chips. HC1 uses only passive cooling.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   arch/arm/boot/dts/Makefile                         |   1 +
>>>   arch/arm/boot/dts/exynos5422-odroid-core.dtsi      | 443
>>> +++++++++++++++++++++
>>>   arch/arm/boot/dts/exynos5422-odroidhc1.dts         | 217 ++++++++++
>>>   arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 428
>>> +-------------------
>>
>> Please experiment with -M (maybe -M20%?) and -B so this would be
>> detected as rename. It might create much simpler patch thus making the
>> review easy (one could see that the changes are just movements).
>
>
> I didn't manage to generate different patch with those options. I have
> however checked that odroidxu3/xu3-lite/xu4 dtbs are exactly the same after
> applying this patch (using dtx_diff tool).

Then it looks like the same issue as here:
http://lists.infradead.org/pipermail/linux-arm-kernel/2017-January/477315.html

You are using some ancient git (v1.9.1) which was released more than
three years ago. March 2014. As Andi pointed in that thread - he had
no problems with -M and -B on newer version.

Same DTBS are good but it might not catch everything. For example any
change in formatting or name of labels (not leading to functional
change) will not be detected.

Best regards,
Krzysztof
