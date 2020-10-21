Return-Path: <SRS0=kOvG=D4=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32C9C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 21 Oct 2020 18:21:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 436AE2246B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 21 Oct 2020 18:21:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.b="aI4DCgQQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392087AbgJUSVa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 21 Oct 2020 14:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504039AbgJUSV3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 21 Oct 2020 14:21:29 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA1DC0613CE
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Oct 2020 11:21:29 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id w27so705192ejb.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Oct 2020 11:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lBYBT2trM0zWLuScJPu/8MEsMxH22DaNGgcD4PxkzgM=;
        b=aI4DCgQQ2pNgP8FJefkPAHWyeYDZ6gBOdUW5ASwTjCdJPt6/F0D5IUw+ryIpjQNXm7
         gK4+rVdRij2UezhsYNKjky15pbLyx71SXm/fZWi7e8Q4m+RVncNlw0/EQHwWG71kG1jW
         swatZpkYTu5yAZOXhuMbyP3n0EJyZ6Tj4Y/cuYa29u3olktUJdc4M4TJ2rd4I+0DOH8g
         zGBna8sz6bZsljPuc9avDUo1nfa6ddJFnaen4gYQFZ8z/YYqPo9kDiLM1CATyUVyGmG8
         pnWq4b5N/m5mvr9ZCnxufY7oD2D56MpGg2WZMNT6wzDAol9vlUAst1BSJiogsIkNya2g
         yS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lBYBT2trM0zWLuScJPu/8MEsMxH22DaNGgcD4PxkzgM=;
        b=YQxpH5wkq/diCDm7O2pA6e0K8QYWQwyEMyuh0K4Pn7oX/6/nHnBqfcD+Msf5gTtKsN
         Y7I0uiHSQCdLbEegIkeihDD+/Yv4rLBmwLwIMDXFoodq3jXe71lob+234Xz2A7ucBzpr
         kcg7RZtDOIk+61slyeZi63muJLpqnBG3x0r5+vG12EqVqsraCqVhyjGcFXLwIR7aNr21
         67iKqSzEDNkEhG/KUeVz3sXW+i90TQ8IXZzLuAYPN9rFnGcKRXSmMdBSyg4u7N3/Ac9t
         3sZSh1oHaqdNBMI6vgF2KkASNCOsIQNnjsmJQ+rVXg5tWrGEjDY9Zg1BtPO8fjH47Eer
         kC+A==
X-Gm-Message-State: AOAM5331G7cmYUkgFuCl+EOd5EISG8RWbDkHHQTdNWy/cDynVdr2L7mm
        x6m3ewEzPQfwTZZhz3excSfrGLJZcyJjZkHQ+XDg7g==
X-Google-Smtp-Source: ABdhPJzA1jSls/Kx/Mwjc1+1+EpDhh/HoRUDuIKQ8K0ggJGziicPcEE6tEKertKBv/kwHwmxQELgJDflTG3MPc+CL3w=
X-Received: by 2002:a17:906:c20f:: with SMTP id d15mr4627011ejz.341.1603304487981;
 Wed, 21 Oct 2020 11:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch> <20201021085655.1192025-14-daniel.vetter@ffwll.ch>
In-Reply-To: <20201021085655.1192025-14-daniel.vetter@ffwll.ch>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 21 Oct 2020 11:21:17 -0700
Message-ID: <CAPcyv4jJTeH-PNjsXGrn=Ooz7=9rsZLdnFgwJ9xpQ6y14YoDrQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/16] /dev/mem: Only set filp->f_mapping
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Daniel Vetter <daniel.vetter@ffwll.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 21, 2020 at 1:57 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> When we care about pagecache maintenance, we need to make sure that
> both f_mapping and i_mapping point at the right mapping.
>
> But for iomem mappings we only care about the virtual/pte side of
> things, so f_mapping is enough. Also setting inode->i_mapping was
> confusing me as a driver maintainer, since in e.g. drivers/gpu we
> don't do that. Per Dan this seems to be copypasta from places which do
> care about pagecache consistency, but not needed. Hence remove it for
> slightly less confusion.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
