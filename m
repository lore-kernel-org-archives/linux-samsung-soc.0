Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78494C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 14 Jan 2022 14:43:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239236AbiANOnL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 14 Jan 2022 09:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239052AbiANOnK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jan 2022 09:43:10 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C01CC061574
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 06:43:10 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id p37so17257909uae.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 06:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BKVVB8JIlocbVFmK09oDWPuTbXu5kJBUcFIgQYk7NB4=;
        b=DNmy4vL9ZxNkKIjHu0CMvG5d3Y1lAkzWqiMUH6negL8tRjVcJ033fVuSnRmTioB7aM
         SPBbU6EeCAQLRwsr9xL3h9kf+shYNIh1BRWxzwDMGz69+2oTovwwSdWyrHAZLRcLZsIB
         Ti6P6Ix47Yg+Q2V5MYGUg5Mxc8lZPFTawjKVlWxCNMJ3A9pxdq9kW/OE6eI0eGVX0C1O
         q9YpoQYo04ZI6MHE3mOZtbbOxmxyuuQtAunh5gUaYPNWmNs0n6PXLMsqaf6jg7Yqnsaf
         QVf8z/ZffE5sjc4fxSJDsO3vxg9XcVBM/TcjbaI4b87MXw0Zyk3YS4+DTDPE0gUd1AsG
         Wx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BKVVB8JIlocbVFmK09oDWPuTbXu5kJBUcFIgQYk7NB4=;
        b=yzmHiv4nhh3VSs3JStkd+C3eHSoocM5KzluQ2ojQXjPn9ond1LUN3OR8dJ7kjESMoD
         tKIrRDzwQ/U5VyCFDUdNz+q54Ji2HkzxZXrueWRnOWqY42qwXNXuqpGEKCr75YLNjCsu
         1vVIQfpjC4XB+u9lre5Vjbn8UYv5jM2zXOOrBNZd9Z4n87YkuuPEezwGvvWt3u/eyrmI
         GeaXLAaJG1yycpDLWLWPwfrDzy/yHFOyIPglQNCyp6wAi2gTTh2l35JLXw6mt6ethBJh
         07UZI2jGbOXeYiRSXXX7NNk7JKmwXImUVeyN04kwntEh70nbB98FJWyTX0YG74nnqWxG
         ZgjA==
X-Gm-Message-State: AOAM532B+FmhsLRirdrlOX5VA529AsMesEVyRA7sDhMx1oXXVrs0Owdp
        8KDRa6quMCgA3O/XAFSd8sTSqNWl8S5DhmqujAzl3Q==
X-Google-Smtp-Source: ABdhPJy3UfXo75HrUbmmGMx6xMJlgE2A1jhGzlWHnbhBxdRVcOPli0ITmkG8XP+4udOxFE7x2G0YHTt84/Fl1CVjaRI=
X-Received: by 2002:ab0:5381:: with SMTP id k1mr4487595uaa.17.1642171389544;
 Fri, 14 Jan 2022 06:43:09 -0800 (PST)
MIME-Version: 1.0
References: <CGME20220113203800epcas2p193b3961d55da5296cf7dd5fffacb87c0@epcas2p1.samsung.com>
 <20220113203754.23197-1-semen.protsenko@linaro.org> <016301d80923$bc172b50$344581f0$@samsung.com>
In-Reply-To: <016301d80923$bc172b50$344581f0$@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 14 Jan 2022 16:42:57 +0200
Message-ID: <CAPLW+4=gtkbBUO8QXXgjpq6_-ptVAnmej6yfyh3BM2ybvqLoXA@mail.gmail.com>
Subject: Re: [PATCH] soc: samsung: Fix typo in CONFIG_EXYNOS_USI description
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 14 Jan 2022 at 10:50, Chanho Park <chanho61.park@samsung.com> wrote:
>
> > -----Original Message-----
> > From: Sam Protsenko <semen.protsenko@linaro.org>
> > Sent: Friday, January 14, 2022 5:38 AM
> > To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> > soc@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: [PATCH] soc: samsung: Fix typo in CONFIG_EXYNOS_USI description
> >
> > The proper name is Exynos Auto V9, not V0. It was the typo slipped in
> > unnoticed, fix it.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>
> Required "Fixes:" tag? Otherwise, LGTM.
>

Right, will add that in v2. Thanks!

> Reviewed-by: Chanho Park <chanho61.park@samsung.com>
>
