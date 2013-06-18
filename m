From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v2] clk: exynos4: Add clock entries for TMU
Date: Tue, 18 Jun 2013 10:45:33 +0530
Message-ID: <CAK9yfHzCJ2njTWGPdTG4qhuu7BGPPzpKRKLhQPgV-Q5NtJTphA@mail.gmail.com>
References: <1366602946-8264-1-git-send-email-sachin.kamat@linaro.org>
	<20130429170052.8923.66455@quantum>
	<CAK9yfHzAHx-5vznBi2K2cY7kYmGmrojwLriNGaXw1tesNoZ2-A@mail.gmail.com>
	<CAK9yfHw_2c1WbSJ7QiN1KBE-H_5BvBNwGRUO3RoHQ6GbFCVphA@mail.gmail.com>
	<1a0b01ce6b53$4a126460$de372d20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:45261 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754238Ab3FRFPd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 01:15:33 -0400
Received: by mail-oa0-f44.google.com with SMTP id l10so4533309oag.31
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 22:15:33 -0700 (PDT)
In-Reply-To: <1a0b01ce6b53$4a126460$de372d20$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>

On 17 June 2013 17:37, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> On 10 June 2013 14:21, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> > Hi Kukjin,
>> >
>> > On 29 April 2013 22:30, Mike Turquette <mturquette@linaro.org> wrote:
>> >> Quoting Sachin Kamat (2013-04-21 20:55:46)
>> >>> Added clock entries for thermal management unit (TMU) for
>> >>> Exynos4 SoCs.
>> >>>
>> >>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> >>> Cc: Thomas Abraham <thomas.abraham@linaro.org>
>> >>> Cc: Mike Turquette <mturquette@linaro.org>
>> >>
>> >> This has my Ack if you plan to take it through the Samsung tree.
>> >> If you want it to go through the clk tree then I can take it in after
>> >> 3.10-rc1.
>> >
>> > Can you apply this one too to Samsung tree?
>> > Thanks.
>>
>> Kukjin,
>>
>> Can you please take this through your tree? This alreday has MIke's Ack.
>>
> Sure, I've applied with Mike's ack.

Thanks. But did not find this in your for-next yet. Not pushed out yet?

Also, please add the following series too.
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/17942


-- 
With warm regards,
Sachin
