From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 3/7] ARM: exynos: add missing properties for combiner IRQs
Date: Mon, 15 Apr 2013 18:15:28 +0530
Message-ID: <CAK9yfHz7X5CA+CfYajtVOBL1r17V0YcFz1BfuZ1PSE0qFiSFEA@mail.gmail.com>
References: <1365775405-115297-1-git-send-email-arnd@arndb.de>
	<201304151041.44805.arnd@arndb.de>
	<CAK9yfHwXYRqo2yG1moWvMnEmNWXCVL7a9eKzi2we=QmdpVsz-w@mail.gmail.com>
	<201304151420.35843.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:58113 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933777Ab3DOMp3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Apr 2013 08:45:29 -0400
Received: by mail-oa0-f53.google.com with SMTP id m6so831650oag.40
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Apr 2013 05:45:28 -0700 (PDT)
In-Reply-To: <201304151420.35843.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>

On 15 April 2013 17:50, Arnd Bergmann <arnd@arndb.de> wrote:
> On Monday 15 April 2013, Sachin Kamat wrote:
>> >> > diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
>> >> > index 36d4299..f83c3c1 100644
>> >> > --- a/arch/arm/boot/dts/exynos4212.dtsi
>> >> > +++ b/arch/arm/boot/dts/exynos4212.dtsi
>> >> > @@ -26,6 +26,15 @@
>> >> >                 cpu-offset = <0x8000>;
>> >> >         };
>> >> >
>> >> > +       interrupt-controller@10440000 {
>> >>
>> >> Don't we need a node name here (combiner:interrupt-controller@10440000)?
>> >
>> > Why?
>>
>> Since it is being referenced as "&combiner" by other bindings, i
>> thought that was required.
>
> The original definition actually comes from exynos4.dtsi. It's enough
> to have the label in one place.

Yes, right. I overlooked that.

>
>> >> We have a combiner node defined in exynos4x12.dtsi. With the bindings
>> >> now defined separately in 4212 and 4412 dtsi files, probably the one
>> >> in 4x12 could be dropped?
>> >
>> > I did not see that one, but it seems to have the wrong numbers in the last
>> > four interrupt specifiers. I think it would be better to just fix that one
>> > and keep using it.
>>
>> OK. Do you want me to fix it and send as a patch or would you like to do it?
>
> If you have a patch that works, you could just send it out, oetherwise I'd
> do it.

Not ATM, so please go ahead.

-- 
With warm regards,
Sachin
