From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 13/14] ARM: S5PV310: Add video clocks
Date: Fri, 20 Aug 2010 16:35:46 +0900
Message-ID: <00b901cb403a$52c69d20$f853d760$%kim@samsung.com>
References: <1282140084-10265-1-git-send-email-kgene.kim@samsung.com>
 <1282140084-10265-14-git-send-email-kgene.kim@samsung.com>
 <AANLkTincrZWhrb8fcrdL2QNtZTbgBB-pAYzTf8cq6Zn7@mail.gmail.com>
 <AANLkTikreMifRgd8kkvcmjZoRZ0fEAcHqWExaOikzE6v@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30126 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750988Ab0HTHgB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Aug 2010 03:36:01 -0400
Received: from epmmp1. (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L7F0003LX3GWQC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Aug 2010 16:35:40 +0900 (KST)
Received: from kgenekim (unknown [12.23.103.96])
 by mmp1.samsung.com (Sun Java(tm) System Messaging Server 7u3-15.01 64bit
 (built Feb 12 2010)) with ESMTPA id <0L7F00DURX3FAB90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Aug 2010 16:35:40 +0900 (KST)
In-reply-to: <AANLkTikreMifRgd8kkvcmjZoRZ0fEAcHqWExaOikzE6v@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Jongpill Lee' <boyko.lee@samsung.com>, ben-linux@fluff.org

MyungJoo Ham wrote:
> 
> On Thu, Aug 19, 2010 at 7:04 PM, MyungJoo Ham
> <myungjoo.ham@samsung.com> wrote:
> > On Wed, Aug 18, 2010 at 11:01 PM, Kukjin Kim <kgene.kim@samsung.com>
> wrote:
> >> From: Jongpill Lee <boyko.lee@samsung.com>
> >>
> >> This patch adds video clocks for S5PV310/S5PC210.
> >>
> >> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> >> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> >> ---
> >>  arch/arm/mach-s5pv310/clock.c |   74
> +++++++++++++++++++++++++++++++++++++++++
> >>  1 files changed, 74 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/arch/arm/mach-s5pv310/clock.c b/arch/arm/mach-s5pv310/clock.c
> >> index 14c9707..04bde94 100644
> >> --- a/arch/arm/mach-s5pv310/clock.c
> >> +++ b/arch/arm/mach-s5pv310/clock.c
> >> @@ -506,6 +506,78 @@ static struct clksrc_sources clkset_group = {
> >>        .nr_sources     = ARRAY_SIZE(clkset_group_list),
> >>  };
> >>
> >> +static struct clksrc_clk clk_sclk_mipidphy4l = {
> >> +       .clk    = {
> >> +               .name           = "sclk_mipidphy4l",
> >> +               .id             = -1,
> >> +               .enable         = s5pv310_clk_ip_lcd0_ctrl,
> >> +               .ctrlbit        = (1 << 4),
> >> +       },
> >> +       .sources        = &clkset_group,
> >> +       .reg_src        = { .reg = S5P_CLKSRC_LCD0, .shift = 12, .size = 4 },
> >> +       .reg_div        = { .reg = S5P_CLKDIV_LCD0, .shift = 16, .size = 4 },
> >> +};
> >
> > It appears that clk_ip_lcd0[4](CLK_SMMUFIMD0) is not for this clock
> > source. This SCLK_MIPIDPHY4L seems to be masked by
> > CLK_SRC_MASK_LCD0[12] (MIPI0_MASK)
> 
Ok...you're right.

> Um... As CLK_SRC_MASK_LCD0[12] (MIPI0_MASK) controls MUX_MIPI0, it
> masks both SCLK_MIPIDPHY4L and SCLK_MIPI0. Then, it seems that we
> cannot mask SCLK_MIPIDPHY4L and SCLK_MIPI0 independently.
> 
> Then, what about not adding .enable entry for both "sclk_mipidphy4l"
> and "sclk_mipi" (which is added in the PATCH 14/14)? Affecting another
> clock source with one does not look good.
> 
Hmm...yeah, I agree with you. I will think about that again.

Thank you for your pointing out.

> >
> >> +
> >> +static struct clksrc_clk clk_sclk_mipidphy2l = {
> >> +       .clk    = {
> >> +               .name           = "sclk_mipidphy2l",
> >> +               .id             = -1,
> >> +               .enable         = s5pv310_clk_ip_lcd1_ctrl,
> >> +               .ctrlbit        = (1 << 4),
> >> +       },
> >> +       .sources        = &clkset_group,
> >> +       .reg_src        = { .reg = S5P_CLKSRC_LCD1, .shift = 12, .size = 4 },
> >> +       .reg_div        = { .reg = S5P_CLKDIV_LCD1, .shift = 16, .size = 4 },
> >> +};
> >
> > Appears to have the similar issue with the previous clock source
> 
> Same with above.
> 

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
