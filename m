From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 5/6] ARM: EXYNOS: Enable multi-platform build support
Date: Wed, 16 Apr 2014 15:51:29 +0200
Message-ID: <534E8AE1.4010402@samsung.com>
References: <1397554134-11827-1-git-send-email-sachin.kamat@linaro.org>
 <1397554134-11827-6-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:48353 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756296AbaDPNve (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 09:51:34 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N44003IBMHVM710@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Apr 2014 14:51:31 +0100 (BST)
In-reply-to: <1397554134-11827-6-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, arnd@arndb.de

Hi Sachin,

On 15.04.2014 11:28, Sachin Kamat wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> This makes it possible to enable the exynos platform as part of a
> multiplatform kernel, in addition to keeping the single-platform
> Exynos support.
> sparsemem is currently not supported in multiplatform.

Is this still true as of today?

Otherwise looks fine.

Best regards,
Tomasz
