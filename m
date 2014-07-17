From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] ARM: config: update multi_v7_defconfig
Date: Fri, 18 Jul 2014 00:49:36 +0200
Message-ID: <CABxcv=kWnJX_ggPZ61QMt8z6DXMPf2TTPmo7eF-+H5m+==fciA@mail.gmail.com>
References: <1405411346-12471-1-git-send-email-ch.naveen@samsung.com>
	<CAD=FV=UFknqF_Mt7ArytFq4KdDsGDa+JR2KZzX9Xn+if-_Vw4g@mail.gmail.com>
	<CABxcv==+cwoXA=WM3E7Zb62T0Epgqg_oH3UNU0vEe2DDPiCYPA@mail.gmail.com>
	<20140717224413.GA21766@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:40025 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753896AbaGQWth (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 18:49:37 -0400
Received: by mail-wg0-f44.google.com with SMTP id m15so2688612wgh.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jul 2014 15:49:36 -0700 (PDT)
In-Reply-To: <20140717224413.GA21766@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Doug Anderson <dianders@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "cpgs ." <cpgs@samsung.com>, Olof Johansson <olofj@chromium.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hello Russell,

On Fri, Jul 18, 2014 at 12:44 AM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Jul 18, 2014 at 12:31:48AM +0200, Javier Martinez Canillas wrote:
>> In the case of the MAX77686, the mfd, regulator and clock drivers use
>> subsys_initcall() instead of module_init() but I wonder which of these
>> really need to be initialized at subsys init call time and which one
>> can just be built as a module.
>
> I think you're making a frequently made mistake concerning module
> initialisation.
>
> Having code initialised by subsys_initcall() (or indeed any other level)
> does not preclude it being a module:
>
> #ifndef MODULE
> ...
> #define subsys_initcall(fn)             __define_initcall(fn, 4)
> ...
> #else /* MODULE */
> ...
> #define subsys_initcall(fn)             module_init(fn)
> ...
> #endif
>
> So, subsys_initcall() automagically becomes module_init() when built
> as a module.  There's no need to change anything here.
>

I was indeed confused, I should had looked at include/linux/init.h
before. Thanks a lot for the clarification.

Best regards,
Javier
