Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A369C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Feb 2021 13:06:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED21364E7E
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Feb 2021 13:06:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhBHNG1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Feb 2021 08:06:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:53880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229637AbhBHNG0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 08:06:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D55964E87;
        Mon,  8 Feb 2021 13:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612789545;
        bh=n2isI83IkIAKm3kI0g0ECHwrDnwL6N3NRCask2v11K4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tXnPlTunpFwu92+fPzbML8iTK5bFD47r16JYOL15YDq8sUvWgYSWCYcog0bcY6osU
         xh+lzTTdf2dw06caWv1MO6c7XzUQPhI+NCh7ghzDWUQf6xcS8dhhrco7GjR7I34rmJ
         AAk9CI3OMOEn6Zj6FjRfSEt9lA8PTIdfLFjar5HRx9sysZXAL4ErUAR5aqsPFOYObq
         j80ngkwleGb9hiojaxB8NTYqF8n7QxPtWBTwhJ/lB5lNT4F/Ku1Ckf4BKdGuZKcJ28
         xE5qRkCgxdLD2MZsM8eBJ2tGU/FJ3PdOZEDi+ETdJ+hGgglVpfQJhVh1xacyv5JQ+p
         ra0oJKj0Bi0Hg==
Received: by mail-ed1-f48.google.com with SMTP id y8so17967014ede.6;
        Mon, 08 Feb 2021 05:05:45 -0800 (PST)
X-Gm-Message-State: AOAM530uUifeRgy2R8rKXYjlA4n+oz6qozRRtc5BIjNxAqp3bzBLFxii
        Sast/sGY6CBG659a2Z6hK47fnFIaHWEksJcT2yo=
X-Google-Smtp-Source: ABdhPJy3MugBCN3vcLgylnGQXqUOP8EwHKtj6Zh2dKo2/+J+UzdE0VRMpo4trg91VeezDp2qc7vylA2ODRRIJwGyK5o=
X-Received: by 2002:a05:6402:d05:: with SMTP id eb5mr16789013edb.143.1612789543824;
 Mon, 08 Feb 2021 05:05:43 -0800 (PST)
MIME-Version: 1.0
References: <CGME20210208114447epcas2p3507f22a555355ac7710c5ca220853e0e@epcas2p3.samsung.com>
 <20210208114538.134766-1-taehyun.cho@samsung.com>
In-Reply-To: <20210208114538.134766-1-taehyun.cho@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Mon, 8 Feb 2021 14:05:31 +0100
X-Gmail-Original-Message-ID: <CAJKOXPeeopnjvdbNb=QA-wS+jcrAzgpouV2DFWe+ydGFE2J68A@mail.gmail.com>
Message-ID: <CAJKOXPeeopnjvdbNb=QA-wS+jcrAzgpouV2DFWe+ydGFE2J68A@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: make USB_DWC3_EXYNOS independent
To:     taehyun cho <taehyun.cho@samsung.com>
Cc:     balbi@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 8 Feb 2021 at 12:51, taehyun cho <taehyun.cho@samsung.com> wrote:
>
> 'ARCH_EXYNOS' is no more used. 'USB_DWC3_EXYNOS' is glue layer

As a maintainer of Samsung Exynos SoC, I am very surprised to hear
that ARCH_EXYNOS is not used anymore... Quite contrary, in my opinion
it is still used. You need to rephrase this sentence, because it's not
possible to understand in current form.

> which can be used with Synopsys DWC3 controller on Exynos SoCs.
> 'USB_DWC3_EXYNOS' can be used from Exynos5 to Exynos9.

Please provide here the answer to "why you want to remove
ARCH_EXYNOS". Quite precise answer, please.

In future, please Cc lists and people responsible for this drivers:
scripts/get_maintainer.pl -f drivers/usb/dwc3/dwc3-exynos.c

Best regards,
Krzysztof
