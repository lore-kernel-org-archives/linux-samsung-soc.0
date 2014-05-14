From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH v4 4/5] ARM: dts: remove chip specific hdmi hpd pin from board
Date: Thu, 15 May 2014 00:53:04 +0530
Message-ID: <CAPdUM4P_huO9BNAyUhr+S1di9h+Gxw9T0zJaEUisa+ss4h63gg@mail.gmail.com>
References: <1400035562-16832-1-git-send-email-rahul.sharma@samsung.com>
	<1400035562-16832-5-git-send-email-rahul.sharma@samsung.com>
	<5373B9D4.2060601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:45924 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751382AbaENTXH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 15:23:07 -0400
In-Reply-To: <5373B9D4.2060601@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>

On 15 May 2014 00:15, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 05/14/14 11:46, Rahul Sharma wrote:
>>
>> From: Rahul Sharma<Rahul.Sharma@samsung.com>
>>
>> "gpx3-7" is chip specific pin in Exynos5420 for hdmi
>> hotplug. This pin is moved to exynos5420-pinctrl.dts
>> and removed from the board file.
>
>
> Rahul, you may need to put the change (moving the pin from smdk5420 board to
> exynos5420-pinctrl.dts) before the patch 3/5.
>

Hi Kukjin,

Ok. I will post with that change tomorrow.

Regards,
Rahul Sharma.

> - Kukjin
>
>
>>
>> Signed-off-by: Rahul Sharma<Rahul.Sharma@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos5420-smdk5420.dts |    9 ---------
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> index 6910485..11cd9bf 100644
>> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> @@ -131,15 +131,6 @@
>>                 };
>>         };
>>
>> -       pinctrl@13400000 {
>> -               hdmi_hpd_irq: hdmi-hpd-irq {
>> -                       samsung,pins = "gpx3-7";
>> -                       samsung,pin-function =<0>;
>> -                       samsung,pin-pud =<1>;
>> -                       samsung,pin-drv =<0>;
>> -               };
>> -       };
>> -
>>         hdmi@14530000 {
>>                 status = "okay";
>>                 hpd-gpio =<&gpx3 7 0>;
