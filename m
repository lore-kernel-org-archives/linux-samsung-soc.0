From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 1/2] drm/exynos: remove DRM_EXYNOS_GEM_MAP_OFFSET ioctl
Date: Thu, 02 Oct 2014 08:47:12 +0900
Message-ID: <542C9280.9050800@samsung.com>
References: <1410961726-2533-1-git-send-email-inki.dae@samsung.com>
 <1410961726-2533-2-git-send-email-inki.dae@samsung.com>
 <542C1A16.6030809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:65276 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753054AbaJAXrR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Oct 2014 19:47:17 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCS00MAXI2GCG70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Oct 2014 08:47:05 +0900 (KST)
In-reply-to: <542C1A16.6030809@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org

Hi Tomasz,

On 10/02/2014 12:13 AM, Tomasz Figa wrote:
> Hi Inki,
> 
> On 17.09.2014 15:48, Inki Dae wrote:
>> This interface and relevant codes aren't used anymore.
>>
> 
> Hmm, I might be missing something, but after removing this IOCTL, how do
> we obtain an offset to pass to mmap()?

There is DRM_IOCTL_MODE_MAP_DUMB, it can get mmap offset before mmap and
the offset is passed via mmap.

Thanks.
