Return-Path: <SRS0=odV2=C7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC54C4727D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 13:35:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E5F0207C3
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600781717;
	bh=i0ZUZREiMdXBuJ+z4xfp3hhisFybJQZNSfeIF8nAod0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=suqJHGrbB6cJizYH8htup9jOgDZ2ZiQswZtmukAQv9Cbf0X9w2cksCsr6qowx1tQt
	 YiUk5tY+vjY7fziD+i34osioI7j6N3vywY//pBeABpr5HsbMutNidoBoN+AXpjZIxY
	 iH322ORPCshK46YA7a6z75TXT7lDwLbk/Z3wkZF4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgIVNfQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Sep 2020 09:35:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:40396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726625AbgIVNfQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 09:35:16 -0400
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C5FE207C3;
        Tue, 22 Sep 2020 13:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600781715;
        bh=i0ZUZREiMdXBuJ+z4xfp3hhisFybJQZNSfeIF8nAod0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C5WVplK2VVUddTDC+42s4bNUAT+7m4vvBcBHhPx9N0az2QNrIwVsLSAjeogVvtRsn
         MNvyRDVYzv0SGurLt+8utmzbEtwojFX4rsFiBP6XDRIbgckWz+JD2VvXGBSF5oJOH3
         Mhww+e0hbR5fAtVkXRVbjVp/uPSmhzP6QtHmZdvc=
Received: by mail-ed1-f47.google.com with SMTP id w1so16221593edr.3;
        Tue, 22 Sep 2020 06:35:15 -0700 (PDT)
X-Gm-Message-State: AOAM533RcdrRwM7oNfG+IXEKNcUwdfSdMbor5JmAm7e7PTHqwDSk+wOZ
        tGChLMBjqLwAtqRo+xUyIDD7BaDKmuktv/kWEKw=
X-Google-Smtp-Source: ABdhPJxoHMVfeZgYEO1XR2hAFKDJHOs5bMt++96sYaNHxH0T5g8ziznRstfPLWT6hSbRToymYXip0gn5LB2OHCoXR3U=
X-Received: by 2002:a50:ab1d:: with SMTP id s29mr4056132edc.246.1600781714252;
 Tue, 22 Sep 2020 06:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200922124053eucas1p200d7381abf1d14e932f41ebc0f458c64@eucas1p2.samsung.com>
 <20200922124046.10496-1-m.szyprowski@samsung.com>
In-Reply-To: <20200922124046.10496-1-m.szyprowski@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 22 Sep 2020 15:35:02 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcp+WA-sVLxMm7Oj1aw6p_fUvF_Sq_2ZPi3-qEAPWMWgA@mail.gmail.com>
Message-ID: <CAJKOXPcp+WA-sVLxMm7Oj1aw6p_fUvF_Sq_2ZPi3-qEAPWMWgA@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos4: mark 'chipid' clock as CLK_IGNORE_UNUSED
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-clk@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 22 Sep 2020 at 14:40, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> The ChipID IO region has it's own clock, which is being disabled while
> scanning for unused clocks. It turned out that some CPU hotplug, CPU idle
> or even SOC firmware code depends on the reads from that area. Fix the
> mysterious hang caused by entering deep CPU idle state by ignoring the
> 'chipid' clock during unused clocks scan, as there are no direct clients
> for it which will keep it enabled.
>
> Fixes: e062b571777f ("clk: exynos4: register clocks using common clock framework")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
