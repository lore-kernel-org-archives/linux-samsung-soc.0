From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 0/6] Switch to generic syscon regmap based drivers
Date: Wed, 21 Oct 2015 16:55:26 +0200
Message-ID: <5627A75E.60509@osg.samsung.com>
References: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
 <CAGOxZ50G-ttivhVjbozUisA0HXcFz7bvRUuPR67xR88TTCa_wQ@mail.gmail.com>
 <CAGOxZ51_JPy51htzD_M_=qaPVUexkVhoA2ANLS2-rpK3QDT=8A@mail.gmail.com>
 <1606098.olLAyTIhB3@dell2.five-lan.de> <56272C1C.8040007@samsung.com>
 <562765F3.9010306@osg.samsung.com>
 <CAGOxZ52-ia8uhgGg5CiU9TSYkfAsRD52zvLqq++Y-mr4uaFOpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:42124 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751616AbbJUOzc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Oct 2015 10:55:32 -0400
In-Reply-To: <CAGOxZ52-ia8uhgGg5CiU9TSYkfAsRD52zvLqq++Y-mr4uaFOpg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, kgene <kgene@kernel.org>, =?UTF-8?Q?Krzysztof_Koz=c5=82owski?= <k.kozlowski@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hello Alim,

On 10/21/2015 04:50 PM, Alim Akhtar wrote:

[snip]

>>
>> [0]:
>> From c9b250ee03bae338339b70693e906145c719f783 Mon Sep 17 00:00:00 2001
>> From: Javier Martinez Canillas <javier@osg.samsung.com>
>> Date: Wed, 21 Oct 2015 11:59:44 +0200
>> Subject: [RFT PATCH] mmc: pwrseq: Use highest priority for eMMC restart
>>  handler
>>
>> The pwrseq_emmc driver does a eMMC card reset before a system reboot to
>> allow broken or limited ROM boot-loaders, that don't have an eMMC reset
>> logic, to be able to read the second stage from the eMMC.
>>
>> But this has to be called before a system reboot handler and while most
>> of them use the priority 128, there are other restart handlers (such as
>> the syscon-reboot one) that use a higher priority. So, use the highest
>> priority to make sure that the eMMC hw is reset before a system reboot.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> ---
> Looks good.
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
>

Thanks, should I post it as a proper patch or are adding it to your
series? I think the latter is more reasonable so with an ack from Ulf,
all patches can go through the linux-samsung tree.
 
Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
