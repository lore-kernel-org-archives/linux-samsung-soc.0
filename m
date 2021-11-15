Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F297C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:44:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27EAE61B01
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:44:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbhKONrF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Nov 2021 08:47:05 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48586
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236510AbhKONo5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 08:44:57 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 662C53F1A9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 13:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636983707;
        bh=/crzo/v4ld5BEDfJ8Uo+M835ZXZd3qKocB73IxuyYag=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Dz/MQU5MNlLrX8UXIAysv2DogSYKfR0WLcWJJxFsjRANIgd9HmomBx3E8UxKyScOF
         zk7olao5IVAgmtFuYMRPD/vwz3+NJMV2Rjz0Bk2RkrEGjCyv/s911I2VNY0hgUFwwE
         +MZMWEjICj/qzaee/32fzLNOFEIQeFfu6oK4SUF6TKbqDC7ze8C9GXBBabYJFyDuyd
         nM1WIBbs0Ra+w1wbb01FarNhzaIWLZfSWZiVVSnDZnMoV4MJsK9hKkHkZhMojIod4a
         PcX77wLOh1qR+UDBvI9GZlDRT5djISECrVYqHSTTkRel7XVlR3mDlSwoushoAcRJ7O
         tHKJlXkYHA4qg==
Received: by mail-lj1-f197.google.com with SMTP id z18-20020a2e8e92000000b00218e583aff1so4949511ljk.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 05:41:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/crzo/v4ld5BEDfJ8Uo+M835ZXZd3qKocB73IxuyYag=;
        b=7m7IhrAVPmfhEZpEukIHRD9yLMvX/peGyJjYg73Ral/nQhH4+dapf9OqrUxbZo4/+J
         gcJI5HwwZYCFxvuE6zm9oN1Wr/CCrramnwwEJwHIG+9rzFCjmgkxu3xKwYBuwIc+Xji7
         GbANSURtHN+ICwpiarSbPLOC9wlEQlVI0kQEKfXkfeeoTXz3TzAF0FwzJvQ0m1FIn3ZC
         5Ma29BzkANyHCJNoXrNE3kdv5xOCTGVbHJWcFhvUD9dpOxazHezlq/bDjb7TMNwkbfu+
         w7LOoUvx7kwFrCW+mkWAvb9zlcwygTKul8sI4vt0FEGC0ldOU1krFvIiWNlsrx56sMzT
         DU4Q==
X-Gm-Message-State: AOAM533MpAvKLzrHew/3ZOBWV/4nwGfok0Yjpv0O9EzgZMopsLi8P3rR
        3ci+TjYGm8R5SG1W8mSJQ3Q8rGQ+NNz08mnSzIecwLnYqd+uCmu9y09WJXjMHslGLkUasSVumEC
        GiYzeycE21DS/WD+6MRsiYbTp39tyhmrThKHDzvzhw1uGlS+Y
X-Received: by 2002:a05:6512:3da9:: with SMTP id k41mr32512244lfv.563.1636983706524;
        Mon, 15 Nov 2021 05:41:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRQMDstg8dLIIEjdGyEDf7+Sl/Yt+pOKzoyRmGgG1oEXkeCKyoa+57U0GH175XKG1BSyoNcg==
X-Received: by 2002:a05:6512:3da9:: with SMTP id k41mr32512230lfv.563.1636983706338;
        Mon, 15 Nov 2021 05:41:46 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id z2sm1427005lfu.94.2021.11.15.05.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 05:41:46 -0800 (PST)
Message-ID: <a7b50036-732d-53cf-4b8c-84c7c760b9fc@canonical.com>
Date:   Mon, 15 Nov 2021 14:41:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2] samsung: exynos-chipid: add Exynos7885 SoC support
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211101004853.55810-1-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211101004853.55810-1-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/11/2021 01:48, David Virag wrote:
> Exynos 7885 has product id "0xE7885000". Add this id to the ids with
> the name.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>   - Removed correction for weird revision bit based on vendor kernel
>   - Rebased on top of
>     https://lore.kernel.org/linux-samsung-soc/20211031205212.59505-1-krzysztof.kozlowski@canonical.com/T/#u
>     Apply it on top of that patch.
> 
>  drivers/soc/samsung/exynos-chipid.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> index baf3afc69d79..2746d05936d3 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -57,6 +57,7 @@ static const struct exynos_soc_id {
>  	{ "EXYNOS5800", 0xE5422000 },
>  	{ "EXYNOS7420", 0xE7420000 },
>  	/* Compatible with: samsung,exynos850-chipid */
> +	{ "EXYNOS7885", 0xE7885000 },
>  	{ "EXYNOS850", 0xE3830000 },
>  	{ "EXYNOSAUTOV9", 0xAAA80000 },
>  };
> 
Applied with fixed title. Please use prefix matching history (git log
--oneline).

Best regards,
Krzysztof
