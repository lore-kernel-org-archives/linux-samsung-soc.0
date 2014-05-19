From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3] clk: exynos5420: Add 5800 specific clocks
Date: Mon, 19 May 2014 20:27:07 +0900
Message-ID: <03b701cf7355$44bf35f0$ce3da1d0$@samsung.com>
References: <1400133374-26041-1-git-send-email-arun.kk@samsung.com>
 <CALt3h7-ZaNCgPk50jEDmN1qab_x4q52QXUfo7Nnxn0e_MHEG_w@mail.gmail.com>
 <5379DCAC.1040601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54030 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754188AbaESL1J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 07:27:09 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5T0062KJT8TTE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 May 2014 20:27:08 +0900 (KST)
In-reply-to: <5379DCAC.1040601@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Arun Kumar K' <arun.kk@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, 'Alim Akhtar' <alim.akhtar@samsung.com>, 'Arun Kumar' <arunkk.samsung@gmail.com>

Tomasz Figa wrote:
> 
> Hi,
> 
Hi,

> On 19.05.2014 10:32, Arun Kumar K wrote:
> > Hi Tomasz,
> >
> > Can this patch be taken for the 3.16 merge?
> >
> > Regards
> > Arun
> >
> > On Thu, May 15, 2014 at 11:26 AM, Arun Kumar K <arun.kk@samsung.com>
> wrote:
> >> From: Alim Akhtar <alim.akhtar@samsung.com>
> >>
> >> Exynos5800 clock structure is mostly similar to 5420 with only
> >> a small delta changes. So the 5420 clock file is re-used for
> >> 5800 also. The common clocks for both are seggreagated and few
> >> clocks which are different for both are separately initialized.
> >>
> >> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> >> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> >> ---
> >> Changes from v2
> >> - Rebased on Tomasz's samsung-clk-next branch of
> >>   samsung-clk [1] tree.
> >>   [1] git://git.kernel.org/pub/scm/linux/kernel/git/tfiga/samsung-
> clk.git
> >> Changes from v1
> >> - Rebased on Shaik's clock consolidation for 5420
> >> - Addressed review comments from Tomasz
> 
> Looks good.
> 
> Acked-by: Tomasz Figa <t.figa@samsung.com>
> 
> Kukjin, since this is just one patch, could you still pick it up
> directly? It should apply anywhere above your v3.16-next/clk-samsung
> branch.
> 
OK, I will with your ack.

Thanks,
Kukjin
