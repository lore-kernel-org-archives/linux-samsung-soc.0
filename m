From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] ARM: EXYYNOS: Use EXYNOS4210_GPEx instead of
 EXYNOS4_GPEx
Date: Fri, 18 May 2012 10:24:40 +0200
Message-ID: <4FB60748.4040307@samsung.com>
References: <1337307497-15777-1-git-send-email-jy0922.shim@samsung.com>
 <4FB5B9A1.2030606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:10024 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760123Ab2ERIYn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 May 2012 04:24:43 -0400
Received: from euspt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M4700GSTLXJC0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 May 2012 09:22:31 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M4700C1DM157D@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 May 2012 09:24:41 +0100 (BST)
In-reply-to: <4FB5B9A1.2030606@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, linus.walleij@stericsson.com

On 05/18/2012 04:53 AM, Joonyoung Shim wrote:
> Add to cc Grant Likely and Linus Walleij
> 
> On 05/18/2012 11:18 AM, Joonyoung Shim wrote:
>> Also use EXYNOS4210_GPIO_Ex instead of EXYNOS4_GPIO_Ex. The GPEx gpios
>> exist only on Exynos4210 and there are no on Exynos4x12. Redefine them
>> to exact SoC name.
>>
>> Signed-off-by: Joonyoung Shim<jy0922.shim@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>

Nit: there is a typo in the patch summary line:

s/EXYYNOS/EXYNOS

--
Regards,
Sylwester
