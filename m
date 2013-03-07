From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: exynos: pl330: Add #dma-cells for generic dma
 binding support
Date: Thu, 07 Mar 2013 10:31:03 +0900
Message-ID: <015901ce1ad3$6ea43540$4bec9fc0$%kim@samsung.com>
References: <1362375268-29405-1-git-send-email-padma.v@samsung.com>
 <201303052237.05910.arnd@arndb.de>
 <CAAgF-Bf+rqiFUaBD=aRqry6-2z4o0Ao2L2YRm8bu1x98TfPPyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54935 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751132Ab3CGBbF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 20:31:05 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ900FCIO7EH1A0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Mar 2013 10:31:04 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MJ900M8KO7RZX90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Mar 2013 10:31:03 +0900 (KST)
In-reply-to: <CAAgF-Bf+rqiFUaBD=aRqry6-2z4o0Ao2L2YRm8bu1x98TfPPyg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padma Venkat' <padma.kvr@gmail.com>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Padmavathi Venna' <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, boojin.kim@samsung.com, robherring2@gmail.com, dinguyen@altera.com, 'Olof Johansson' <olof@lixom.net>

Padma Venkat wrote:
> 
> On Wed, Mar 6, 2013 at 4:07 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Monday 04 March 2013, Padmavathi Venna wrote:
> >>
> >> This patch adds #dma-cells property to PL330 DMA controller
> >> nodes for supporting generic dma dt bindings on samsung exynos
> >> platforms. #dma-channels and #dma-requests are not required now
> >> but added in advance.
> >>
> >> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Should we apply these directly to the arm-soc fixes branch, or wait
> > until they come back from the Samsung subarchitecture tree?
> 
> Hmm, If Kukjin can take in 3.9 rc2 it's better to go via Samsung tree.
> 
> Kukjin,
> 
> Can you please take this patch in 3.9 rc2 ?
> 
Sure, I will.

BTW, Arnd, I'm not sure second one(socfpga.dtsi) can be handled in samsung
tree.

Thanks.

- Kukjin
