From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH RFT 1/2] drivers: bus: check cci device tree node status
Date: Fri, 9 Jan 2015 21:58:42 +0530
Message-ID: <CAM4voamN1A-sqCDR2bT5rHRBARH2SmfA1wYkXZRn9oi-4-Gj8g@mail.gmail.com>
References: <1417186209-5256-1-git-send-email-a.kesavan@samsung.com>
	<CAM4voakjWgnEXoXT1LH2ZFBy=U4vfXFXS1Su8VB7Cd3s3wqmSA@mail.gmail.com>
	<5487C897.9050405@arm.com>
	<CAM4voa=TQeOMTHmM2iBquDRwoEFPAgUFeMwJ73H4qdcSmR1Lug@mail.gmail.com>
	<5487D726.6000603@arm.com>
	<54AE278F.4020003@arm.com>
	<CAM4voamaqoje8Ccz3+UxvxaHN6GBd=QC5wRjVcz9Osfc=4aeiw@mail.gmail.com>
	<54AF62D2.7000400@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f176.google.com ([209.85.216.176]:52891 "EHLO
	mail-qc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752014AbbAIQ2n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Jan 2015 11:28:43 -0500
Received: by mail-qc0-f176.google.com with SMTP id i17so9918759qcy.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Jan 2015 08:28:42 -0800 (PST)
In-Reply-To: <54AF62D2.7000400@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kevin Hilman <khilman@kernel.org>, "nicolas.pitre@linaro.org" <nicolas.pitre@linaro.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Punit Agrawal <Punit.Agrawal@arm.com>, Will Deacon <Will.Deacon@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Douglas Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Hi Arnd/Olof,

On Fri, Jan 9, 2015 at 10:40 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
>
> On Thursday 08 January 2015 08:57 PM, Abhilash Kesavan wrote:
>>
>> Hi Sudeep,
>>
>> On Thu, Jan 8, 2015 at 12:15 PM, Sudeep Holla <sudeep.holla@arm.com>
>> wrote:
>>>
>>> Hi Abhilash,
>
>
> [...]
>
>>>
>>> What's the status of this patch. It was useful for me on vexpress for
>>> some
>>> testing. Please feel free to add
>>>
>>> Tested-by: Sudeep Holla <sudeep.holla@arm.com>
>>>
>>> if this is not yet queued.
>>
>>
>> Thanks for the tested-by. This patch has not been merged yet; I am not
>> quite sure who is supposed to pick this up.
>>
>
> So far, most of the CCI patches are merged through arm-soc.

Would you be OK picking this up as is or do you want me to re-send
this with the RFT tag dropped ?

Regards,
Abhilash
>
> Regards,
> Sudeep
>
