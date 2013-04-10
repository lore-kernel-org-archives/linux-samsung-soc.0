From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 04/10] clk-exynos for v3.10
Date: Wed, 10 Apr 2013 17:42:59 +0900
Message-ID: <30be01ce35c7$68eab7a0$3ac026e0$%kim@samsung.com>
References: <51630A02.4080905@samsung.com> <201304092231.18314.arnd@arndb.de>
 <CAK9yfHzMOmrRMKdc2fUJHnbrOC_-=AR3BnHBDjtvPeinvxOcLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:31939 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S936088Ab3DJInN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 04:43:13 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0ML100K5B6V7ZK50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 10 Apr 2013 17:43:02 +0900 (KST)
In-reply-to: <CAK9yfHzMOmrRMKdc2fUJHnbrOC_-=AR3BnHBDjtvPeinvxOcLg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Sachin Kamat wrote:
> 
> On 10 April 2013 02:01, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Monday 08 April 2013, Kukjin Kim wrote:
> >> The following changes since commit
> 07961ac7c0ee8b546658717034fe692fd12eefa9:
> >>
> >>    Linux 3.9-rc5 (2013-03-31 15:12:43 -0700)
> >>
> >> are available in the git repository at:
> >>
> >>
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> >> tags/clk-exynos-for-v3.10
> >>
> >> for you to fetch changes up to
da821eb7d42935b0f7056d98c75fd1150f6636f4:
> >>
> >>    Merge commit 'v3.9-rc5' into next/clk-exynos (2013-04-09 01:10:13
> +0900)
> >>
> >> ----------------------------------------------------------------
> >>
> >> add suppport common clock framework for exynos
> >
> > I got a build warning, probably because of this patch:
> 
> 
> IIRC, the patch at [1] was supposed to fix the build warning. Kukjin
> had mentioned it was applied [1].
> 
> [1] https://patchwork.kernel.org/patch/2010691/
> 
Oops, probably the patch missed :-( Let me fix it.

Thanks.

- Kukjin
