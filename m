From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Support Suspend-to-RAM on EXYNOS5420
Date: Mon, 16 Dec 2013 17:15:08 +0100
Message-ID: <1470279.CK35gJZeX3@amdc1227>
References: <1387195271-3613-1-git-send-email-a.kesavan@samsung.com>
 <CANacCWx7YV45mVK=7BJjc95cSgm6ck1qSMRsfW3oeGxLC1LC5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:48765 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754466Ab3LPQPZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Dec 2013 11:15:25 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MXW00I8FQHNOIB0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Dec 2013 16:15:23 +0000 (GMT)
In-reply-to: <CANacCWx7YV45mVK=7BJjc95cSgm6ck1qSMRsfW3oeGxLC1LC5w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vaibhav Bedia <vaibhav.bedia@gmail.com>
Cc: Abhilash Kesavan <a.kesavan@samsung.com>, kgene.kim@samsung.com, tomasz.figa@gmail.com, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, olof@lixom.net, dianders@chromium.org

Hi,

On Monday 16 of December 2013 08:27:17 Vaibhav Bedia wrote:
> Hi,
> 
> On Mon, Dec 16, 2013 at 7:01 AM, Abhilash Kesavan <a.kesavan@samsung.com> wrote:
[snip]
> > +       { EXYNOS5_CMU_RESET_GSCL_SYS_PWR_REG,                   { 0x0, 0x0, 0x0} },
> > +       { EXYNOS5_CMU_RESET_ISP_SYS_PWR_REG,                    { 0x0, 0x0, 0x0} },
> > +       { EXYNOS5_CMU_RESET_MFC_SYS_PWR_REG,                    { 0x0, 0x0, 0x0} },
> > +       { EXYNOS5_CMU_RESET_G3D_SYS_PWR_REG,                    { 0x0, 0x0, 0x0} },
> > +       { EXYNOS5420_CMU_RESET_DISP1_SYS_PWR_REG,               { 0x0, 0x0, 0x0} },
> > +       { EXYNOS5420_CMU_RESET_MAU_SYS_PWR_REG,                 { 0x0, 0x0, 0x0} },
> > +       { EXYNOS5420_CMU_RESET_G2D_SYS_PWR_REG,                 { 0x0, 0x0, 0x0} },
> > +       { EXYNOS5420_CMU_RESET_MSC_SYS_PWR_REG,                 { 0x0, 0x0, 0x0} },
> > +       { EXYNOS5420_CMU_RESET_FSYS_SYS_PWR_REG,                { 0x0, 0x0, 0x0} },
> > +       { PMU_TABLE_END,},
> > +};
> > +
> 
> Looking at a rather long list of register defines and soc_is_* checks here
> makes me wonder how this is any different from the static data that the
> other SoC vendors (TI) are trying very hard to move out of arch/arm...

Well, this data will eventually get moved to a PMU driver once
drivers/syslib (as discussed on KS in Edinburgh) infrastructure shows up.

We can't get rid of these data from kernel sources, since there is no
other place where they would fit. (No, DT is not such place.)

Best regards,
Tomasz
