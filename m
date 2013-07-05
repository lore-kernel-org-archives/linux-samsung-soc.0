From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] drm/exynos: exynos_drm_ipp: fix return value check
Date: Sat, 06 Jul 2013 01:45:48 +0200
Message-ID: <1543220.nCniYjBE9B@flatron>
References: <CAPgLHd9yE7YES-yDFSWfHOKbbay2yLS_VrvF5-QyJumnNFitQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f179.google.com ([209.85.215.179]:44022 "EHLO
	mail-ea0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751942Ab3GEXpw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Jul 2013 19:45:52 -0400
Received: by mail-ea0-f179.google.com with SMTP id b15so1748642eae.24
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Jul 2013 16:45:51 -0700 (PDT)
In-Reply-To: <CAPgLHd9yE7YES-yDFSWfHOKbbay2yLS_VrvF5-QyJumnNFitQw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene.kim@samsung.com, yongjun_wei@trendmicro.com.cn, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Thursday 04 of July 2013 21:35:00 Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> In case of error, the function ipp_find_obj() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check
> should be replaced with IS_ERR().
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
