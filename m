Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4B1C433E6
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jan 2021 08:18:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF98A20754
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jan 2021 08:18:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbhA0IR4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jan 2021 03:17:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234691AbhA0IPa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jan 2021 03:15:30 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F97C0613D6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jan 2021 00:14:47 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id o10so1394258lfl.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jan 2021 00:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J2HCC4yhbbPsmLQ0n0dZus/7x+U8iB2qhIOWhoNSYcY=;
        b=NDMLH3T1eAaIFdZmrxDra9KWHUA2cmKRFDFoinAAIKxXiThkOFOB3RtQ7NrMe/+vh6
         aXTiM86/Mk4NPI91/uCV0v/RRWlxN8+o6z65+wPGyPuud9RXTandWAf0osnTyv8Cz2Js
         sKEunNG8VIohEpiWqUYxu0uxy8SUqg6G0d3T+bXCSu6bZ4u2lqlDEg/W8gOuhtvFrlku
         +Vlhwq11R5zmEkfG/TVLofGU/xK/C7pvLeJmaUp/Hs23p2/mXielZcCsMxKGOorQjbCI
         SeQ/J7TiztQxzh3KDxrF1T+GUq4wg9OHjxvL3Kx6jDaCz7nJ6cqkCmZwq+kExAEMGlzy
         SsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J2HCC4yhbbPsmLQ0n0dZus/7x+U8iB2qhIOWhoNSYcY=;
        b=mM+NEPnQwI8effJSNxgIHa/MvQ61qXAY/ibbCANcqOW9HxPdHJeKSPRpOb10NVIMmi
         BaSQAdoTYVKLd9yD8y5f7cWaVPUauRA9pSMJtXNPfYfYAmUN6nhDur2jFXNCyprK2F1e
         jjkuRnixeWBTeyJnswWSKD+Hoa2Dwq78uS2Em3g/iMksQpbpmqppSeYc6R2dgY9vizcK
         YZKfRLAfvdjpiNKRQjytRy2Ty96Mqz7cdsALLdOx/RGJDvf6FPy7Hw11Smknlq0BKq6T
         jCyNvvCE0qiEDo+Kx3px3TS41XBjHGKAbCRFMk0+fkkSyEvm4tAE/64L2SUiVhaXgoPa
         baOw==
X-Gm-Message-State: AOAM530HdkXpqTjtzsfbpW/j81fMlyq/dG6bYPDJN2Kp1zr6kIGCCyKh
        SW50zvWb3g1adpb/rU7657KjhwsHh+MDg8kuzmvEdA==
X-Google-Smtp-Source: ABdhPJyWf+xVImkqWvS5UA3di35EMJA9L0HYCcZ9G6wxZpbFK3IsJuXrlMmi7aAR7vcl5l4lMc+Xhmx7AFEk5FhpigY=
X-Received: by 2002:ac2:5c45:: with SMTP id s5mr4503390lfp.586.1611735285619;
 Wed, 27 Jan 2021 00:14:45 -0800 (PST)
MIME-Version: 1.0
References: <CGME20210127001644epcas2p13cbc984fecc3ac7700a422488b488135@epcas2p1.samsung.com>
 <20210127001631.91209-1-chanho61.park@samsung.com>
In-Reply-To: <20210127001631.91209-1-chanho61.park@samsung.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Jan 2021 09:14:34 +0100
Message-ID: <CACRpkdZhZP9uJ7Wm6vLQYCCZN3=g_Rfrbap9cmwUREPeuWFGUA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: use raw_spinlock for s3c64xx
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jan 27, 2021 at 1:16 AM Chanho Park <chanho61.park@samsung.com> wrote:

> This patch converts spin_[lock|unlock] functions of pin bank to
> raw_spinlock to support preempt-rt for pinctrl-s3c64xx. Below patch
> converted spinlock_t to raw_spinlock_t but it didn't convert the
> s3c64xx's spinlock.
>
> Fixes: 1f306ecbe0f6 ("pinctrl: samsung: use raw_spinlock for locking")
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

Fixed up the patch commit text a bit as indicated by
Krzysztof and applied so the tree compiles again.
Thanks for fixing!

Yours,
Linus Walleij
