From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v2 0/2] Remove static mapping of SCU from mach-exynos
Date: Tue, 08 Nov 2016 10:00:13 +0530
Message-ID: <582154D5.7020501@samsung.com>
References: <CGME20161108031123epcas1p2d5f60a1903a6005a5cf7eb7f6b392119@epcas1p2.samsung.com>
 <1478574864-24683-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39271 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752071AbcKHE15 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 23:27:57 -0500
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGB00L0C31AZJF0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Nov 2016 13:27:10 +0900 (KST)
In-reply-to: <1478574864-24683-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, kgene@kernel.org, thomas.ab@samsung.com

Hi,

On Tuesday 08 November 2016 08:44 AM, Pankaj Dubey wrote:
> This patch series is part of patch series [1], which adds support of SCU
> device node for Cortex-A9 based Exynos4 SoC. First two patches of the same
> has been accepted and hence not included them in v2.
> 
> This patch series does some cleanup for Exynos4 SoC based boards.
> We are currently statically mapping SCU SFRs in mach-exynos/exynos.c
> which can be avoided if map this from device node of SCU. 
> 
> This patch introduces exynos_scu_enable in firmware.c file,
> which will be called from exynos_resume, which in turn called by pm.c and
> suspend.c as firmware_ops.
> 

Please ignore this patchset as just noticed that firmware_ops needs not
be present for all boards, in that case exynos_resume ops won't be
defined in some of Exynos4 based boards and scu_enable won't be called.
I will think about some other approach and submit again.

Sorry for noise.

Thanks,
Pankaj Dubey
