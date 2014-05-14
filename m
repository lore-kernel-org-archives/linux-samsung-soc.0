From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [GIT PULL 1/4] Samsung clock Exynos5260 support for v3.16
Date: Wed, 14 May 2014 15:07:44 -0700
Message-ID: <20140514220744.19795.64527@quantum>
References: <1400090591-5064-1-git-send-email-t.figa@samsung.com>
 <5373CB1A.1040801@samsung.com> <20140514201313.19795.35617@quantum>
 <5373CFFE.1000209@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:44923 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752502AbaENWHv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 18:07:51 -0400
Received: by mail-pa0-f50.google.com with SMTP id fb1so159105pad.23
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2014 15:07:50 -0700 (PDT)
In-Reply-To: <5373CFFE.1000209@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Quoting Tomasz Figa (2014-05-14 13:20:14)
> Hi Mike,
> 
> On 14.05.2014 22:13, Mike Turquette wrote:
> > Quoting Kukjin Kim (2014-05-14 12:59:22)
> >> On 05/15/14 03:03, Tomasz Figa wrote:
> >>
> >> Hi Mike,
> >>
> >> I've talked to Tomasz about current samsung related clock stuff. Since 
> >> they are mostly having dependency on samsung tree now not clock core 
> >> stuff, so would be better if it could be sent to upstream via samsung 
> >> tree. And as you know, updating arch/arm/ and clock stuff are usually 
> >> required for adding new SoC or supporting CCF newly...
> > 
> > The Samsung clk pull requests only touch two arch/arm Kconfig files and
> > one dtsi file. That's not a lot of arch/arm churn. Is there a strong
> > reason that this needs to go through the samsung/arm-soc trees?
> > Otherwise it should continue to go through the clk tree.
> 
> Obviously they are patches for Samsung clock drivers. ;)
> 
> The issue here is that there is a number of patches already merged in
> Samsung tree on which the patches discussed here depend.

OK, I think I misread the original email. I thought you were asking for
future pull requests to go through the samsung tree, but you only mean
the ones in this thread. No problem there.

Acked-by: Mike Turquette <mturquette@linaro.org>

Regards,
Mike

> 
> > 
> >>
> >> How do you think? Basically I need your agreement for it.
> > 
> > Based on the above pull requests I do not see the need for changing how
> > code gets merged.
> 
> As long as there are no dependencies on arch code and series being
> applied do not touch arch code, this is perfectly fine. Unfortunately
> this is rarely the case, at least for Samsung platforms and at least for
> now. After we finish with arch clean-up and move all code to appropriate
> subsystems, it should become easier, though.
> 
> Best regards,
> Tomasz
