From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v4 5/5] ARM: exynos: dts: Add FIMD DT binding Documentation
Date: Mon, 18 Feb 2013 22:46:01 +0100
Message-ID: <5122A119.7070501@gmail.com>
References: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org> <1360912200-26377-6-git-send-email-vikas.sajjan@linaro.org> <511E1008.6010308@samsung.com> <CAD025yQokBbJwyFWeg8KwzTsE-4jgra5UhLuic5zJnQRt+GNTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:50719 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756380Ab3BRVqG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Feb 2013 16:46:06 -0500
Received: by mail-ee0-f42.google.com with SMTP id b47so3169883eek.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Feb 2013 13:46:04 -0800 (PST)
In-Reply-To: <CAD025yQokBbJwyFWeg8KwzTsE-4jgra5UhLuic5zJnQRt+GNTw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, sunil joshi <joshi@samsung.com>, Inki Dae <inki.dae@samsung.com>

Hi,

On 02/18/2013 11:51 AM, Vikas Sajjan wrote:
> On 15 February 2013 16:08, Sylwester Nawrocki<s.nawrocki@samsung.com>  wrote:
>> On 02/15/2013 08:10 AM, Vikas Sajjan wrote:
>>> Adds FIMD DT binding documentation both SoC and Board, with an example
>>>
>>> Signed-off-by: Vikas Sajjan<vikas.sajjan@linaro.org>
>>> ---
>>>   .../devicetree/bindings/drm/exynos/fimd.txt        |   37 ++++++++++++++++++++
>>>   1 file changed, 37 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/drm/exynos/fimd.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/drm/exynos/fimd.txt b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
>>> new file mode 100644
>>> index 0000000..bec9d07
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/drm/exynos/fimd.txt

Wouldn't Documentation/devicetree/bindings/video/exynos-fimd.txt be more
appropriate location for this file ? There is also framebuffer driver for
FIMD. Even if the framebuffer driver gets phased out it still feels like
a more intuitive location for a display controller bindings.
This is just my humble suggestion though.

I think you should CC the device tree mailing list and the maintainers.

>>> @@ -0,0 +1,37 @@
>>> +Device-Tree bindings for fimd driver
>>> +
>>> +FIMD stands for Fully Interactive Mobile Display, is the Display Controller for
>>> +the Exynos series of SoCs which transfers the image data from a video buffer
>>> +located in the system memory to an external LCD interface.
>>> +
>>> +Required properties:
>>> +- compatible := value should be "samsung,exynos5-fimd" or "samsung,exynos4-fimd"
>>
>> What about older SoCs like S5Pv210 ? There is the FIMD IP block in those SoCs
>> as well. There are also differences in the FIMD IP block across various SoC
>> version, so either you need to list the quirks in the bindings or use an
>> appropriate compatible properties if there are significant differences across
>> FIMDs that make them not really compatible.
>>
> as of now, I was working on Exynos4 and Exynos5 SoC. have to really
> see the differences in the previous SoC and how to handle all those
> FIMD IPs in the driver.
> if you know the differences between these FIMD IPs, please let me know.

Please have a look at drivers/video/s3c-fb.c and all driver_data structures
defined for various SoCs.

[...]
> we have 3 interrupts and the Interrupt combiner order is FIFO Level ,
> VSYNC  and LCD_SYSTEM.
> since we only use VSYNC interrupt , In the driver to get the interrupt number
>
> res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>           if (!res) {
>                   dev_err(dev, "irq request failed.\n");
>                   return -ENXIO;
>            }
>
>   ctx->irq = res->start;
>
>   I am passing the 3rd parameter as '0' , to get the VSYNC interrupt,
> and hence in the DTSI file     i have it in the order  VSYNC,  FIFO
> LEVEL and LCD_SYSTEM.

Yes, I'm aware what's going on here. Since I had to change the interrupts
order when I used one of the first version of patches adding device tree
support for FIMD, when I needed working display to test the camera.

> what I can do is the pass the 3rd parameter as '1' , and rectify the
> order in DTSI file as  FIFO LEVEL, VSYNC and LCD_SYSTEM.

Then you would have to do it only for dt case. I guess it is okay to
require VSYNC as the first interrupt. I'm fine with that, as long as
it is properly documented.

--

Regards,
Sylwester
