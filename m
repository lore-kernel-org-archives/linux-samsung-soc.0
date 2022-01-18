Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FDCC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347801AbiARSMy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:12:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233793AbiARSMy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 13:12:54 -0500
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5670C061574
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 10:12:53 -0800 (PST)
Received: by mail-ua1-x92b.google.com with SMTP id m15so38400040uap.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 10:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1RQy1GPxyJOygdU8LSftSpYUEzrYqolvY3YbNsj+tk8=;
        b=wkgKDyNNhufcfMfSVn1M8P+RYjxU4dw9Fpc6jaHKwhGyg+uqdeI0NuuDC8tjfNXvAZ
         2lWO9Q9gB9nFOIbFez6V6AtTdsR/bEBos4Iybu/HMEBTDlCtHPt+Sp/i8xV5u9oLhK0g
         rwIuODdpe/FFk90XeZ/AnOnUAib+0tZz8xNPoRQq34Pve+jX5B6M2Ga8jlLASOuwUzGX
         OwFhmRc/m0LT/LO9qnAlwPj81uvSksN2ieADElhESn3nDSP/Awme6Xg8NJc5LfjCdoFj
         MtNuEGA94kDywpALPqOyKXpuDa5aZ8gDe5k7s/CyBWlp3TBg+HQdC0797ZkGD1weB/e2
         8pXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1RQy1GPxyJOygdU8LSftSpYUEzrYqolvY3YbNsj+tk8=;
        b=b8dlrMPspwwWHuVBBHEA2XvIyQ8rxqcDEqjuSfKD3QWUizDoejJrS8UZUqP0iRSxTM
         5abuxvNxElKE6rb6qs7yQ0yY8P3LWIx7b0xJBWFDMmohhFWJXti00ntT0j4n01VYELvk
         70f15/3PUyK27kjYCveg/OKzX9FdSZ/ly0Uigh/kNwKBXDBv9uF3MwlDZptZrndoDAot
         9YBvfMzgYPiAWubTTPFp28i6XbVw5KbBOfQ0k+njXF+UI/vof4ndmSrNIC7kkzG+Ey5B
         q3ybl1asu7O385PeWmyq2reNXAA6Lc3Dq1RZiSi1fIUTfwXVqlGrQAepex0TfPAMjERf
         YB3A==
X-Gm-Message-State: AOAM533j3dJnQerjebujftVp5I67DTaWrveWHDhU4x9dTs+9O6Rw6Afc
        TMxM+3mtyEsR+JiOsGU/sDzhCmMONecplNdcjnj39g==
X-Google-Smtp-Source: ABdhPJxAmR9Afk9RB57wvNNnGDS3cjPfHig05+jDSqhX28ABw+Zb8v1etaQvVKTtq+8YoVUNG5DjCOZ0Fg7IkMisxME=
X-Received: by 2002:ab0:5381:: with SMTP id k1mr10968965uaa.17.1642529573008;
 Tue, 18 Jan 2022 10:12:53 -0800 (PST)
MIME-Version: 1.0
References: <20220118110928.120640-1-linus.walleij@linaro.org>
 <20220118110928.120640-3-linus.walleij@linaro.org> <CAPLW+4kNbC2BNcC54evJL_9tYoY_S3hcski81KHUPughs3f0ag@mail.gmail.com>
 <Yebx+BwFfKaXchtU@sirena.org.uk>
In-Reply-To: <Yebx+BwFfKaXchtU@sirena.org.uk>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 18 Jan 2022 20:12:41 +0200
Message-ID: <CAPLW+4kvurCoQ5kbvJ=CtrK=XzF5972bEcc=1UEhuiDh9zoMCw@mail.gmail.com>
Subject: Re: [PATCH 3/3 v2] spi: s3c64xx: Convert to use GPIO descriptors
To:     Mark Brown <broonie@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 18 Jan 2022 at 18:59, Mark Brown <broonie@kernel.org> wrote:

[snip]

>
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.

Sure. Thanks for pointing that out. Just forgot to do so this time :)
