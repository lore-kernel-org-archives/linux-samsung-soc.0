From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: Re: [PATCH v5 5/5] ARM: exynos: dts: Add FIMD DT binding Documentation
Date: Thu, 28 Feb 2013 12:07:38 +0530
Message-ID: <CAD025ySw8XZVWjP=bchQypfg6L3fYzvotW+OFMkEzPbnokPkQQ@mail.gmail.com>
References: <1361954620-20614-1-git-send-email-vikas.sajjan@linaro.org>
 <1361954620-20614-6-git-send-email-vikas.sajjan@linaro.org> <CAK9yfHyqC4TzR4p+xfYv2LH-mrR=vV3k0C68-Kts_t6M-AMgyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:35024 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751096Ab3B1Gh7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Feb 2013 01:37:59 -0500
Received: by mail-wi0-f181.google.com with SMTP id hm6so1663400wib.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Feb 2013 22:37:58 -0800 (PST)
In-Reply-To: <CAK9yfHyqC4TzR4p+xfYv2LH-mrR=vV3k0C68-Kts_t6M-AMgyg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com

Hi Sachin,

On 28 February 2013 11:42, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi Vikas,
>
> On 27 February 2013 14:13, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
>> Adds FIMD DT binding documentation both SoC and Board, with an example
>>
>> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
>> ---
>>  .../devicetree/bindings/video/exynos-fimd.txt      |   46 ++++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/video/exynos-fimd.txt
>>
>> diff --git a/Documentation/devicetree/bindings/video/exynos-fimd.txt b/Documentation/devicetree/bindings/video/exynos-fimd.txt
>> new file mode 100644
>> index 0000000..b3542b9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/video/exynos-fimd.txt
>> @@ -0,0 +1,46 @@
>> +Device-Tree bindings for Exynos SoC display controller (FIMD)
>> +
>> +FIMD stands for Fully Interactive Mobile Display, is the Display Controller for
>> +the Exynos series of SoCs which transfers the image data from a video buffer
>
> I think this should be Samsung series of SoCs intead of Exynos series.
> As such the file name could be samsung-fimd.txt.
Right.
>
>> +located in the system memory to an external LCD interface.
>> +
>> +Required properties:
>> +- compatible := value can be one these below
>
> "value should be one of the following:"
Ok.
>
>
>> +               "samsung,s3c2443-fimd"; /* for S3C24XX SoCs */
>> +               "samsung,s3c6400-fimd"; /* for S3C64XX SoCs */
>> +               "samsung,s5p6440-fimd"; /* for S5P64X0 SoCs */
>> +               "samsung,s5pc100-fimd"; /* for S5PC100 SoC  */
>> +               "samsung,s5pv210-fimd"; /* for S5PV210 SoC */
>> +               "samsung,exynos4210-fimd"; /* for Exynos4 SoCs */
>> +               "samsung,exynos5250-fimd"; /* for Exynos5 SoCs */
>
> blank line here would make it more readable?
>
>> +- reg := physical base address of the fimd and length of memory mapped region
>> +- interrupt-parent := reference to the interrupt combiner node with phandle
>> +- interrupts := interrupt number from the combiner to the cpu
>> +               we have 3 interrupts and the Interrupt combiner order is
>> +               FIFO Level, VSYNC and LCD_SYSTEM. Make sure to mention order
>> +               as VSYNC, FIFO Level and LCD_SYSTEM as show in the example below.
>
> Please rephrase the above as there seems to be difference in order in
> the above 2 lines itself. :)

 what it means is the Interrupt combiner order is : FIFO Level, VSYNC
and LCD_SYSTEM
but since we use only the VSYNC interrupt and in the driver while
getting IRQ number we pass 0 as index,
hence the documentation says
Make sure to mention order as VSYNC, FIFO Level and LCD_SYSTEM, as
show in the example below
 interrupts = <11 1>, <11 0>, <11 2>;
>
>
> --
> With warm regards,
> Sachin



-- 
Thanks and Regards
 Vikas Sajjan
