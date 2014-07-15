From: Sachin Kamat <spk.linux@gmail.com>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Update exynos_defconfig
Date: Tue, 15 Jul 2014 09:48:00 +0530
Message-ID: <CAK5sBcF3_zgRxMrxmo=Fr2ZdF=X3XWHLWneyCPENME3gNTMSiQ@mail.gmail.com>
References: <1404901353-14806-1-git-send-email-sachin.kamat@samsung.com>
	<CAD=FV=XHFY3OtPg6vttpAkX1he0iS6cFLVC6ESauG+1=gredwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:35877 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751093AbaGOESC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 00:18:02 -0400
Received: by mail-lb0-f173.google.com with SMTP id n15so1595625lbi.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2014 21:18:00 -0700 (PDT)
In-Reply-To: <CAD=FV=XHFY3OtPg6vttpAkX1he0iS6cFLVC6ESauG+1=gredwA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>

Hi Doug,

On Mon, Jul 14, 2014 at 10:17 PM, Doug Anderson <dianders@chromium.org> wrote:
> Sachin,
>
> On Wed, Jul 9, 2014 at 3:22 AM, Sachin Kamat <sachin.kamat@samsung.com> wrote:
>> Removed outdated configs. Enabled most of the configs used on latest
>> Exynos based platforms. This will provide a reference for users trying
>> to verify and test various features on Exynos based platforms and also
>> help in detecting breakages by widening the build coverage.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
>> ---
>>  arch/arm/configs/exynos_defconfig |   56 +++++++++++++++++++++++++++++++------
>>  1 file changed, 48 insertions(+), 8 deletions(-)
>
> How about "CONFIG_CPU_FREQ=y" + related configs?  I'm pretty sure that
> CPU_FREQ works on exynos5250-snow and the config didn't hurt last time
> I tried on exynos5420/5800.

I have left them out for now in the hope that they would soon get
obsoleted by the
latest patchset migrating to generic CPUFreq driver. I will send a
second round of
update around rc-7 based on the drivers prevalent then.

>
> Once Javier's changes land we'll need to add max77802 in here, but
> it's fine to leave it out until then.
>
> I'd also wonder about CONFIG_DRM eventually being set for graphics,
> but I'll admit to very little knowledge there.  That seems like it
> could be in a followup patch.

My plan was to include only basic things which are currently
functional in the first
round and then enable CPUFreq, DRM and PMIC (for 5420/5800) in the second round
(based on the merge status). Display/panel/bridge related patches are
not yet merged
and enabling hdmi, etc. would give errors as regulator is not
available. Again a second
round material.

>
> I would strongly suggest PREMPT_VOLUNTARY=y for now (again in a
> separate patch).

OK.

>With your config and 'slub_debug=FZPUA' I continue
> to get constant errors reported.  These errors are not your fault
> (they also show up on tegra boards).  I've already reported this and
> it's pretty much gone nowhere.
>
> Another suggestion is to enable the WiFi that's on ARM Chromebooks:
>   CONFIG_MWIFIEX=m
>   CONFIG_MWIFIEX_SDIO=m

OK.

>
> ...and that probably means some WiFi configs.  I'm not an expert, but
> possibly these.  The first of these appears to be needed to keep shill
> (present in the default ChromeOS rootfilesystem) from crashing wildly:
>   CONFIG_CFG80211=m
>   CONFIG_CFG80211_WEXT=y
>   CONFIG_MAC80211=m

OK. I would need someone to test these though.

>
>
> Possibly you should be enabling the battery eventually since
> Chromebooks have these too:
>   CONFIG_BATTERY_SBS=m

Sure.

>
> You're enabling the adc, but not what's hooked up to it:
>   CONFIG_SENSORS_NTC_THERMISTOR=m

OK.

>
> The eMMC that ships on Chromebooks has more than 8 partitions, so you
> probably should have this:
>   CONFIG_MMC_BLOCK_MINORS=16

OK.

>
> There's a light sensor on most ARM Chromebooks:
>   CONFIG_SENSORS_ISL29018=m

OK.

>
>
>
> All of the above could be in followup patches, so:
>
> Tested-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>

Thanks for your review and testing.

<snip>

>> +CONFIG_COMMON_CLK_S2MPS11=y
>> +CONFIG_EXYNOS_IOMMU=y
>> +CONFIG_IIO=y
>
> optional: You could probably =m this (and the ADC).  Better to test
> the =m case I think and there's no strong need for this to be in the
> kernel.

OK.

-- 
Regards,
Sachin.
