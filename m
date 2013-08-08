From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V3 2/3] ASoC: Samsung: I2S: Add quirks as driver data in I2S
Date: Thu, 8 Aug 2013 13:13:02 +0530
Message-ID: <CAAgF-BdpsgQk8myq7OOk5zJ8Zxy+J6LUPb3-d40+iE2aNwdwDw@mail.gmail.com>
References: <1375865122-5258-1-git-send-email-padma.v@samsung.com>
	<1375865122-5258-3-git-send-email-padma.v@samsung.com>
	<2116389.OxrlCQ9LXd@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:62000 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757013Ab3HHHnE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Aug 2013 03:43:04 -0400
In-Reply-To: <2116389.OxrlCQ9LXd@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, "broonie@kernel.org" <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, abrestic@chromium.org

Hi Tomasz,

On Wed, Aug 7, 2013 at 4:43 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> Ahh, one more thing inline.
>

[snip]

>>
>> +static struct samsung_i2s_dai_data i2sv3_dai_type = {
>> +     .dai_type = TYPE_PRI,
>> +     .quirks = QUIRK_NO_MUXPSR,
>> +};
>> +
>> +static struct samsung_i2s_dai_data i2sv4_dai_type = {
>> +     .dai_type = TYPE_PRI,
>> +     .quirks = QUIRK_PRI_6CHAN | QUIRK_NO_MUXPSR,
>> +};
>> +
>> +static struct samsung_i2s_dai_data i2sv5_c100_dai_type = {
>> +     .dai_type = TYPE_PRI,
>> +     .quirks = QUIRK_PRI_6CHAN | QUIRK_NO_MUXPSR | QUIRK_SEC_DAI |
>> +                     QUIRK_NEED_RSTCLR,
>> +};
>> +
>> +static struct samsung_i2s_dai_data i2sv5_dai_type = {
>> +     .dai_type = TYPE_PRI,
>> +     .quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR,
>> +};
>> +
>> +static struct samsung_i2s_dai_data samsung_dai_type_sec = {
>> +     .dai_type = TYPE_SEC,
>> +};
>> +
>>  static struct platform_device_id samsung_i2s_driver_ids[] = {
>>       {
>> -             .name           = "samsung-i2s",
>> -             .driver_data    = TYPE_PRI,
>> +             .name           = "samsung,s3c6410-i2s",
>> +             .driver_data    = (kernel_ulong_t)&i2sv3_dai_type,
>> +     }, {
>> +             .name           = "samsung,s3c6410-i2s-multi",
>> +             .driver_data    = (kernel_ulong_t)&i2sv4_dai_type,
>> +     }, {
>> +             .name           = "samsung,s5pc100-i2s",
>> +             .driver_data    = (kernel_ulong_t)&i2sv5_c100_dai_type,
>>       }, {
>> -             .name           = "samsung-i2s-sec",
>> -             .driver_data    = TYPE_SEC,
>> +             .name           = "samsung,s5pv210-i2s",
>> +             .driver_data    = (kernel_ulong_t)&i2sv5_dai_type,
>> +     }, {
>> +             .name           = "samsung-i2s-sec",
>> +             .driver_data    = (kernel_ulong_t)&samsung_dai_type_sec,
>
> I don't think you need to change the legacy platform IDs at all.

If legacy platforms not required to change then I need to introduce a
new samsung_i2s_dai_data structure which holds only dai_type for
non-dt platforms. If I change legacy platforms it breaks the older
platforms now. Is it okay adding a samsung_i2s_dai_data structure for
non-dt platforms which will be removed later?

>
> IMHO it would be better to keep the old way of quirk retrieval from
> platform_data (which I think this patch does anyway, because the probe path
> without DT is unchanged), as it will be dropped in some point in time
> anyway.
>
> This would also eliminate the need for patch 1.
>
> Best regards,
> Tomasz
>

Thanks
Padma
