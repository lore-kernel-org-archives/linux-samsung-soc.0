From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 1/2] drm/exynos: add support for dt based search to
 exynos4 hdmi
Date: Thu, 31 Jan 2013 13:43:00 +0530
Message-ID: <CAPdUM4NJJg4_QjEXTW3ZHXBE=h35KwzudmHK8eEbnZMbcH1Svg@mail.gmail.com>
References: <1359111346-12908-1-git-send-email-rahul.sharma@samsung.com>
	<1359111346-12908-2-git-send-email-rahul.sharma@samsung.com>
	<CAAQKjZNsrpk75yEaztKBAx-apZpF3iinFYJ-G_ytPmLweE4kZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:54305 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755108Ab3AaINC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jan 2013 03:13:02 -0500
Received: by mail-wi0-f176.google.com with SMTP id hm14so3420527wib.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Jan 2013 00:13:00 -0800 (PST)
In-Reply-To: <CAAQKjZNsrpk75yEaztKBAx-apZpF3iinFYJ-G_ytPmLweE4kZg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, joshi@samsung.com

Thanks Mr. Dae,

I will include DT binding documentation in Arch side patches.
I am following the mentioned thread.

regards,
Rahul Sharma.

On Wed, Jan 30, 2013 at 12:07 PM, Inki Dae <inki.dae@samsung.com> wrote:
> Hi Rahul,
>
> Could you add descriptions to dt document file? For this, you can
> refer to the below link,
>         https://patchwork.kernel.org/patch/1948061/
>
> Thanks,
> Inki Dae
>
> 2013/1/25 Rahul Sharma <rahul.sharma@samsung.com>:
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_ddc.c     | 2 ++
>>  drivers/gpu/drm/exynos/exynos_hdmi.c    | 6 ++++++
>>  drivers/gpu/drm/exynos/exynos_hdmiphy.c | 2 ++
>>  3 files changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_ddc.c b/drivers/gpu/drm/exynos/exynos_ddc.c
>> index 4e9b5ba..7680809 100644
>> --- a/drivers/gpu/drm/exynos/exynos_ddc.c
>> +++ b/drivers/gpu/drm/exynos/exynos_ddc.c
>> @@ -53,6 +53,8 @@ static struct of_device_id hdmiddc_match_types[] = {
>>         {
>>                 .compatible = "samsung,exynos5-hdmiddc",
>>         }, {
>> +               .compatible = "samsung,exynos4-hdmiddc",
>> +       }, {
>>                 /* end node */
>>         }
>>  };
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> index fbab3c4..202b65f 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> @@ -2418,6 +2418,12 @@ static struct platform_device_id hdmi_driver_types[] = {
>>  #ifdef CONFIG_OF
>>  static struct of_device_id hdmi_match_types[] = {
>>         {
>> +               .compatible = "samsung,exynos4-hdmi",
>> +               .data   = (void *)HDMI_TYPE13,
>> +       }, {
>> +               .compatible = "samsung,exynos4-hdmi14",
>> +               .data   = (void *)HDMI_TYPE14,
>> +       }, {
>>                 .compatible = "samsung,exynos5-hdmi",
>>                 .data   = (void *)HDMI_TYPE14,
>>         }, {
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmiphy.c b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
>> index ea49d13..2e33f90 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmiphy.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
>> @@ -51,6 +51,8 @@ static struct of_device_id hdmiphy_match_types[] = {
>>         {
>>                 .compatible = "samsung,exynos5-hdmiphy",
>>         }, {
>> +               .compatible = "samsung,exynos4-hdmiphy",
>> +       }, {
>>                 /* end node */
>>         }
>>  };
>> --
>> 1.8.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
