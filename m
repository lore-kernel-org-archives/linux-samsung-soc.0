From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/7] clk: exynos4: add support for MOUT_HDMI and MOUT_MIXER
 clocks
Date: Tue, 01 Jul 2014 10:57:18 +0200
Message-ID: <53B277EE.1060704@samsung.com>
References: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
 <1404202211-15788-2-git-send-email-m.szyprowski@samsung.com>
 <53B27565.8090703@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:48378 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757708AbaGAI5U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 04:57:20 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N80002J7ZJHZ290@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Jul 2014 09:57:17 +0100 (BST)
In-reply-to: <53B27565.8090703@gmx.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <liquid.acid@gmx.net>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>

Hello,

On 2014-07-01 10:46, Tobias Jakobi wrote:
> Hello Marek,
>
> I think this particular clock setup should already be handled by this patch:
> http://www.spinics.net/lists/arm-kernel/msg320013.html
>
> Or am I missing something here?

The patch you have pointed requires adding support for SET_PARENT_PARENT
feature to clock core, which has not been accepted yet. Only then Exynod
DRM drivers can be updated to correctly handle the changed clock tree.

My approach is to introduce minimal changes and use the code which is
already in the exynos drm/hdmi driver (it already manages 'mout_hdmi/mixer'
clocks). If other solution is finally accepted, the code can be simplified
and mout_hdmi/mixer clocks simply ignored. For now - my changes are needed
to get HDMI output working and have least dependencies.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
