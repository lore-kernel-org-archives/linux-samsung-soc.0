From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: EXYNOS4: Add EPLL clock operations
Date: Thu, 30 Jun 2011 16:28:47 +0900
Message-ID: <BANLkTinzY57NCviNmerwpa_GZL8jmXr_rQ@mail.gmail.com>
References: <1308655463-8787-1-git-send-email-ch.naveen@samsung.com>
	<1308655463-8787-4-git-send-email-ch.naveen@samsung.com>
	<BANLkTim_0yj8hSefv5BUg5Z1vLh5SWhqjA@mail.gmail.com>
	<BANLkTim2pK5qKwQ5fmJxRHmNHCU=oJtf3A@mail.gmail.com>
	<BANLkTi=aGo3WPaftzBxR=Jy6oHAzt+Yhbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:40640 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750928Ab1F3H2t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 03:28:49 -0400
Received: by wwe5 with SMTP id 5so1949720wwe.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2011 00:28:47 -0700 (PDT)
In-Reply-To: <BANLkTi=aGo3WPaftzBxR=Jy6oHAzt+Yhbw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jassisinghbrar@gmail.com, sbkim73@samsung.com, sw.youn@samsung.com, kgene.kim@samsung.com

> So far i was not lucky in finding out a generic way of deriving the
> epll_div values.
> And it doesn't seem to
> 1. Save lines of code or
> 2. Consolidate the PLL code.
>
> Any suggestions for a simpler implementation are welcome.

No, I mean that 'epll_div' values are _not_always_correct_ on Samsung
SoC platform. It depends on board setting. That 'epll_div' values only
works fine when FINpll is 24MHz, as you know these're from reference
values on User Manual, and board maker can change FINpll freq. with
OM[0] pin setting, XXTI and XusbXTI.
So. if you want to make consolidate the PLL code, you should make a
general formula to calculate that epll_div values on the fly OR move
'epll_div' values table into somewhere machine specific file, not into
platform file 'arch/arm/plat-s5p/clock.c'.

        claude
