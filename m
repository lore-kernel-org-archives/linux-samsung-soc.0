From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Update exynos_defconfig
Date: Mon, 14 Jul 2014 18:46:07 -0700
Message-ID: <CAOesGMigojxCjXEEOgf4cwPyhLMSm7mmLHQ5BzhJQcgmzj4B5g@mail.gmail.com>
References: <1404901353-14806-1-git-send-email-sachin.kamat@samsung.com>
	<CAD=FV=XHFY3OtPg6vttpAkX1he0iS6cFLVC6ESauG+1=gredwA@mail.gmail.com>
	<CAOesGMgyZN8TApVO0Svi65qLBzV6jnzGNg9UP1U+hRw=uXg1Bw@mail.gmail.com>
	<020e01cf9fcc$1c91dda0$55b598e0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:49332 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753301AbaGOBqI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 21:46:08 -0400
Received: by mail-vc0-f169.google.com with SMTP id hu12so3789891vcb.14
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2014 18:46:07 -0700 (PDT)
In-Reply-To: <020e01cf9fcc$1c91dda0$55b598e0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Doug Anderson <dianders@chromium.org>, Sachin Kamat <sachin.kamat@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sachin Kamat <spk.linux@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kevin Hilman <khilman@linaro.org>

On Mon, Jul 14, 2014 at 6:28 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Olof Johansson wrote:
>>
>> On Mon, Jul 14, 2014 at 9:47 AM, Doug Anderson <dianders@chromium.org> wrote:
>> > Sachin,
>> >
>> > On Wed, Jul 9, 2014 at 3:22 AM, Sachin Kamat <sachin.kamat@samsung.com> wrote:
>> >> Removed outdated configs. Enabled most of the configs used on latest
>> >> Exynos based platforms. This will provide a reference for users trying
>> >> to verify and test various features on Exynos based platforms and also
>> >> help in detecting breakages by widening the build coverage.
>> >>
>> >> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
>> >> ---
>> >>  arch/arm/configs/exynos_defconfig |   56 +++++++++++++++++++++++++++++++------
>> >>  1 file changed, 48 insertions(+), 8 deletions(-)
>> >
>> > How about "CONFIG_CPU_FREQ=y" + related configs?  I'm pretty sure that
>> > CPU_FREQ works on exynos5250-snow and the config didn't hurt last time
>> > I tried on exynos5420/5800.
>> >
>> > Once Javier's changes land we'll need to add max77802 in here, but
>> > it's fine to leave it out until then.
>> >
>> > I'd also wonder about CONFIG_DRM eventually being set for graphics,
>> > but I'll admit to very little knowledge there.  That seems like it
>> > could be in a followup patch.
>> >
>> > I would strongly suggest PREMPT_VOLUNTARY=y for now (again in a
>> > separate patch).  With your config and 'slub_debug=FZPUA' I continue
>> > to get constant errors reported.  These errors are not your fault
>> > (they also show up on tegra boards).  I've already reported this and
>> > it's pretty much gone nowhere.
>> >
>> > Another suggestion is to enable the WiFi that's on ARM Chromebooks:
>> >   CONFIG_MWIFIEX=m
>> >   CONFIG_MWIFIEX_SDIO=m
>> >
>> > ...and that probably means some WiFi configs.  I'm not an expert, but
>> > possibly these.  The first of these appears to be needed to keep shill
>> > (present in the default ChromeOS rootfilesystem) from crashing wildly:
>> >   CONFIG_CFG80211=m
>> >   CONFIG_CFG80211_WEXT=y
>> >   CONFIG_MAC80211=m
>> >
>> >
>> > Possibly you should be enabling the battery eventually since
>> > Chromebooks have these too:
>> >   CONFIG_BATTERY_SBS=m
>> >
>> > You're enabling the adc, but not what's hooked up to it:
>> >   CONFIG_SENSORS_NTC_THERMISTOR=m
>> >
>> > The eMMC that ships on Chromebooks has more than 8 partitions, so you
>> > probably should have this:
>> >   CONFIG_MMC_BLOCK_MINORS=16
>> >
>> > There's a light sensor on most ARM Chromebooks:
>> >   CONFIG_SENSORS_ISL29018=m
>> >
>> >
>> >
>> > All of the above could be in followup patches, so:
>> >
>> > Tested-by: Doug Anderson <dianders@chromium.org>
>> > Reviewed-by: Doug Anderson <dianders@chromium.org>
>>
>> Gave this a go on my board farm as well, it looks better than before
>
> Sounds good. I will take into fixes for 3.16 and will send out to arm-soc soon.

3.16 is regressions-only now, so this is 3.17 material now.


-Olof
