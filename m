From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Update exynos_defconfig
Date: Mon, 14 Jul 2014 11:50:17 -0700
Message-ID: <CAOesGMgyZN8TApVO0Svi65qLBzV6jnzGNg9UP1U+hRw=uXg1Bw@mail.gmail.com>
References: <1404901353-14806-1-git-send-email-sachin.kamat@samsung.com>
	<CAD=FV=XHFY3OtPg6vttpAkX1he0iS6cFLVC6ESauG+1=gredwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f175.google.com ([209.85.220.175]:39309 "EHLO
	mail-vc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756529AbaGNSuS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 14:50:18 -0400
Received: by mail-vc0-f175.google.com with SMTP id hu12so2926316vcb.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2014 11:50:17 -0700 (PDT)
In-Reply-To: <CAD=FV=XHFY3OtPg6vttpAkX1he0iS6cFLVC6ESauG+1=gredwA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Sachin Kamat <sachin.kamat@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <spk.linux@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kevin Hilman <khilman@linaro.org>

On Mon, Jul 14, 2014 at 9:47 AM, Doug Anderson <dianders@chromium.org> wrote:
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
>
> Once Javier's changes land we'll need to add max77802 in here, but
> it's fine to leave it out until then.
>
> I'd also wonder about CONFIG_DRM eventually being set for graphics,
> but I'll admit to very little knowledge there.  That seems like it
> could be in a followup patch.
>
> I would strongly suggest PREMPT_VOLUNTARY=y for now (again in a
> separate patch).  With your config and 'slub_debug=FZPUA' I continue
> to get constant errors reported.  These errors are not your fault
> (they also show up on tegra boards).  I've already reported this and
> it's pretty much gone nowhere.
>
> Another suggestion is to enable the WiFi that's on ARM Chromebooks:
>   CONFIG_MWIFIEX=m
>   CONFIG_MWIFIEX_SDIO=m
>
> ...and that probably means some WiFi configs.  I'm not an expert, but
> possibly these.  The first of these appears to be needed to keep shill
> (present in the default ChromeOS rootfilesystem) from crashing wildly:
>   CONFIG_CFG80211=m
>   CONFIG_CFG80211_WEXT=y
>   CONFIG_MAC80211=m
>
>
> Possibly you should be enabling the battery eventually since
> Chromebooks have these too:
>   CONFIG_BATTERY_SBS=m
>
> You're enabling the adc, but not what's hooked up to it:
>   CONFIG_SENSORS_NTC_THERMISTOR=m
>
> The eMMC that ships on Chromebooks has more than 8 partitions, so you
> probably should have this:
>   CONFIG_MMC_BLOCK_MINORS=16
>
> There's a light sensor on most ARM Chromebooks:
>   CONFIG_SENSORS_ISL29018=m
>
>
>
> All of the above could be in followup patches, so:
>
> Tested-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>

Gave this a go on my board farm as well, it looks better than before
for sure. Boot logs are at:
http://arm-soc.lixom.net/bootlogs/misc/v3.16-rc4-360-g1501776

There are still some issues to resolve but this is an improvement so
let's pick it up and fix with new patches on top.

Some of the new warnings are:

[WARN] [    0.785066] usb@12000000 supply vdd33 not found, using dummy regulator
[WARN] [    0.791071] usb@12000000 supply vdd10 not found, using dummy regulator
[WARN] [    0.998658] usb@12400000 supply vdd33 not found, using dummy regulator
[WARN] [    1.004049] usb@12400000 supply vdd10 not found, using dummy regulator
[WARN] [    1.673277] 10060000.tmu supply vtmu not found, using dummy regulator
[WARN] [    1.685873] 10064000.tmu supply vtmu not found, using dummy regulator
[WARN] [    1.706262] 10068000.tmu supply vtmu not found, using dummy regulator
[WARN] [    1.720076] 1006c000.tmu supply vtmu not found, using dummy regulator
[WARN] [    1.733957] 100a0000.tmu supply vtmu not found, using dummy regulator

On snow there is also the below. The L2C might be fixed on -next, it
needs to be checked for.

[ERR] [    0.000000] L2C: failed to init: -19
[ERR] [    2.118115] cros-ec-i2c-tunnel cros-ec-i2c-tunnel.2: Couldn't
read remote-bus property
[ERR] [    2.726727] max98095 7-0011: ASoC: mux Linein Mux has no paths
[ERR] [    2.731092] max98095 7-0011: ASoC: mux External MIC has no paths

[WARN] [    2.125843] cros-ec-i2c-tunnel: probe of
cros-ec-i2c-tunnel.2 failed with error -22
[WARN] [    2.138322] tps65090 104-0048: No cache defaults, reading back from HW
[WARN] [    2.296011] tps65090-charger tps65090-charger: Unable to get
charger irq = -22
[WARN] [    2.313705] tps65090-charger: probe of tps65090-charger
failed with error -22



-Olof
