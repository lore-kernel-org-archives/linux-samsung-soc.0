From: Chanho Park <chanho61.park@samsung.com>
Subject: RE: [PATCH 02/27] ARM: EXYNOS: Add IO mapping for non-secure SYSRAM of
 Exynos3250
Date: Thu, 10 Apr 2014 18:57:02 +0900
Message-ID: <002501cf54a3$38f50d60$aadf2820$@samsung.com>
References: <1397122124-15690-1-git-send-email-cw00.choi@samsung.com>
 <1397122124-15690-3-git-send-email-cw00.choi@samsung.com>
 <4172202.teSeEmypAU@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:22629 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965804AbaDJJ5D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 05:57:03 -0400
In-reply-to: <4172202.teSeEmypAU@wuerfel>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, hyunhee.kim@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, yj44.cho@samsung.com, inki.dae@samsung.com, 'Chanwoo Choi' <cw00.choi@samsung.com>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org

Hi Arnd,

> -----Original Message-----
> From: linux-arm-kernel [mailto:linux-arm-kernel-
> bounces@lists.infradead.org] On Behalf Of Arnd Bergmann
> Sent: Thursday, April 10, 2014 6:45 PM
> To: linux-arm-kernel@lists.infradead.org
> Cc: kgene.kim@samsung.com; t.figa@samsung.com; hyunhee.kim@samsung.com;
> sw0312.kim@samsung.com; linux-kernel@vger.kernel.org;
> yj44.cho@samsung.com; inki.dae@samsung.com; Chanwoo Choi;
> kyungmin.park@samsung.com; linux-samsung-soc@vger.kernel.org
> Subject: Re: [PATCH 02/27] ARM: EXYNOS: Add IO mapping for non-secure
> SYSRAM of Exynos3250
> 
> On Thursday 10 April 2014 18:28:19 Chanwoo Choi wrote:
> >
> > The non-secure SYSRAM is used for secondary CPU bring-up. This patch
> add
> > IO mapping for non-scure SYSRAM.
> >
> > Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> I really don't want to see any further static mappings here. We had the
> same discussion for the previous Exynos chip that was submitted, so
> please
> describe the SYSRAM in DT, and start thinking about the other static
> mappings
> that can be removed.

Sachin already submitted the DT support[1] for SYSRAM area.

[1] : http://www.spinics.net/lists/linux-samsung-soc/msg27647.html

> 
> 	Arnd
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
