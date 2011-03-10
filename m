From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/3] ARM: EXYNOS4: Suspend to RAM Support
Date: Thu, 10 Mar 2011 13:35:53 +0900
Message-ID: <006101cbdedc$a8728540$f9578fc0$%kim@samsung.com>
References: <1299636521-4831-1-git-send-email-jc.lee@samsung.com>
 <1299636521-4831-3-git-send-email-jc.lee@samsung.com>
 <AANLkTikNu89XxoZ70PVH1MPXA7FBOGaiViovxmO7=t_E@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:24202 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751852Ab1CJEgD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Mar 2011 23:36:03 -0500
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHT00LD1RG1VL30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 13:36:01 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHT003PMRG1MT@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 13:36:01 +0900 (KST)
In-reply-to: <AANLkTikNu89XxoZ70PVH1MPXA7FBOGaiViovxmO7=t_E@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@samsung.com>, 'Jaecheol Lee' <jc.lee@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, =?UTF-8?B?J+2VqOuqheyjvCc=?= <myungjoo.ham@gmail.com>

MyungJoo Ham wrote:
> 
> On Wed, Mar 9, 2011 at 11:08 AM, Jaecheol Lee <jc.lee@samsung.com> wrote:
> > This patch adds support suspend to ram for EXYNOS4210.
> > As a note, this includes function of outer cache flush
> > because it is used before entering PM.
> >
> > Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> > ---

Hi, Mr. Ham.

Thanks for your comments.

I received his reply directly. I'm adding it below.

(snip)

> > +       { .reg = S5P_PCIE_MEM_LOWPWR                    , .val = 0x0, },
> > +       { .reg = S5P_SATA_MEM_LOWPWR                    , .val = 0x0, },
> > +       { .reg = S5P_PAD_RETENTION_DRAM_LOWPWR          , .val = 0x0, },
> > +       { .reg = S5P_PAD_RETENTION_MAUDIO_LOWPWR        , .val = 0x0, },
> 
> Probably, it's ok to choose not to write codes for exceptions of some
> chip revisions, in EVT 1.0 (tested and not applied in EVT0, not tested
> in EVT1.1), we had to set S5P_PAD_RETENTION_MAUDIO_LOWPWR 0x1.
> Otherwise, the sound didn't work after an instance of resume (which
> worked in EVT0)
> 
Ok, I missed MAUDIO retention release code so will add it.

(snip)

> In this list, how about adding the following CMU registers for core_save[]?
> S5P_CLKSRC_LEFTBUS,
> S5P_CLKGATE_IP_LEFTBUS,
> S5P_CLKOUT_CMU_LEFTBUS,
> S5P_CLKSRC_RIGHTBUS,
> S5P_CLKGATE_IP_RIGHTBUS,
> S5P_CLKOUT_CMU_RIGHTBUS,
> S5P_EPLL_LOCK,
> S5P_VPLL_LOCK,
> S5P_VPLL_CON0,
> S5P_VPLL_CON1,
> S5P_CLKSRC_TV,
> S5P_CLKSRC_G3D,
> S5P_CLKDIV_TV,
> S5P_CLKDIV_MFC,
> S5P_CLKDIV_G3D,
> S5P_CLKSRC_MASK_CAM,
> S5P_CLKDIV2_RATIO,
> S5P_CLKGATE_IP_TV,
> S5P_CLKGATE_IP_G3D,
> S5P_CLKGATE_IP_GPS,
> S5P_CLKGATE_BLOCK,
> S5P_CLKOUT_CMU_TOP,
> S5P_CLKDIV_DMC1,
> S5P_CLKGATE_IP_DMC,
> S5P_CLKOUT_CMU_DMC,
> S5P_APLL_LOCK,
> S5P_MPLL_LOCK,
> S5P_APLL_CON0,
> S5P_APLL_CON1,
> S5P_MPLL_CON0,
> S5P_MPLL_CON1,
> S5P_CLKDIV_CPU1,
> S5P_CLKGATE_IP_CPU,
> S5P_CLKOUT_CMU_CPU,
> 
> and some of PMU registers (mainly "CONTROL" and "CONFIGURATION" registers)?
> 
Ok, will add some more CMU registers but not PMU register. Because PMU register is in alive block.

(snip)

> You may need to ensure EPLL and VPLL are ON when you entering sleep.
> When I've tested with "NURI" board, it was ok to turn them off while
> the system is running; however, when entering a suspend-to-RAM, they
> should be turned on.
> 
Glitch-free MUX input clock should be enabled when entering system power down mode. If you use EPLL or VPLL as a clock source of some MUX, you need to turn on these PLLs or change other clock source (XusbXTI) which is always enabled.

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
