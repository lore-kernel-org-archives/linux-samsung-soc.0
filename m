From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH] clk: samsung: exynos5260: fix typo in clock name
Date: Fri, 12 Sep 2014 14:57:04 +0530
Message-ID: <000e01cfce6b$bf538ca0$3dfaa5e0$@samsung.com>
References: <1410328565-25122-1-git-send-email-pankaj.dubey@samsung.com>
 <54122962.5020903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18124 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751646AbaILJYg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Sep 2014 05:24:36 -0400
In-reply-to: <54122962.5020903@gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, 'Chander Kashyap' <k.chander@samsung.com>, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Hi Tomasz,

> -----Original Message-----
> From: Tomasz Figa [mailto:tomasz.figa@gmail.com]
> Sent: Friday, September 12, 2014 4:30 AM
> To: Pankaj Dubey; linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: kgene.kim@samsung.com; s.nawrocki@samsung.com; mturquette@linaro.org;
> Chander Kashyap; Abhilash Kesavan
> Subject: Re: [PATCH] clk: samsung: exynos5260: fix typo in clock name
> 
> Hi Pankaj,
> 
> On 10.09.2014 07:56, Pankaj Dubey wrote:
> > From: Chander Kashyap <k.chander@samsung.com>
> >
> > The parent name added in parent list as
> > mout_phyclk_mipi_dphy_4l_m_txbyte_clkhs_p, is different than the
> > defined parent due to typo.
> >
> > Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> > Signed-off-by: Chander Kashyap <k.chander@samsung.com>

Please add my sign-off as 

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>

> 
> Missed your sign-off? You can reply with it inline and I will add it when
applying this
> weekend.
> 
> P.S. Please keep me on CC when sending patches for Samsung clock drivers.
> 
> Best regards,
> Tomasz
