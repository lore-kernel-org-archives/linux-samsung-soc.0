From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [RESEND] [PATCH 1/1] ARM: dts: Add LEDs on odroid XU3 board
Date: Fri, 8 May 2015 15:45:09 +0530
Message-ID: <CANAwSgQA23GC-b6+Y_oam1bSsvRXT++Rf0yj6kwvY3YtZ=zNHg@mail.gmail.com>
References: <554C66F4.4070005@fivetechno.de> <554C6B28.7000306@samsung.com> <554C7DA2.5050603@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:36451 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751097AbbEHKPa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 06:15:30 -0400
Received: by wgiu9 with SMTP id u9so68035247wgi.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 May 2015 03:15:29 -0700 (PDT)
In-Reply-To: <554C7DA2.5050603@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>

Hi Markus/Krzysztof,

Tested-by: Anand Moon <linux.amoon@gmail.com>

I have tested this patch.

-Anand Moon


On 8 May 2015 at 14:40, Markus Reichl <m.reichl@fivetechno.de> wrote:
> Hi Krzysztof,
>
> Am 08.05.2015 um 09:52 schrieb Krzysztof Kozlowski:
>> On 08.05.2015 16:34, Markus Reichl wrote:
>>> This patch adds the RGB-LED on XU3 as 3 gpio-leds.
>>
>>> Tested-by: Anand Moon <linux.amoon@gmail.com>
>>
>> Unfortunately I could not found on LKML email from Anand that he
>> tested it. You sent the patch first time on 2nd of April - without
>> Anand's tested-by. On 13th of April it appeared with his tag.
>>
>> Guys, even when you work closely please send all tags publicly on LKML
>> so everyone could see them.
>>
>> Anand, do you confirm the tested-by?
>>
>>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de> --- It is
>>> derived from hardkernel's 3.10 tree.
>>
>> Hmmm... Whose original code it was? Shouldn't there be someone else
>> Signed-off-by here?
>
> I sent a mail to HK guys to get the respective contact address for
> another signed-off tag.
>
> After this and Anand's tag I'll come back with a resend.
>>
>> Best regards,
>> Krzysztof
>>
>>
> Best Regards,
> --
> Markus Reichl
>
