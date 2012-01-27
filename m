From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 5/6] ARM: SAMSUNG: Correct M-5MOLS sensor clock frequency
 on Nuri board
Date: Fri, 27 Jan 2012 10:34:03 +0900
Message-ID: <016801ccdc93$c1053930$430fab90$%kim@samsung.com>
References: <1327501407-1927-1-git-send-email-s.nawrocki@samsung.com>
 <1327501407-1927-6-git-send-email-s.nawrocki@samsung.com>
 <4F205D18.7070509@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49479 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751485Ab2A0BeV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jan 2012 20:34:21 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LYF0008QOCJS270@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 10:34:04 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LYF003CAOCRPL50@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 10:34:04 +0900 (KST)
In-reply-to: <4F205D18.7070509@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <snjw23@gmail.com>
Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com, 'Kyungmin Park' <kyungmin.park@samsung.com>

Sylwester Nawrocki wrote:
> 
Hi Sylwester,

> oops, it's for Universal C210 so the subject should be:
> 
> ARM: SAMSUNG: Correct M-5MOLS sensor clock frequency on Universal C210
> board
> 
OK, let me fix the subject when I apply.

> Should I resend or would you fix it when applying.
> 
No :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> --
> Regards,
> Sylwester
> 
> On 01/25/2012 03:23 PM, Sylwester Nawrocki wrote:
> > In order to keep the sensor's master clock frequency in valid range
> > when FIMC parent clock is xusbxti, the specified frequency must be
> > exactly 24MHZ, otherwise it's being set to too low value due to
> > rounding.
> >
> > Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>
> > Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> > ---
> >   arch/arm/mach-exynos/mach-universal_c210.c |    2 +-
> >   1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-
> exynos/mach-universal_c210.c
> > index 44fc43e..0e3aeb9 100644
> > --- a/arch/arm/mach-exynos/mach-universal_c210.c
> > +++ b/arch/arm/mach-exynos/mach-universal_c210.c
> > @@ -973,7 +973,7 @@ static struct s5p_fimc_isp_info
> universal_camera_sensors[] = {
> >   		.bus_type	= FIMC_MIPI_CSI2,
> >   		.board_info	=&m5mols_board_info,
> >   		.i2c_bus_num	= 0,
> > -		.clk_frequency	= 21600000UL,
> > +		.clk_frequency	= 24000000UL,
> >   		.csi_data_align	= 32,
> >   	},
> >   };
