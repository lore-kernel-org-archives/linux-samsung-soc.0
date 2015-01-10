From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH RFT 1/2] drivers: bus: check cci device tree node status
Date: Sat, 10 Jan 2015 08:51:27 +0530
Message-ID: <CAM4voa=cbMDW=b4sESpGb0S+0tHYw06LC94P_=sxJo4CMYXtng@mail.gmail.com>
References: <1417186209-5256-1-git-send-email-a.kesavan@samsung.com>
	<CAM4voakjWgnEXoXT1LH2ZFBy=U4vfXFXS1Su8VB7Cd3s3wqmSA@mail.gmail.com>
	<5487C897.9050405@arm.com>
	<CAM4voa=TQeOMTHmM2iBquDRwoEFPAgUFeMwJ73H4qdcSmR1Lug@mail.gmail.com>
	<5487D726.6000603@arm.com>
	<54AE278F.4020003@arm.com>
	<CAM4voamaqoje8Ccz3+UxvxaHN6GBd=QC5wRjVcz9Osfc=4aeiw@mail.gmail.com>
	<54AF62D2.7000400@arm.com>
	<CAM4voamN1A-sqCDR2bT5rHRBARH2SmfA1wYkXZRn9oi-4-Gj8g@mail.gmail.com>
	<7hfvbjvexn.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:37360 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753099AbbAJDV2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Jan 2015 22:21:28 -0500
Received: by mail-qg0-f45.google.com with SMTP id z107so11796973qgd.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Jan 2015 19:21:27 -0800 (PST)
In-Reply-To: <7hfvbjvexn.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "nicolas.pitre@linaro.org" <nicolas.pitre@linaro.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Punit Agrawal <Punit.Agrawal@arm.com>, Will Deacon <Will.Deacon@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Douglas Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Hi Kevin,

On Sat, Jan 10, 2015 at 2:39 AM, Kevin Hilman <khilman@kernel.org> wrote:
> Abhilash Kesavan <kesavan.abhilash@gmail.com> writes:
>
>> Hi Arnd/Olof,
>>
>> On Fri, Jan 9, 2015 at 10:40 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>>>
>>>
>>> On Thursday 08 January 2015 08:57 PM, Abhilash Kesavan wrote:
>>>>
>>>> Hi Sudeep,
>>>>
>>>> On Thu, Jan 8, 2015 at 12:15 PM, Sudeep Holla <sudeep.holla@arm.com>
>>>> wrote:
>>>>>
>>>>> Hi Abhilash,
>>>
>>>
>>> [...]
>>>
>>>>>
>>>>> What's the status of this patch. It was useful for me on vexpress for
>>>>> some
>>>>> testing. Please feel free to add
>>>>>
>>>>> Tested-by: Sudeep Holla <sudeep.holla@arm.com>
>>>>>
>>>>> if this is not yet queued.
>>>>
>>>>
>>>> Thanks for the tested-by. This patch has not been merged yet; I am not
>>>> quite sure who is supposed to pick this up.
>>>>
>>>
>>> So far, most of the CCI patches are merged through arm-soc.
>>
>> Would you be OK picking this up as is or do you want me to re-send
>> this with the RFT tag dropped ?
>
> Please resend without the RFT, and collect the Tested-by tags
> you can add mine:
>
> Tested-by: Kevin Hilman <khilman@linaro.org>
>
> Please send to arm@kernel.org where patches targeted for the arm-soc
> tree are collected.

I have done as suggested. Kindly check.

Regards,
Abhilash
>
> Thanks,
>
> Kevin
>
