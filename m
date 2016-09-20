From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC 1/2] drm/exynos: mixer: convert booleans to flags in mixer
 context
Date: Tue, 20 Sep 2016 10:30:54 +0200
Message-ID: <726a3852-6fbb-9e18-0ee9-0e36c6635b2f@samsung.com>
References: <1474293183-9918-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <CGME20160919135328eucas1p22f4277a06420853e06323e988f22a211@eucas1p2.samsung.com>
 <1474293183-9918-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38185 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751015AbcITIbA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Sep 2016 04:31:00 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ODS00BSFNNLFY40@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Sep 2016 09:30:57 +0100 (BST)
In-reply-to: <1474293183-9918-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com

On 19.09.2016 15:53, Tobias Jakobi wrote:
> The mixer context struct already has a 'flags' field, so
> we can use it to store the 'interlace', 'vp_enabled' and
> 'has_sclk' booleans.
> We use the non-atomic helper functions to access these bits.
>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
--
Regards
Andrzej
