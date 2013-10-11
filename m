From: Amit Kachhap <amit.kachhap@gmail.com>
Subject: Re: [RESEND PATCH 1/3] ARM: EXYNOS: Move arm core power down clock to
 exynos5250 common clock
Date: Fri, 11 Oct 2013 09:57:45 +0530
Message-ID: <CADGdYn5ZB8s0QfhYovhNqOv8AyHNwgyKvdYeGYz3NKXtQiBHOA@mail.gmail.com>
References: <1363240979-1939-2-git-send-email-amit.daniel@samsung.com>
	<150e01ce6831$44d94920$ce8bdb60$%kim@samsung.com>
	<CADGdYn7sZMp13K-WcoHJ13FyXnkVbHjhg5LNcofiYPDTgxsHNg@mail.gmail.com>
	<16865865.dEQ4lomChq@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:41473 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942Ab3JKE1q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Oct 2013 00:27:46 -0400
Received: by mail-ie0-f169.google.com with SMTP id tp5so7376177ieb.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Oct 2013 21:27:46 -0700 (PDT)
In-Reply-To: <16865865.dEQ4lomChq@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Abhilash Kesavan <a.kesavan@samsung.com>, LAK <linux-arm-kernel@lists.infradead.org>

Hi Bartlomeij,

Yes these patches have missed 2 merge windows and still not merged.

Mike:
I am re-basing these patches on linux-next. Please merge them.

Regards,
Amit

On Wed, Oct 9, 2013 at 3:18 PM, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
> Hi,
>
> Mike:
>
> Could you please apply this patch? It is few months overdue..
>
> Amit:
>
> This patch no longer applies to -next. Could you please refresh and resend it?
>
> You can add:
>
>         Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>
> while at it.
>
> Thanks.
>
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
>
> On Friday, August 16, 2013 10:22:44 AM amit daniel kachhap wrote:
>> Hi Mike,
>>
>> Please merge this patch as it is pending since last merge window.
>>
>> Thanks,
>> Amit
>>
>> On Thu, Jun 13, 2013 at 5:56 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> > Amit Daniel Kachhap wrote:
>> >>
>> >> Now with common clock support added for exynos5250 it is necessary to move
>> >> this code to exynos5250 common clock driver as clock registers should be
>> >> handled there. This change is tested in exynos5250 based arndale platform.
>> >>
>> >> Cc: Abhilash Kesavan <a.kesavan@samsung.com>
>> >> Cc: Thomas Abraham <thomas.abraham@linaro.org>
>> >> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
>> >
>> > Hmm...I'm not sure it's better to handle the ARM core power down clock in
>> > common clock but the clock registers should be handled in one part, clock.
>> >
>> > Acked-by: Kukjin Kim <kgene.kim@samsugn.com>
>> >
>> > Mike, the mach-exynos/cpuidle.c is not touched in samsung tree at this
>> > moment, so this patch will not create any conflict between samsung and clk.
>> >
>> > Thanks,
>> > - Kukjin
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


On Wed, Oct 9, 2013 at 3:18 PM, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
> Hi,
>
> Mike:
>
> Could you please apply this patch? It is few months overdue..
>
> Amit:
>
> This patch no longer applies to -next. Could you please refresh and resend it?
>
> You can add:
>
>         Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>
> while at it.
>
> Thanks.
>
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
>
> On Friday, August 16, 2013 10:22:44 AM amit daniel kachhap wrote:
>> Hi Mike,
>>
>> Please merge this patch as it is pending since last merge window.
>>
>> Thanks,
>> Amit
>>
>> On Thu, Jun 13, 2013 at 5:56 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> > Amit Daniel Kachhap wrote:
>> >>
>> >> Now with common clock support added for exynos5250 it is necessary to move
>> >> this code to exynos5250 common clock driver as clock registers should be
>> >> handled there. This change is tested in exynos5250 based arndale platform.
>> >>
>> >> Cc: Abhilash Kesavan <a.kesavan@samsung.com>
>> >> Cc: Thomas Abraham <thomas.abraham@linaro.org>
>> >> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
>> >
>> > Hmm...I'm not sure it's better to handle the ARM core power down clock in
>> > common clock but the clock registers should be handled in one part, clock.
>> >
>> > Acked-by: Kukjin Kim <kgene.kim@samsugn.com>
>> >
>> > Mike, the mach-exynos/cpuidle.c is not touched in samsung tree at this
>> > moment, so this patch will not create any conflict between samsung and clk.
>> >
>> > Thanks,
>> > - Kukjin
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
