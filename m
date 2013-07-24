From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 1/1] ARM: EXYNOS: Update CONFIG_ARCH_NR_GPIO for Exynos
Date: Wed, 24 Jul 2013 11:20:33 +0900
Message-ID: <0df901ce8814$601ab6d0$20502470$@org>
References: <1372054438-15693-1-git-send-email-sachin.kamat@linaro.org>
 <CAK9yfHzmF_oxc3DsuT5wtXX2C5O+wLxz4C2Ps3cVPnKLb8jOEw@mail.gmail.com>
 <0ad601ce868c$d88bff40$89a3fdc0$@org> <3136364.6D0qu7zGk3@amdc1227>
 <51ED89CA.2040908@gmail.com>
 <CAK9yfHyNqDJKuC8urpyrKR564jVJVfsJRRF0Z9a3p52iLWLZ8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:21284 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750731Ab3GXCUf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 22:20:35 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF0036S52ERJK0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 11:20:33 +0900 (KST)
In-reply-to: <CAK9yfHyNqDJKuC8urpyrKR564jVJVfsJRRF0Z9a3p52iLWLZ8A@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org

Sachin Kamat wrote:

[...]

> >>>>> Hmm, BTW, I'm wondering why it is 288 not 285 or other specific
> >>>
> >>>
> >>> number...
> >>>
> >>>> I wasn't really sure if we can have any number there. I chose the
> >>>> closest one (288) which was already used by other platform.
> >>>> If there is no problem to use 285 itself then I can resend with that
> >>>> number. Please let me know.
> >>>
> >>>
> >>> If there is no reason, please don't use bigger value than necessary
> one.
> >>
> >>
> >> Hmm, what about some GPIO expanders that would require bigger GPIO
> address
> >> space? I would reserve some space just in case, i.e. define this value
> to
> >> be
> >> the highest number of GPIOs on all Exynos SoCs + some extra, like 32 or
> >> 64.
> >
> >
> > That sounds like a good idea. IIRC I once had to increase ARCH_NR_GPIO
> to
> > make the wm8994 GPIO controller working. The wm8994 driver also handles
> > WM1811 audio codec that some Exynos development boards are shipped with.
> 
> Looks like a valid point.
> 
> Kukjin,
> Let me know your opinion about this before I respin the patch.
> 
Agreed, let's use 512 including some extras, I'm not sure what value for
some GPIO expanders is reasonable at this moment, though. It should be fine
on current EXYNOS platforms.

Thanks,
Kukjin
