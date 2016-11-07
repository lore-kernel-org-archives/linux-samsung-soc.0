From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/4] ARM: EXYNOS: Remove smp_init_cpus hook from platsmp.c
Date: Mon, 7 Nov 2016 08:59:52 +0200
Message-ID: <CAJKOXPfuN7sdj+C=ccb18TspS_QmvJF-OS1keBsXt8a4w51TUg@mail.gmail.com>
References: <1478230764-13748-1-git-send-email-pankaj.dubey@samsung.com>
 <1478230764-13748-2-git-send-email-pankaj.dubey@samsung.com>
 <CGME20161105154127epcas1p1316e4c558b8442426db131ce7bb87bd2@epcas1p1.samsung.com>
 <20161105154119.GA8183@kozik-lap> <581FF706.3050502@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:60856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750717AbcKGG74 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 01:59:56 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
        by mail.kernel.org (Postfix) with ESMTP id 9D4FE20211
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Nov 2016 06:59:54 +0000 (UTC)
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com [209.85.214.45])
        (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57509200EC
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Nov 2016 06:59:53 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id u205so108769140itc.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Nov 2016 22:59:53 -0800 (PST)
In-Reply-To: <581FF706.3050502@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "pankaj.dubey" <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene@kernel.org, thomas.ab@samsung.com

On Mon, Nov 7, 2016 at 5:37 AM, pankaj.dubey <pankaj.dubey@samsung.com> wrote:
> Hi Krzysztof,
>
> On Saturday 05 November 2016 09:11 PM, Krzysztof Kozlowski wrote:
>> On Fri, Nov 04, 2016 at 09:09:21AM +0530, Pankaj Dubey wrote:
>>> We can safely remove exynos_smp_init_cpus() hook from mach-exynos/platsmp.c,
>>> as all SMP platforms in mach-exynos can rely on DT for CPU core description
>>> instead of determining number of cores from the SCU.
>>>
>>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>>> ---
>>>  arch/arm/mach-exynos/platsmp.c | 31 -------------------------------
>>>  1 file changed, 31 deletions(-)
>>>
>>
>>
>> Thanks, applied. Somehow your patchset did not reach linux-samsung-soc's
>> Parchwork. I don't have a clue why... It is on linux-arm-kernel's
>> Patchwork.
>>
>
> Thanks for looking into this series.
>
> I am also not sure why its not reflecting for you on linux-samsung-soc's
> Patchwork, but I can see this series in linux-samsung-soc Patchwork at
> below links:

Hmmm... it is weird. Why I didn't see them before? It seems that I
even updated their status. Confusing...


> Will you please review other two patches (3/4 and 4/4) in this series?

4/4 is okay but it depends on 3/4 which already has a valid comment -
what will happen when DT node is not present (which first of all will
happen because DTS is applied on separate branch... and anyway the
code must be prepared for different DTSes). Initially I thought there
will be NULL pointer exception on of_iomap() but after looking at the
code it might work, I mean fail in a reasonable way.

Best regards,
Krzysztof
