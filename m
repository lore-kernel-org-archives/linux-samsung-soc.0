From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: Fix typo in trip point temperature for
 exynos5420/5440
Date: Fri, 08 May 2015 08:48:02 +0900
Message-ID: <554BF9B2.8080401@samsung.com>
References: <1430988887-6743-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46254 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750843AbbEGXsH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 May 2015 19:48:07 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NO000H5W7G49L10@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 May 2015 00:48:05 +0100 (BST)
In-reply-to: <1430988887-6743-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>, kgene@kernel.org, l.majewski@samsung.com, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kesavan.abhilash@gmail.com

On 07.05.2015 17:54, Abhilash Kesavan wrote:
> Remove the extra zero in the "cpu-crit-0" trip point for exynos5420
> and exynos5440.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>

Looks good, thank you.
Applied to my tree, I'll push it later to Kukjin.

Best regards,
Krzysztof
