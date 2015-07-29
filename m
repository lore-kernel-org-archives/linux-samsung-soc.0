From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 01/12] ARM: SAMSUNG: local regs-srom header in mach-exynos
Date: Wed, 29 Jul 2015 09:48:44 +0900
Message-ID: <040801d0c998$525c3150$f71493f0$@kernel.org>
References: <013a01d0c87c$854d4d00$8fe7e700$@kernel.org>
 <55B6CF92.8050904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55728 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752032AbbG2AtA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Jul 2015 20:49:00 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS802KOZ4X9FK10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Jul 2015 09:48:45 +0900 (KST)
In-reply-to: <55B6CF92.8050904@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org

Krzysztof Kozlowski wrote:
> 
> On 27.07.2015 23:57, Kukjin Kim wrote:
> >
> > This patch moves regs-srom header file into mach-exynos.
> 
> Hi,
> 
Hi,

> Minor nits:
> 1. Could you trim it and remove unnecessary empty line before description?

Yeah, actually I couldn't use git send-email when I submitted but just used
e-mail. It should be fine in my local branch.

> 2. Could you answer in commit message: Why? Why are you moving the headers?
> 
OK, basically we don't need to keep headers in <mach/xxx> and <plat/xxx> if it
is not required. For example, actually common.h files in mach-xxxx/ have been
made/moved because of the reason before. Someday we did because it was required
to support multi_v7 as well. Anyway it is still required and note that I have
some more patches to move headers which are used only for under drivers/ not
arch side into drivers/. And next step is removing some definitions which are
not used more.

> >
> > c: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> Malformed "Cc:" tag.
> 
Oh, OK. Thanks.

One more thing, please ignore patch "[09/12] ARM: SAMSUNG: local keypad header
in mach-s3c64xx" in this series because the header is used in plat-samsung as
well.

Anyway, thanks,
Kukjin
