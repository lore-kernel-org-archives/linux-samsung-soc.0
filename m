From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [BUG] Compile error with THUMB2
Date: Mon, 26 May 2014 17:02:00 +0530
Message-ID: <CAKohpo=_=n7n+1KMGyZEp3-OmsSicv98ScoVj1M1Mc-hLD-Z7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:58211 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752242AbaEZLcB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 07:32:01 -0400
Received: by mail-oa0-f51.google.com with SMTP id n16so8284510oag.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 May 2014 04:32:01 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Santosh Shukla <santosh.shukla@linaro.org>

Hi Guys,

I didn't had time to put in an effort on this but here is a problem
reported by Santosh. See if somebody can get this fixed..

arch/arm/mach-exynos/sleep.S: Assembler messages:
arch/arm/mach-exynos/sleep.S:57: Error: invalid immediate for address
calculation (value = 0x00000004)

Its because of THUMB2 and a probably fix would be something
like this:

https://lkml.org/lkml/2010/3/31/235

NOTE: Mainline's defconfig doesn't get this as THUMB2 isn't
enabled.

Reproduced on 3.15-rc6

--
viresh
