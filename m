From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 7/7] ARM: dts: Add Samsung G2D DT bindings documentation
Date: Thu, 14 Feb 2013 17:01:34 +0100
Message-ID: <511D0A5E.7060907@samsung.com>
References: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
 <1360151477-26460-8-git-send-email-sachin.kamat@linaro.org>
 <511C1462.5060106@gmail.com>
 <CAK9yfHyEfEhRE-7CUeu7x7GbqJZL4aJfgHso2kXoGCWRrxiYWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:31930 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757979Ab3BNQBh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Feb 2013 11:01:37 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI700JT2WFYVLA0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Feb 2013 16:01:35 +0000 (GMT)
Received: from [106.116.147.32] by eusync3.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MI700ID6WINY470@eusync3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Feb 2013 16:01:35 +0000 (GMT)
In-reply-to: <CAK9yfHyEfEhRE-7CUeu7x7GbqJZL4aJfgHso2kXoGCWRrxiYWw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "patches@linaro.org" <patches@linaro.org>

On 02/14/2013 04:45 PM, Sachin Kamat wrote:
> Thanks for reviewing. Does the filename look good or should it be exynos-g2d?

You're welcome. My apologies for being a bit late.
I guess exynos-g2d.txt would be more appropriate. OTOH if this document is
going to cover all Samsung G2D IP blocks then current name might be better.
I used samsung- prefix for fimc and mipi-csis as those documents are supposed
to cover the S5P and Exynos4 SoCs.
