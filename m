From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH Resend 1/1] Documentation/watchdog: Add binding example in samsung-wdt
Date: Wed, 30 Oct 2013 12:34:18 +0530
Message-ID: <CAK9yfHxQ6X-Vc0ZbetAXNBCb1PMgMLbGRAs=ZMjYRWmTJN4J8Q@mail.gmail.com>
References: <1383110797-26225-1-git-send-email-sachin.kamat@linaro.org>
	<CAL1wa8fDt2O++FwUDa8ErRkSKL_8=f-sjmUN6EcPzxN0+xE6cA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:61196 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751681Ab3J3HET (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Oct 2013 03:04:19 -0400
Received: by mail-oa0-f47.google.com with SMTP id i1so1039674oag.20
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2013 00:04:18 -0700 (PDT)
In-Reply-To: <CAL1wa8fDt2O++FwUDa8ErRkSKL_8=f-sjmUN6EcPzxN0+xE6cA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <leelakrishna.a@gmail.com>
Cc: linux-watchdog@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>

On 30 October 2013 12:13, Leela Krishna Amudala
<leelakrishna.a@gmail.com> wrote:
> Hi Sachin,
>
> On Wed, Oct 30, 2013 at 10:56 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> Added an example for reference.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  .../devicetree/bindings/watchdog/samsung-wdt.txt   |    9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
>> index 2aa486c..7ddf461 100644
>> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
>> @@ -12,3 +12,12 @@ Required properties:
>>
>>  Optional properties:
>>  - timeout-sec : contains the watchdog timeout in seconds.
>> +
>> +Example:
>> +
>> +watchdog@101D0000 {
>> +       compatible = "samsung,s3c2410-wdt";
>> +       reg = <0x101D0000 0x100>;
>> +       interrupts = <0 42 0>;
>> +       status = "disabled";
>> +};
>
> This example node has been changed and I posted the latest version.
> So, you can abandon this patch now.
>

Yes. Makes sense.

-- 
With warm regards,
Sachin
