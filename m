From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 2/2] leds: Convert S3C24XX LED driver to gpiolib API
Date: Tue, 03 Jul 2012 23:10:41 +0200
Message-ID: <4FF35FD1.4060402@gmail.com>
References: <1341059426-22693-1-git-send-email-sylvester.nawrocki@gmail.com> <1341059426-22693-2-git-send-email-sylvester.nawrocki@gmail.com> <CAK5ve-JRmb93+KVFVfeDbP7i_7n3dN22WcsyLurgAbvkU5e=mA@mail.gmail.com> <4FF20224.4020203@gmail.com> <CAK5ve-+k0vJCDrrLoVTrtCDz0MrfootreAsy2+O6YRss1apB=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:57180 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757266Ab2GCVKp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jul 2012 17:10:45 -0400
In-Reply-To: <CAK5ve-+k0vJCDrrLoVTrtCDz0MrfootreAsy2+O6YRss1apB=g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bryan Wu <bryan.wu@canonical.com>
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

On 07/03/2012 04:30 AM, Bryan Wu wrote:
...
>>> Overall, these 2 patches are good. I'm just curious why not we just
>>> use generic led-gpio driver to replace this one.
>>
>> Thank you for the suggestion, I wasn't really aware of generic leds-gpio
>> driver... This could be nice optimization. However my intention was
>> to just clean up the GPIO bits, with minimal changes to other subsystems.
>> I could check and see how it could be done perhaps as a next step ?
> 
> Sure, no problem. I will merge these 2 patches soon.

Thank you.

>> There is a few (old) boards that use this driver and converting them would
>> delay the GPIO patches even further...
>>
>> Also generic led-gpio has some limitations, e.g. I couldn't see it supports
>> tri-stating a GPIO when a LED is off. Probably this feature could be added.
>>
> 
> Good point, I will help to take a look.

I should get back to this when I find some more time.

That might not be difficult, probably gpio_request_one() with GPIOF_OPEN_DRAIN/
GPIOF_OPEN_SOURCE flag instead of gpio_request() would do.

--
Regards,
Sylwester
