From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: DTS: correct the capability string for mmc0
Date: Tue, 24 Jun 2014 14:33:20 -0700
Message-ID: <CAD=FV=XJpx_otzW-dWNj1rnXMYab7vPGjo2KNirwyVKtEKat2w@mail.gmail.com>
References: <1403522420-1208-1-git-send-email-ch.naveen@samsung.com>
	<034701cf8ed7$70c78330$52568990$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f169.google.com ([209.85.128.169]:34349 "EHLO
	mail-ve0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751456AbaFXVdV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 17:33:21 -0400
Received: by mail-ve0-f169.google.com with SMTP id pa12so1053054veb.28
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2014 14:33:21 -0700 (PDT)
In-Reply-To: <034701cf8ed7$70c78330$52568990$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kevin Hilman <khilman@linaro.org>, Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>, Seungwon Jeon <tgih.jun@samsung.com>, Chris Ball <cjb@laptop.org>

Hi,

On Mon, Jun 23, 2014 at 4:36 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Naveen Krishna Chatradhi wrote:
>>
>> MMC capability for HS200 is parsed in mmc/core/host.c as
>> dts string "mmc-hs200-1_8v".
>>
>> This patch corrects the dts string for Exynos5420 based peach-pit
>> and Exynos5800 based peach-pi boards.
>>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5420-peach-pit.dts |    2 +-
>>  arch/arm/boot/dts/exynos5800-peach-pi.dts  |    2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-
>> peach-pit.dts
>> index 7649982..7dea480 100644
>> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> @@ -173,7 +173,7 @@
>>       status = "okay";
>>       num-slots = <1>;
>>       broken-cd;
>> -     caps2-mmc-hs200-1_8v;
>> +     mmc-hs200-1_8v;
>>       supports-highspeed;
>>       non-removable;
>>       card-detect-delay = <200>;
>> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-
>> peach-pi.dts
>> index 2c2c137..bb3ee76 100644
>> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> @@ -171,7 +171,7 @@
>>       status = "okay";
>>       num-slots = <1>;
>>       broken-cd;
>> -     caps2-mmc-hs200-1_8v;
>> +     mmc-hs200-1_8v;
>>       supports-highspeed;
>>       non-removable;
>>       card-detect-delay = <200>;
>> --
>> 1.7.9.5
>
> Applied, thanks.

As an FYI: this patch (while correct) will likely cause sporadic boot
failures until Sonny and my patches land:

* https://patchwork.kernel.org/patch/4323921/
  mmc: dw_mmc: Make sure we don't get stuck when we get an error

* https://patchwork.kernel.org/patch/4213211/
  mmc: dw_mmc: change to use recommended reset procedure

In the very least we got sporadic boot failures locally when we
enabled hs200 and didn't have the "don't get stuck" patch.  I will
also note that it would have been nice had this patch title included
the words exynos and/or pit/pi in it.

-Doug
