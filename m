From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Set clock parent if provided
Date: Mon, 08 Apr 2013 16:23:26 +0900
Message-ID: <2c9201ce3429$f61a8640$e24f92c0$%kim@samsung.com>
References: <1362634301-9706-1-git-send-email-shaik.ameer@samsung.com>
 <5138B3BA.9040303@samsung.com>
 <CAOD6ATqK5crLc2nzz1rf856Lw48j2hOw_YRpjS4y8g7OzaLgSQ@mail.gmail.com>
 <5146DEF5.1070608@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:27414 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753646Ab3DHHX2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 03:23:28 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKX00GOODV1ZZ40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Apr 2013 16:23:27 +0900 (KST)
In-reply-to: <5146DEF5.1070608@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Shaik Ameer Basha' <shaik.samsung@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

Sylwester Nawrocki wrote:
> 
> Hi Shaik,
> 
> On 03/15/2013 10:00 AM, Shaik Ameer Basha wrote:
> > On Thu, Mar 7, 2013 at 9:05 PM, Sylwester Nawrocki
> > <s.nawrocki@samsung.com> wrote:
> ...
> >> May I ask what do you need this for ? This code won't be used for
> >> Exynos4 and Exynos5 SoCs starting from 3.10. And it is going to be
> >> removed once other platforms are converted to the new Samsung clocks
> >> driver.
> >
> > I had some issues in exynos5 with out this implementation.
> > But yes... you are right, once we move to common clock framework (CCF)
> > we don't require this change, as CCF doesn't use this (for exynos 4/5).
> >
> > What about all old non-dt based platforms?
> > Cant they use this change until they move to DT and CCF?
> 
> I have nothing against the patch, I was just curious if you need
> it for the new SOCs where the new clocks driver is supposed to be used.
> Of course other Samsung platforms could switch to CCF before having
> support for the device tree.
> 
Sorry for late response on this...

Yes, I think, as many guys said, this is not required for now for exynos4/5.

But the reason is different, I think, because the parent clock should be set depends on each board. That's why there are many parent clocks hardware providing. Sometimes just one parent clock can be used as a default though.

- Kukjin
