From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V3 1/2] ARM: dts: Add DT changes for display on snow
Date: Sun, 14 Sep 2014 00:17:21 +0530
Message-ID: <CAEC9eQNPipVNGjsjc+etCY-w4BErqLxeC5kFStM14rE+wtQvHA@mail.gmail.com>
References: <1409567792-8281-1-git-send-email-ajaykumar.rs@samsung.com>
	<54147D6E.2030103@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:38421 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752024AbaIMSrW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Sep 2014 14:47:22 -0400
In-Reply-To: <54147D6E.2030103@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Hi Kukjin,


On Sat, Sep 13, 2014 at 10:52 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 09/01/14 19:36, Ajay Kumar wrote:
>>
>> Add DT nodes for ptn3460 bridge chip and panel.
>> Add backlight enable pin and backlight power supply for pwm-backlight.
>> Also add bridge phandle needed by dp to enable display on snow.
>>
>> Signed-off-by: Ajay Kumar<ajaykumar.rs@samsung.com>
>> ---
>> Changes since V1:
>>         -- Remove "simple-panel" compatible string.
>>         -- Use GPIO_ACTIVE_HIGH instead of 0.
>>         -- Change panel node naming from "panel-simple" to "panel".
>>
>> Changes since V2:
>>         -- Use proper compatible string: "auo,b116xw03"
>>
>>   arch/arm/boot/dts/exynos5250-snow.dts |   41
>> ++++++++++++++++++---------------
>>   1 file changed, 22 insertions(+), 19 deletions(-)
>>
> Applied this and 2nd one.
>
> BTW, I resolved conflict when I applied. Please check my tree and then if
> any problems, please let me know.

This patchset has dependency on driver patches.
But, no harm merging it since DT bindings are almost agreed.

The below patch should be merged ASAP. Because, driver changes are already in
for this patch:
https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg35182.html

Ajay
