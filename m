From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V2 1/8] platform: Increase platform name size
Date: Sat, 27 Jul 2013 06:43:23 +0530
Message-ID: <CAAgF-Bf2fkcZG27QmkhumpB27OkA+WR4vRb1rUumJpOaoDewcg@mail.gmail.com>
References: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
	<1374845812-7803-2-git-send-email-padma.v@samsung.com>
	<CAK9yfHxX7j8o3rQNzDM2eL6M66CJVcdGSz3XYR2-4i=5SmCinA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:35335 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756230Ab3G0BNX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 21:13:23 -0400
Received: by mail-oa0-f47.google.com with SMTP id m6so2143383oag.34
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2013 18:13:23 -0700 (PDT)
In-Reply-To: <CAK9yfHxX7j8o3rQNzDM2eL6M66CJVcdGSz3XYR2-4i=5SmCinA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, "broonie@kernel.org" <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, abrestic@chromium.org, Tomasz Figa <tomasz.figa@gmail.com>

Hi Sachin,

On Fri, Jul 26, 2013 at 8:06 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi Padma,
>
> On 26 July 2013 19:06, Padmavathi Venna <padma.v@samsung.com> wrote:
>> This patch increases the platform name size from 20 to 30.
>
> Instead of describing what the patch does (which is quite obvious from
> the code), it would be useful to describe why this change is required.

OK. I will post in my next version.

>
>
>>
>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>> ---
>>  include/linux/mod_devicetable.h |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
>> index b62d4af..f67b5d5 100644
>> --- a/include/linux/mod_devicetable.h
>> +++ b/include/linux/mod_devicetable.h
>> @@ -478,7 +478,7 @@ struct dmi_system_id {
>>  #define DMI_MATCH(a, b)        { .slot = a, .substr = b }
>>  #define DMI_EXACT_MATCH(a, b)  { .slot = a, .substr = b, .exact_match = 1 }
>>
>> -#define PLATFORM_NAME_SIZE     20
>> +#define PLATFORM_NAME_SIZE     30
>>  #define PLATFORM_MODULE_PREFIX "platform:"
>>
>>  struct platform_device_id {
>> --
>> 1.7.4.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> With warm regards,
> Sachin

Thanks
Padma
