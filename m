From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/4] ARM: S5PV210: Enable FIMC and MFC on SMDK C110 and
 V210 boards
Date: Tue, 31 Jan 2012 13:17:30 +0900
Message-ID: <4F276B5A.7060604@samsung.com>
References: <1324893613-5469-1-git-send-email-sachin.kamat@linaro.org>	<CAK9yfHyXazVh3weycF-FCHYtH==m4J-YtwnZfsAdfeAB9mBnkQ@mail.gmail.com>	<028b01ccc5da$d0cbeeb0$7263cc10$%kim@samsung.com>	<01c301cccf25$0db1fdd0$2915f970$%park@samsung.com> <CAK9yfHyVA__KtLzjh5ksvtmCJnbp0K23ytpjZQkTrtKQt3gVrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:54805 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753054Ab2AaERg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jan 2012 23:17:36 -0500
Received: by dadi2 with SMTP id i2so4149082dad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jan 2012 20:17:35 -0800 (PST)
In-Reply-To: <CAK9yfHyVA__KtLzjh5ksvtmCJnbp0K23ytpjZQkTrtKQt3gVrg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: jtp.park@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On 01/30/12 14:15, Sachin Kamat wrote:
> Hi Kukjin,
>
> Ping.
>
Hi Sachin,

I looked at your reply on Sylwester's comments, PATCH 3/4.
I'd like to apply all of this series after your re-submitting.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

>
> On 10 January 2012 04:48, Jeongtae Park<jtp.park@samsung.com>  wrote:
>> Hi Sachin,
>>
>> thanks for the patch.
>> There is no issue for MFC.
>>
>> Best regards,
>> /jtpark
>>
>>> -----Original Message-----
>>> From: Kukjin Kim [mailto:kgene.kim@samsung.com]
>>> Sent: Thursday, December 29, 2011 12:35 PM
>>> To: 'Sachin Kamat'; linux-samsung-soc@vger.kernel.org
>>> Cc: jtp.park@samsung.com
>>> Subject: RE: [PATCH 0/4] ARM: S5PV210: Enable FIMC and MFC on SMDK C110 and V210 boards
>>>
>>> Sachin Kamat wrote:
>>>>
>>>> Hi Kukjin,
>>>>
>>>> Please pick up the MFC patches (patches 1&  2) from this series. I
>>>> will post a separate patch series for FIMC related changes.
>>>>
>>> (Cc'ed Jeongtae Park)
>>>
>>> Jeongtae, let me know your opinion on this MFC enabling patches.
>>>
>>> Thanks.
>>>
>>> Best regards,
>>> Kgene.
>>> --
>>> Kukjin Kim<kgene.kim@samsung.com>, Senior Engineer,
>>> SW Solution Development Team, Samsung Electronics Co., Ltd.
>>>
>>>> Regards
>>>> Sachin
>>>>
>>>> On 26 December 2011 15:30, Sachin Kamat<sachin.kamat@linaro.org>  wrote:
>>>>> This patch series adds support for MFC and FIMC on SMDK C110 and V210
>>>> boards.
>>>>> It is based on Kukjin Kim's latest for-next branch.
>>>>>
>>>>> Sachin Kamat (4):
>>>>>   ARM: S5PV210: Enable MFC on SMDKV210
>>>>>   ARM: S5PV210: Enable MFC on SMDKC110
>>>>>   ARM: S5PV210: Enable FIMC on SMDKV210
>>>>>   ARM: S5PV210: Enable FIMC on SMDKC110
>>>>>
>>>>>   arch/arm/mach-s5pv210/Kconfig         |    8 ++++++++
>>>>>   arch/arm/mach-s5pv210/mach-smdkc110.c |   14 ++++++++++++++
>>>>>   arch/arm/mach-s5pv210/mach-smdkv210.c |   13 +++++++++++++
>>>>>   3 files changed, 35 insertions(+), 0 deletions(-)
>>>>>
>>>>> --
>>>>> 1.7.4.1
