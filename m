From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: Re: [PATCH v4 5/5] ARM: exynos: dts: Add FIMD DT binding Documentation
Date: Mon, 18 Feb 2013 16:21:06 +0530
Message-ID: <CAD025yQokBbJwyFWeg8KwzTsE-4jgra5UhLuic5zJnQRt+GNTw@mail.gmail.com>
References: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org>
 <1360912200-26377-6-git-send-email-vikas.sajjan@linaro.org> <511E1008.6010308@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:38481 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751007Ab3BRKv3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Feb 2013 05:51:29 -0500
Received: by mail-lb0-f172.google.com with SMTP id n8so4207427lbj.31
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Feb 2013 02:51:27 -0800 (PST)
In-Reply-To: <511E1008.6010308@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, sunil joshi <joshi@samsung.com>

Hi Sylwester,

thannks for the review.

On 15 February 2013 16:08, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> Hi,
>
> On 02/15/2013 08:10 AM, Vikas Sajjan wrote:
>> Adds FIMD DT binding documentation both SoC and Board, with an example
>>
>> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
>> ---
>>  .../devicetree/bindings/drm/exynos/fimd.txt        |   37 ++++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/drm/exynos/fimd.txt
>>
>> diff --git a/Documentation/devicetree/bindings/drm/exynos/fimd.txt b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
>> new file mode 100644
>> index 0000000..bec9d07
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
>> @@ -0,0 +1,37 @@
>> +Device-Tree bindings for fimd driver
>> +
>> +FIMD stands for Fully Interactive Mobile Display, is the Display Controller for
>> +the Exynos series of SoCs which transfers the image data from a video buffer
>> +located in the system memory to an external LCD interface.
>> +
>> +Required properties:
>> +- compatible := value should be "samsung,exynos5-fimd" or "samsung,exynos4-fimd"
>
> What about older SoCs like S5Pv210 ? There is the FIMD IP block in those SoCs
> as well. There are also differences in the FIMD IP block across various SoC
> version, so either you need to list the quirks in the bindings or use an
> appropriate compatible properties if there are significant differences across
> FIMDs that make them not really compatible.
>
as of now, I was working on Exynos4 and Exynos5 SoC. have to really
see the differences in the previous SoC and how to handle all those
FIMD IPs in the driver.
if you know the differences between these FIMD IPs, please let me know.

>> +- reg := physical base address of the fimd and length of memory mapped region
>> +- interrupt-parent := reference to the interrupt combiner node with phandle
>> +- interrupts := interrupt number from the combiner to the cpu
>
> These are actually 3 interrupts. Can you please document what they are
> and in what order should be listed in the interrupts property ?
>
Sure, will mention the all the 3 interrupts and the order.

>> +- pinctrl := property defining the pinctrl configurations with a phandle
>> +- pinctrl-names := name of the pinctrl
>> +
>> +Optional Properties:
>> +- samsung,power-domain := power domain property defined with a phandle
>> +- status := property defining the status of the node
>
> I don't think this standard property needs to be documented here.
>
fine. will remove.
>> +
>> +Example:
>> +
>> +SoC specific DT Entry:
>> +
>> +     fimd@11c00000 {
>> +             compatible = "samsung,exynos4-fimd";
>> +             interrupt-parent = <&combiner>;
>> +             reg = <0x11c00000 0x20000>;
>> +             interrupts = <11 1>, <11 0>, <11 2>;
>
> Why this order exactly ? Because currently the driver expects VSYNC
> interrupt specifier in the first entry and it won't work when you put
> any other interrupt specifier there ?
>
> The interrupts order really needs to be specified above, otherwise
> you need to look at the bindings implementation in the driver to
> figure out why it didn't work when you put the interrupt in different
> order... see confused and angry faces of developers ? ... :)
>
we have 3 interrupts and the Interrupt combiner order is FIFO Level ,
VSYNC  and LCD_SYSTEM.
since we only use VSYNC interrupt , In the driver to get the interrupt number

res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
         if (!res) {
                 dev_err(dev, "irq request failed.\n");
                 return -ENXIO;
          }

 ctx->irq = res->start;

 I am passing the 3rd parameter as '0' , to get the VSYNC interrupt,
and hence in the DTSI file     i have it in the order  VSYNC,  FIFO
LEVEL and LCD_SYSTEM.

what I can do is the pass the 3rd parameter as '1' , and rectify the
order in DTSI file as  FIFO LEVEL, VSYNC and LCD_SYSTEM.

> If I'm not mistaken we have "Video Frame" (VSYNC), "I80 Interface"
> and "FIFO Level" interrupts here.
>
>> +     };
>
>
> Thanks,
> --
> Sylwester Nawrocki
> Samsung Poland R&D Center



-- 
Thanks and Regards
 Vikas Sajjan
