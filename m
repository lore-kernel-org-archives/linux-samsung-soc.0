From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 4/7] Exynos: add support for 'domain-always-on' property
Date: Tue, 01 Jul 2014 11:08:51 +0200
Message-ID: <53B27AA3.5030000@samsung.com>
References: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
 <1404202211-15788-5-git-send-email-m.szyprowski@samsung.com>
 <53B276BE.2090509@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:49214 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757441AbaGAJIx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 05:08:53 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N81002VS02QZ290@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Jul 2014 10:08:50 +0100 (BST)
In-reply-to: <53B276BE.2090509@gmx.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <liquid.acid@gmx.net>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Hello,

On 2014-07-01 10:52, Tobias Jakobi wrote:
> Hello Marek,
>
> I think you had a similar patch in the tizen tree, but according to
> Tomasz Figa, it was considered a hack. I don't quite see how this is
> different.
>
> Also, if I have been following the discussion correctly, then the
> powerdomain issue essentially is about the question which SoC block
> needs the LCD0 domain and how the proper power on/off sequences should
> look like.
>
> At least the mixer power issue, which I pointed out some time ago, seems
> to be deal with now:
> https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=exynos-drm-next&id=381be025ac1a6dc8efebdf146ced0d4a6007f77b

Well, that patch solves power on/off sequence issue with mixer and hdmi,
but it didn't solve the issue with additional managing of power domain
on/off. You can check that if you remove always on property, system will
freeze when hdmi cable is connected for the second time. I've investigated
it for some time, but right now I didn't find any 100% reliable solution
other than keeping the power domain enabled all the time. At least for
now, this patch lets you use HDMI without any stability issues.

I've only found that there are still at least 2 issues with power domains.
One is Mixer/Video Processor dependency on LCD0 domain, second is the proper
power on/off sequence of HDMI/Mixer and TV domain. Forcing both domains to
'always on' workarounds both issues for now. Right now I have no better
idea.

Later, once the proper sequence is found we can remove those properties
from Odroid DTS.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
