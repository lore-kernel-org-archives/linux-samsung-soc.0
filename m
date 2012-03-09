From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Samsung Cleanup EXYNOS clock for v3.4
Date: Fri, 09 Mar 2012 07:33:01 -0800
Message-ID: <4F5A22AD.1070907@samsung.com>
References: <4F589474.8050609@samsung.com> <CAOesGMiWOChuMjLQTK1pGys+oXCc4A=HO-2_=37rh3M6pgUP_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:65308 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756673Ab2CIPdG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 10:33:06 -0500
Received: by obbuo6 with SMTP id uo6so2273888obb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Mar 2012 07:33:04 -0800 (PST)
In-Reply-To: <CAOesGMiWOChuMjLQTK1pGys+oXCc4A=HO-2_=37rh3M6pgUP_g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>

On 03/08/12 07:16, Olof Johansson wrote:
> Hi,
>
> On Thu, Mar 8, 2012 at 3:13 AM, Kukjin Kim<kgene.kim@samsung.com>  wrote:
>
>> Kukjin Kim (2):
>>       ARM: EXYNOS: cleanup clock part for new EXYNOS SoCs
>
> This is one large commit that does many things in one change. As the
> patch message says:
>
> ARM: EXYNOS: cleanup clock part for new EXYNOS SoCs
>
> - the prefix of clk register replace S5P_ with EXYNOS4_
> - move mach-exynos/clock.c to mach-exynos/clock-exynos4.c
> - according to moving clock-exynos4.c,
>    move<mach/exynos4-clock.h>  to "clock-exynos4.h"
> - add prefix exynos4_ on clk declaration
>
> It makes it hard to review, especially when you combine a move with
> other changes. It's better to do the move in a separate commit that
> doesn't change code (or only changes very very little) and then do the
> other changes in separate commits later.
>
Hmm...OK, let me do as per your suggestion and will re-send this soon.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
