From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: add bindings for USB physical
 connector
Date: Thu, 15 Mar 2018 19:08:32 +0200
Message-ID: <a470c2e0-09ea-fc3a-2eef-bba2af18b33f@ti.com>
References: <20180227071134.28063-1-a.hajda@samsung.com>
 <CGME20180227071138eucas1p17e1e16f13f6d3e3b15a57dc93eb8cf3f@eucas1p1.samsung.com>
 <20180227071134.28063-2-a.hajda@samsung.com>
 <ed0ce43c-3c81-b027-2eb1-30e49156c3ac@ti.com>
 <b588527d-2ca2-9e88-9e27-e09e5b52f8d6@samsung.com>
 <12da0d00-9ab3-3752-793b-e487666f35a3@ti.com>
 <1c3f8cde-4f9a-306f-b4f9-c0bdc76caf1f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1c3f8cde-4f9a-306f-b4f9-c0bdc76caf1f@arm.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>, Andrzej Hajda <a.hajda@samsung.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, Archit Taneja <architt@codeaurora.org>, linux-samsung-soc@vger.kernel.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 15/03/18 13:46, Robin Murphy wrote:
> On 12/03/18 10:41, Roger Quadros wrote:
> [...]
>>>>> @@ -0,0 +1,75 @@
>>>>> +USB Connector
>>>>> +=============
>>>>> +
>>>>> +USB connector node represents physical USB connector. It should be
>>>>> +a child of USB interface controller.
>>>>> +
>>>>> +Required properties:
>>>>> +- compatible: describes type of the connector, must be one of:
>>>>> +    "usb-a-connector",
>>>>> +    "usb-b-connector",
>>>>> +    "usb-c-connector".
>>>> compatible should be just "usb-connector"
>>>>
>>>> Type should be a property
>>>>
>>>> type: type of usb connector "A", "B", "AB", "C"
>>>> AB is for dual-role connectors.
>>>
>>> I have proposed such property (and size also) in my first RFC [1]. Rod
>>> did not like it :)
>>>
>>> [1]: https://marc.info/?l=devicetree&m=150660411515233&w=2
>>>
>>
>> This is what Rob says here https://patchwork.kernel.org/patch/9976043/
>> "We did "type" for hdmi-connector, but I think I'd really prefer
>> compatible be used to distinguish as least where it may matter to s/w.
>> In the HDMI case, they all are pretty much the same, just different
>> physical size."
>>
>> So the question is. Does it matter to this particular software implementation
>> if it is type A,B,C connector?
>> If yes, how?
>>
>> Type A will never have any alternate function. It is always dedicated to USB.
> 
> In USB spec terms, at least. In reality there are things like the cool trick Rockchip SoCs do whereby they can expose the debug UART Rx/Tx through the OTG port's D+/D- pins, and that is on a type A connector in many products. I'm guessing that's probably beyond the scope of this binding, though.
> 
>> Also does the size "full", "micro", "mini" matter to software?
> 
> If it means the user can look in sysfs to easily correlate logical ports with physical connectors that's certainly handy (e.g. on something like Odroid-XU where the two USB3 ports are brought out to an A and a micro-AB connector respectively).

But this logic fails if both connectors are the same type/size.
This is where the label comes in handy. The labels can be unique and end user can identify the port using that.

> 
> Robin.

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
