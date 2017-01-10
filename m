From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v7 3/4] drm/panel: Add support for S6E3HA2 panel driver on
 TM2 board
Date: Tue, 10 Jan 2017 10:15:52 +0900
Message-ID: <587435C8.2040901@samsung.com>
References: <1483611609-23522-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170105102012epcas1p4ddeb577ea84b5c2cdf7029666b2091c1@epcas1p4.samsung.com>
 <1483611609-23522-4-git-send-email-hoegeun.kwon@samsung.com>
 <20170106052239.5prkyj3v4x4qcc46@gangnam.samsung>
 <586F2BF3.8080400@samsung.com>
 <20170106081806.h4y7o57kjbibau6l@gangnam.samsung>
 <586F5728.1010800@samsung.com>
 <5df95abe-0d5d-0c48-2840-5996260201de@samsung.com>
 <587355B8.2050701@samsung.com>
 <aeab26bc-76a8-0b4d-b5b9-b8602fcf2eb3@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <aeab26bc-76a8-0b4d-b5b9-b8602fcf2eb3@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Andi Shyti <andi.shyti@samsung.com>
Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>, robh@kernel.org, thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, jh80.chung@samsung.com, Donghwa Lee <dh09.lee@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org



2017년 01월 09일 18:53에 Andrzej Hajda 이(가) 쓴 글:
> On 09.01.2017 10:19, Inki Dae wrote:
>>
>> 2017년 01월 09일 16:37에 Andrzej Hajda 이(가) 쓴 글:
>>> On 06.01.2017 09:36, Inki Dae wrote:
>>>> 2017년 01월 06일 17:18에 Andi Shyti 이(가) 쓴 글:
>>>>> Hi Inki,
>>>>>
>>>>> Thanks for the reply, but...
>>>>>
>>>>>>>> +static const struct drm_display_mode default_mode = {
>>>>>>>> +	.clock = 222372,
>>>>>>>> +	.hdisplay = 1440,
>>>>>>>> +	.hsync_start = 1440 + 1,
>>>>>>>> +	.hsync_end = 1440 + 1 + 1,
>>>>>>>> +	.htotal = 1440 + 1 + 1 + 1,
>>>>>>>> +	.vdisplay = 2560,
>>>>>>>> +	.vsync_start = 2560 + 1,
>>>>>>>> +	.vsync_end = 2560 + 1 + 1,
>>>>>>>> +	.vtotal = 2560 + 1 + 1 + 15,
>>>>>>>> +	.vrefresh = 60,
>>>>>>>> +	.flags = 0,
>>>>>>>> +};
>>>>>>> how is this working with tm2e? Are these values valid for both
>>>>>>> the boards?
>>>>>> We don't need to consider tm2e board with two reasones,
>>>>>> 1. there is no tm2e board support in mainline
>>>>>> 2. the panel on tm2 would be a little bit different from one on tm2e
>>>>> ... this display in the Tizen Kernel is supported by both:
>>>>> tm2 [1] and tm2e [2]. The only differences are:
>>>> Why tm2e dts file is in mainline? Seems communication miss with Chanwoo. :( 
>>>>
>>>>> TM2:
>>>>>    clock-frequency = <14874444>;
>>>>>    hactive = <1440>;
>>>>>
>>>>> TM2E:
>>>>>    clock-frequency = <16523724>;
>>>>>    hactive = <1600>;
>>>>>
>>>>> I don't know much about the differences you mention in point 2,
>>>>> but it's a pity to drop support only because we don't want to put
>>>>> in the dts the 'hactive', and 'clock-frequency' properties.
>>>> Anyway, tm2e board is already in mainline so Panel driver may need to identify what kinds of panel is probed to decide porch values. I think there are relevant registers in MCU of the Panel device to check version or similar thing.
>>> I think we can safely use different compatible string for tm2e - it uses
>>> different display IC controller - s6e3hf2, driver will provide timings
>>> based on it.
>> Using compatable string wouldn't be a good idea because Panel is a device not specific to board.
> 
> But both panels are different devices:
> TM2 has: AMS567DJ01 panel on S6E3HA2 interface (called LDI/IC)
> TM2E has AMB559DE01 panel on S6E3HF2 interface (called LDI/IC)
> 
> Why assigning different compatibles to different devices is not a good idea?

Oops, I didn't know that these two panels are different so I thought using different compatiable string for same panel device is not good idea.

This panel driver is no problem as-is. For tm2e board, it can be considered with a separated patch later.

For this, these two boards have different MCU modules but just a little bit different so we could do either just adding compatible string to tm2e dts file and panel driver - maybe not reasonable due to different hardware name - or creating new panel driver even though source code is duplicated.

Thanks.

> 
>>
>>> As far as I examined available specs/docs there is no reliable register
>>> which can be used to safely distinguish it on runtime, but the docs I
>>> have are far from completeness.
>> The data sheet I am seeing says a RDDIDS register describes manufacturer and module version information. With this we could identify the Panel device.
>> Of course, we may need to check the register has really different values according to board.
>>
>> Below is the version information Hoegeun checked,
>>
>> TM2
>> [    4.908666] panel_s6e3ha2 13900000.dsi.0: Manufacture date: 2014-10-31 06:41
>> [    5.035768] panel_s6e3ha2 13900000.dsi.0: Id: 50 20 09
>>
>> TM2e
>> [    4.929265] panel_s6e3ha2 13900000.dsi.0: Manufacture date: 2014-09-03 06:30
>> [    5.056287] panel_s6e3ha2 13900000.dsi.0: Id: 40 40 14
> 
> There is description of ID1, ID2, ID3 registers in specs of both panels,
> I see no reliable bits to distinguish panels.
> And relying on read values of random devices does not seems to me proper
> solution.
> 
> Regards
> Andrzej
> 
> 
>>
>>
>> Thanks.
>>
>>> Regards
>>> Andrzej
>>>
>>>> Thanks.
>>>>
>>>>> Andi
>>>>>
>>>>> [1] https://git.tizen.org/cgit/platform/kernel/linux-exynos/tree/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts?h=tizen#n1284
>>>>> [2] https://git.tizen.org/cgit/platform/kernel/linux-exynos/tree/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts?h=tizen#n1270
>>>>> --
>>>>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>>>>> the body of a message to majordomo@vger.kernel.org
>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>>
>>>>> .
>>>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>>
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
