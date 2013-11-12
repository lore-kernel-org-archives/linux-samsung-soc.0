From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [Patch v4 0/2] Enable all cpus in Exynos5420
Date: Tue, 12 Nov 2013 20:42:42 +0900
Message-ID: <086901cedf9c$4c1ffca0$e45ff5e0$@org>
References: <1381119431-12697-1-git-send-email-chander.kashyap@linaro.org>
 <CANuQgHEx+pNdaybeJ_dpQ5kWYpA44hrYj4ikW9d60a3hEZZPDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51365 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751559Ab3KLLmo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 06:42:44 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MW5004D8F68SO40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Nov 2013 20:42:42 +0900 (KST)
In-reply-to: <CANuQgHEx+pNdaybeJ_dpQ5kWYpA44hrYj4ikW9d60a3hEZZPDA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chander Kashyap' <chander.kashyap@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

Chander Kashyap wrote:
> 
> Hi Kukjin,
> 
> On 7 October 2013 09:47, Chander Kashyap <chander.kashyap@linaro.org>
> wrote:
> > Exynos5420 is an octa-core SoC. This patch series enables the remaining
> 4 cores.
> >
> > Changes in v2:
> >         - Changed the cpu node @unit-address value to reg property
value.
> > Changes in v3:
> >         - Removed leading 0x from @unit-address value.
> > Changes in v4:
> >         - Fixed typo and patch subject from "arm: dt" to "ARM: dt".
> >
> > Chander Kashyap (2):
> >   clocksource: mct: extend mct to support 8 local interrupts for
> >     Exynos5420
> >   arm: dt: Exynos5420: populate cpu node enteries to 8 cpus
> >
> >  arch/arm/boot/dts/exynos5420.dtsi |   37
> +++++++++++++++++++++++++++++++++++--
> >  drivers/clocksource/exynos_mct.c  |    4 ++++
> >  2 files changed, 39 insertions(+), 2 deletions(-)
> >
> > --
> > 1.7.9.5

Looks OK to me, applied.

Thanks,
Kukjin
