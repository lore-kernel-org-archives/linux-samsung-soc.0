From: amit daniel kachhap <amit.daniel@samsung.com>
Subject: Re: [RESEND PATCH 1/3] ARM: EXYNOS: Move arm core power down clock to
 exynos5250 common clock
Date: Fri, 16 Aug 2013 10:22:44 +0530
Message-ID: <CADGdYn7sZMp13K-WcoHJ13FyXnkVbHjhg5LNcofiYPDTgxsHNg@mail.gmail.com>
References: <1363240979-1939-2-git-send-email-amit.daniel@samsung.com>
	<1370501833-9196-1-git-send-email-amit.daniel@samsung.com>
	<150e01ce6831$44d94920$ce8bdb60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:43234 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751095Ab3HPEwq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Aug 2013 00:52:46 -0400
Received: by mail-la0-f41.google.com with SMTP id ec20so1134609lab.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Aug 2013 21:52:45 -0700 (PDT)
In-Reply-To: <150e01ce6831$44d94920$ce8bdb60$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, LAK <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <thomas.abraham@linaro.org>, Abhilash Kesavan <a.kesavan@samsung.com>

Hi Mike,

Please merge this patch as it is pending since last merge window.

Thanks,
Amit

On Thu, Jun 13, 2013 at 5:56 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Amit Daniel Kachhap wrote:
>>
>> Now with common clock support added for exynos5250 it is necessary to move
>> this code to exynos5250 common clock driver as clock registers should be
>> handled there. This change is tested in exynos5250 based arndale platform.
>>
>> Cc: Abhilash Kesavan <a.kesavan@samsung.com>
>> Cc: Thomas Abraham <thomas.abraham@linaro.org>
>> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
>
> Hmm...I'm not sure it's better to handle the ARM core power down clock in
> common clock but the clock registers should be handled in one part, clock.
>
> Acked-by: Kukjin Kim <kgene.kim@samsugn.com>
>
> Mike, the mach-exynos/cpuidle.c is not touched in samsung tree at this
> moment, so this patch will not create any conflict between samsung and clk.
>
> Thanks,
> - Kukjin
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

On Thu, Jun 13, 2013 at 5:56 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Amit Daniel Kachhap wrote:
>>
>> Now with common clock support added for exynos5250 it is necessary to move
>> this code to exynos5250 common clock driver as clock registers should be
>> handled there. This change is tested in exynos5250 based arndale platform.
>>
>> Cc: Abhilash Kesavan <a.kesavan@samsung.com>
>> Cc: Thomas Abraham <thomas.abraham@linaro.org>
>> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
>
> Hmm...I'm not sure it's better to handle the ARM core power down clock in
> common clock but the clock registers should be handled in one part, clock.
>
> Acked-by: Kukjin Kim <kgene.kim@samsugn.com>
>
> Mike, the mach-exynos/cpuidle.c is not touched in samsung tree at this
> moment, so this patch will not create any conflict between samsung and clk.
>
> Thanks,
> - Kukjin
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
