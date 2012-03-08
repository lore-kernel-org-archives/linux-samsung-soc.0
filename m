From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH-RESEND 0/4] ARM: S5PV210: Enable FIMC & MFC on SMDKC110 &
 V210 boards
Date: Thu, 8 Mar 2012 16:59:44 +0530
Message-ID: <CAK9yfHzeaKA7CeiEu1b+tcXiHLic5VS-aRB40EM0sCM7vrPSow@mail.gmail.com>
References: <1329110331-12746-1-git-send-email-sachin.kamat@linaro.org>
	<4F3CFDFD.1000804@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:53950 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751502Ab2CHL3p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Mar 2012 06:29:45 -0500
Received: by qcqw6 with SMTP id w6so242031qcq.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Mar 2012 03:29:45 -0800 (PST)
In-Reply-To: <4F3CFDFD.1000804@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org

Hi Kukjin,

Could not find this series applied on any of your branches. Please
check the same.

Regards
Sachin

On 16/02/2012, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 02/13/12 14:18, Sachin Kamat wrote:
>> Re-sending the patch series rebased onto next/board-samsung branch of
>> Kukjin Kim's tree:
>> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>>
>> Sachin Kamat (4):
>>    ARM: S5PV210: Enable MFC on SMDKV210
>>    ARM: S5PV210: Enable MFC on SMDKC110
>>    ARM: S5PV210: Enable FIMC on SMDKV210
>>    ARM: S5PV210: Enable FIMC on SMDKC110
>>
>>   arch/arm/mach-s5pv210/Kconfig         |    8 ++++++++
>>   arch/arm/mach-s5pv210/mach-smdkc110.c |   14 ++++++++++++++
>>   arch/arm/mach-s5pv210/mach-smdkv210.c |   14 ++++++++++++++
>>   3 files changed, 36 insertions(+), 0 deletions(-)
>>
>
> Hi Sachin,
>
> Looks good to me, will apply this whole series.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>


-- 
With warm regards,
Sachin
