From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: Re: [PATCH v4 5/5] ARM: exynos: dts: Add FIMD DT binding Documentation
Date: Thu, 21 Feb 2013 12:34:55 +0530
Message-ID: <CAD025yRmvSpnM9RJJvN+FM00Rgz8Bt5msmEYcyFVxNTEKsM2xg@mail.gmail.com>
References: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org>
 <1360912200-26377-6-git-send-email-vikas.sajjan@linaro.org>
 <511E1008.6010308@samsung.com> <CAD025yQokBbJwyFWeg8KwzTsE-4jgra5UhLuic5zJnQRt+GNTw@mail.gmail.com>
 <5122A119.7070501@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:58455 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752665Ab3BUHFS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Feb 2013 02:05:18 -0500
Received: by mail-wg0-f52.google.com with SMTP id 12so6952747wgh.31
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Feb 2013 23:05:16 -0800 (PST)
In-Reply-To: <5122A119.7070501@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, sunil joshi <joshi@samsung.com>, Inki Dae <inki.dae@samsung.com>

Hi,

On 19 February 2013 03:16, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> Hi,
>
>
> On 02/18/2013 11:51 AM, Vikas Sajjan wrote:
>>
>> On 15 February 2013 16:08, Sylwester Nawrocki<s.nawrocki@samsung.com>
>> wrote:
>>>
>>> On 02/15/2013 08:10 AM, Vikas Sajjan wrote:
>>>
>>>> Adds FIMD DT binding documentation both SoC and Board, with an example
>>>>
>>>> Signed-off-by: Vikas Sajjan<vikas.sajjan@linaro.org>
>>>> ---
>>>>   .../devicetree/bindings/drm/exynos/fimd.txt        |   37
>>>> ++++++++++++++++++++
>>>>   1 file changed, 37 insertions(+)
>>>>   create mode 100644
>>>> Documentation/devicetree/bindings/drm/exynos/fimd.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/drm/exynos/fimd.txt
>>>> b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
>>>> new file mode 100644
>>>> index 0000000..bec9d07
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
>
>
> Wouldn't Documentation/devicetree/bindings/video/exynos-fimd.txt be more
> appropriate location for this file ? There is also framebuffer driver for
> FIMD. Even if the framebuffer driver gets phased out it still feels like
> a more intuitive location for a display controller bindings.
> This is just my humble suggestion though.
>
I think we can move it there.

> I think you should CC the device tree mailing list and the maintainers.
>
>
will do.

>>>> @@ -0,0 +1,37 @@
>>>> +Device-Tree bindings for fimd driver
>>>> +
>>>> +FIMD stands for Fully Interactive Mobile Display, is the Display
>>>> Controller for
>>>> +the Exynos series of SoCs which transfers the image data from a video
>>>> buffer
>>>> +located in the system memory to an external LCD interface.
>>>> +
>>>> +Required properties:
>>>> +- compatible := value should be "samsung,exynos5-fimd" or
>>>> "samsung,exynos4-fimd"
>>>
>>>
>>> What about older SoCs like S5Pv210 ? There is the FIMD IP block in those
>>> SoCs
>>> as well. There are also differences in the FIMD IP block across various
>>> SoC
>>> version, so either you need to list the quirks in the bindings or use an
>>> appropriate compatible properties if there are significant differences
>>> across
>>> FIMDs that make them not really compatible.
>>>
>> as of now, I was working on Exynos4 and Exynos5 SoC. have to really
>> see the differences in the previous SoC and how to handle all those
>> FIMD IPs in the driver.
>> if you know the differences between these FIMD IPs, please let me know.
>
>
> Please have a look at drivers/video/s3c-fb.c and all driver_data structures
> defined for various SoCs.
>
> [...]
>
I went through the driver_data structures define for s5p64x0,s3c2443,
s5pv210, s5pc100 ad 64xx SoCs.
there are some differences w.r.t number of windows, osd_stride  length
and regsiter offsets.
but  I dont have access to all the above mentioned Boards and so that
I can modify and test on each one of them.

>> we have 3 interrupts and the Interrupt combiner order is FIFO Level ,
>> VSYNC  and LCD_SYSTEM.
>> since we only use VSYNC interrupt , In the driver to get the interrupt
>> number
>>
>> res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>>           if (!res) {
>>                   dev_err(dev, "irq request failed.\n");
>>                   return -ENXIO;
>>            }
>>
>>   ctx->irq = res->start;
>>
>>   I am passing the 3rd parameter as '0' , to get the VSYNC interrupt,
>> and hence in the DTSI file     i have it in the order  VSYNC,  FIFO
>> LEVEL and LCD_SYSTEM.
>
>
> Yes, I'm aware what's going on here. Since I had to change the interrupts
> order when I used one of the first version of patches adding device tree
> support for FIMD, when I needed working display to test the camera.
>
>
>> what I can do is the pass the 3rd parameter as '1' , and rectify the
>> order in DTSI file as  FIFO LEVEL, VSYNC and LCD_SYSTEM.
>
>
> Then you would have to do it only for dt case. I guess it is okay to
> require VSYNC as the first interrupt. I'm fine with that, as long as
> it is properly documented.
>
 So, I shall keep the logic as is, and just document it well. is it ok.?
> --
>
> Regards,
> Sylwester



-- 
Thanks and Regards
 Vikas Sajjan
