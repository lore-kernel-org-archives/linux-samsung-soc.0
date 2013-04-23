From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH RESEND] ARM: EXYNOS: no more support non-DT for EXYNOS
 SoCs
Date: Tue, 23 Apr 2013 23:14:54 +0900
Message-ID: <5176975E.5000802@samsung.com>
References: <51642dab.e844440a.0ad1.ffffc13f@mx.google.com> <516571BC.9030909@samsung.com> <51756E98.9040606@samsung.com> <201304222111.45653.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:42109 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755538Ab3DWOPA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 10:15:00 -0400
Received: by mail-pa0-f54.google.com with SMTP id fa11so522992pad.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2013 07:15:00 -0700 (PDT)
In-Reply-To: <201304222111.45653.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Olof Johansson' <olof@lixom.net>

On 04/23/13 04:11, Arnd Bergmann wrote:

>>>> I still have hope to get those included.
>>>>
>>> I agree and I asked Tomasz to re-send universal dt patch.
>>>
>> Hi Arnd and Olof,
>>
>> Is it possible to send one more pull-request for this and something like
>> dt patches for exynos?
>
> I think it's too late for that now, let's just fix the broken pieces
> now and do the minimum amount of patches on top of what we have:
>
Agreed, but following has been sent to arm-soc as a name of 'dt-exynos2 
for v3.10' at 4/10, even though its base should be fixed.

--------8<----------------8<---------
Sachin Kamat (5):
       ARM: dts: Remove keypad entries from exynos4x12-pinctrl.dtsi
       ARM: dts: Add keypad entries to Exynos4412 based Origen
       ARM: dts: Add keypad entries to SMDK4412
       ARM: dts: Add MFC clock entries for exynos4
       ARM: dts: Update MFC documentation for clock entries

Vivek Gautam (5):
       ARM: dts: Enabling samsung-usb2phy driver for exynos5250
       ARM: dts: Enabling samsung-usb3phy driver for exynos5250
       ARM: dts: Add device tree bindings for dwc3-exynos
       ARM: dts: Enabling dwc3-exynos driver for exynos5250
       ARM: EXYNOS: Enable XHCI support on exynos5

.../devicetree/bindings/media/s5p-mfc.txt          |  5 ++
  .../devicetree/bindings/usb/exynos-usb.txt         | 34 +++++++++
  arch/arm/boot/dts/exynos4.dtsi                     |  2 +
  arch/arm/boot/dts/exynos4412-origen.dts            | 62 +++++++++++++++
  arch/arm/boot/dts/exynos4412-smdk4412.dts          | 87 
++++++++++++++++++++++
  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi          | 56 --------------
  arch/arm/boot/dts/exynos5250.dtsi                  | 45 +++++++++++
  arch/arm/mach-exynos/Kconfig                       |  1 +
  8 files changed, 236 insertions(+), 56 deletions(-)
--------8<----------------8<---------

So I'd like to send below you mentioned with above.

Note that I will send this removing non-DT exynos support patch to 
arm-soc tree after release v3.10-rc1.

> * Thomas Abraham's fix for the clk code

Included in my late-dt branch for exynos.

> * Tomasz Figa's patch to restore Universal C210

If you mean '[PATCH v2 0/3] ARM: EXYNOS: DT-enabled support for 
Universal C210', the series included but as I know, that depends on 
'[PATCH v5 00/14] ARM: samsung-time: Prepare for multiplatform support' 
you asked to postpone for v3.11...

> * Whatever is needed to get USB working again on Arndale

Hmm, I'm not sure which patch is needed for this on Arndale, 
unfortunately, I don't have the platform...Probably above Vivek's patches?

> * Anything else that comes up that is really a bug fix.

Yes, right.

> * Getting the PWM and ADC drivers working with DT, that can
>    easily be done.

OK.

> * Possibly a patch to mark CONFIG_EXYNOS_ATAGS as broken,
>    if you think that helps.

Yes.

> but not:
>
> * The entire series to rework the PWM clock from Tomasz

See above comments.

> * The entire series to remove ATAGS support on Exynos

OK.

> * Any other non-bugfix patches
>
OK.

- Kukjin
