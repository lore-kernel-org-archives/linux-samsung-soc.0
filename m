From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: exynos4: cpu hotplug + cpuidle/AFTR broken
Date: Tue, 01 Apr 2014 13:22:34 +0200
Message-ID: <533AA17A.1090405@samsung.com>
References: <533A9849.1080402@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:59254 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752600AbaDALWl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Apr 2014 07:22:41 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3C00E1ANLQP950@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Apr 2014 12:22:38 +0100 (BST)
In-reply-to: <533A9849.1080402@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-samsung-soc@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi Daniel,

On 01.04.2014 12:43, Daniel Lezcano wrote:
>
> Hi all,
>
> I tried the v3.14 kernel and unplugged the cpu1. That leads to a kernel
> hang without any trace.
>
> If I disable the cpuidle AFTR state through sysfs before unplugging
> cpu1, it works well.
>
> I reproduced the issue on v3.14, v3.13, v3.12, v3.11
>
> v3.10 works fine.

Could you try to reproduce the same issue on linux-next? Some of PM 
issues on Exynos should be patches there.

Best regards,
Tomasz
