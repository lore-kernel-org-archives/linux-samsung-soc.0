Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65CEC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 08:44:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E4AF61BF9
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 08:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhKOIrD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Nov 2021 03:47:03 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36118
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230151AbhKOIq3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 03:46:29 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5B9FE3F1A8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 08:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636965808;
        bh=0oqdKTEInfxFxK9xa4c8vwLVD6X93UYR6ISSifrJI1s=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=qwOMJ+ZzpKkDSUW3m20hBbXU7FdZRXYhIxJrUHmQno8zZ1RiwC9nXpjZlOYJQ/L0p
         LDfgPc2JTiqzxXxLcZgiLEWeZcolfrdrt6mr77xVjoyK4qWxqtNAowzVa6NJq9c3Xu
         UUWCpf1Kmils2F2abnEGlssLL/yGJ1p/hHKj8Fd5L6Npp4kV5Xgakuy8zYIDS25P2x
         56+p9I9E7nY+N0bprvu1XkUX0U5Mj3hdA50kJGGPV4z0t3AishqVHla5LoWHe8Wo3/
         8SPF2jA41KTjLqi3KAb4/gqm6Y2ffDlSDmXVGrWtTnlIJAIt29T6eSTBlYJSR9hU6t
         ld+CeoQzNwatQ==
Received: by mail-lf1-f72.google.com with SMTP id q26-20020ac2515a000000b0040adfeb8132so630281lfd.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 00:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0oqdKTEInfxFxK9xa4c8vwLVD6X93UYR6ISSifrJI1s=;
        b=vh0QibMlkzyvT7UvC3271eTB8hEXImpDgHzJEJLqoHLKOvKff2t5HsEuSzjUu6LjJn
         8/b+IhB9Lzl+J/+C3xoE+t4S5pPprSrBpGUDsCPSScw3QR2MA+7hY2SRmb4pVl94Brxy
         EGcdILx7cEn/jCJZ0711XSrs1BWVzJm7YWBIzNTYgKKTiUNdbJeTyRbTGOCPfXrZ0qvo
         NCl+TE3jZ4y9E0tI/mbNRZxuIjkoxEnuVt/8cfjyQY2rhnQuHacPAhDCCEPEMogpaoBu
         PqurSImoo6f5NVPC09Ig/5Ln8su8zuR10h3oRGUhX+c+hOuQYQlicu17Vv9aHpXBZWGJ
         7xhw==
X-Gm-Message-State: AOAM531Ee4gN2yNuE8lMgftzZRSyNJt176/Yhoe0QM7DEqDSTeAhdDYm
        IFl1VtDtlFRZn28MaDk2UuEst4VP/jkYnXI2oVcW7gO6zhitMr2XKIeA0gTs58958OvzgU+SA1V
        8vGIiAuSenD1TpG0281RbNqTEBw+2V3gHrcSAWHCzSvJgk0D1
X-Received: by 2002:a2e:390c:: with SMTP id g12mr36658617lja.118.1636965807784;
        Mon, 15 Nov 2021 00:43:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAADM5AFPI2hdyvOqd5eY9jnktOJRIUfQWacRX0FQauEX9xiSejkjbB59+nLHMBHjzifbClQ==
X-Received: by 2002:a2e:390c:: with SMTP id g12mr36658597lja.118.1636965807598;
        Mon, 15 Nov 2021 00:43:27 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id n9sm1440454lji.131.2021.11.15.00.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 00:43:27 -0800 (PST)
Message-ID: <fa6a55a9-1c27-e9a8-739e-fd7ec34e3b76@canonical.com>
Date:   Mon, 15 Nov 2021 09:43:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] ARM: s3c: Fix typo in one comment
Content-Language: en-US
To:     Jason Wang <wangborong@cdjrlc.com>
Cc:     linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211113031117.33727-1-wangborong@cdjrlc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211113031117.33727-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/11/2021 04:11, Jason Wang wrote:
> The double `would' in the comment might be repeated. Remove one of them
> from the comment.
> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>  arch/arm/mach-s3c/mach-gta02.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c/mach-gta02.c b/arch/arm/mach-s3c/mach-gta02.c
> index 418939ce0fc3..174b2e55ea16 100644
> --- a/arch/arm/mach-s3c/mach-gta02.c
> +++ b/arch/arm/mach-s3c/mach-gta02.c
> @@ -393,9 +393,9 @@ static struct s3c2410_nand_set __initdata gta02_nand_sets[] = {
>  	[0] = {
>  		/*
>  		 * This name is also hard-coded in the boot loaders, so
> -		 * changing it would would require all users to upgrade
> -		 * their boot loaders, some of which are stored in a NOR
> -		 * that is considered to be immutable.
> +		 * changing it would require all users to upgrade their
> +		 * boot loaders, some of which are stored in a NOR that
> +		 * is considered to be immutable.
>  		 */

This is a legacy platform, bigger set of cleanups are accepted but a
patch which changes only one typo, is not. Especially that you change
here three lines for this simple one typo.

Please send a bigger cleanup for all of such issues or skip it.

Best regards,
Krzysztof
