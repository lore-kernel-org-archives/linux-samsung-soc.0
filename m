From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] regulator: s2mps11: Added shutdown function to poweroff
 Odroid-XU3
Date: Tue, 14 Jul 2015 11:33:03 +0200
Message-ID: <55A4D74F.5060003@samsung.com>
References: <1435130188-4087-1-git-send-email-linux.amoon@gmail.com>
 <CAJKOXPewv=_aOjf=ot-n8hsE=FEmLzHGsafSQiRngLhMU2BjEg@mail.gmail.com>
 <CANAwSgQSXRojp-EU_djnQv7w+3OBGQ500T8t_-8SGHUko2GkjQ@mail.gmail.com>
 <CAJKOXPde5JivEEApNaGVHgLZfoK9qLWxa8hr-WASNwH00Rm_uw@mail.gmail.com>
 <CANAwSgThkgK9wsNLigsFrvw8U0gJqFdNVOMPkJ5-Sw+BYiQw_w@mail.gmail.com>
 <55A0CC61.7070204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:21492 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751999AbbGNJdH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jul 2015 05:33:07 -0400
In-reply-to: <55A0CC61.7070204@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hello,

On 2015-07-11 09:57, Krzysztof Kozlowski wrote:
> +CC Marek
>
>
> W dniu 11.07.2015 o 16:12, Anand Moon pisze:
>> Hi Krzysztof,
>>
>> On 24 June 2015 at 16:27, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
>>> 2015-06-24 19:32 GMT+09:00 Anand Moon <linux.amoon@gmail.com>:
>>>> Hi Krzysztof,
>>>>
>>>> On 24 June 2015 at 13:27, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
>>>>> 2015-06-24 16:16 GMT+09:00 Anand Moon <linux.amoon@gmail.com>:
>>>>>> Added .shutdown function to s2mps11 to help poweroff the board succefully.
>>>>> s/succefully/successfully/
>>>>>
>>>>>> The device drivers set the register to turn off the PMIC.
>>>>> Driver or drivers?
>>>>>
>>>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>>>>> ---
>>>>>> Changes fixes the poweroff
>>>>>> root@odroidxu3:~# poweroff
>>>>>>
>>>>>> Broadcast message from root@odroidxu3
>>>>>>          (/dev/ttySAC2) at 13:08 ...
>>>>>>
>>>>>> The system is going down for power off NOW!
>>>>>> root@odroidxu3:~# wait-for-state stop/waiting
>>>>>>   * Stopping rsync daemon rsync                                           [ OK ]
>>>>>>   * Stopping RDP Session manager                                          [ OK ]
>>>>>>   * Stopping NTP server ntpd                                              [ OK ]
>>>>>>   * Asking all remaining processes to terminate...                        [ OK ]
>>>>>>   * All processes ended within 1 seconds...                               [ OK ]
>>>>>> nm-dispatcher.action: Caught signal 15, shutting down...
>>>>>> ModemManager[2134]: <warn>  Could not acquire the 'org.freedesktop.ModemManager1' service name
>>>>>>
>>>>>> ModemManager[2134]: <info>  ModemManager is shut down
>>>>>>
>>>>>>   * Unmounting temporary filesystems...                                   [ OK ]
>>>>>>   * Deactivating swap...                                                  [ OK ]
>>>>>>   * Unmounting local filesystems...                                       [ OK ]
>>>>>>   * Will now halt
>>>>>> [  209.020280] reboot: Power down
>>>>>> [  209.122039] Power down failed, please power off system manually.
>>>>>> ---
>>>>>>   drivers/regulator/s2mps11.c | 8 ++++++++
>>>>>>   1 file changed, 8 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
>>>>>> index ff82811..871f7b8 100644
>>>>>> --- a/drivers/regulator/s2mps11.c
>>>>>> +++ b/drivers/regulator/s2mps11.c
>>>>>> @@ -1060,6 +1060,13 @@ out:
>>>>>>          return ret;
>>>>>>   }
>>>>>>
>>>>>> +static void s2mps11_pmic_shutdown(struct platform_device *pdev)
>>>>>> +{
>>>>>> +       struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
>>>>>> +
>>>>>> +       regmap_update_bits(iodev->regmap_pmic, S2MPS11_REG_CTRL1, 0xff, 0x00);
>>>>> This looks odd to me and interesting in the same time...
>>>>> 1. Why clearing all of the fields from the register? Don't you want to
>>>>> clear only one of it?
>>>> I have followed what the hardkernel source code point at this point.
>>>> I will look into which bit need to clear/set to power off successful.
>>> Following other tree is not enough, even when it solves some one
>>> problem. Drivers could be used on different boards, where hardkernel
>>> patches were not tested. This driver is used on many boards so please
>>> explain exactly what is the cause of problem, what have to be done and
>>> how patch achieves this. Such explanation helps understanding impact
>>> on other boards.
>>>
>>>>> 2. What exactly you want to do here? What is expected behaviour?
>>>> When you power off the board dose not power off cleanly.
>>>> [  209.122039] Power down failed, please power off system manually.
>>>>
>>>> After this changes Its power off the board. Leaving the board with
>>>> solid red led blowing.
>>> You described observable issue, which is nice, but I am asking for
>>> technical details. What exactly do you want to achieve here?
>>> Technically. What is expected behaviour. In technical details, not
>>> only observable. I am asking for these technical details not only
>>> because they are important but also because I do not know them.
>>>
>>>>> 3. How this relates to PWRHOLD coming from AP to the PMIC?
>>>> No Idea right now about this right now. but will update you it I have
>>>> some thing.
>>> The PMIC receives two signals - PWREN and PWRHOLD. It seems strange
>>> that PMIC must override PWRHOLD... maybe there is an issue in
>>> mach-exynos code?
>>>
>>>>> 4. Why this is needed only for this driver and only for this board (Odroid XU3)?
>>>> Yes It could be generic not specific for the Odroid XU3 will correct
>>>> in next patch.
>>> Thanks,
>>> Best regards,
>>> Krzysztof
>> I don't have much technical knowlegde on the arch side PMIC.
>>
>> Problem that I am trying to addressed is unclean shutdown. i.e. CPU is
>> still running in busy loop.
>> which leads external HDD not able to clean umount or power-off of the board.
>>
>> [   27.427485] reboot: Power down
>> [   27.529236] Power down failed, please power off system manually.
>>
>> My investigation lead to the following.
>> Reading the control register S2MPS11_REG_CTRL1 of s2mps11-pmic shown below.
>>
>> [   27.411231] s2mps11-pmic s2mps11-pmic: reg value
>> 16:00000000000000000000000000010000
> This means the PWRHOLD bit is high.
>
>> clearing the bit of the control register S2MPS11_REG_CTRL1 which lead
>> to proper shutdown of board.
>>
>> Please share you thought on this.
> The power off should be initiated from application processor, not PMIC.
> The AP should set PWRHOLD pin (XPSHOLD on AP) to low which will turn off
> the power.
>
> This works for other Exynos SoCs.
>
> Power off should not be performed by driver's shutdown callback because
> there is no guarantee that this is the last shutdown callback. Maybe
> other shutdowns would be executed after it?
>
> The power should go off from exynos_power_off() method in pmu.c. Please
> start with that. Why disabling PS_HOLD does not turn off the power?
>
>
> Marek (cc-ed), do you have any ideas why Odroid XU3 fails to power down?

I have no idea why XU3 doesn't power down. I think it should be safe to
implement reset handler in PMIC driver and do all needed stuff there instead
of device .shutdown callback.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
