Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39E4C77B7A
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 19 May 2023 02:37:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjESChR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 18 May 2023 22:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjESChQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 18 May 2023 22:37:16 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DB1E7F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 May 2023 19:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684463835; x=1715999835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gPVLxIgLjrPophpUuE+ZF3za491E2E6KrFr2sELiUXI=;
  b=CkV3uLYhAyIAwtDGLqcb0YzhAjdLU1Zc3TlKe0xweU7FfiJzNRM7i+IO
   XgKnEJq3cwndif70FJELpDdoekzJofrJe/f+ElOMJ7RLee4YWFDsbPWcz
   rMAyXMDbOQSbPB0cugHfm5NZV8Uu58g70ZuwWdh8cro+lKejhgc7ckDK4
   g/Z99NEJd3ZmDXAKuFBgTg1b19TJMKFEjrIFsRmA+rNDPDmf7AGkByqbz
   f22IviC/FBY3Wnpb0CXnmZrAV+Z6vCTcvSDKm8S6y8RnAffFPyTyGHhl7
   BJpYbAfU88LhJQLQ/fyF6k5LNxQQSAa2ne2gxqi9hPrc/WaZP77hpGSHx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="352278825"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="352278825"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 19:37:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="814565295"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="814565295"
Received: from refaase-mobl.ger.corp.intel.com (HELO intel.com) ([10.251.221.245])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 19:37:04 -0700
Date:   Fri, 19 May 2023 04:37:01 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Andi Shyti <andi.shyti@linux.intel.com>
Cc:     Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
        linux-samsung-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH] drm/exynos: vidi: fix a wrong error return
Message-ID: <ZGbgza6w6taNIXAl@ashyti-mobl2.lan>
References: <CGME20230519000408epcas1p4f5d90f588e7250d2d168d2943adef4f7@epcas1p4.samsung.com>
 <20230519000407.60744-1-inki.dae@samsung.com>
 <ZGbCO9/5yEstym+c@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGbCO9/5yEstym+c@ashyti-mobl2.lan>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Inki,

On Fri, May 19, 2023 at 02:26:40AM +0200, Andi Shyti wrote:
> Hi Inki,
> 
> On Fri, May 19, 2023 at 09:04:07AM +0900, Inki Dae wrote:
> > Fix a wrong error return by dropping an error return.
> > 
> > When vidi driver is remvoed, if ctx->raw_edid isn't same as fake_edid_info
> > then only what we have to is to free ctx->raw_edid so that driver removing
> > can work correctly - it's not an error case.
> > 
> > Signed-off-by: Inki Dae <inki.dae@samsung.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> > index 4d56c8c799c5..f5e1adfcaa51 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> > @@ -469,8 +469,6 @@ static int vidi_remove(struct platform_device *pdev)
> >  	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
> >  		kfree(ctx->raw_edid);
> >  		ctx->raw_edid = NULL;
> > -
> > -		return -EINVAL;
> 
> It doesn't look right to me, I think the correct patch should be:
> 
> -       if (ctx->raw_edid != (struct edid *)fake_edid_info) {
> -               kfree(ctx->raw_edid);
> -               ctx->raw_edid = NULL;
> -
> -               return -EINVAL;
> -       }
> -
> +       ctx->raw_edid = NULL;
> 
> because "ctx->raw_edid" points to a non allocated memory in the
> .data segment and you cannot free it.
> 
> A follow-up cleanup should be to remove the "const" from
> fake_edid_info because you are assigning its address to pointers
> (raw_edid), so that what's the point for having it const? You are
> just fooling the compiler :)

please ignore, this is what happens when reading patches at
2.26am, that a "!=" becomes "==". The patch is correct, still
some cleanups is needed here, though.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

PS I was actually sleeping and this woke me up :)

> Andi
> 
> >  	}
> >  
> >  	component_del(&pdev->dev, &vidi_component_ops);
> > -- 
> > 2.25.1
