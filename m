From: Kevin Hilman <khilman@kernel.org>
Subject: Re: exynos5420/arndale-octa: imprecise external aborts on exynos_defconfig
Date: Fri, 31 Oct 2014 10:41:50 -0700
Message-ID: <CAMAWPa8ofYCWJdzHt3_xM8SskZy09-OYDsRx5JjA5RmADfpcMQ@mail.gmail.com>
References: <CANMBJr41TQx4jVjnOO9WThn=SiZCq12mx1xtGN8_ubzZrO1=YA@mail.gmail.com>
	<7h7g1bwbyh.fsf@deeprootsystems.com>
	<CAJuA9ahkpZ4EJQz4DoAjYzo0OQw5zXLavAVoXRBdgPcm9EUQYA@mail.gmail.com>
	<7hk351ep8e.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:48672 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752780AbaJaRl6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 13:41:58 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 0DA582010B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2014 17:41:57 +0000 (UTC)
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com [209.85.215.44])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BE6072013A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2014 17:41:53 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id gf13so6665543lab.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2014 10:41:50 -0700 (PDT)
In-Reply-To: <7hk351ep8e.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Thomas Abraham <ta.omasab@gmail.com>, Tyler Baker <tyler.baker@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Sep 17, 2014 at 5:39 PM, Kevin Hilman <khilman@kernel.org> wrote:
> Thomas Abraham <ta.omasab@gmail.com> writes:
>
>> On Thu, Sep 11, 2014 at 12:16 AM, Kevin Hilman <khilman@kernel.org> wrote:
>>> Tyler Baker <tyler.baker@linaro.org> writes:
>>>
>>>> Exynos5420-based Arndale octa boards have recently started failing boot
>>>> tests due to imprecise external aborts.  This only appears to happen
>>>> when using exynos_defconfig and boots fine with multi_v7_defconfig.  The
>>>> issue seems to be intermittent, so is not reliably reproducable and
>>>> difficult to bisect.  Here are a few boot logs from recent
>>>> mainline/linux-next kernels that are failing:
>>>
>>> FYI, I'm seeing the same periodic aborts.  For example, here's my boot
>>> of next-20140910:
>>> http://images.armcloud.us/kernel-ci/next/next-20140910/arm-exynos_defconfig/boot-exynos5420-arndale-octa.html
>>>
>>> However, my userspace is much simpler and doesn't seem to cause a panic,
>>> so my boot tests report passing. (I should fixup my scripts so these
>>> imprecise aborts are reported as a FAIL.)
>>>
>>> I'm glad you pointed out that it happens only with exynos_defconfig and
>>> not multi_v7_defconfig because I noticed that too.  I haven't had the
>>> time to track it any further than that, so maybe the exynos folks can
>>> help track it down from here.
>>>
>>> Thanks for reporting this,
>>>
>>> Kevin
>>
>> Hi Tyler, Kevin,
>>
>> From the bootlog you have shared,
>>
>> [    1.060016] CPU4: failed to come online
>> [    2.070031] CPU5: failed to come online
>> [    3.080049] CPU6: failed to come online
>> [    4.090066] CPU7: failed to come online
>> [    4.090099] Brought up 4 CPUs
>> [    4.090109] SMP: Total of 4 processors activated.
>> [    4.090119] CPU: WARNING: CPU(s) started in wrong/inconsistent
>> modes (primary CPU mode 0x13)
>> [    4.090128] CPU: This may indicate a broken bootloader or firmware.
>>
>> Would it be possible to set max cpus to 1, disable switcher and try
>> again. I don't have a arndale octa board but I have tested mainline
>> kernel with smdk5420 board. It boots all eight CPUs, switcher works
>> fine and there are no imprecise aborts seen.
>
> Sorry for the delay, I'm travelling this week.
>
> FWIW, the same CPU boot failures you hilight above are happening on
> multi_v7_defconfig[1] which is not getting the imprecise abort.  This is
> only happening on exynos_defconfig[2], so I'm curious why you think the
> switcher or NR_CPUS might be the issues.
>
> Anyways, I narrowed this down a bit and discovered it's
> CONFIG_EXYNOS5420_MCPM=y that's the root cause.  If I use
> exynos_defconfig and then disable that option, I don't get any more
> imprecise aborts.

These imprecise aborts are still happening, and preventing running
full userspace.

I'm going to send a patch to disable this CONFIG_EXYNOS5420_MCPM until
someone can figure out what's going on.

Kevin
