From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/4] ARM Exynos4210-Nuri: remove compiler errors
Date: Sat, 03 Dec 2011 18:26:14 +0900
Message-ID: <000201ccb19d$9ab31070$d0193150$%kim@samsung.com>
References: <1322730317-8171-1-git-send-email-myungjoo.ham@samsung.com>
 <1322730317-8171-4-git-send-email-myungjoo.ham@samsung.com>
 <04f901ccb0d0$b94191b0$2bc4b510$%kim@samsung.com>
 <CAJ0PZbTKgqgg3SZN3KyVFzGDuSU8qjM5NjwNcM28mtmzfbS0Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:11153 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752891Ab1LCJ0Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Dec 2011 04:26:16 -0500
In-reply-to: <CAJ0PZbTKgqgg3SZN3KyVFzGDuSU8qjM5NjwNcM28mtmzfbS0Xw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: myungjoo.ham@gmail.com
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Kevin Hilman' <khilman@ti.com>, 'Russell King' <linux@arm.linux.org.uk>, 'Kyungmin Park' <kyungmin.park@samsung.com>

MyungJoo Ham wrote:
> 
> On Fri, Dec 2, 2011 at 5:59 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > MyungJoo Hamm wrote:
> >>
> > What's the 'compiler errors'?
> >
> > And I don't know why this patch included in this series, maybe this
> should
> > be separated from this series?
> 
> The error is:
> arch/arm/mach-exynos/mach-nuri.c: In function 'nuri_power_init':
> arch/arm/mach-exynos/mach-nuri.c:1080:2: error: implicit declaration
> of function 'irq_alloc_descs'

Well, I couldn't find the 'irq_alloc_descs' at the
arch/arm/mach-exynos/mach-nuri.c file in my tree and linux-next. Maybe you
missed submitting some patches?

And I don't know why inclusion of <linux/export.h> is needed for
'irq_alloc_descs'...

> It is due to the recent changes in some of the header files (they
> removed some header inclusion from header fiiles).
> 
I think, if this is required, this fix should be separated because the build
error what you said will be happened without this series...

> In this patchset, we are providing a test case (Exynos4210-Nuri) for
> the device driver and we had to resolve the compiler error first.
> 
If so, yes, firstly that should be fixed...but now don't we need this?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
