From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 1/3] pinctrl: add a driver for the OMAP pinmux
Date: Fri, 25 Nov 2011 09:53:45 +0100
Message-ID: <CACRpkdabC1Tf=bf-LV4_2XSOrWqU7sr_rrjXFaqv3GnKM54UGA@mail.gmail.com>
References: <1321274409-24643-2-git-send-email-rnayak@ti.com>
	<20111114172312.GI31337@atomide.com>
	<4EC1EB9D.1000503@ti.com>
	<CACRpkdYuw+AfVtgfsbpkd=uvfWd8yE-n25EC0FDffhiGUS2MBw@mail.gmail.com>
	<CAJuYYwSgzkDed5-R=PaBR_F6ssj_EhxLDfCREXUA=UaynkgZyg@mail.gmail.com>
	<CACRpkdbBQoOU8hyew6tXth3Ohrg5_rN7M+tbVsYFcOjgq73aCw@mail.gmail.com>
	<CAJuYYwT_useS-8cH+qfDu5t7wh73yUuJAVXMjP5CXBS2VM3bag@mail.gmail.com>
	<CACRpkdax0GK=mNNao7FPc6JG0RwVywSEzGJPC_u73iJ_eOTgqQ@mail.gmail.com>
	<20111122175409.GE31337@atomide.com>
	<CACRpkdaStA_+SiqwnA-=jCi4XusHqcwgVzUUWyDg7byTPq1_JA@mail.gmail.com>
	<20111124195452.GG13928@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:36412 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752592Ab1KYIxq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Nov 2011 03:53:46 -0500
In-Reply-To: <20111124195452.GG13928@atomide.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Rajendra Nayak <rnayak@ti.com>, linux-omap@vger.kernel.org, linaro-dev@lists.linaro.org, linus.walleij@stericsson.com, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org

On Thu, Nov 24, 2011 at 8:54 PM, Tony Lindgren <tony@atomide.com> wrote:

> We should probably pass over
> the static board specific mapping as platform_data to the pinmux device
> and make it be part of struct pinctrl_dev. Then new driver instances
> can have their own pctldev->mapping and we can support both platform_data
> and device tree based drivers on the same system.

That sounds like a real good idea and I think it'll work fine.

You can use the map in mach-u300/core.c as guinea pig for refactoring if you
like. I think that's the only map that's in-tree ftm.

Thanks,
Linus Walleij
