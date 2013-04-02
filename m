From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 00/21] Various fixes and extensions to Exynos4 clock driver
Date: Tue, 02 Apr 2013 17:30:39 +0900
Message-ID: <22e101ce2f7c$5b6a0cd0$123e2670$%kim@samsung.com>
References: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
 <CAJuYYwQap4pZ6qTgBPGeSWbMFm-ZhqLfv7wBMVYjK1v0YHr_kQ@mail.gmail.com>
 <1496108.NDegb7PXrt@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63117 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760054Ab3DBIal (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 04:30:41 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKM00LPUCZ3RNL0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Apr 2013 17:30:40 +0900 (KST)
In-reply-to: <1496108.NDegb7PXrt@flatron>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, a.hajda@samsung.com, l.majewski@samsung.com

Tomasz Figa wrote:
> 
> On Saturday 30 of March 2013 15:33:00 Thomas Abraham wrote:
> > Hi Tomasz,
> >
> > On 27 March 2013 16:32, Tomasz Figa <t.figa@samsung.com> wrote:
> > > This series is a collection of various fixes and extensions to Exynos4
> > > clock driver, which improve coverage of clocks present on Exynos4 SoCs
> > > and fix problems discovered during our internal work and testing.
> >
> > Nice series. Thanks for the improvements and fixes. Looking at the
> > second patch in this series, I crossed checked again with the
> > Exynos4412 user manual that I have. Your modifications are different
> > from what the manual has listed. I suspect, you have a newer copy of
> > the manual.
> 
> Right. I have checked revisions 0.0, 0.1 and 1.1 of the manual and indeed
> there are differences in clock layout between 0.1 and 1.1. My patches are
> based on revision 1.1.
> 
Correct...hmm...

> > For this series:
> > Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
> 
Yes, looks good to me but would be better if I could get Mike's ack on this
series.

Thanks.

- Kukjin
