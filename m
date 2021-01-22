Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678DEC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Jan 2021 13:23:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3892E239D1
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Jan 2021 13:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbhAVNWk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 22 Jan 2021 08:22:40 -0500
Received: from mail-wm1-f51.google.com ([209.85.128.51]:53341 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbhAVNW0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 08:22:26 -0500
Received: by mail-wm1-f51.google.com with SMTP id j18so4296964wmi.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Jan 2021 05:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e94xpvHI68qewB3epNIKMs2mX0bh71LFJru0+VzFv6E=;
        b=uJ/g5867KzO09Obpprkl1SNTrzbLsROhtwXCtYRE4nNcoxcbttlhtWKrN71RHV+qy9
         Emdu4scmYQYXUAzxVFRxV+p1l7UZ5mcWs5kKKAxc+lDIgr8OOPCxuAKhNo9DGLlDfYXa
         HlGNEKlsKRcnkgF29vrH8VlyWU3bpzSkajAYWOpHtRupKWS12AOHR6lAUuXUWSBWdd8N
         Ppbo4jlfVvGjW2tqLaDxsoX2/nhP19p3iuJIie5gdEqCaXlI7xhY07Oodzqkqb/UY093
         d5c28iPAg71CAOzzjLCVDTOT3ep6nQItpnvIyDGFVUjxgC1XZQq0zecLjHXikH6Uj8Z1
         qdQw==
X-Gm-Message-State: AOAM533vFZ3uMBWnzJ6VYteha6XkdTXHd45Vj0gwL/Fu9fyprFGjcghk
        jqn47S+qKfK9oLHUzpG3ds/QRbQ3xtY=
X-Google-Smtp-Source: ABdhPJz3G+usrphZflUrpzU6OpgfYcInlZR8VWtTfm5wlnDAslStKxKPVKblJ437icGx1f5iTgLXLQ==
X-Received: by 2002:a05:600c:214d:: with SMTP id v13mr4021568wml.186.1611321702432;
        Fri, 22 Jan 2021 05:21:42 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id l1sm4981111wrp.40.2021.01.22.05.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 05:21:41 -0800 (PST)
Date:   Fri, 22 Jan 2021 14:21:39 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Chanho Park <chanho61.park@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: samsung: use raw_spinlock for locking
Message-ID: <20210122132139.cowdrtjhdoicdsvv@kozik-lap>
References: <CGME20210121030006epcas2p40fd4e30ae5bf514b7891a464462db7be@epcas2p4.samsung.com>
 <20210121030009.25673-1-chanho61.park@samsung.com>
 <CACRpkdZ26sNR+oZy_f6JR4ZuNWS9PoVAm-OuNwgzCAuhEBGTeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACRpkdZ26sNR+oZy_f6JR4ZuNWS9PoVAm-OuNwgzCAuhEBGTeQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jan 22, 2021 at 02:15:18PM +0100, Linus Walleij wrote:
> On Thu, Jan 21, 2021 at 4:00 AM Chanho Park <chanho61.park@samsung.com> wrote:
> 
> > This patch converts spin_[lock|unlock] functions of pin bank to
> > raw_spinlock to support preempt-rt. This can avoid BUG() assertion when
> > irqchip callbacks are triggerred. Spinlocks can be converted rt_mutex
> > which is preemptible when we apply preempt-rt patches.
> >
> > According to "Documentation/driver-api/gpio/driver.rst",
> >
> > "Realtime considerations: a realtime compliant GPIO driver should not
> > use spinlock_t or any sleepable APIs (like PM runtime) as part of its
> > irqchip implementation.
> >
> > - spinlock_t should be replaced with raw_spinlock_t.[1]
> > "
> >
> > Cc: Tomasz Figa <tomasz.figa@gmail.com>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> 
> Looks correct to me.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Krzysztof, will you collect Samsung patches for this merge window or
> shall I apply it directly?

I don't have anything in the queue so far and I don't see any patches
incomming, so maybe take it directly?

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
