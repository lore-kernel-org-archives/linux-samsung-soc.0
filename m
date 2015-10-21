From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v2 0/6] Switch to generic syscon regmap based drivers
Date: Wed, 21 Oct 2015 16:14:23 +0530
Message-ID: <56276C87.6040509@samsung.com>
References: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
 <CAGOxZ50G-ttivhVjbozUisA0HXcFz7bvRUuPR67xR88TTCa_wQ@mail.gmail.com>
 <CAGOxZ51_JPy51htzD_M_=qaPVUexkVhoA2ANLS2-rpK3QDT=8A@mail.gmail.com>
 <1606098.olLAyTIhB3@dell2.five-lan.de> <56272C1C.8040007@samsung.com>
 <562765F3.9010306@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60354 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751918AbbJUKx5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Oct 2015 06:53:57 -0400
In-reply-to: <562765F3.9010306@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, m.reichl@fivetechno.de, Alim Akhtar <alim.akhtar@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, kgene <kgene@kernel.org>, =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hi Javier,

On 10/21/2015 03:46 PM, Javier Martinez Canillas wrote:
> Hello Alim,
>
> On 10/21/2015 08:09 AM, Alim Akhtar wrote:
>
> [snip]
>
>>>>>>
>>>>>> Hi Alim,
>>>>>>
>>>>>> I have installed your patch set above with git am on top of
>>>>>> 4.3.0-rc6-00108-gce1fad2 torvalds/linux of today
>>>>>> with make exynos_defconfig on Odroid U3.
>>>>>>
>>>>> which exynos soc Odroid U3 uses?
>>>>>
>>>> OK, I can see its uses exynos4412 and exynos4412-odroidu3.dts does
>>>> include exynos4.dtsi,
>>>> so these should have worked.
>>>>
>>>>>> "halt -p" worked (power 0.0W).
>>>>>> "reboot" got stuck at 0.5W.
>>>>>>
>>>>> reboot stuck mean system does not reboot any more?
>>>
>>> It freezes when going for reboot.
>>> Have to power off/on to boot again.
>>>
>>> Btw I use an mmc, not an sd-card.
>>> No other HW connected, just LAN-cable.
>>> Bootloader is u-boot v2015.10.
>>> o
>> Have checked on 4.3.0-rc6-00006-gd03c139e7e77, still works on peach boards.
>> Sorry I don't have Odroid U3 with me, may be Javier or Krzysztof might help here to check whats wrong. To me its looks more of a board specific issue for now.
>>
>
> Krzysztof has an Odroid XU3 lite and I have an Odroid XU4, both uses an
> Exynos5422 so we can't check what's wrong with Odroid U3 (Exynos4412).
>
> Having said that I think I know what is the issue here. Markus said that
> he is using an eMMC instead of an uSD (which is what I used and my guess
> is that Krzysztof did too).
>
> Now, there is a subtle difference between the old PMU restart handler
> and the syscon-reboot one, and that is the restart handler priorities:
>
> notifier                    priority
> ------------------------------------
> pmu_restart_notify          128
> mmc_pwrseq_emmc_reset_nb    129
> syscon_restart_handle       192
>
> So, without Alim's patches, first the eMMC reset handler will be called
> and then the PMU restart handler but after his series, the syscon reset
> handler has a higher priority so the eMMC reset will never be called.
>
> But the problem is that the eMMC card has to be properly reset on system
> restart to allow the SoC iROM to be able to read the bootloader from the
> eMMC since the iROM doesn't have restart logic and the card shouldn't be
> left in an unknown state.
>
> So the problem here is not that the system is not being reset (that I
> think that works) but that on reboot, the system is not able to boot
> again since the ROM is not able to read the second stage bootloader.
>
Thanks for nailing it down, this make lots of sense and probably the 
main cause of Odroid U3 reboot failure.
I was going to suggest Markus to try a uSD boot. But looks like your 
suggested patch will do the trick for him.

> Markus,
>
> Can you please test following patch [0] on top of Alim's series? If that
> works then it should either be part of Alim's series or the patches will
> have to wait until that patch lands into mainline. I don't have an eMMC
> to test it in XU4 but I'm pretty confident that it will solve the issue.
>
I am fine with including this with my series or lowering 
syscon_restart_handler priority to 128.
It also make sense to increase eMMC priority as you suggested as before 
system reboot, devices should have reseted itself.
Thanks!


> Best regards,
>
