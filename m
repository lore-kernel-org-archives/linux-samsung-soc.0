Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DB1C77B7A
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 19 May 2023 09:21:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjESJVV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 19 May 2023 05:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjESJVU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 19 May 2023 05:21:20 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D14C18F
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 May 2023 02:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684488079; x=1716024079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GkKfBmF6E5I1B54syimenbREv13HM+EuYV61v02IhJk=;
  b=K93AatIZqI66IPEecy33Z2OvTQTG/z0RqqmEm2Ib4c3ycTa49LV76QNB
   rWwG9fsK6lSpgrgBzr4s3EIwYxUUK4Iz5mHHkxSLjA+DiSU7JeRTdOC6v
   HaAk7SBqX5BfxiYUr7GErC+/h3e2V2r+GcWGkeX4GgodpNbsRPjJT1x+f
   NcwfIAXl+jxBUGlXzWCaZkj+n4EDZHkxS2qW6c6Lht7VW3i5zpu7PGyoj
   cdrV6TAaLoSzdzP3KPEEcqnPIf8PJnYWCHsIis+JfTt4vJV76fvXKqDCT
   93Tn10lfD6adALdF5HU3j0S/ixGuClwVp30bI8p3oP1PTlejlotyF8Zjo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354679118"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="354679118"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 02:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="679990475"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="679990475"
Received: from refaase-mobl.ger.corp.intel.com (HELO intel.com) ([10.251.221.245])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 02:21:16 -0700
Date:   Fri, 19 May 2023 11:21:14 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     =?utf-8?B?77+977+977+9zrHvv70=?= <inki.dae@samsung.com>
Cc:     'Andi Shyti' <andi.shyti@linux.intel.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        'Andi Shyti' <andi.shyti@kernel.org>
Subject: Re: [PATCH] drm/exynos: vidi: fix a wrong error return
Message-ID: <ZGc/ipQspaaUf5FX@ashyti-mobl2.lan>
References: <CGME20230519000408epcas1p4f5d90f588e7250d2d168d2943adef4f7@epcas1p4.samsung.com>
 <20230519000407.60744-1-inki.dae@samsung.com>
 <ZGbCO9/5yEstym+c@ashyti-mobl2.lan>
 <04c401d98a09$898df160$9ca9d420$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04c401d98a09$898df160$9ca9d420$@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Inki,

> > > @@ -469,8 +469,6 @@ static int vidi_remove(struct platform_device *pdev)
> > >  	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
> > >  		kfree(ctx->raw_edid);
> > >  		ctx->raw_edid = NULL;
> > > -
> > > -		return -EINVAL;
> > 
> > It doesn't look right to me, I think the correct patch should be:
> > 
> > -       if (ctx->raw_edid != (struct edid *)fake_edid_info) {
> > -               kfree(ctx->raw_edid);
> > -               ctx->raw_edid = NULL;
> > -
> > -               return -EINVAL;
> > -       }
> > -
> > +       ctx->raw_edid = NULL;
> > 
> > because "ctx->raw_edid" points to a non allocated memory in the
> > .data segment and you cannot free it.
> > 
> > A follow-up cleanup should be to remove the "const" from
> > fake_edid_info because you are assigning its address to pointers
> > (raw_edid), so that what's the point for having it const? You are
> > just fooling the compiler :)
> 
> Thanks for review comment. 
> 
> "ctx->raw_edid != fake_edid_info" means that the edid sent by the user through
> the ictl system call - vidi_connection_ioctl - is used instead of fake one -
> face_edid_info.
> In this case, ctx->raw_edid object needs to be released because ctx->raw_edid
> object is allocated and the edid object sent by user is copied to the ctx-
> >raw_edid by kmemdup(). :)

yes... yes... I sent you another e-mail after this :)

Thanks,
Andi
