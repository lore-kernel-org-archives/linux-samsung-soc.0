From: Kevin Hilman <khilman@linaro.org>
Subject: Re: Problems booting exynos5420 with >1 CPU
Date: Mon, 09 Jun 2014 13:27:51 -0700
Message-ID: <7hoay1rfp4.fsf@paris.lan>
References: <CAD=FV=UX90hgyojW3k_kpT=mt8eX9=AyHr+AGjhK=MrE1hHbUA@mail.gmail.com>
	<539145B4.5000200@gmail.com>
	<CAD=FV=XqwEQNJmij-4Gh62OY+B66AjdQjZC0=f_6tbot3UfQaA@mail.gmail.com>
	<CAM4voaknx3+X4O8MUwaruUFPyquY8Opq61ucKX08xTrv8PqfLg@mail.gmail.com>
	<alpine.LFD.2.11.1406061740280.25775@knanqh.ubzr>
	<CAM4voam5KDicwLAt3EA1UC7M+EciGccrnMUKxoR-5c8xT8-zSQ@mail.gmail.com>
	<alpine.LFD.2.11.1406062340480.25775@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:43511 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753988AbaFIU1y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jun 2014 16:27:54 -0400
Received: by mail-pb0-f43.google.com with SMTP id up15so5344467pbc.16
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Jun 2014 13:27:54 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1406062340480.25775@knanqh.ubzr> (Nicolas
	Pitre's message of "Sat, 7 Jun 2014 12:10:27 -0400 (EDT)")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Abhilash Kesavan <kesavan.abhilash@gmail.com>, Doug Anderson <dianders@google.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Turquette, Mike" <mturquette@linaro.org>, Tushar Behera <trblinux@gmail.com>, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>, Sonny Rao <sonnyrao@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Arun Kumar <arun.kk@samsung.com>

Nicolas Pitre <nicolas.pitre@linaro.org> writes:

> On Sat, 7 Jun 2014, Abhilash Kesavan wrote:
>
>> Hi Nicolas,
>> 
>> The first man of the incoming cluster enables its snoops via the
>> power_up_setup function. During secondary boot-up, this does not occur
>> for the boot cluster. Hence, I enable the snoops for the boot cluster
>> as a one-time setup from the u-boot prompt. After secondary boot-up
>> there is no modification that I do.
>
> OK that's good.
>
>> Where should this be ideally done ?
>
> If I remember correctly, the CCI can be safely activated only when the 
> cache is disabled.  So that means the CCI should ideally be turned on 
> for the boot cluster (and *only* for the boot CPU) by the bootloader.
>
> Now... If you _really_ prefer to do it from the kernel to avoid 
> difficulties with bootloader updates, then it should be possible to do 
> it from the kernel by temporarily turning the cache off.  This is not a 
> small thing but the MCPM infrastructure can be leveraged.  Here's what I 
> tried on a TC2 which might just work for you as well:

FWIW, I dropped the u-boot hack I was using to enable CCI and tested
this patch (with a cut/paste of the TC2 specific stuff into
mach-exynos/mcpm-exynos.c) along with Doug's patch[1] and 
and confirm that all 8 cores boot up on the Chromebook2 using linux-next.

Kevin

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-June/262440.html
