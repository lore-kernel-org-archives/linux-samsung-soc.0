From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 04/19] serial: samsung: Remove support for legacy clock code
Date: Wed, 16 Jul 2014 14:43:50 +0200
Message-ID: <53C67386.5070401@samsung.com>
References: <1404496099-26708-1-git-send-email-t.figa@samsung.com>
 <1404496099-26708-5-git-send-email-t.figa@samsung.com>
 <1405502840.4408.2.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:19890 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755112AbaGPMoa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 08:44:30 -0400
In-reply-to: <1405502840.4408.2.camel@x220>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>

On 16.07.2014 11:27, Paul Bolle wrote:
> On Fri, 2014-07-04 at 19:48 +0200, Tomasz Figa wrote:
>> All Samsung platforms are now using the Common Clock Framework and the
>> legacy clock code is being removed, so remove related dead code from
>> samsung-serial driver as well.
>>
>> Reported-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (maintainer:SERIAL DRIVERS)
>> Cc: Jiri Slaby <jslaby@suse.cz> (supporter:TTY LAYER)
>> Cc: linux-serial@vger.kernel.org (open list:SERIAL DRIVERS)
>> ---
>>  drivers/tty/serial/samsung.c | 4 ----
>>  1 file changed, 4 deletions(-)
> 
> This just entered linux-next (see next-20140716).
> 
>> diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
>> index 36c7747..cae8ebd 100644
>> --- a/drivers/tty/serial/samsung.c
>> +++ b/drivers/tty/serial/samsung.c
>> @@ -47,10 +47,6 @@
>>  
>>  #include <asm/irq.h>
>>  
>> -#ifdef CONFIG_SAMSUNG_CLOCK
>> -#include <plat/clock.h>
>> -#endif
>> -
>>  #include "samsung.h"
>>  
>>  #if	defined(CONFIG_SERIAL_SAMSUNG_DEBUG) &&	\
> 
> There are three further references to CONFIG_SAMSUNG_CLOCK in this file.
> Those should be removed too, shouldn't they?

That's right. Apparently I missed them. I guess that's not critical,
though, and could be done in separate patch, right?

Best regards,
Tomasz
