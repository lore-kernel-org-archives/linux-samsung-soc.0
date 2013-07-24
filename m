From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: dts: Add USBPHY nodes to Exynos4x12
Date: Wed, 24 Jul 2013 11:46:39 +0530
Message-ID: <CAK9yfHzXg_U=dgkJ=vqmme+VxXCw=WcRdCU-7V1_hPzRrgTyPQ@mail.gmail.com>
References: <1374600682-19376-1-git-send-email-tobetter@gmail.com>
	<CAK9yfHw98L-FUtX7v32FyE4UN308uYpJXx8oxDuYgYZk1uUp_A@mail.gmail.com>
	<CADoNuNe1t8KENvdwZXzg8tZAVNuqobV7gXAaVVuSVZX8LEc2xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:49037 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751509Ab3GXGQk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 02:16:40 -0400
Received: by mail-pa0-f44.google.com with SMTP id jh10so268047pab.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jul 2013 23:16:39 -0700 (PDT)
In-Reply-To: <CADoNuNe1t8KENvdwZXzg8tZAVNuqobV7gXAaVVuSVZX8LEc2xg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dongjin Kim <tobetter@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 24 July 2013 11:29, Dongjin Kim <tobetter@gmail.com> wrote:
> Thanks Sachin,
>
> On Wed, Jul 24, 2013 at 2:12 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> Hi Dongjin,
>>
>> On 23 July 2013 23:01, Dongjin Kim <tobetter@gmail.com> wrote:
>>> This patch adds device nodes for USBPHY to Exynos4x12.
>>>
>>> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
>>> ---
>>>  arch/arm/boot/dts/exynos4x12.dtsi |   18 ++++++++++++++++++
>>>  1 file changed, 18 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
>>> index 01da194..9c3335b 100644
>>> --- a/arch/arm/boot/dts/exynos4x12.dtsi
>>> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
>>> @@ -73,4 +73,22 @@
>>>                 clock-names = "sclk_fimg2d", "fimg2d";
>>>                 status = "disabled";
>>>         };
>>> +
>>> +       usbphy@125B00000 {
>>
>> Extra 0 above.
>>
> This is my bad, I will fix.
>
>>> +               #address-cells = <1>;
>>> +               #size-cells = <1>;
>>> +               compatible = "samsung,exynos4x12-usb2phy";
>>> +               reg = <0x125B0000 0x100>;
>>> +               ranges;
>>> +
>>> +               clocks = <&clock 2>, <&clock 305>;
>>> +               clock-names = "xusbxti", "otg";
>>> +               status = "disabled";
>>> +
>>> +               usbphy-sys {
>>> +                       /* USB device and host PHY_CONTROL registers */
>>> +                       reg = <0x10020704 0xc>,
>>> +                             <0x1001021c 0x4>;
>>> +               };
>>> +       };
>>>  };
>>
>> Please add this node after tmu node (satisfies alphabetical order as
>> well as increasing address value)
> No tmu node in exynos4x12.dtsi in mainline v3.11-rc2 yet, even in
> Kukjin's branch.

Sorry, that patch is not yet applied to for-next. I will re-send
again. You may ignore this comment for now.

-- 
With warm regards,
Sachin
