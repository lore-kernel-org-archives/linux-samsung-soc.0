From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH] regulator: s2mps11: Added shutdown function to poweroff Odroid-XU3
Date: Wed, 24 Jun 2015 16:02:42 +0530
Message-ID: <CANAwSgQSXRojp-EU_djnQv7w+3OBGQ500T8t_-8SGHUko2GkjQ@mail.gmail.com>
References: <1435130188-4087-1-git-send-email-linux.amoon@gmail.com> <CAJKOXPewv=_aOjf=ot-n8hsE=FEmLzHGsafSQiRngLhMU2BjEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPewv=_aOjf=ot-n8hsE=FEmLzHGsafSQiRngLhMU2BjEg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 24 June 2015 at 13:27, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
> 2015-06-24 16:16 GMT+09:00 Anand Moon <linux.amoon@gmail.com>:
>> Added .shutdown function to s2mps11 to help poweroff the board succefully.
>
> s/succefully/successfully/
>
>> The device drivers set the register to turn off the PMIC.
>
> Driver or drivers?
>
>>
>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>> ---
>> Changes fixes the poweroff
>> root@odroidxu3:~# poweroff
>>
>> Broadcast message from root@odroidxu3
>>         (/dev/ttySAC2) at 13:08 ...
>>
>> The system is going down for power off NOW!
>> root@odroidxu3:~# wait-for-state stop/waiting
>>  * Stopping rsync daemon rsync                                           [ OK ]
>>  * Stopping RDP Session manager                                          [ OK ]
>>  * Stopping NTP server ntpd                                              [ OK ]
>>  * Asking all remaining processes to terminate...                        [ OK ]
>>  * All processes ended within 1 seconds...                               [ OK ]
>> nm-dispatcher.action: Caught signal 15, shutting down...
>> ModemManager[2134]: <warn>  Could not acquire the 'org.freedesktop.ModemManager1' service name
>>
>> ModemManager[2134]: <info>  ModemManager is shut down
>>
>>  * Unmounting temporary filesystems...                                   [ OK ]
>>  * Deactivating swap...                                                  [ OK ]
>>  * Unmounting local filesystems...                                       [ OK ]
>>  * Will now halt
>> [  209.020280] reboot: Power down
>> [  209.122039] Power down failed, please power off system manually.
>> ---
>>  drivers/regulator/s2mps11.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
>> index ff82811..871f7b8 100644
>> --- a/drivers/regulator/s2mps11.c
>> +++ b/drivers/regulator/s2mps11.c
>> @@ -1060,6 +1060,13 @@ out:
>>         return ret;
>>  }
>>
>> +static void s2mps11_pmic_shutdown(struct platform_device *pdev)
>> +{
>> +       struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
>> +
>> +       regmap_update_bits(iodev->regmap_pmic, S2MPS11_REG_CTRL1, 0xff, 0x00);
>
> This looks odd to me and interesting in the same time...
> 1. Why clearing all of the fields from the register? Don't you want to
> clear only one of it?

I have followed what the hardkernel source code point at this point.
I will look into which bit need to clear/set to power off successful.

> 2. What exactly you want to do here? What is expected behaviour?

When you power off the board dose not power off cleanly.
[  209.122039] Power down failed, please power off system manually.

After this changes Its power off the board. Leaving the board with
solid red led blowing.

> 3. How this relates to PWRHOLD coming from AP to the PMIC?

No Idea right now about this right now. but will update you it I have
some thing.

> 4. Why this is needed only for this driver and only for this board (Odroid XU3)?

Yes It could be generic not specific for the Odroid XU3 will correct
in next patch.

-Anand Moon
>
> Best regards,
> Krzysztof
