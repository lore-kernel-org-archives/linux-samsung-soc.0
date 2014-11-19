From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCH 2/2] drm/exynos: use drm generic mmap interface
Date: Wed, 19 Nov 2014 03:32:48 +0100
Message-ID: <546C0150.3030909@gmx.net>
References: <1410961726-2533-1-git-send-email-inki.dae@samsung.com> <1410961726-2533-3-git-send-email-inki.dae@samsung.com> <542BFEFE.20708@gmail.com> <542D275B.3080304@samsung.com> <546BC3A6.1090304@gmx.net> <546BFAA7.1030605@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:62268 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753796AbaKSCdH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 21:33:07 -0500
In-Reply-To: <546BFAA7.1030605@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Inki Dae wrote:
>>
>> Hello,
>>
>> it looks like libdrm git master is still using the EXYNOS_GEM_MMAP ioctl
>> that was removed by this patch. Is there any news on the patches for libdrm?
> 
> The patch set already was posted. You can refer to below link,
> 	http://www.spinics.net/lists/dri-devel/msg70737.html
> 
> Thanks,
> Inki Dae
> 

Looks like I missed that, thanks for the heads up!

With best wishes,
Tobias
