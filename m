From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix multiple definition build error
Date: Fri, 26 Apr 2013 11:48:50 +0200
Message-ID: <517A4D82.8010306@samsung.com>
References: <1366952590-11652-1-git-send-email-inki.dae@samsung.com>
 <1835608.J1o7g8oiCZ@flatron>
 <CAAQKjZPQ4LWTka0rfgPypsh+a-B5gzBv5hEbRYdkrry_C5J6Hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46816 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754354Ab3DZJsx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Apr 2013 05:48:53 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLU00KUKWK9TP50@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Apr 2013 10:48:51 +0100 (BST)
In-reply-to: <CAAQKjZPQ4LWTka0rfgPypsh+a-B5gzBv5hEbRYdkrry_C5J6Hg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>

On 04/26/2013 10:20 AM, Inki Dae wrote:
> Exactly right. it's my mistake. But now it seems that __mode_of_device_table is
> multi defined at fimd and g2d side so there still is module build error. :(

Since all drivers seem to be linked into single a single module, you 
likely need to create a separate table of struct of_device_id just for 
the purpose of MODULE_DEVICE_TABLE(of, ...). This table would contain 
'compatible' strings for all devices. Or choose of_device_id for just 
one device and define MODULE_DEVICE_TABLE() for it in some common place,
e.g. exynos_drm_drv.c. I believe all devices should be listed though.


Thanks,
Sylwester
