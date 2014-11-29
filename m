From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v5 5/6] drivers: soc: exynos-pmu: Add support for Exynos7
Date: Sun, 30 Nov 2014 08:35:26 +0900
Message-ID: <02b001d00c2d$27410aa0$75c31fe0$@kernel.org>
References: <1417270508-11174-1-git-send-email-amit.daniel@samsung.com>
 <1417270508-11174-6-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51970 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751735AbaK2Xf3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 29 Nov 2014 18:35:29 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFT009ZBQV2XG40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 30 Nov 2014 08:35:26 +0900 (KST)
In-reply-to: <1417270508-11174-6-git-send-email-amit.daniel@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Amit Daniel Kachhap' <amit.daniel@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: b.zolnierkie@samsung.com, pankaj.dubey@samsung.com, 'Eunseok Choi' <es10.choi@samsung.com>, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Amit Daniel Kachhap wrote:
> 
> Add PMU settings for exynos7. This is required for future suspend-to-ram,
> cpuidle and power domain support.
> 
> Note: In this patch some static declarations lines are over 80
> characters per line for easy redability.
> 
> Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Eunseok Choi <es10.choi@samsung.com>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
> ---
>  drivers/soc/samsung/exynos-pmu.c            |  427 ++++++++++++++++++++++++++-
>  include/linux/soc/samsung/exynos-regs-pmu.h |  273 +++++++++++++++++
>  2 files changed, 699 insertions(+), 1 deletion(-)
> 
I'm not sure all of the definitions in exynos-regs-pmu are required?...too many,
and I couldn't check the addresses are correct ;)

And how about splitting to each SoC specific file in drivers/soc/samsung/ ?
For example, exynos-pmu.c and exynos7-pmu.c like cpufreq...? Just considering.

- Kukjin
