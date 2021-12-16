Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC00C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Dec 2021 07:38:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232217AbhLPHiM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Dec 2021 02:38:12 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:46188
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232210AbhLPHiL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 02:38:11 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 431123FFDB
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 07:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639640290;
        bh=6XFRqSMdUPXz3BmHUNLepdt3XO5NwJG7CC0ys/8y//o=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Q6n/XffI9GFexDoBBuIHjyJCJPAtuZ8aJ7aRq0Bfscn2WyrQkEXuSt21OhuvXHJGh
         pUdvCUFX2YC9DengqW7p6d/Vv4SFlRZhyY051EAgmdR8E5txj+esF8Ob4gneaI61+A
         8DYp8feAVfO+R8tmymefQCnC94kvDrOGn+mmnpuLngPvB029pAA121otJdLOiZn61j
         QjxybgRe9qg9okN0NR6kowgLj0HuMu2UzPVlKA5mb9UQL2eGGcJePAl9k30aSWZ7EI
         ouRbd8/1Ce+LcGGnvfxtXPgrx4mn9hfbzmOWOFBsEauLsnAsmq1CAWR+vaHPNty7ZO
         +O5Zi/GrjPuYA==
Received: by mail-lf1-f69.google.com with SMTP id bq6-20020a056512150600b0041bf41f5437so10274152lfb.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Dec 2021 23:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6XFRqSMdUPXz3BmHUNLepdt3XO5NwJG7CC0ys/8y//o=;
        b=VrGYGCibbDbAdOgt/wJRV6QSLUpsKR5w/cVokRUk3QF3J1iWsj6Dg+eHu5ph8ypoWG
         ZC89GiLH3Qp+loXS3/JFTeUGe7ARkbvb358gHWxs+XjkGZHvze6K5TPbwudVhslXnNNh
         PjBYFw2TCDWAHEOd3CuX5dXMccUJviNwJ05AOwEyag9Ph3M5Ih9x1pb7SuhPm9SeGiMZ
         RAcvhUD3pEldTvF+2IUS4KTi6OsnU0p/Cq3P4A91XHMLNyZx6WNrjId0OriBun427CAo
         kFufa7c25IAKDYr4ZBbBtvbd+yvvsR2wAgYcnscLj451nA9ElxH7anO4vebfhUfGeiF2
         YJxA==
X-Gm-Message-State: AOAM533xPZ/rMrlXfNQVAZFsLLTm0Zpi5QcJw0xu6K3nIJiugxRCkFkW
        zZRA2AC0CuSurF2DVG6OigAxxaE7bTHhfWf94r892kbS0IaIyV3biNH2wXgCzY16RI2iN1t4Yom
        e58RAwevPEDwXBc31Fr+8O4oAD5kfM4xulu/CDZToDAqtSByR
X-Received: by 2002:a05:6512:340c:: with SMTP id i12mr1545526lfr.442.1639640289600;
        Wed, 15 Dec 2021 23:38:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6D4M3milSj9T6RMMugHsSByLIVmvgCptY8KQLkssmSHA/cG6m1PV3kpo4dpmAQxiZhglncA==
X-Received: by 2002:a05:6512:340c:: with SMTP id i12mr1545502lfr.442.1639640289312;
        Wed, 15 Dec 2021 23:38:09 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s10sm955828ljd.75.2021.12.15.23.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 23:38:08 -0800 (PST)
Message-ID: <b432dfba-2388-5a22-d319-e03ddbdf1a47@canonical.com>
Date:   Thu, 16 Dec 2021 08:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] usb: ohci-s3c2410: Use platform_get_irq() to get the
 interrupt
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211215225358.1993774-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211215225358.1993774-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 15/12/2021 23:53, Rob Herring wrote:
> Accessing platform device resources directly has long been deprecated for
> DT as IRQ resources may not be available at device creation time. Drivers
> relying on the static IRQ resources is blocking removing the static setup
> from the DT core code.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/usb/host/ohci-s3c2410.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
