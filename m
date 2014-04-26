From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V5 00/20] ARM: exynos: cpuidle: Move the driver to
 drivers/cpuidle
Date: Sat, 26 Apr 2014 20:05:58 +0900
Message-ID: <0b4201cf613f$80c91750$825b45f0$@samsung.com>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
 <534BA3CF.6030701@linaro.org> <535943B2.8030308@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18634 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751836AbaDZLGA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 Apr 2014 07:06:00 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4M00GPUXHZD1C0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Apr 2014 20:05:59 +0900 (KST)
In-reply-to: <535943B2.8030308@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'Daniel Lezcano' <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

Tomasz Figa wrote:
> 
> On 14.04.2014 11:01, Daniel Lezcano wrote:
> >
> > Hi Kukjin,
> >
> > I believe I addressed all the comments. Is it possible to take this
> > patchset for next ?
> 
Sure ;-)

> +1.
> 
> Also when applying you might add
> 
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> 
> to any patches that don't have it yet.
> 
Tomasz, thanks for your review.

I will take this series, "moving exynos-cpuidle into drivers/cpuidle" into samsung tree if Rafael is OK on that.

Thanks,
Kukjin
