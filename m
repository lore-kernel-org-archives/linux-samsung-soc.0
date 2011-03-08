From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/3] ARM: S5P: Add D-PHY control platform helpers for
	MIPI-CSIS/DSIM drivers
Date: Wed, 09 Mar 2011 08:05:29 +0900
Message-ID: <042301cbdde5$54047a60$fc0d6f20$%kim@samsung.com>
References: <01a701cbd95d$9873c160$c95b4420$%kim@samsung.com>
 <1299179061-30959-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:12608 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755891Ab1CHXFf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Mar 2011 18:05:35 -0500
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHR007B6HH9OO00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Mar 2011 08:05:33 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHR00L8RHH9WY@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Mar 2011 08:05:33 +0900 (KST)
In-reply-to: <1299179061-30959-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com

Sylwester Nawrocki wrote:
> 
> Hello,
> 
> the following patch series adds the platform helpers for MIPI-CSIS and
MIPI-
> DSIM
> drivers to control their corresponding D-PHYs.
> MIPI-DSIM driver should use its D-PHY control function from
plat-s5p/setup-
> mipi.c.
> 
> Changes since v1:
> - created common setup-mipi.c under plat-s5p for all S5P/EXYNOS4* SoCs
> 
> 
> The patch series contains:
> [PATCH v2 1/3] ARM: S5P: Rename MIPI-CSIS driver header and update
Copyright
> [PATCH v2 2/3] ARM: S5P: Extend MIPI-CSIS platform_data with the PHY
control
> callback
> [PATCH v2 3/3] ARM: S5P: Add support for common MIPI CSIS/DSIM D-PHY
control
> 
Hi Sylwester,

Basically, I agree with your current approach :)

Will review it today and re-think other method about your ifdef(EXYNOS4) so
that can support single kernel later.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
