From: Bryan Wu <bryan.wu@canonical.com>
Subject: Re: [PATCH 2/2] leds: Convert S3C24XX LED driver to gpiolib API
Date: Tue, 3 Jul 2012 10:30:12 +0800
Message-ID: <CAK5ve-+k0vJCDrrLoVTrtCDz0MrfootreAsy2+O6YRss1apB=g@mail.gmail.com>
References: <1341059426-22693-1-git-send-email-sylvester.nawrocki@gmail.com>
 <1341059426-22693-2-git-send-email-sylvester.nawrocki@gmail.com>
 <CAK5ve-JRmb93+KVFVfeDbP7i_7n3dN22WcsyLurgAbvkU5e=mA@mail.gmail.com> <4FF20224.4020203@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:58001 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881Ab2GCCad (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jul 2012 22:30:33 -0400
In-Reply-To: <4FF20224.4020203@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

On Tue, Jul 3, 2012 at 4:18 AM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> Hi,
>
> On 07/02/2012 05:35 AM, Bryan Wu wrote:
>> On Sat, Jun 30, 2012 at 8:30 PM, Sylwester Nawrocki
>> <sylvester.nawrocki@gmail.com>  wrote:
>>> The s3c2410_gpio* calls are obsolete and have been scheduled for
>>> removal since several kernel releases. Remove them and use common
>>> gpiolib API instead.
>>> This patch also adds gpio_request/gpio_free call for API corectness.
>>>
>>> It is a prerequisite for removal of the S3C24XX SoC specific
>>> arch/arm/plat-samsung/include/gpio-fns.h header.
>>>
>>> Tested on Micro2440-SDK.
>>>
>>
>> Overall, these 2 patches are good. I'm just curious why not we just
>> use generic led-gpio driver to replace this one.
>
> Thank you for the suggestion, I wasn't really aware of generic leds-gpio
> driver... This could be nice optimization. However my intention was
> to just clean up the GPIO bits, with minimal changes to other subsystems.
> I could check and see how it could be done perhaps as a next step ?

Sure, no problem. I will merge these 2 patches soon.

> There is a few (old) boards that use this driver and converting them would
> delay the GPIO patches even further...
>
> Also generic led-gpio has some limitations, e.g. I couldn't see it supports
> tri-stating a GPIO when a LED is off. Probably this feature could be added.
>

Good point, I will help to take a look.

Thanks,
-- 
Bryan Wu <bryan.wu@canonical.com>
Kernel Developer    +86.186-168-78255 Mobile
Canonical Ltd.      www.canonical.com
Ubuntu - Linux for human beings | www.ubuntu.com
