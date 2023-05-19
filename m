Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0F7C77B7A
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 19 May 2023 00:27:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbjESA1J (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 18 May 2023 20:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbjESA1I (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 18 May 2023 20:27:08 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C2219A4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 May 2023 17:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684456000; x=1715992000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IczHcTinen5R8LnXTA43eyV1MBcFE/tZE7MTOfhMK9c=;
  b=MmiKBedd7kwVYa1jhABt9uM3rNu8tFvUGOZ7YeTdqB9FY1T3pVxbaRNj
   ycnSMHp0iKgh5/H5176vTBGszo1qf4GBhvjzvP1S2MMOVtgrLkKg8TJfG
   /canEmFbikyhqwjquJNA/yiDvxf8JoMuM4vbW7e6aH7pG8uZOr9wJOrHU
   ZvqfOJ19msXj7j+V+NnVIt3h9YGNaK2k2WmNIRAk2DyDkOt18tMnK1QS0
   +FAEFLIfcS0fk4CMqGJ6DyeoFThtJFNSSFxiivkTlZJeE9Xz/3u3Ns8Ex
   EzKtHutCNsAFJRUq8svWAkY3Ara2tSgN1FmL9jhwb1LN/Xm1MA9Qqj/kl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="349750312"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="349750312"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 17:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="826588292"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="826588292"
Received: from refaase-mobl.ger.corp.intel.com (HELO intel.com) ([10.251.221.245])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 17:26:38 -0700
Date:   Fri, 19 May 2023 02:26:35 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Inki Dae <inki.dae@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH] drm/exynos: vidi: fix a wrong error return
Message-ID: <ZGbCO9/5yEstym+c@ashyti-mobl2.lan>
References: <CGME20230519000408epcas1p4f5d90f588e7250d2d168d2943adef4f7@epcas1p4.samsung.com>
 <20230519000407.60744-1-inki.dae@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519000407.60744-1-inki.dae@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Inki,

On Fri, May 19, 2023 at 09:04:07AM +0900, Inki Dae wrote:
> Fix a wrong error return by dropping an error return.
> 
> When vidi driver is remvoed, if ctx->raw_edid isn't same as fake_edid_info
> then only what we have to is to free ctx->raw_edid so that driver removing
> can work correctly - it's not an error case.
> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> index 4d56c8c799c5..f5e1adfcaa51 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -469,8 +469,6 @@ static int vidi_remove(struct platform_device *pdev)
>  	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
>  		kfree(ctx->raw_edid);
>  		ctx->raw_edid = NULL;
> -
> -		return -EINVAL;

It doesn't look right to me, I think the correct patch should be:

-       if (ctx->raw_edid != (struct edid *)fake_edid_info) {
-               kfree(ctx->raw_edid);
-               ctx->raw_edid = NULL;
-
-               return -EINVAL;
-       }
-
+       ctx->raw_edid = NULL;

because "ctx->raw_edid" points to a non allocated memory in the
.data segment and you cannot free it.

A follow-up cleanup should be to remove the "const" from
fake_edid_info because you are assigning its address to pointers
(raw_edid), so that what's the point for having it const? You are
just fooling the compiler :)

Andi

>  	}
>  
>  	component_del(&pdev->dev, &vidi_component_ops);
> -- 
> 2.25.1
