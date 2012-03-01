From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/4] ARM: EXYNOS: Hook up power domains to generic power
 domain infrastructure (part 2)
Date: Thu, 01 Mar 2012 12:58:23 +0900
Message-ID: <076701ccf75f$8c217b20$a4647160$%kim@samsung.com>
References: <1330505255-25587-1-git-send-email-b.zolnierkie@samsung.com>
 <1330505255-25587-2-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33862 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756064Ab2CAD6Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 22:58:25 -0500
In-reply-to: <1330505255-25587-2-git-send-email-b.zolnierkie@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Cc: thomas.abraham@linaro.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, rjw@sisk.pl, 'Kyungmin Park' <kyungmin.park@samsung.com>

Bartlomiej Zolnierkiewicz wrote:
> 
> * Add support of enabling/disabling modules in S5P_CLKGATE_BLOCK register.

NO. I remember, we talked about this before and I'm still thinking it should
be handled independently.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
