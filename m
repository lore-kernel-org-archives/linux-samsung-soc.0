Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00DCC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 23 Jan 2021 22:35:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 720DA22CAF
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 23 Jan 2021 22:35:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbhAWWe6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 23 Jan 2021 17:34:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbhAWWe6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 23 Jan 2021 17:34:58 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BEC6C0613D6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Jan 2021 14:34:17 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id u11so10748745ljo.13
        for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Jan 2021 14:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FwLmBssihYQ3sM43xaxZMzI3mK5zHOf2/GNKEjEjQ3I=;
        b=J4IxoW32jijj81ByT036j1rgZzXNrYkLnY9ou/P+C7DZA6AC7cbOo0lmER+4o+o52t
         IIcbXDys7aGCwLOQjgD/UaK4NKMtiV2xLjrtGDHtx91NTGmj0611Y4psagih9f4xO1B9
         BwnAbVaEdzqqYeNC1C246GoMWs88Wy86VDZqZebM0Iz1gVvHhYImJAIXoZS1PEuJ/fES
         3m7gmVXTkE332Fbntr6t3tizzqMRAbBqk9DXPGIkgx/s2Dw0Ms1DMif04brnPm6leHxR
         +HH7qXoIFDiigggvcYcdow0y+CpSZ0HL/Sddcu6MrCtkCnxwjo0b4tw4KWji108HLlKK
         tv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FwLmBssihYQ3sM43xaxZMzI3mK5zHOf2/GNKEjEjQ3I=;
        b=t4pQWqQQtqT1Uh+aUzVAf0xQkI8+XdgjE7rJe8Un6EPG9oxWuF7h/fAGZ74DJTXnhG
         aKb7MmFNNwxgqI4tQjdNbnW76l2yqGeN7zHLFyQEfBAt8G2jXZwzDt8WuUtasYTaJe1a
         k9+8f/Wl7wCG1oTH5tMRsBP0vABX0msBGHTnLMmKs/fGWGBVN3f8rIVHcolpyvfg+muN
         ReR3sbdKHlZSn7Iz00Zw0RIDGV5PrOeOqAgal6VvOOXJiHGEObsG14saV20W9G5Ed8of
         Opb5ghYCNdIT1mSImYHPEKnCYZi5ORZUWECgn7n+UnweLpflPbDDjThhEQ5swwWpjlLb
         +u4Q==
X-Gm-Message-State: AOAM532TqkXBn+G3T0Vzt4nUF3Bpx8tT5dGcrMZ7hxsXMptRk2XWKDX2
        STe21Rbu+p+63MuXfXjKuHMiyCVBgJQkQk8AmQv2Dg==
X-Google-Smtp-Source: ABdhPJyuQvbjRKHMK2HtlyghHFKLDIS5oNQ65PxEf25qUJaEc+JVkFmKTrxFlP2NYQHG38EuMhU2FEdVcDA2Wxm0J4k=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr7975ljl.467.1611441255771;
 Sat, 23 Jan 2021 14:34:15 -0800 (PST)
MIME-Version: 1.0
References: <CGME20210121030006epcas2p40fd4e30ae5bf514b7891a464462db7be@epcas2p4.samsung.com>
 <20210121030009.25673-1-chanho61.park@samsung.com>
In-Reply-To: <20210121030009.25673-1-chanho61.park@samsung.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 23 Jan 2021 23:34:05 +0100
Message-ID: <CACRpkdYJHf7z+E2DeQb1TmmQnh0jysCjw+Vs=518GnYOqLH2_A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: use raw_spinlock for locking
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Jan 21, 2021 at 4:00 AM Chanho Park <chanho61.park@samsung.com> wrote:

> This patch converts spin_[lock|unlock] functions of pin bank to
> raw_spinlock to support preempt-rt. This can avoid BUG() assertion when
> irqchip callbacks are triggerred. Spinlocks can be converted rt_mutex
> which is preemptible when we apply preempt-rt patches.
>
> According to "Documentation/driver-api/gpio/driver.rst",
>
> "Realtime considerations: a realtime compliant GPIO driver should not
> use spinlock_t or any sleepable APIs (like PM runtime) as part of its
> irqchip implementation.
>
> - spinlock_t should be replaced with raw_spinlock_t.[1]
> "
>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

Patch applied!

Yours,
Linus Walleij
