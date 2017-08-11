From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/2] drm/bridge: add Silicon Image SiI9234 driver
Date: Fri, 11 Aug 2017 09:00:00 +0200
Message-ID: <4d5ac06c-d396-b489-65d0-a975edf6db61@samsung.com>
References: <1501746323-5254-1-git-send-email-m.purski@samsung.com>
 <3612749.1Xj3PQ173Q@avalon> <eea9742d-0180-205b-652e-f9bfbdd21c33@samsung.com>
 <CGME20170810145149epcas3p304a0b8f288028568080d59c0bf8434d8@epcas3p3.samsung.com>
 <5485864.0NeJDQRaQs@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:55891 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751299AbdHKHAF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Aug 2017 03:00:05 -0400
In-reply-to: <5485864.0NeJDQRaQs@avalon>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maciej Purski <m.purski@samsung.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, krzk@kernel.org

Hi Laurent,

On 2017-08-10 16:51, Laurent Pinchart wrote:
> Hi Marek,
>
> On Friday 04 Aug 2017 08:55:55 Marek Szyprowski wrote:
>> Hi Laurent,
>>
>> Thanks for your detailed comments. Maciej resurrected some orphaned code,
>> which is still useful today (Tomasz has left Samsung a few years ago).
>> I'm not sure we will be able to answer all your questions without deep
>> investigation, especially about the driver operation details, but we
>> will try.
> Thank you.
>
>> On 2017-08-03 12:24, Laurent Pinchart wrote:
>>> On Thursday 03 Aug 2017 09:45:22 Maciej Purski wrote:
>>>> SiI9234 transmitter converts eTMDS/HDMI signal to MHL 1.0.
>>>> It is controlled via I2C bus. Its interaction with other
>>>> devices in video pipeline is performed mainly on HW level.
>>>> The only interaction it does on device driver level is
>>>> filtering-out unsupported video modes, it exposes drm_bridge
>>>> interface to perform this operation.
>>>>
>>>> This patch is based on the code refactored by Tomasz Stanislawski
>>>> <t.stanislaws@samsung.com>, which was initially developed by:
>>>> Adam Hampson <ahampson@sta.samsung.com>
>>>> Erik Gilling <konkers@android.com>
>>>> Shankar Bandal <shankar.b@samsung.com>
>>>> Dharam Kumar <dharam.kr@samsung.com>
>>>>
>>>> Signed-off-by: Maciej Purski <m.purski@samsung.com>
>>>> ---
>>>>
>>>>    .../devicetree/bindings/display/bridge/sii9234.txt |   20 +
>>>>    drivers/gpu/drm/bridge/Kconfig                     |    8 +
>>>>    drivers/gpu/drm/bridge/Makefile                    |    1 +
>>>>    drivers/gpu/drm/bridge/sii9234.c                   | 1019 +++++++++++++
>>>>    4 files changed, 1048 insertions(+)
>>>>    create mode 100644
>>>>
>>>> Documentation/devicetree/bindings/display/bridge/sii9234.txt create mode
>>>> 100644 drivers/gpu/drm/bridge/sii9234.c
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/sii9234.txt
>>>> b/Documentation/devicetree/bindings/display/bridge/sii9234.txt new file
>>>> mode 100644
>>>> index 0000000..2cdf286
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/bridge/sii9234.txt
>>> DT reviewers might ask you to submit DT bindings as a separate patch.
>>>
>>>> @@ -0,0 +1,20 @@
>>>> +SiI9234 Mobile HD Link Transmitter
>>>> +
>>>> +Required properties:
>>>> +- compatible : "sil,sii9234".
>>>> +- reg : I2C address for TPI interface, use 0x39
>>>> +- vcc-supply : regulator that supplies the chip
>>> Is there a single power supply only ? Transceivers usually have at least
>>> one digital and one analog power supply.
>> Acording to the schematic there are four power supplies used for SII9234
>> MHL chip in Trats2 board: VSIL_1.2A, VSIL_1.2C, VCC_3.3V_MHL and
>> VCC_1.8V_MHL. First two are derived directly from VSIL_1.2 signal, which is
>> modeled as a fixed regulator. The latter two are derived directly from VBAT
>> using some level converter, which is controlled by the same GPIO pin as VSIL
>> fixed regulator. Any idea how this should be represented better in device
>> tree instead of having single vcc-supply?
> Without access to the documentation I can only guess, but it looks like
> VSIL_1.2A and VSIL_1.2C are supposed to be powered from the same power supply
> rail, possibly with different filters. I think they can be grouped together
> from a DT binding point of view. The last two supplies seem independent. We
> should thus probably model this as three separate supplies.

Okay, I see no problem adding support for all those three supplies, but 
I was
wondering how to model them in the device tree, because from the software
perspective ALL power supplies needed by this chip are enabled by a single
GPIO line switch.

I see 3 possible solutions:
1. Keep only single vcc supply for now and use fixed gpio regulator for it
as a provider. Add a comment that it fact it provides 3 different power 
signals.
2. Extend fixed gpio regulator driver and bindings so it will be possible to
have more than one fixed regulator controlled by the same gpio pin.
3. Model VCC_3.3V_MHL and VCC_1.8V_MHL providers as "vctrl-regulator" and
use this VSIL_1.2 as control voltage for them.

Which one do you prefer?

> It would be useful to check in the SII9234 datasheet what power sequence the
> chip expects. Is there any chance you could find that document ?

We have access only to the parts of the SII9234 documentation now and 
there is no
such information there.

>>>> +- interrupts, interrupt-parent: interrupt specifier of INT pin
>>>> +- reset-gpios: gpio specifier of RESET pin
>>> Is this mandatory to connect the reset pin to the SoC ?
>> IMHO yes, the chip has to be reset during the initialization procedure
>> and doesn't work properly without reset.
> OK, I have no issue making the property mandatory then.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
