From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] ARM: S5P: Rename MIPI-CSIS header and update Copyright
Date: Thu, 03 Mar 2011 13:33:01 +0900
Message-ID: <01a501cbd95c$37069cf0$a513d6d0$%kim@samsung.com>
References: <1299087289-29926-1-git-send-email-s.nawrocki@samsung.com>
 <1299087289-29926-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10539 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756041Ab1CCEeB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Mar 2011 23:34:01 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHG0022DSONWCE0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 13:33:59 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHG00EQUSONDQ@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 13:33:59 +0900 (KST)
In-reply-to: <1299087289-29926-2-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com

Sylwester Nawrocki wrote:
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-s5p/dev-csis0.c              |    2 +-
>  arch/arm/plat-s5p/dev-csis1.c              |    2 +-
>  arch/arm/plat-s5p/include/plat/csis.h      |   28
--------------------------
> --
>  arch/arm/plat-s5p/include/plat/mipi_csis.h |   28
> ++++++++++++++++++++++++++++
>  4 files changed, 30 insertions(+), 30 deletions(-)
>  delete mode 100644 arch/arm/plat-s5p/include/plat/csis.h
>  create mode 100644 arch/arm/plat-s5p/include/plat/mipi_csis.h
> 
Oops, why didn't use '-M'?
It can show me this like following.

.../plat-s5p/include/plat/{csis.h => mipi_csis.h}  |   10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename arch/arm/plat-s5p/include/plat/{csis.h => mipi_csis.h} (68%)

Secondly, I remember this...
Following is your response at that time.
http://lists.infradead.org/pipermail/linux-arm-kernel/2011-January/038037.ht
ml

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
