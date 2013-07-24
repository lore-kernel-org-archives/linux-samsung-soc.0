From: amit daniel kachhap <amit.daniel@samsung.com>
Subject: Re: [PATCH V2 2/2] ARM: EXYNOS: cpuidle: Allow C1 state only in
 supported SOC's.
Date: Wed, 24 Jul 2013 15:25:48 +0530
Message-ID: <CADGdYn7yOvwr_v5bj9G+iXr_kkqFGXhYPdmcasTPmqh=ROcvnw@mail.gmail.com>
References: <1371036526-16589-1-git-send-email-amit.daniel@samsung.com>
	<1371036526-16589-3-git-send-email-amit.daniel@samsung.com>
	<0e2301ce882c$d39021a0$7ab064e0$@org>
	<CADGdYn5uY7A9OB=xGi_oKS3DX6+wRhbKBnTfxjkFY5OtUX3hXg@mail.gmail.com>
	<0e7d01ce8840$82f79070$88e6b150$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:53838 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751879Ab3GXJzs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 05:55:48 -0400
Received: by mail-ob0-f178.google.com with SMTP id fb19so12447575obc.23
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jul 2013 02:55:48 -0700 (PDT)
In-Reply-To: <0e7d01ce8840$82f79070$88e6b150$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>, Abhilash Kesavan <a.kesavan@samsung.com>

On Wed, Jul 24, 2013 at 1:06 PM, Kukjin Kim <kgene@kernel.org> wrote:
> amit daniel kachhap wrote:
>
> [...]
>
>> >>               /* Support IDLE only */
>> >> -             if (cpu_id != 0)
>> >> +             if (!(soc_is_exynos4210() || soc_is_exynos4212() ||
>> >> +                     soc_is_exynos4412() || soc_is_exynos5250()) ||
>> >> +                     cpu_id != 0)
>> >
>> > How about exynos5420?
>> >
>> > So...
>> >
>> > +               if (soc_is_exynos5440() || cpu_id !=0) ?
>> This is fine.
>>
> So, you will re-send?
Just submitted the patch with this change.

Thanks,
Amit
>
> - Kukjin
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
