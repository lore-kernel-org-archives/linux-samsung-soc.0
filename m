From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 0/2] ARM: EXYNOS: Add DRM device to Origen and SMDKV310
Date: Thu, 3 May 2012 09:13:07 +0530
Message-ID: <CAK9yfHx6sez0hMyMvqmYZ=OaNpBbPa-mTZe_3_Fq4hj_sohDbA@mail.gmail.com>
References: <1332823239-12280-1-git-send-email-sachin.kamat@linaro.org>
	<CAK9yfHw8bfnrmw5yw66C2v162vr6h3eW6SOAU-0=vqVVzFYiWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:39007 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753464Ab2ECDnI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 May 2012 23:43:08 -0400
Received: by qcro28 with SMTP id o28so868427qcr.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 May 2012 20:43:07 -0700 (PDT)
In-Reply-To: <CAK9yfHw8bfnrmw5yw66C2v162vr6h3eW6SOAU-0=vqVVzFYiWg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, "aditya.ps" <aditya.ps@samsung.com>

Hi Kukjin,

Can you please review these patches and let me know your comments.

On 11/04/2012, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> ping...
>
> On 27/03/2012, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> This patch series adds DRM core device and FIMD DRM platform device
>> support
>> to Origen and SMDKV310 boards.
>>
>> This series depends on the following patch:
>> http://www.spinics.net/lists/arm-kernel/msg164762.html
>>
>> Sachin Kamat (2):
>>   ARM: EXYNOS: Add DRM device to Origen
>>   ARM: EXYNOS: Add DRM device to SMDKV310
>>
>>  arch/arm/mach-exynos/Kconfig         |    2 ++
>>  arch/arm/mach-exynos/mach-origen.c   |   31
>> +++++++++++++++++++++++++++++++
>>  arch/arm/mach-exynos/mach-smdkv310.c |   30
>> ++++++++++++++++++++++++++++++
>>  3 files changed, 63 insertions(+), 0 deletions(-)
>>
>> --
>> 1.7.4.1
>>
>>
>
>
> --
> With warm regards,
> Sachin
>


-- 
With warm regards,
Sachin
