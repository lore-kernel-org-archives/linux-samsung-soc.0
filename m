From: Kukjin Kim <kgene@kernel.org>
Subject: RE: Broken device trees for exynos in linux-next
Date: Sat, 17 Aug 2013 19:40:18 +0900
Message-ID: <159201ce9b36$2a513f30$7ef3bd90$@org>
References: <CAOesGMgv9gTQ_NtaKZY_ZfLD1NBU19E-vaLaWwmvGJJB1MQrwg@mail.gmail.com>
 <13b101ce9a14$2cebd700$86c38500$@org>
 <CAOesGMiyNM6VdNzKQU3XwoiacJV8hc60mcLiH+vHoS6xJM6q-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18190 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751624Ab3HQKkU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 17 Aug 2013 06:40:20 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRO008CC8B67B10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 17 Aug 2013 19:40:18 +0900 (KST)
In-reply-to: <CAOesGMiyNM6VdNzKQU3XwoiacJV8hc60mcLiH+vHoS6xJM6q-A@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Mark Brown' <broonie@kernel.org>, 'Arnd Bergmann' <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Olof Johansson wrote:
> 
> On Thu, Aug 15, 2013 at 5:04 PM, Kukjin Kim <kgene@kernel.org> wrote:
> > I think, maybe we discussed about that? :) current exynos_defconfig
> cannot
> > support exynos5440 because of LPAE and I remember we decided LPAE and
> > non-LPAE should be separated. So as I commented before,
> exynos5440_defconfig
> > is needed. If you have any concerns, please let me know.
> 
> Having a SoC-specific defconfig makes no sense. You can run with LPAE
> enabled on A15 and A7-based systems even if they don't have enough
> memory to need it.
> 
Hmm, I'm not sure. If so, I'm wondering why LPAE is implemented with 'ifdef'
and why Red Hat and Canonical provide PAE enabled kernel separately in
x86...

> Really, what we want is to just turn on the LPAE functionality and
> keep everything else common. Forking into two defconfigs seems like
> the wrong idea, even if we did discuss it before. Having something
> like a config fragment to include would make more sense, since that
> could be shared across all platforms (and apply with
> multi_v7_defconfig for those who want to run that on LPAE as well).
> 
If we could make LPAE enabled defconfig for all ARM platforms, I'm fine. I
think your concern is creating SoC specific defconfig and I agree with you.
But I'm not sure how we can support LPAE enabled defconfig for ARM
platforms.

> Or, you know, just have your build script enable it without having an
> in-tree config fragment. That'd work too.
> 
I don't think so because the defconfig will be used by customer for their
product so I should provide some defconfig for exynos5440 in mainline...

> The main case where this isn't sufficient is on platforms where _all_
> memory sits above 4G, since you can't boot a non-LPAE kernel on those
> at all. It seems like 5440 has memory starting at 2GB so it's not one
> of those.
> 
5440 has 8GB memory by default.

So let me know which way is fine to us?

- Kukjin
