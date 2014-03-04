From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [REGRESSION] Arndale Octa panics when booting 3.14-rc1
Date: Tue, 04 Mar 2014 13:03:33 +0100
Message-ID: <5315C115.3060000@gmail.com>
References: <20140303185755.GA11460@e102654-lin.cambridge.arm.com>	<5314D239.7090001@gmail.com>	<5314EBCB.3060400@gmail.com>	<20140304101608.GA3852@e102654-lin.cambridge.arm.com>	<5315AB3B.5080207@samsung.com>	<20140304103936.GA10559@e102654-lin.cambridge.arm.com> <CAHbNUh2kbYUa1OegRrOXMAEmKRjsf4PifT6tZnKdBx7NoDkq6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f177.google.com ([209.85.215.177]:48572 "EHLO
	mail-ea0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756963AbaCDMDr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Mar 2014 07:03:47 -0500
Received: by mail-ea0-f177.google.com with SMTP id h10so304768eak.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2014 04:03:46 -0800 (PST)
In-Reply-To: <CAHbNUh2kbYUa1OegRrOXMAEmKRjsf4PifT6tZnKdBx7NoDkq6A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>, Javi Merino <javi.merino@arm.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sachin Kamat <sachin.kamat@linaro.org>, Chander Kashyap <chander.kashyap@linaro.org>

On 04.03.2014 13:01, Tushar Behera wrote:
> On 4 March 2014 16:09, Javi Merino <javi.merino@arm.com> wrote:
>> On Tue, Mar 04, 2014 at 10:30:19AM +0000, Sylwester Nawrocki wrote:
>>> On 04/03/14 11:16, Javi Merino wrote:
>>>> Yes, with [1] applied I don't get a kernel panic but the kernel fails
>>>> to boot later on with an Imprecise external abort.  Removing the mdma
>>>> nodes from the dts gets rid of that.  I guess what's missing is what
>>>> you said: clocks for the mdma devices.
>>>
>>> Is removing mdm0 node enough to fix the boot failure, or both have to be
>>> removed ?
>>
>> Actually, you it's only mdma1.  Just removing the mdma1 node from the
>> dt fixes the imprecise external abort.
>>
>
> MDMA1 can support both secure and non-secure AXI transactions, the
> actual behaviour is controlled by trustzone software. It may be the
> case that MDMA1 is configured to be used in secure mode only, hence
> accessing it in non-secure mode is causing the oops.
>
> Right now, the only solution looks like disabling this node in
> Arndale-Octa dts file.
>
> --- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> +++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> @@ -354,4 +354,16 @@
>                  samsung,i2s-controller = <&i2s0>;
>                  samsung,audio-codec = <&i2s_stub>;
>          };
> +
> +       amba {
> +               mdma1: mdma@11C10000 {
> +                       /*
> +                        * MDMA1 can support both secure and non-secure
> +                        * AXI transactions. When this is enabled in the kernel
> +                        * for boards that run in secure mode, we are getting
> +                        * imprecise external aborts causing the kernel to oops.
> +                        */
> +                       status = "disabled";
> +               };
> +       };
>
> If it works, I will submit this patch.

On Exynos 4 SoCs there were two instances of MDMA1, one secure and one 
non-secure. Isn't it the case for Exynos5420 as well? If yes, the common 
DTSI could be changed to always use the non-secure one.

Best regards,
Tomasz
