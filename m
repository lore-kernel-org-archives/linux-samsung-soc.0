From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: exynos4412: misc issues on Hardkernel Odroid boards
Date: Tue, 17 Feb 2015 14:24:11 +0100
Message-ID: <CAJKOXPcSRjO__ywh0QVDex8zKZ2FEvgCt4JsPs78_kHzCtqZBA@mail.gmail.com>
References: <54D779FB.9070306@math.uni-bielefeld.de>
	<54D86913.2050109@samsung.com>
	<54DF9089.8050204@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f179.google.com ([209.85.220.179]:32818 "EHLO
	mail-vc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754828AbbBQNYM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Feb 2015 08:24:12 -0500
Received: by mail-vc0-f179.google.com with SMTP id hy4so12556331vcb.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Feb 2015 05:24:11 -0800 (PST)
In-Reply-To: <54DF9089.8050204@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

2015-02-14 19:14 GMT+01:00 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:
> Hello!
>
> Marek Szyprowski wrote:
>>> 4) Spinlock BUGs triggered by the sdhci subsystem (so for the people
>>> using the system with a SD card). This is also a known problem, I think
>>> first mentioned here:
>>> http://www.spinics.net/lists/linux-mmc/msg27277.html
>>> Currently fixing this with this patch:
>>> https://github.com/tobiasjakobi/linux-odroid/commit/abc749843dd7022d01322dca3db0181211a30cd8
>>>
>>
>> The fix for this issue has been queued to mmc-next:
>> https://git.linaro.org/people/ulf.hansson/mmc.git/commit/017210d1c0dc2e2d3b142985cb31d90b98dc0f0f
> This fix doesn't work for me. I have it applied, but encountered this
> just now:
>
> [   33.159544] BUG: scheduling while atomic: mmcqd/0/789/0x00000002
> [   33.159558] Modules linked in: bridge stp llc bnep btrfs xor xor_neon
> zlib_inflate zlib_deflate raid6_pq ecb btusb bluetooth usb_storage
> [   33.159625] Preemption disabled at:[<c037de64>]
> sdhci_do_set_ios+0x24/0x6a0

Looking at the backtrace this seems very likely however I have
troubles reproducing this. Any special tree or config is required
(except MMC_CLKGATE and DEBUG_ATOMIC_SLEEP)?

Best regards,
Krzysztof
