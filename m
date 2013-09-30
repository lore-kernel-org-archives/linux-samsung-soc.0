From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V2] ARM: EXYNOS: implement pm_power_off for EXYNOS5440
Date: Mon, 30 Sep 2013 10:41:06 +0200
Message-ID: <2759812.IaDDKuvX2H@flatron>
References: <003101cebd7c$ded3a610$9c7af230$%lee@samsung.com> <069501cebdae$357285a0$a05790e0$@org> <CAK9yfHyQdswnNXVo_Wwz7y40URGOzecJ0juqFeSAMsDO1K3Nmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f52.google.com ([74.125.83.52]:49555 "EHLO
	mail-ee0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753174Ab3I3IlI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Sep 2013 04:41:08 -0400
Received: by mail-ee0-f52.google.com with SMTP id c41so2466371eek.39
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Sep 2013 01:41:07 -0700 (PDT)
In-Reply-To: <CAK9yfHyQdswnNXVo_Wwz7y40URGOzecJ0juqFeSAMsDO1K3Nmw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Kukjin Kim <kgene@kernel.org>, Jungseok Lee <jays.lee@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Monday 30 of September 2013 13:56:39 Sachin Kamat wrote:
> On 30 September 2013 12:55, Kukjin Kim <kgene@kernel.org> wrote:
> > I think current patch looks good to me, and in this case I don't have
> > any idea why we should macro for just one time usage.
> 
> It is not the question of one time usage, it is just to make the code
> more readable.

I tend to agree with Sachin on this. Code as in current version of the 
patch reads as "write 0x1 to register offset by 0x14 from clock controller 
base", while it should read "write RESET_VAL to RESET_CTRL register of 
clock controller" (names made up) for people doing further work on this 
file to quickly find what the code does or allow referring to SoC 
documentation.

Best regards,
Tomasz
