From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH] ASoC: Samsung: i2s: Fix crash in i2s driver
Date: Tue, 7 May 2013 16:42:40 +0530
Message-ID: <CAAgF-BcgtjKPoSy8SPsk3WnS8T3P9f=5U2tt3WHb0fFM=M61+w@mail.gmail.com>
References: <1367897941-18439-1-git-send-email-padma.v@samsung.com>
	<2286960.PxJxnETVLS@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:64372 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755550Ab3EGLMl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 May 2013 07:12:41 -0400
Received: by mail-ie0-f179.google.com with SMTP id c13so685901ieb.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2013 04:12:40 -0700 (PDT)
In-Reply-To: <2286960.PxJxnETVLS@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sangbeom Kim <sbkim73@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Kukjin Kim <kgene.kim@samsung.com>, alim.akhtar@samsung.com, thomas.ab@samsung.com

Hi Tomasz,

On Tue, May 7, 2013 at 3:20 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Padmavathi,
>
> On Tuesday 07 of May 2013 09:09:01 Padmavathi Venna wrote:
>> This patch fixes a null pointer deference in i2s driver in DT
>> case
>>
>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>> ---
>>
>> This patch is dependent on below patch posted by Thomas Abraham.
>> https://patchwork.kernel.org/patch/2224801/
>>
>>  sound/soc/samsung/i2s.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
>> index 7ce7c50..eaf6439 100644
>> --- a/sound/soc/samsung/i2s.c
>> +++ b/sound/soc/samsung/i2s.c
>> @@ -1182,7 +1182,7 @@ static int samsung_i2s_probe(struct platform_device
>> *pdev) pri_dai->sec_dai = sec_dai;
>>       }
>>
>> -     if (i2s_pdata->cfg_gpio && i2s_pdata->cfg_gpio(pdev)) {
>> +     if (i2s_pdata && i2s_pdata->cfg_gpio && i2s_pdata->cfg_gpio(pdev)) {
>
> This is a problem that needs to be fixed indeed. However the same problem
> exists in samsung_i2s_remove() as well (at least in latest linux-next).

This will go off once Thomas "ASoC: samsung: let device core setup the
default pin configuration"
patch get merged.

>
> This makes me wonder what happens with i2s_pdata in DT case. Most of drivers
> allocate a pdata struct anyway and fill it with data parsed from device tree.
> This allows rest of the code to remain unmodified and consider DT and non-DT
> cases equal.

This driver doesn't allocate the i2s_pdata in DT case. It directly
parse the information form DT file
and assign that information to i2s_dai.

Thanks
Padma

>
> Best regards,
> --
> Tomasz Figa
> Samsung Poland R&D Center
> SW Solution Development, Kernel and System Framework
>
