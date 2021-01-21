Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631C3C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Jan 2021 15:56:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2103C22C9F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Jan 2021 15:56:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730552AbhAUP4J (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Jan 2021 10:56:09 -0500
Received: from mail-ed1-f41.google.com ([209.85.208.41]:46784 "EHLO
        mail-ed1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730017AbhAUPzy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 10:55:54 -0500
Received: by mail-ed1-f41.google.com with SMTP id dj23so3023122edb.13;
        Thu, 21 Jan 2021 07:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7cfwWzcxKAkrfbqLS31dTG25iiqLlFnIt2NCXBcjsGU=;
        b=UqzBqawGGkZ3vHFAqpmHqr66KLks2t+mDlUfhCCnoueTB8IlyvQPPB4mnHCKB4gXWR
         2dPt6O3KUqiRn4u5ZeQQTyHjuBxQqOIFhHYI73QWWU1U2nozia1NVfSo3R43X+o9+skq
         w1e9rVxdeoVlgplOGyRcCNwa7k6OVncqPzfckQV+JSrBfli4NqAZ9U3RQZVe58GwFA3B
         KjrblOSLIHv//aa7BOBZWB2Xi8cew1SRUttEf1Awn2jR0+l8Q32kBT7Lx3DchD7kkb/1
         dvLok6GlKRaKpM7jHqFMI0Mm0BkWK6fvhHYDbrXSx1hq7q2/XfynhPAnguuFEo/hDUNd
         A+Aw==
X-Gm-Message-State: AOAM5324IFVCoiuUynxdrosqmgtayTM0SFs6/JQa++dnxDfGD25y7Bmf
        6FHEWnNyI0RVxPSXehrMQDw=
X-Google-Smtp-Source: ABdhPJzL+2yPmE8VsTyymmmEUJBAhrdYSaEoS1rKwWL41e3WgjNz9TZAQhzjQ13fQMTCu5+1phJd4A==
X-Received: by 2002:a05:6402:94f:: with SMTP id h15mr8442507edz.106.1611244491261;
        Thu, 21 Jan 2021 07:54:51 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id k2sm2411216ejp.6.2021.01.21.07.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 07:54:49 -0800 (PST)
Date:   Thu, 21 Jan 2021 16:54:47 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Pan Bian <bianpan2016@163.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: s5m8767: Fix reference count leak
Message-ID: <20210121155447.m75vmrxllotlmc2w@kozik-lap>
References: <20210121032756.49501-1-bianpan2016@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210121032756.49501-1-bianpan2016@163.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jan 20, 2021 at 07:27:56PM -0800, Pan Bian wrote:
> Call of_node_put() to drop references of regulators_np and reg_np before
> returning error code.
> 
> Fixes: 9ae5cc75ceaa ("regulator: s5m8767: Pass descriptor instead of GPIO number")
> Signed-off-by: Pan Bian <bianpan2016@163.com>
> ---
>  drivers/regulator/s5m8767.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
