From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH RESEND 3/4] ARM: EXYNOS: Add s3c-hsotg device support
 for NURI board
Date: Mon, 14 May 2012 23:01:54 +0900
Message-ID: <4FB11052.4090602@samsung.com>
References: <1336655818-15136-1-git-send-email-l.majewski@samsung.com> <1336655818-15136-4-git-send-email-l.majewski@samsung.com> <4FAF0964.9030704@samsung.com> <20120514104845.43ce9dea@lmajewski.digital.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:55641 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756706Ab2ENOCA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 10:02:00 -0400
Received: by dady13 with SMTP id y13so5953228dad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 May 2012 07:02:00 -0700 (PDT)
In-Reply-To: <20120514104845.43ce9dea@lmajewski.digital.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>

On 05/14/12 17:48, Lukasz Majewski wrote:
> Hi Kukjin,
>
>> Oops, happens build error...
>>
>> arch/arm/mach-s5pv210/mach-goni.c: In function 'goni_machine_init':
>> arch/arm/mach-s5pv210/mach-goni.c:947: error: implicit declaration of
>> function 's3c_hsotg_set_platdata'
>
> Thanks for applying patches.
>
> Regarding the build error:
>
> After applying following patches on top of yours for next
> (linux-samsung/for-next) the problem with build error doesn't appear
> anymore.
>
Yes, I know why the build error happens and I can't apply them which are 
already in usb tree in my tree now. I'm thinking this series should be 
sent to upstream via usb tree together so if required, I will ask Greg 
and Felipe to do it.

> Link to USB HSOTG patch series:
>
> http://permalink.gmane.org/gmane.linux.usb.general/62101
> "usb:hsotg:samsung USB S3C-HSOTG driver fixes and code cleanup"
>
> Moreover those patches have been already applied to Greg-KH's usb-next
> branch an will be released with 3.5 kernel.
>
Yeah, I know. But the problem is that if arm-soc tree is merged before 
usb tree, same build error will be happened in mainline so I was 
thinking how we can avoid that. If your effort is required, let you know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
