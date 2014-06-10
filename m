From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: exynos: mark machine descriptor functions static
Date: Tue, 10 Jun 2014 15:07:10 +0200
Message-ID: <539702FE.5030902@samsung.com>
References: <1401771456-6101-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36460 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937AbaFJNH1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 09:07:27 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N6Y003XKF3YF200@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jun 2014 14:07:11 +0100 (BST)
In-reply-to: <1401771456-6101-1-git-send-email-olof@lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Olof,

On 03.06.2014 06:57, Olof Johansson wrote:
> There's no reason to export these functions, and I have no idea why
> they have over time ended up in the header file. As a result, none of
> the checker tools caught it (i.e. sparse was silent on it).
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
> 
> I'm guessing with all the churn right now this might not apply, so it
> might need manual application around -rc1.
> 
> There's definitely room for more cleanup in common.h.
> 
>  arch/arm/mach-exynos/common.h |    6 ------
>  arch/arm/mach-exynos/exynos.c |   10 +++++-----
>  2 files changed, 5 insertions(+), 11 deletions(-)
> 

Similar patch and few other clean-up patches were posted some time ago
on the list as a part of PMU rework series, but somehow got missed. They
can be applied independently from rest of the series which is still
under discussion.

Best regards,
Tomasz
