From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH V2 5/5] arm: samsung: delete frame buffer header files
 from platform
Date: Wed, 1 Aug 2012 08:50:15 +0530
Message-ID: <CAL1wa8cShB7zDj-CPvfEncX+Up7enKM9MJOt-488dThj_tXbMA@mail.gmail.com>
References: <1343737385-23337-1-git-send-email-l.krishna@samsung.com>
 <1343737385-23337-6-git-send-email-l.krishna@samsung.com> <02ee01cd6f89$f218b2c0$d64a1840$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:54933 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754007Ab2HADUh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jul 2012 23:20:37 -0400
In-Reply-To: <02ee01cd6f89$f218b2c0$d64a1840$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, ben-linux@fluff.org, inki.dae@samsung.com, joshi@samsung.com, jg1.han@samsung.com, m.szyprowski@samsung.com

Hello Kgene,

On Wed, Aug 1, 2012 at 7:34 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Leela Krishna Amudala wrote:
>>
>> The FIMD register headers are moved to include/video/
>> hence, deleting these files from platform side
>>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> ---
>>  arch/arm/plat-samsung/include/plat/regs-fb-v4.h |  159 ---------
>>  arch/arm/plat-samsung/include/plat/regs-fb.h    |  403
> -------------------
>> ----
>>  2 files changed, 0 insertions(+), 562 deletions(-)
>>  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-fb-v4.h
>>  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-fb.h
>>
> No. This should be squashed into first patch on this series. See below.
>
>  arch/arm/plat-samsung/include/plat/regs-fb-v4.h    |  159
> --------------------
>  .../plat/regs-fb.h => include/video/samsung_fimd.h |  145
> ++++++++++++++++--
>  2 files changed, 134 insertions(+), 170 deletions(-)
>  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-fb-v4.h
>  rename arch/arm/plat-samsung/include/plat/regs-fb.h =>
> include/video/samsung_fimd.h (74%)
>

If I squash it with the first patch and if somebody set that as a head
commit, it will break the build. Hence, splitted it up from the first
patch.

Thank you Sylwester for suggesting this split up change.

Regards,
Leela Krishna

> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fbdev" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
