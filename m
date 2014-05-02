From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/3] clk: exynos5420: Add 5800 specific clocks
Date: Fri, 02 May 2014 20:52:26 +0200
Message-ID: <4431329.kolHX05ZMV@wuerfel>
References: <1399035821-25096-1-git-send-email-arun.kk@samsung.com> <1399035821-25096-2-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:51368 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751636AbaEBSwg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 14:52:36 -0400
In-Reply-To: <1399035821-25096-2-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org, olofj@google.com, t.figa@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, arunkk.samsung@gmail.com

On Friday 02 May 2014 18:33:39 Arun Kumar K wrote:
> From: Alim Akhtar <alim.akhtar@samsung.com>
> 
> Exynos5800 clock structure is mostly similar to 5420 with only
> a small delta changes. So the 5420 clock file is re-used for
> 5800 also. The common clocks for both are seggreagated and few
> clocks which are different for both are separately initialized.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>

This isn't about your specific patch, but every time I see a new
exynos variant get supported, it comes with a clock driver patch
that is at least as big as all the other patches combined.

New variants come out all the time now, and we are starting to
accumulate huge amounts of clock definitions both in the source
and the binary. I think we should try to come up with a better
way to represent the clocks. I don't think any other SoC
family is nearly as bad as Exynos, either because they have
much fewer models, or because they abstract their clocks more
and put all the tables into DT.

I'm definitely not saying no to the exynos5800 addition for this,
but I'm starting to get a little annoyed, and I think it would be
good to come up with a new clock binding before we see 64-bit
Exynos variants.

	Arnd
