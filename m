From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 1/3] ARM: S5P: Rename MIPI-CSIS driver header and update
	Copyright
Date: Thu, 10 Mar 2011 20:13:17 +0900
Message-ID: <008c01cbdf14$2c6d6d60$85484820$%kim@samsung.com>
References: <002601cbdead$0f1cb840$2d5628c0$%kim@samsung.com>
 <1299755195-9055-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:21486 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904Ab1CJLN1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Mar 2011 06:13:27 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHU007U99UDPF20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 20:13:25 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHU00G4Z9UC1Y@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 20:13:24 +0900 (KST)
In-reply-to: <1299755195-9055-2-git-send-email-s.nawrocki@samsung.com>
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
Sylwester,

Oops...I remember, already said, if you use -M, you can see following.

arch/arm/plat-s5p/dev-csis0.c                      |    2 +-
 arch/arm/plat-s5p/dev-csis1.c                      |    2 +-
 .../plat-s5p/include/plat/{csis.h => mipi_csis.h}  |   10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename arch/arm/plat-s5p/include/plat/{csis.h => mipi_csis.h} (68%)

Please don't test my patience :(

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
