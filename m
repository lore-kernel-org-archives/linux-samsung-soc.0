From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: exynos5800-peach-pi: suspend/resume (still) broken
Date: Fri, 20 Mar 2015 18:52:48 +0100
Message-ID: <550C5E70.30009@collabora.co.uk>
References: <CAMAWPa_r04tAXAXosmLk+DfwvQV0qpD+=8O7T_pwFTAozcjOgQ@mail.gmail.com>	<550953ED.10508@collabora.co.uk>	<CAM4voakvhHuVXLY2DmdGexfrqSYUqhXhg1krLwO4CCxjHQ1NCw@mail.gmail.com>	<550C47ED.3010301@collabora.co.uk>	<CAM4voamLt=6dSY-DwDb+c=KRwDWAvjvzUUnno+=+1svDqf41Qg@mail.gmail.com> <CAM4voanUg87=Ya6azGCRz8r2=WJ0wi4ktqdn6GD6ULJsnLUMmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:58227 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751127AbbCTRw4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Mar 2015 13:52:56 -0400
In-Reply-To: <CAM4voanUg87=Ya6azGCRz8r2=WJ0wi4ktqdn6GD6ULJsnLUMmw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: Kevin Hilman <khilman@deeprootsystems.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vikas Sajjan <vikas.sajjan@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pankaj Dubey <pankaj.dubey@samsung.com>

Hello Abhilash,

On 03/20/2015 06:40 PM, Abhilash Kesavan wrote:
>>
>> I have made some progress on this. This is the current state:
>>
>> If I use next-20141114 (which was when the S2R code first appeared in
>> linux-next), then all is good. next-20141117 is fine too but things
>> are broken in next-20141118.
>> I have narrowed it down to the commit: "ae43b32 ARM: 8202/1:
>> dmaengine: pl330: Add runtime Power Management support v12". The only
>> way I see this impacting s2r is because it disables the dma pclk while
>> suspending or before.
>>
>> Checking further, will update in a bit.
> 
> OK, so disabling the mdma0 node in "arch/arm/boot/dts/exynos5420.dtsi"
> gets things working. Like Kevin mentioned in the initial report, I
> need to disable DRM else there is a crash while suspending. With these
> two changes, on linus' tree and kgene's for-next s2r works fine.
>

Awesome, thanks a lot for digging this out!
 
> On linux-next, I need to disable CONFIG_MWIFIEX too.
> 

Yes, I also saw that issue with mwfiex when suspend-to-idle (which works
in -next) due the MMC_PM_KEEP_POWER flag being set in the host pm caps.
But I don't see that being set in the host driver.

> Also, I observe cros-ec-spi transfer failures during resume and
> sometimes it is unable to re-enable the tps fets causing a crash.
> However, that would be a driver specific issue.
> 

Indeed, I can take a look to that issue as well.

> Regarding the mdma0 disablement, it looks like for the system to
> suspend properly the mdma0 pclk needs to stay on.
>

It seems so, I remember we had other issues with the mentioned commit
due clocks being gated. For example the mau_epll clock that was needed
to access the audss block registers and caused a boot hang on Exyos5420.

That specific issue was fixed by f1e9203e2366 ("clk: samsung: Fix Exynos
5420 pinctrl setup and clock disable failure due to domain being gated")
which solves it by enabling the mau_epll on probe.
 
> Regards,
> Abhilash
>>>

Best regards,
Javier
