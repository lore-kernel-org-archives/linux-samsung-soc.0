Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6BBC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jan 2022 10:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349077AbiASKVI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jan 2022 05:21:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345816AbiASKVI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 05:21:08 -0500
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0162DC06161C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 02:21:08 -0800 (PST)
Received: by mail-ua1-x92f.google.com with SMTP id w21so3573404uan.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 02:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dAq2GHUlmK9e0a4SGMbGLyaITkdBnfKqtBK3aX9Whcs=;
        b=I3rVfJXq2NVP8dqgHqcFAirDhg+hPcQzCZyxN7SHayOy8ckvDF8N/62MjRBrz97aL6
         Ma1/dYJOnkrehrJSWMtXeUYFGQ5PXpI7I8uUcmUiC/9LAMUUmfRai2gTWUyFVuLR3VHx
         a6NSw9WXkWKtzZYzoTE6AepIt6tmP65aNdHVIQTV62u7fFtym2M5S3YzTh44U3kiwMnC
         MrL9J1Bx9i6M5Oq6mp6L1yXg670xBL68ndzH0SUJ6xZQlgN+WLIA+Ru7tAA77VJYXFlA
         mi+bhPhD9B20PX56nw5u7eZK6HKMD4hKDlrmm2x7SMzNihwk/ATFEYQi10eBrx4v6Nol
         ZjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dAq2GHUlmK9e0a4SGMbGLyaITkdBnfKqtBK3aX9Whcs=;
        b=6R/wXIMid2/0OEV97hqQ3Of+jQs6pYYoJlANZCRHMGf3xs+OP4wCtQsHNVXUOlaE9Q
         lHL+tNCXRwSIUubBY5eo/9jZ0lachifXyYElcdKfQ/8hElLATI6hvsx9C6TpuOHVPOxi
         4StLv/BKyF2sY46fUruew308C7URNMFSDdihKMuJG/G/MVv0lezF1sK07OjGk/9whKww
         ZHkdsGci5XsICDA3/RDRJEPDLk9GWL00VUKfpDgczHB/JtqO4bpbh+LEeFB20jZR3Q6g
         l/48ngBwslkjDiWXOIRWWOgeQgjNcMoNC8VvatImiFIFIpfwNMEU35rLQvUVYqj/j0cD
         sCLg==
X-Gm-Message-State: AOAM533GGr8Pt6EEsAXDNTmU0nn1+a+JvxMn6BVyr8GjJdxJ5MR6adGk
        56FWgfs8I51+ZBodD24cU2cMtRrGqdNQxaIn1+lKIQ==
X-Google-Smtp-Source: ABdhPJzWMPXB35VP2FzS7xpvvyuejvxAZ6PKtDb7KxZe1WiMf/xocc++NtG2JakFJuMWZLXpMzBwXBKfixe+m4QmKXk=
X-Received: by 2002:a67:e109:: with SMTP id d9mr10945818vsl.57.1642587667172;
 Wed, 19 Jan 2022 02:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20220118230915.157797-1-linus.walleij@linaro.org> <20220118230915.157797-2-linus.walleij@linaro.org>
In-Reply-To: <20220118230915.157797-2-linus.walleij@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 19 Jan 2022 12:20:56 +0200
Message-ID: <CAPLW+4=7aqcA=n6Hb8Fd+hoWSSzZSeMGDUkA_ceBmesC4ndJTA@mail.gmail.com>
Subject: Re: [PATCH 2/3 v3] spi: s3c64xx: Drop custom gpio setup argument
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 19 Jan 2022 at 01:11, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The SPI0 platform population function was taking a custom
> gpio setup callback but the only user pass NULL as
> argument so drop this argument.
>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - No changes
> ChangeLog v1->v2:
> - Split out to separate patch
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
