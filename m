From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH V3] ARM: dts: Add DT changes for display on peach_pi
Date: Sun, 14 Sep 2014 09:23:46 +0900
Message-ID: <5414E012.3060701@samsung.com>
References: <1407145638-3803-1-git-send-email-ajaykumar.rs@samsung.com> <CAEC9eQNSPKdTKbAnNpj1ssc==NHkLUUAb+02wZiO+v41XEvutQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:54928 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752281AbaINAYA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Sep 2014 20:24:00 -0400
In-Reply-To: <CAEC9eQNSPKdTKbAnNpj1ssc==NHkLUUAb+02wZiO+v41XEvutQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, InKi Dae <inki.dae@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

On 08/25/14 15:13, Ajay kumar wrote:
> On Mon, Aug 4, 2014 at 3:17 PM, Ajay Kumar<ajaykumar.rs@samsung.com>  wrote:
>> Add DT nodes for panel-simple "auo,b133htn01" panel.
>> Add backlight enable pin and backlight power supply for pwm-backlight.
>> Also, add panel phandle needed by dp to enable display on peach_pi.
>>
>> Signed-off-by: Ajay Kumar<ajaykumar.rs@samsung.com>
>> ---
>> Changes since V1:
>> Remove "simple-panel" compatible string and use only ""auo,b133htn01".
>>
>> Changes since V2:
>> As suggested by Andreas,
>> Use GPIO_ACTIVE_HIGH for backlight enable-gpios instead of using 0.
>> Change panel node naming from "panel-simple" to "panel".
>>
>>   arch/arm/boot/dts/exynos5800-peach-pi.dts |   27 ++++++++++-----------------
>>   1 file changed, 10 insertions(+), 17 deletions(-)
>>
Applied, thanks.

- Kukjin
