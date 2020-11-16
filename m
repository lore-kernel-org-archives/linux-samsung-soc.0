Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9405C4742C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 16:32:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2317221F8
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 16:32:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731167AbgKPQce convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 Nov 2020 11:32:34 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38267 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730830AbgKPQce (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 11:32:34 -0500
Received: by mail-wm1-f67.google.com with SMTP id m125so12899038wmm.3;
        Mon, 16 Nov 2020 08:32:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=L/Kiv/hvmGXAFXybNuDo0hZoh70H5Wyb3qtrSsFGdpc=;
        b=K23SbrVQ7c2ppHJjMyUAMKkSrCCCtyKeDjs9ij5UJqa5fWH3cyrj+DJLObhVKJvIYT
         Bqq83Qmpj0BQc9IcXfLMknmSC8q+ZHBUAidi4+ttYuT7JFASR4u5f+FVLMqz9mfmmdDo
         LyKcMbPKbwI7aDZIPddlD9ToxeRtibE1p+s+8Hg9DHhh2/YRW9aFOS9uZwhrLlTspomG
         oOxjk8tb/D627veayenfzP/VWpxxb307SWO7hvamQke1QSFAEJFwnRFeTeKkWjkE0/Lm
         MwIGhxsuml5E0UVSVJSDx+O1m0mvtzzCaVLH2TbXrXrouwRydsasFkXCvnT7jJFR5acu
         CWkQ==
X-Gm-Message-State: AOAM533fvDSXqNHIy4XmWxt4vQQHqq7G/Lzcf/jqBVlObVpDMzTQIyaZ
        DiqH1iDVUC1L0PKa0omOZ00=
X-Google-Smtp-Source: ABdhPJyPwe7Nsm/oHNWd/mih6yAzX2BY06dUwzNl8Nh10T5DW8XrObYlgkr6cZMz+jhRSwom/m57/A==
X-Received: by 2002:a05:600c:2949:: with SMTP id n9mr15978431wmd.29.1605544352436;
        Mon, 16 Nov 2020 08:32:32 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id c4sm2924898wrd.30.2020.11.16.08.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 08:32:30 -0800 (PST)
Date:   Mon, 16 Nov 2020 17:32:29 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martin =?utf-8?Q?J=C3=BCcker?= <martin.juecker@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/5] ARM: exynos: extend cpuidle support to p4note
 boards
Message-ID: <20201116163229.GG25108@kozik-lap>
References: <20201113212525.13455-1-martin.juecker@gmail.com>
 <20201113212525.13455-6-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201113212525.13455-6-martin.juecker@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 13, 2020 at 10:25:26PM +0100, Martin Jücker wrote:
> The p4note family supports cpuidle, so allow it to make use of this
> feature.
> 
> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> ---
>  arch/arm/mach-exynos/exynos.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, applied.

Best regards,
Krzysztof

