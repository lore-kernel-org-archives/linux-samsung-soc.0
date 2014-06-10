From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: EXYNOS: mcpm: Don't rely on firmware's secondary_cpu_start
Date: Tue, 10 Jun 2014 08:21:59 -0700
Message-ID: <CAD=FV=V5_RRNkgA7Rk7XbQw9m1qh6-RJA8arW7ZRU=QbWAPa+w@mail.gmail.com>
References: <1402090985-8061-1-git-send-email-dianders@chromium.org>
	<20140607181221.GB25068@e102568-lin.cambridge.arm.com>
	<CAD=FV=X17PeJ6JPE9Qyc1QT07AvA2PTE69Q87gz9a6MdUHgi4A@mail.gmail.com>
	<20140609223831.GB16889@e102568-lin.cambridge.arm.com>
	<CANuQgHHxAhTNYX-JAEdRkO=PMYT4A5GwXcuQfiqwE0CEkQyR+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f172.google.com ([209.85.220.172]:61220 "EHLO
	mail-vc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750809AbaFJPWA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 11:22:00 -0400
Received: by mail-vc0-f172.google.com with SMTP id hy10so2590661vcb.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2014 08:21:59 -0700 (PDT)
In-Reply-To: <CANuQgHHxAhTNYX-JAEdRkO=PMYT4A5GwXcuQfiqwE0CEkQyR+w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Kukjin Kim <kgene.kim@samsung.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Inderpal Singh <inderpal.s@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, "olof@lixom.net" <olof@lixom.net>, Tushar Behera <trblinux@gmail.com>, Kevin Hilman <khilman@linaro.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Chander,

On Tue, Jun 10, 2014 at 1:12 AM, Chander Kashyap
<chander.kashyap@linaro.org> wrote:
> On 10 June 2014 04:08, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> wrote:
>> On Mon, Jun 09, 2014 at 06:03:31PM +0100, Doug Anderson wrote:
>>
>> [...]
>>
>>> Cold boot and resume from suspend are detected via various special
>>> flags in various special locations.  Resume from suspend looks at
>>> INFORM1 (0x10048004) for flags.  This register is 0 during a cold boot
>>> and has special values set by the kernel at resume time.
>>>
>>> It also looks as if some code looks at 0x10040900 (PMU_SPARE0) to help
>>> tell initial cold boot and secondary CPU bringup.
>>
>> Ok, thanks a lot. It looks like firmware paths should be ready to
>> detect cold vs warm boot, and hopefully do not rely on a specific
>> MPIDR to come up first out of power states.
>>
>>> > I am asking to check if on this platform CPUidle (where the notion of
>>> > primary CPU disappears) has a chance to run properly.
>>>
>>> I believe it should be possible, but we don't have CPUidle implemented
>>> in our current system.  Abhilash may be able to comment more.
>>
>
> Cpuidle is implemented for exynos5420, and is tested on chromebook.

My S-state knowledge is not strong, but I believe that Lorenzo's
questions matter if we're using S2 for CPUidle (where we actually turn
off power and hot unplug CPUs) but not when we're using S1 for CPUidle
(where we just enter WFI/WFE).

I believe that in ChromeOS we use S1 CPUidle and that it works fine.
We've never implemented S2 that I'm aware of.

-Doug
