From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: RE: [PATCH 00/21] Various fixes and extensions to Exynos4 clock
 driver
Date: Thu, 04 Apr 2013 09:36:48 +0900
Message-ID: <26e501ce30cc$7e4d4d60$7ae7e820$%kim@samsung.com>
References: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
 <CAJuYYwQap4pZ6qTgBPGeSWbMFm-ZhqLfv7wBMVYjK1v0YHr_kQ@mail.gmail.com>
 <1496108.NDegb7PXrt@flatron> <22e101ce2f7c$5b6a0cd0$123e2670$%kim@samsung.com>
 <20130403220118.3383.10734@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49032 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761262Ab3DDAgu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Apr 2013 20:36:50 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKP00MZRGCVFLD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Apr 2013 09:36:49 +0900 (KST)
In-reply-to: <20130403220118.3383.10734@quantum>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mike Turquette' <mturquette@linaro.org>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, a.hajda@samsung.com, l.majewski@samsung.com

Mike Turquette wrote:
> 
> Quoting Kukjin Kim (2013-04-02 01:30:39)
> > Tomasz Figa wrote:
> > >
> > > On Saturday 30 of March 2013 15:33:00 Thomas Abraham wrote:
> > > > Hi Tomasz,
> > > >
> > > > On 27 March 2013 16:32, Tomasz Figa <t.figa@samsung.com> wrote:
> > > > > This series is a collection of various fixes and extensions to
> Exynos4
> > > > > clock driver, which improve coverage of clocks present on Exynos4
> SoCs
> > > > > and fix problems discovered during our internal work and testing.
> > > >
> > > > Nice series. Thanks for the improvements and fixes. Looking at the
> > > > second patch in this series, I crossed checked again with the
> > > > Exynos4412 user manual that I have. Your modifications are different
> > > > from what the manual has listed. I suspect, you have a newer copy of
> > > > the manual.
> > >
> > > Right. I have checked revisions 0.0, 0.1 and 1.1 of the manual and
> indeed
> > > there are differences in clock layout between 0.1 and 1.1. My patches
> are
> > > based on revision 1.1.
> > >
> > Correct...hmm...
> >
> > > > For this series:
> > > > Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
> > >
> > Yes, looks good to me but would be better if I could get Mike's ack on
> this
> > series.
> >
> 
> Acked-by: Mike Turquette <mturquette@linaro.org>
> 
Thanks, applied.

- Kukjin
