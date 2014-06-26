From: Sachin Kamat <sachin.kamat@samsung.com>
Subject: Re: [PATCH 1/2] usb: host: Kconfig: Select PHY drivers for Exynos EHCI/OHCI
Date: Thu, 26 Jun 2014 14:32:04 +0530
Message-ID: <CAK5sBcH-WNuZ-UHO4kaBZ9j1jq9EX3_o=B3CmHTuBvEtp-Yf8w@mail.gmail.com>
References: <1403761178-5371-1-git-send-email-sachin.kamat@samsung.com>
	<53ABDE90.2010103@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:62242 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750960AbaFZJCF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 05:02:05 -0400
In-Reply-To: <53ABDE90.2010103@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Doug Anderson <dianders@chromium.org>, Vivek Gautam <gautam.vivek@samsung.com>

Hi Kishon,

On Thu, Jun 26, 2014 at 2:19 PM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
> Hi Sachin,
>
> On Thursday 26 June 2014 11:09 AM, Sachin Kamat wrote:
>> EHCI and OHCI drivers on Exynos platforms do not work without their
>> corresponding SoC specific phy drivers. Hence it makes no sense to
>> keep these phy drivers as user selectable. Instead select them from
>> the respective USB configs to make things easier for the end user.
>> While at it enable 5250 phy for Exynos 5420 SoC too.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
>> Cc: Kishon Vijay Abraham I <kishon@ti.com>
>> ---
>>  drivers/phy/Kconfig      |   37 +++++++------------------------------
>>  drivers/usb/host/Kconfig |   10 ++++++----
>>  2 files changed, 13 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index 16a2f067c242..7fe7ef5f1322 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>
> <snip>
>
>>
>>  config USB_EHCI_EXYNOS
>> -       tristate "EHCI support for Samsung S5P/EXYNOS SoC Series"
>> -       depends on PLAT_S5P || ARCH_EXYNOS
>> -       help
>> -     Enable support for the Samsung Exynos SOC's on-chip EHCI controller.
>> +     tristate "EHCI support for Samsung S5P/EXYNOS SoC Series"
>> +     depends on PLAT_S5P || ARCH_EXYNOS
>> +     select PHY_SAMSUNG_USB2 if ARCH_EXYNOS
>
> I am skeptical to add select after the problems it created during previous
> releases.

If you could point me to some link/discussion about this, I could check if such
problem is applicable here. IMHO, there shouldn't be any in this case.

> Maybe use 'default y if ARCH_EXYNOS' in PHY_SAMSUNG_USB2 Kconfig?

I would prefer to use this option only if there is a strong objection
to doing it the
current way as I do not see any benefits of exposing the PHY entries
that are only
prerequisites for the USB functionality (in this case) to users.

Regards,
Sachin.
