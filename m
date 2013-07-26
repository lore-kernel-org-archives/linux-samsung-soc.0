From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] watchdog: s3c2410_wdt: parse watchdog dt node to read
 PMU registers adresses
Date: Thu, 25 Jul 2013 17:32:23 -0700
Message-ID: <CAD=FV=U+S__hkbtWDAb5Ezkw0jJ6-tJLFKQPx4KpbvqHfFJnAg@mail.gmail.com>
References: <1374658699-3961-1-git-send-email-l.krishna@samsung.com>
	<1374658699-3961-2-git-send-email-l.krishna@samsung.com>
	<3356224.pISrcKET7X@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qe0-f44.google.com ([209.85.128.44]:50127 "EHLO
	mail-qe0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756531Ab3GZAcY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Jul 2013 20:32:24 -0400
Received: by mail-qe0-f44.google.com with SMTP id 6so694836qeb.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2013 17:32:23 -0700 (PDT)
In-Reply-To: <3356224.pISrcKET7X@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Jingoo Han <jg1.han@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Wim Van Sebroeck <wim@iguana.be>, devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>

Tomasz,

On Thu, Jul 25, 2013 at 3:27 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Leela,
>
> On Wednesday 24 of July 2013 15:08:17 Leela Krishna Amudala wrote:
>> This patch parses the watchdog node to read pmu wdt sys registers
>> addresses and do mask/unmask enable/disable of WDT in probe and s2r
>> scenarios.
>>
>> Reviewed-by: Doug Anderson <dianders@chromium.org>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> ---
>>  .../devicetree/bindings/watchdog/samsung-wdt.txt   |   14 ++++-
>>  drivers/watchdog/s3c2410_wdt.c                     |   56
>> ++++++++++++++++++++ 2 files changed, 69 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
>> b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt index
>> 2aa486c..4c798e3 100644
>> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
>> @@ -7,8 +7,20 @@ occurred.
>>  Required properties:
>>  - compatible : should be "samsung,s3c2410-wdt"
>>  - reg : base physical address of the controller and length of memory
>> mapped -      region.
>> +     region and the optional (addresses and length of memory mapped regions
>> +     of) PMU registers for masking/unmasking WDT.
>>  - interrupts : interrupt number to the cpu.
>
> I don't think PMU registers should be passed like this, even if USB PHY
> driver currently does it - it needs to be fixed. Every time you are mapping
> a single 4-byte register, you are creating new mapping for the whole page
> (4K) containing it. In addition, this makes the WDT driver map IO memory
> that does not belong to the IP block it handles, which is not nice.
>
> I would suggest looking into regmap helpers to implement a driver for the
> PMU that can share PMU registers with interested drivers.

We've done this in some other drivers as well.  I remember someone
suggested that this was fine when I posted the change to the ADC
driver for something similar.

Do you really think it's worth adding a level of abstraction here?
The argument I remember in the past was that it was fine as long as
the register itself was used only by this driver.

If we want to do as you say, we'll have to figure out whether you want
to create a new generic interface for this or reuse an existing one.
You could kinda think of these bits as enabling power, so you could
use the regulator framework.  ...but that framework often gets abused.

Olof: I think I got your advice when I did the ADC work.  Do you have
any advice here?

Thanks!

-Doug
