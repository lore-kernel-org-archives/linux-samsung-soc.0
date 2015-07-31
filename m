From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 2/2] ARM: EXYNOS: fix double of_node_put() on error path
Date: Fri, 31 Jul 2015 09:39:02 +0900
Message-ID: <55BAC3A6.8080807@samsung.com>
References: <1438301390-7397-1-git-send-email-vz@mleia.com>
 <1438301390-7397-3-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:37732 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751013AbbGaAjB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jul 2015 20:39:01 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NSB0064QTSZ0LB0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 31 Jul 2015 01:39:00 +0100 (BST)
In-reply-to: <1438301390-7397-3-git-send-email-vz@mleia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>, Kukjin Kim <kgene@kernel.org>
Cc: Russell King <linux@arm.linux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 31.07.2015 09:09, Vladimir Zapolskiy wrote:
> The change removes the second of_node_put(), if
> for_each_compatible_node() body execution is not terminated. This
> prevents from object refcounter overflow over zero in OF_DYNAMIC
> build.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> ---
> Changes from v1 to v2:
> * split a single change v1 into two
> 
>  arch/arm/mach-exynos/pm_domains.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
