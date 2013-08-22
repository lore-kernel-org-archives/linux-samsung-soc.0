From: Kukjin Kim <kgene@kernel.org>
Subject: RE: Broken device trees for exynos in linux-next
Date: Thu, 22 Aug 2013 18:55:35 +0900
Message-ID: <1c7e01ce9f1d$bf4967d0$3ddc3770$@org>
References: <CAOesGMgv9gTQ_NtaKZY_ZfLD1NBU19E-vaLaWwmvGJJB1MQrwg@mail.gmail.com>
 <13b101ce9a14$2cebd700$86c38500$@org>
 <CAOesGMiyNM6VdNzKQU3XwoiacJV8hc60mcLiH+vHoS6xJM6q-A@mail.gmail.com>
 <159201ce9b36$2a513f30$7ef3bd90$@org> <8738q5lnjc.fsf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38002 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752428Ab3HVJzh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 05:55:37 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRX00G46FKJN340@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Aug 2013 18:55:35 +0900 (KST)
In-reply-to: <8738q5lnjc.fsf@kernel.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kevin Hilman' <khilman@linaro.org>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, 'Mark Brown' <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, 'Arnd Bergmann' <arnd@arndb.de>

Kevin Hilman wrote:
> 
> Kukjin Kim <kgene@kernel.org> writes:
> 
> [...]
> 
> > If we could make LPAE enabled defconfig for all ARM platforms, I'm fine.
> I
> > think your concern is creating SoC specific defconfig and I agree with
> you.
> > But I'm not sure how we can support LPAE enabled defconfig for ARM
> > platforms.
> 
> Here's a simple way to keep a single base defconfig, and enable LPAE:
> 
> $ echo CONFIG_ARM_LPAE=y > /tmp/lpae.config
> $ ./scripts/kconfig/merge_config.sh arch/arm/config/exynos_defconfig
> /tmp/lpae.config
> 
Yeah, it can be used for test. But there are many differences between
exynos_defconfig and exynos5440_defconfig...PCIe, GbE, HugeTLB and KVM...so
I'm still wondering how to handle it without other defconfig.

Olof, do you still having objection for exynos5440_defconfig? If so, OK I
will revert exynos5440_defconfig for now so that I could pull out the
'defconfig' branch to arm-soc for upcoming merge window. Then, let's discuss
again :)

Thanks,
Kukjin
