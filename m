From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 09/10] dt-bindings: video: exynos5433-decon: add bindings
 for DECON-TV
Date: Tue, 20 Oct 2015 21:55:26 +0900
Message-ID: <CAJKOXPfXrEwu1egSnLxwYofu_scskkPRKOjOCskObPFn9yVcJw@mail.gmail.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
	<1445332961-25419-10-git-send-email-a.hajda@samsung.com>
	<56263400.6010200@samsung.com>
	<5626394C.5040202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <5626394C.5040202@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

2015-10-20 21:53 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
> On 10/20/2015 02:30 PM, Krzysztof Kozlowski wrote:
>> W dniu 20.10.2015 o 18:22, Andrzej Hajda pisze:
>>> DECON-TV(Display and Enhancement Controller for TV) is a variation
>>> of DECON IP. Its main purpose is to produce video stream for HDMI IP.
>>>
>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>> ---
>>>  .../devicetree/bindings/video/exynos5433-decon.txt  | 21 ++++++++++++---------
>>>  1 file changed, 12 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/video/exynos5433-decon.txt b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>>> index 3dff78b..2a88c8d 100644
>>> --- a/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>>> +++ b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>>> @@ -5,24 +5,27 @@ Exynos series of SoCs which transfers the image data from a video memory
>>>  buffer to an external LCD interface.
>>>
>>>  Required properties:
>>> -- compatible: value should be "samsung,exynos5433-decon";
>>> +- compatible: value should be one of:
>>> +    "samsung,exynos5433-decon", "samsung,exynos5433-decon-tv";
>> Until this point it looked good.
>>
>>>  - reg: physical base address and length of the DECON registers set.
>>> -- interrupts: should contain a list of all DECON IP block interrupts in the
>>> -          order: VSYNC, LCD_SYSTEM. The interrupt specifier format
>>> -          depends on the interrupt controller used.
>>> -- interrupt-names: should contain the interrupt names: "vsync", "lcd_sys"
>>> -               in the same order as they were listed in the interrupts
>>> -               property.
>>> +- interrupts: should contain interrupt specifier of VSYNC and optionally
>>> +          LCD_SYSTEM. The interrupt specifier format depends on
>>> +          the interrupt controller used.
>>> +- interrupt-names: should contain the interrupt name "vsync" and optionally
>>> +               "lcd_sys" in the same order as they were listed in
>>> +               the interrupts property.
>> The driver already did not require both interrupts, right? Only one of them?
>
> Right. More precisely it did not require since beginning.

So can you move it to the cleanup patch with change below?

Best regards,
Krzysztof
