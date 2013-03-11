From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/7] Add G2D nodes to Exynos4 machines
Date: Mon, 11 Mar 2013 15:54:23 +0900
Message-ID: <052101ce1e25$4370c410$ca524c30$%kim@samsung.com>
References: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
 <CAK9yfHyQ=2EjRKknhN7nKUygnryKfWZ2A61w1+WRtrzLaF3SBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44631 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751392Ab3CKGyY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Mar 2013 02:54:24 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJH00MDHHU32ZV0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Mar 2013 15:54:23 +0900 (KST)
In-reply-to: <CAK9yfHyQ=2EjRKknhN7nKUygnryKfWZ2A61w1+WRtrzLaF3SBA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: s.nawrocki@samsung.com, patches@linaro.org

Sachin Kamat wrote:
> 
> Hi Kukjin,
> 
> Can you please look into this series as it is pending since quite some time.
> 
Applied, I have another opinion about the compatible string though...

I think, it can be sorted out next time :-)

Thanks.

- Kukjin

> On 18 February 2013 10:32, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> > This patch series is based on Kukjin Kim's next/dt-exynos branch of
> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tree.
> >
> > Changes since v1:
> > * Removed power-domain entry in patch 1/7 as the driver currently
> >   does not use it.
> > * Addressed review comments from Sylwester Nawrocki and Tomasz Figa
> >   in patch 7/7.
> >
> > Sachin Kamat (7):
> >   ARM: dts: Add G2D node to exynos4210.dtsi
> >   ARM: dts: Add G2D node to SMDKV310
> >   ARM: dts: Add G2D node to exynos4210-origen
> >   ARM: dts: Add G2D node to exynos4x12.dtsi
> >   ARM: dts: Add G2D node to SMDK4412
> >   ARM: dts: Add G2D node to exynos4412-origen
> >   ARM: dts: Add Samsung G2D DT bindings documentation
