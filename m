From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable bus frequency scaling with
 DEVFREQ/DEVFREQ-Event
Date: Thu, 21 Jul 2016 10:52:53 +0200
Message-ID: <0b7a7675-f3ef-b78d-d56a-09c2f0029d53@samsung.com>
References: <CGME20160715013357epcas1p1f7e365ac861b48a56c029e67b9461d60@epcas1p1.samsung.com>
 <1468546426-4482-1-git-send-email-cw00.choi@samsung.com>
 <579088FB.2000101@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:44386 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751302AbcGUIw7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 04:52:59 -0400
In-reply-to: <579088FB.2000101@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux@armlinux.org.uk, kgene@kernel.org, javier@osg.samsung.com, linux.amoon@gmail.com, treding@nvidia.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/21/2016 10:34 AM, Chanwoo Choi wrote:
> Hi Krzysztof,
> 
> Could you please pick this patch?
> 
> Regards,
> Chanwoo Choi

Hi,

The patchset looks good, only the commit message needs some minor
improvements (I can do that while applying). However it came too late
for this cycle - after my last pull request for v4.8 ten days ago. I
won't be able to push anything more so it has to wait for v4.9. I'll
pick it up after merge window.

For the record:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
