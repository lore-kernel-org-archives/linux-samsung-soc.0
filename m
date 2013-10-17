From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH V2] ARM: dts: Exynos5420: Add device nodes for GScaler
 blocks
Date: Fri, 18 Oct 2013 08:31:21 +0900
Message-ID: <1e0401cecb90$fceb6ee0$f6c24ca0$@org>
References: <1381989300-21818-1-git-send-email-l.krishna@samsung.com>
 <1654668.cjaYLCemzK@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50932 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753253Ab3JQXbZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 19:31:25 -0400
In-reply-to: <1654668.cjaYLCemzK@amdc1227>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'Leela Krishna Amudala' <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, khw0178.kim@samsung.com, cpgs@samsung.com

Tomasz Figa wrote:
> 
> Hi Leela,
> 
> On Thursday 17 of October 2013 11:25:00 Leela Krishna Amudala wrote:
> > Adds G-Scaler device nodes to the DT device list
> >
> > Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> > ---
> >
> > Changes since V1:
> > 	- Changed the patch subject
> > 	- Changed the node name to video-scaler
> > 	  suggested by Tomasz Figa <t.figa@samsung.com>
> >
> > Note: G-scaler probe test done on Kgene's for-next branch.
> >
> >  arch/arm/boot/dts/exynos5420.dtsi |   20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> 
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> 
Tomasz, thanks for your review.

Leela, looks good to me too, applied.

Thanks,
Kukjin
