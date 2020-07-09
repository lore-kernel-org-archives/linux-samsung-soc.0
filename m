Return-Path: <SRS0=xCO3=AU=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6206CC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Jul 2020 07:54:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2860C20674
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Jul 2020 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594281290;
	bh=ZP0fMyf/+sTGbUumaGqQE5gOWjW3qaP1fbvKZAmlgJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GhUbPwwN5cdUZ9lrKg2fU76C7dBs9KyAt+NAH3ZL8nwgEH2ftaB2fOiPvkjBxHHBp
	 B8eP3LIlTHW30yzgNTanihWV9NuQ7WY2BHd3d8Bl07Vyi8VrD/ofqmvEpxmSb+TwTb
	 GUcCHYTc7f5KNvvwWUiaibtEeLxqVgZ7pVjAyD88=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgGIHyt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Jul 2020 03:54:49 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:44993 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbgGIHyt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Jul 2020 03:54:49 -0400
Received: by mail-ej1-f66.google.com with SMTP id ga4so1263371ejb.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2020 00:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CMiLxtVTICWAGYOpfZqDMnAVll0zOnONpr0dL/HD6cU=;
        b=LzESgAuTTj3JnrFwjkXxhD2HismRUA02rIMzP0eXHaHJ2wZanhUJjSdLUPE4EdO7hY
         /swB/FVu4vfJSOm++9whNILfM8j3EzdNJsDzdTohT95f6XOhDbzKe+e4yGNE+k9E+rxP
         dtJK78bPvlJ/LmeY/Xkoy9IlYCh1XcQjn2VDDKhRLUsKTXvUfc9UAX8sAtRHUJ/eIagS
         PwkMPMj6YA/yfxilakPjEkDCNtjoNj5h3ulqCBF0OaXu0awd4ei/rsLCrZR/UvL/hhbX
         yEdv4ymBpHhn/4btpCHj0cvrQ6QUTumKmkYABzr54nZoJHMbHbUsf+w/2/6KDmgHAQP/
         Vtfg==
X-Gm-Message-State: AOAM533d4pUiwIEYnHT77FKfixf6BXVLQlgSChN1R25hNDwvNBFnK3N0
        9jpKEvzwLC+F4ot/affCF7k=
X-Google-Smtp-Source: ABdhPJwuhrghB3WBdR6TE0cAVlc4kbY2vXMCKw8yrCqVbPHEHH/gYPd9g7LeIekhAbZVY2G4OtsU7g==
X-Received: by 2002:a17:906:748:: with SMTP id z8mr56456214ejb.257.1594281287675;
        Thu, 09 Jul 2020 00:54:47 -0700 (PDT)
Received: from kozik-lap ([194.230.155.195])
        by smtp.googlemail.com with ESMTPSA id h15sm1271905eja.44.2020.07.09.00.54.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 00:54:46 -0700 (PDT)
Date:   Thu, 9 Jul 2020 09:54:44 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/exynos: gem: Fix sparse warning
Message-ID: <20200709075444.GA7306@kozik-lap>
References: <CGME20200707110911eucas1p1e21621f402b2aac89457647c3b2ad46f@eucas1p1.samsung.com>
 <20200707110859.3822-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200707110859.3822-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jul 07, 2020 at 01:08:59PM +0200, Marek Szyprowski wrote:
> Add a proper cast on the exynos_gem->kvaddr assignment to avoid a sparse warning.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 9940d9d93406 ("drm/exynos: gem: Get rid of the internal 'pages' array")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
