From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCHv2 1/2] ARM: exynos_defconfig: Enable CONFIG_SND_SOC_ODROIDX2
 for Odroid-XU3
Date: Tue, 9 Jun 2015 08:09:35 +0530
Message-ID: <CANAwSgQchBKumr4WMZ-REMcMN-CgGfeVuJ=nd+j6DeYe2S-S0g@mail.gmail.com>
References: <1433696621-4763-1-git-send-email-linux.amoon@gmail.com> <55762A4E.5090208@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f195.google.com ([209.85.212.195]:33859 "EHLO
	mail-wi0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751372AbbFICj4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Jun 2015 22:39:56 -0400
In-Reply-To: <55762A4E.5090208@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hi,

On 9 June 2015 at 05:20, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
> On 08.06.2015 02:03, Anand Moon wrote:
>> Enable CONFIG_SND_SOC_ODROIDX2 and CONFIG_SND_SIMPLE_CARD to enable
>> sound on Odroid-XU3 board.
>>
>> Below is the output of boot log.
>> [    6.021550] max98090 5-0010: MAX98090 REVID=0x43
>> [    6.025506] random: nonblocking pool is initialized
>> [    6.047297] asoc-simple-card sound: HiFi <-> 3830000.i2s mapping ok
>> [    6.068392] s5m-rtc s2mps14-rtc: setting system clock to 2015-06-07 12:51:06 UTC (1433681466)
>> [    6.123650] ALSA device list:
>> [    6.135203]   #0: Odroid-XU3
>
> Answering the question "why" and "what is device" would be sufficient.
> You answered the first question ("enable sound") so you can just add
> second part - using the max98090 audio codec.
>
> This whole dmesg does not bring any benefits here, especially the
> irrelevant items (like random or RTC). Could you trim the commit message?
>
> Beside of that it looks fine however you marked this as "v2":
> 1. I cannot find v1 on Google. The title was the same?
> 2. Where is changelog?
>
> Best regards,
> Krzysztof

Look like I an doom to make mistake.
This series of patch got PATCHv2 tag,
It's my mistake. not maintain the version of the patch.
I will resend it.

-Anand Moon
