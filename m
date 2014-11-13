From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: fix typo in static struct name "exynos5_list_diable_wfi_wfe"
Date: Thu, 13 Nov 2014 11:40:05 +0900
Message-ID: <54641A05.9030107@samsung.com>
References: <1414489832-28011-1-git-send-email-pankaj.dubey@samsung.com> <CABxcv=nJ7-NoF-0EqCL=rk6hX2688iV98g=CiDADKT7QTNWBrw@mail.gmail.com> <CABxcv==Hjfi+-Mt63YQaCtC3Wj12WFfU6biwmiVEFQvqAp3DBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:49207 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753387AbaKMCkL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Nov 2014 21:40:11 -0500
Received: by mail-pd0-f170.google.com with SMTP id z10so13476063pdj.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2014 18:40:11 -0800 (PST)
In-Reply-To: <CABxcv==Hjfi+-Mt63YQaCtC3Wj12WFfU6biwmiVEFQvqAp3DBA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, thomas.ab@samsung.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 11/11/14 18:54, Javier Martinez Canillas wrote:
> Hello Kukjin,
>
>>
>> After this patch, "[PATCH v9 1/2] ARM: EXYNOS: Add platform driver
>> support for Exynos PMU" [0] does not apply cleanly anymore.
>>
>
> I see that you already picked all the Exynos S2R patches on your
> v3.19-next/mach-exynos branch and also resolved that conflict.
>
Yes, but I couldn't merge it into -next because of some conflicts 
between for-next and mach-exynos branch at that time.

Note I've merged into -next just now, so if any problems in -next, 
please let us know.

> Is just that this branch was not merged in your for-next branch and
> that's why I didn't see the patches in linux-next.
>
> Sorry for the noise.

No problem, thanks.

- Kukjin
