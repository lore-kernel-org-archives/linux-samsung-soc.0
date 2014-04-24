From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V5 00/20] ARM: exynos: cpuidle: Move the driver to
 drivers/cpuidle
Date: Thu, 24 Apr 2014 19:02:42 +0200
Message-ID: <535943B2.8030308@samsung.com>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
 <534BA3CF.6030701@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:57874 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754038AbaDXRCv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 13:02:51 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N4J00KY8OOPPFB0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Apr 2014 18:02:49 +0100 (BST)
In-reply-to: <534BA3CF.6030701@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

On 14.04.2014 11:01, Daniel Lezcano wrote:
>
> Hi Kukjin,
>
> I believe I addressed all the comments. Is it possible to take this
> patchset for next ?

+1.

Also when applying you might add

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

to any patches that don't have it yet.

Best regards,
Tomasz
