From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: Enable RTC node in exynos4.dtsi file
Date: Fri, 20 Dec 2013 23:07:25 +0100
Message-ID: <CA+Ln22FJe21ud8fdOVAy_-Vsmo5-+NifOw-3cPDHmoheDP+XAw@mail.gmail.com>
References: <1382438215-13215-1-git-send-email-sachin.kamat@linaro.org>
	<2781292.vINFB8v7mM@flatron>
	<CAK9yfHwgCkFZV7pE3t2pu7xYnvCD8DErgZTJPyDVQcE+s57pvA@mail.gmail.com>
	<10362116.E9jFDHDWMM@amdc1227>
	<52B4BB29.7070600@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:41780 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751904Ab3LTWH1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 17:07:27 -0500
In-Reply-To: <52B4BB29.7070600@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@secretlab.ca>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>

2013/12/20 Kukjin Kim <kgene.kim@samsung.com>:
> On 12/19/13 00:55, Tomasz Figa wrote:
>>
>> On Tuesday 10 of December 2013 14:37:13 Sachin Kamat wrote:
>>>
>>> On 13 November 2013 17:51, Tomasz Figa<tomasz.figa@gmail.com>  wrote:
>>>>
>>>> On Wednesday 13 of November 2013 12:52:05 Bartlomiej Zolnierkiewicz
>>>> wrote:
>>>>
>>>> [+ DT maintainers]
>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>> On Wednesday, November 13, 2013 11:27:03 AM Sylwester Nawrocki wrote:
>>>>>>
>>>>>> On 13/11/13 09:08, Tomasz Figa wrote:
>>>>>>>>
>>>>>>>> As was discussed earlier too, status field of DT node is not
>>>>>>>> supposed
>>>>>>>>>
>>>>>>>>> to be used for
>>>>>>>>> keeping an IP enabled or disabled. That should be done via the
>>>>>>>>> kernel
>>>>>>>>> config. The DT status
>>>>>>>>> is mostly to indicate the hardware status of the IP on the
>>>>>>>>> SoC/board.
>>>>>>>>> If the node fully defines the hardware,
>>>>>>>>> then it should be kept enabled by default unless such enabling
>>>>>>>>> causes
>>>>>>>>> some issues with other IPs due to
>>>>>>>>> pin sharing conflicts, etc. In the above case the node completely
>>>>>>>>> defines the hardware and hence there is no
>>>>>>>>> reason to keep it disabled.
>>>>>>>
>>>>>>>
>>>>>>> That's correct. (Unless I'm missing some board specific dependency of
>>>>>>> RTC.
>>>>>>> If so, please correct me.)
>>>>
>>>>
>>>> Well, I was missing one indeed. RTC requires an external 32.768KHz
>>>> clock,
>>>> which must be provided by an oscillator or any other clock source on the
>>>> board. However...
>>>>
>>>>>>
>>>>>> I don't really like this argument. Why not allow the firmware to
>>>>>> decide
>>>>>> which devices are relevant and should be handled by the kernel ?
>>>>>> And since we are aiming at single kernel config, if I understand
>>>>>> things
>>>>>> correctly, I can't see anything else than dts that could hold the
>>>>>> machine
>>>>>> *configuration*.
>>>>>>
>>>>>> So let's not make all stuff enabled by default, that's not something
>>>>>> we
>>>>>> want on those mobile device SoCs. We should not be making fine system
>>>>>> tuning more difficult than necessary.
>>>>>>
>>>>>> I'm with Kukjin on this matter and would prefer patches like the
>>>>>> $subject
>>>>>> patch not be merged.
>>>>>
>>>>>
>>>>> I generally agree with Sylwester and Kukjin that devices should not be
>>>>> enabled by default in dtsi files.  However in a particular case of RTC
>>>>> support there should be an exception from the generic rule and RTC
>>>>> should be enabled for all EXYNOS boards (we have RTC driver config
>>>>> option already enabled in our exynos_defconfig and we are also already
>>>>> enabling RTC device explicitly in EXYNOS5250 dtsi file).
>>>>
>>>>
>>>> I believe the rule is clear and we already went through enough
>>>> discussion
>>>> about this. To clarify again:
>>>>
>>>> Device Tree should not restrict possible use cases of particular
>>>> hardware
>>>> that are allowed by particular integration of such hardware on
>>>> particular
>>>> board. This means that if there are no technical reasons to mark such
>>>> hardware as disabled on particular board, this should not be done. Let
>>>> me show you this on several examples:
>>>>
>>>> 1. SoC X has an MMC controller, which needs N pins of the SoC to be
>>>> routed to an MMC slot. Our board X1 does _not_ have necessary traces on
>>>> its PCB. In this case the MMC controller must be marked as disabled.
>>>>
>>>> 2. SoC X has an MMC controller, which needs N pins of the SoC to be
>>>> routed to an MMC slot. Our board X2 _does_ have necessary traces on its
>>>> PCB, so when user inserts an MMC card into the slot he expects that the
>>>> system detects it. In this case the MMC controller must _not_ be marked
>>>> as disabled.
>>>>
>>>> 3. SoC X has a built-in 2D graphics accelerator. It does not have any
>>>> output pads nor any requirements with respect to the board - it's purely
>>>> a mem-to-mem device. A user might want to run a rootfs that uses it to
>>>> accelerate his applications, so this device must _not_ be marked as
>>>> disabled.
>>>>
>>>> 4. SoC X has a image processing block, consisting of two functions:
>>>>   - a camera interface, that requires SoC pads to be connected to a
>>>> camera
>>>>     sensor,
>>>>   - general-purpose image scaler and format converter, that can operate
>>>>     either on input of camera interface or on images stored in memory.
>>>> This case is more interesting. Even if board does not have a physical
>>>> camera interface, the binding should be designed in a way that allows
>>>> enabling only the memory-to-memory scaler. Then such IP must be marked
>>>> okay regardless of board support, because the camera interface will be
>>>> used only if relevant board-specific properties are provided.
>>>>
>>>> To sum up, I would not interpret the "disabled" value of "status"
>>>> property
>>>> as the opposite of "enabled", but rather as "disabled" in "disabled
>>>> person".
>>>>
>>>> Anyway, I'd like to get a confirmation (or denial) from other Device
>>>> Tree
>>>> maintainers and if what I've written above is correct, maybe we should
>>>> put this somewhere in kernel documentation.
>>>
>>>
>>> Ping..
>>>
>>> In the absence of kernel documentation formulating the guidelines for
>>> enabling/disabling
>>> of IP (nodes), the current code should be the reference for someone
>>> doing this for a given
>>> platform. However, the current code (Exynos DT files) itself is not
>>> consistent one way or the
>>> other w.r.t to the above points. For e.g. commit 73784475febf ("ARM:
>>> dts: Update the "status"
>>> property of RTC DT node for Exynos5250 SoC") does the exact same thing
>>> done by this patch.
>>> Similarly in exynos5420.dtsi. I am sure there are other similar
>>> examples as well. I think there should be
>>> one consistent guideline, atleast for accepting patches of this nature
>>> (for this platform).
>>
>>
>> Yes, there should be a document somewhere describing such guidelines.
>> I believe it's already being written by some people, though.
>> (Mark, Stephen?)
>>
>> For this patch alone and earlier patches doing the same, we missed the
>> fact that some boards might not have RTC xtal, so RTC shouldn't really be
>> enabled by default. This isn't really anything that can't be changed
>> later, though, and I believe we should make this consistent for all Exynos
>> SoC dtsi files.
>>
>
> Yes, we need to make a common rule about that for exynos stuff and I think
> we could do for 3.15... from maybe mid of Jan...

Hmm, I think most of the devices follow the convention already. We can
recheck for any inconsistencies again, though.

By the way, Merry Christmas.

Best regards,
Tomasz
