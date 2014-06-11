From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: exynos5420-peach-pi: linux-next boot fails unless mau_epll left
 enabled?
Date: Wed, 11 Jun 2014 17:56:02 +0200
Message-ID: <53987C12.8020406@collabora.co.uk>
References: <7hoay6sxjl.fsf@paris.lan> <CAGa+x86ko1N+T+QAqnY+md4+nyzza_cDt0wa-s06TdCX+27fSA@mail.gmail.com> <CAOD6ATpZWEg9d7WnZ8tg9_uQJ29vMoucaOwh0_tbdRSDRj25cw@mail.gmail.com> <CAD=FV=UsVQm_pLNtPwZMNCQQSSVrx=6M8eJrNRS8VyWMQzYtAQ@mail.gmail.com> <539764AF.4090409@collabora.co.uk> <CAD=FV=UdCp0dG7tnzaSnWxhtnU46ttMOUht00DL=bfvbbt7mXQ@mail.gmail.com> <5397EB99.1070209@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:51357 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753807AbaFKP4H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jun 2014 11:56:07 -0400
In-Reply-To: <5397EB99.1070209@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <trblinux@gmail.com>, Kevin Hilman <khilman@linaro.org>
Cc: Doug Anderson <dianders@google.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Shaik Ameer Basha <shaik.samsung@gmail.com>, Olof Johansson <olof@lixom.net>, "Turquette, Mike" <mturquette@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hello Tushar,

On 06/11/2014 07:39 AM, Tushar Behera wrote:
> On 06/11/2014 01:56 AM, Doug Anderson wrote:
>> Javier,
>> 
>> On Tue, Jun 10, 2014 at 1:03 PM, Javier Martinez Canillas
>> <javier.martinez@collabora.co.uk> wrote:
>>> Yes, I did not have this issue before. However... I installed the latest Peach
>>> pit recovery image you provided me and mainline kernel started to hang on boot.
>>> I remembered this thread so tested Kevin's patch which make it boot again.
>>>
>>> You said that chain-booting u-boot runs the sound init code but did you try
>>> booting a signed FIT image using the verified u-boot?
>> 
>> Right, I'd bet that it's actually verified boot that's calling the
>> sound init code (probably just in case it needs to beep at the user).
>> ...so this would happen even without chain booting.  I haven't tried
>> signing / booting without chain booting, but I can totally believe it
>> would hang just as easily.
>> 
>> 
>>> I'm asking because I'm see the hang both when chain-booting nv-u-boot from a
>>> kernel partition and booting a signed FIT image with the verified u-boot.
>>>
>>> So it seems this is a regression in latest U-boot and I didn't run into this
>>> before due having an older RW U-Boot on my Peach pit?
>> 
>> You must have had a very old RW U-Boot, possibly one before audio
>> support was added.  I think we just need to fix this in the kernel so
>> it doesn't hang.
>> 
>> -Doug
>> 
> 
> Hi Kevin,
> 
> I have posted the fixes[1] in the mailing list. Please test and update.
> 
> Changes:
> 1 patch in drivers/clk/samsung/clk-exynos-audss.c
> 1 patch in arch/arm/boot/dts/exynos5420.dtsi
> 
> For testing audio in Peach-pi,
> 1 patch in arch/arm/boot/dts/exynos5800-peach-pi.dts
> 
> [1] [PATCH 0/3] Fix boot-hang on Peach-pit and Enable audio
> 

I tested your patches and after applying Patch 1 and 2, the kernel did not hang
anymore. Both when booting a signed FIT image directly using the verified u-boot
and chain-booting nv-u-boot and booting a uImage.

I'll add Tested-by tags in the original patches threads.

Thanks a lot and best regards,
Javier
