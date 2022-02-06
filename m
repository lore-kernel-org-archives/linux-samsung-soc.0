Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C73C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  6 Feb 2022 16:51:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbiBFQvj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 6 Feb 2022 11:51:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbiBFQvj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Feb 2022 11:51:39 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2448FC06173B
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Feb 2022 08:51:38 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 71AD53F199
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Feb 2022 16:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644166296;
        bh=vDkDi7ORKLCJHUi4o/FHJpx5nP2VVbFUW40QeGRguEs=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=GZ8f2ENj2d3aaCTfBDOYNYtS1aSy/p9uVoKpXqzNmdvqzgGy6BBNwROxzNCV6C2Id
         Dc4v6s2arrWUESXJVPLIWaSJmH4rpp5jP3YYVpyI8abgPsMPq6nSj6CqG+tUXAL/O+
         /TlbllGO+dwzTTl+b6Owy5+gmFoZbhgpIRlFU3N/1OeG6axZWqM4dcyk+swituy5N7
         9DBNH7YmEi5MBHRvMz9WpuIYQ/k6VkcTNPDU1UtBv+XSJisYTZHJpdAFHemZFOFcLL
         cFlKipcht0NlMPFPSj5XwFMfVJobyLlJcEJ5BkIvnFxoFgW7OV1QEWUnGB0JM1R5hl
         zh3uRgHJIpGhQ==
Received: by mail-ed1-f72.google.com with SMTP id n7-20020a05640205c700b0040b7be76147so6289342edx.10
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Feb 2022 08:51:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vDkDi7ORKLCJHUi4o/FHJpx5nP2VVbFUW40QeGRguEs=;
        b=byfDs9NHXQbTVYA4+jc6hljCInkCCwtR0VRSl/NMc8n0ObZGnycLgXO36uuyYWzPn2
         kY2lQq0uGjyA3fGAJK4XSJ4XF9oComeNGdxcLBUqpVgP17OR4mi56RZrsPgfPXZnhQPX
         uDnQM2h1d+ka/t/2ZIFu1PQmY5AvoNBR8p15+QTSx/pyQgWaDGfaxsYLDKkU0njLnUbR
         EV2N+pW4d6BOfP+UCOXt7eS0Ba7ztOc+b5MJiTQvo0mYjr/dPGLB7Ecb50jsOzwXTiw7
         DIM/kjxr0tyLBKo7g0cxExp1WKm1D3708bOBB0itcig4N5pO1D55ICUmZbiZscW6euux
         MtZA==
X-Gm-Message-State: AOAM5301VWhYPAdnhWRUIss5fm6emqDIOTpqMmcZOPohyuU6Tccb1XsQ
        VzRp3FdwHtKiSeYQKFy7Zn94wRf2o2WxW+2pkqBFbY9oeyNV1XbDj6Vaqe2TPFZp5Fp//giP8C/
        P3sqYj+tE+q+PSMQzhism6asUjn3/o7POYljqZTm2C/e1srnD
X-Received: by 2002:a17:907:90c8:: with SMTP id gk8mr4901389ejb.630.1644166296170;
        Sun, 06 Feb 2022 08:51:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztpeykM8mWuYU/AuQpbl+BXMDbStsCr1iU3wN9CBEBPBivhqpcB3izYNCJDGuPTy/NTaa2bw==
X-Received: by 2002:a17:907:90c8:: with SMTP id gk8mr4901371ejb.630.1644166295940;
        Sun, 06 Feb 2022 08:51:35 -0800 (PST)
Received: from [192.168.0.86] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id s14sm3878804edx.37.2022.02.06.08.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Feb 2022 08:51:35 -0800 (PST)
Message-ID: <b3c98aa3-751b-acc4-8e57-5566af27f922@canonical.com>
Date:   Sun, 6 Feb 2022 17:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 RESEND 21/24] drm/exynos/decon5433: add local path
 support
Content-Language: en-US
To:     Inki Dae <inki.dae@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>
Cc:     linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20190325071349.22600-1-a.hajda@samsung.com>
 <CGME20190325071401eucas1p10df709b256570f1aba9cbc4e875da1b3@eucas1p1.samsung.com>
 <20190325071349.22600-22-a.hajda@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20190325071349.22600-22-a.hajda@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25/03/2019 08:13, Andrzej Hajda wrote:
> GSCALERs in Exynos5433 have local path to DECON and DECON_TV.
> They can be used as extra planes with support for non-RGB formats and scaling.
> To enable it on DECON update_plane and disable_plane callback should
> be modified. Moreover DSD mux should be set accordingly, and finally
> atomic_check callback should be used to limit the number of active planes.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 80 +++++++++++++++----
>  drivers/gpu/drm/exynos/regs-decon5433.h       |  6 ++
>  2 files changed, 72 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ex
Hi guys!

I am working on DRM bindings conversion to DT schema format and I found
this set only partially applied. I merged the DTS patches ("dsd" clock),
but I think the driver and bindings were not picked up.

Nevertheless I am going to include the "dsd" clock in the new bindings,
so the DTS passes DT schema checks. Let me know if other approach
(revert of DTS change) should be taken.

Best regards,
Krzysztof
