Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5FEC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Sep 2021 10:52:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27579611C4
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Sep 2021 10:52:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237300AbhIPKyD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Sep 2021 06:54:03 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36262
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235627AbhIPKyA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Sep 2021 06:54:00 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1A3884028E
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Sep 2021 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631789559;
        bh=4Lgdn0Ixo4EbM/31cJClCQJWWjH8/3D1avitifyopTc=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Cr9qm5aJxJbkCpFqUGzq3IKsxa0wQEbQBEjvUOMeq3NNfEyLNh7+/Zn2kA4fSMpYH
         O+bEN6MEY9xAAcQs3VMGDBuum9/6NNVIs0NhupJAnpfLlOSTjPxwfpMsi+q6xNE1Cy
         ZoVBNZgYOKOvTpUPF7Qvid5SfbVCAHiPTShQIbpiyPEMmjd6PC4P5YVnJg6SRAd70Q
         juQ8wPSGaKo2ugq9xocDLRco+1nhk5o8WB2U7a6blYbuaqVdZMbkVhGa9bsTTgPfuU
         AfszoRuGvPPWtsezLO4QDDsTK27B5g40GajzQESWwO1Q5qZ0ugZHtmQo01l8p2FCHg
         TB8l2LlJ60Nxg==
Received: by mail-ed1-f71.google.com with SMTP id r7-20020aa7c147000000b003d1f18329dcso4994249edp.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Sep 2021 03:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4Lgdn0Ixo4EbM/31cJClCQJWWjH8/3D1avitifyopTc=;
        b=gtlV+c13FOq6d3d/5JrIzmiFV0rIdUd/UhTUJ4eBpZdE5uLr6prsCsTYySKOc3DYB3
         pvB2gGyBZN3DpbCPFSSiPe01U1DpEOmibyWtVfdX0daxHDKUqB1vfrKWDcfhpfsYfaM3
         5FZPwpUB6UICEwZ6+qWwhHyFMiPPdXiXBdbQzWWNajHUuD5Uvuf0vRThCIiKowIsRBeI
         SX3+ep2oA++MBAprSMq5NmoSfmcA53nzUhLj9s8x/uN6Lsj5HjzAbIcpgphuSCSvAJmz
         hOtS0jdEpXNrtU8pXDUuppiQ54ZWzKs8P11SQ1w932VKN1yq+eYnnbInRSnf+08QXgho
         NtaQ==
X-Gm-Message-State: AOAM532M5DUHjKUr1giPNLltOC/TR8BcrAeii2Q8u0MtnMVvlaNltu7z
        l+ivDCbQ4PgiogjDryJzVzR89CMfdcdBi6yqUeeDhHOC7Bpc9LTkcYFU63u/62QLivwjMMPe0tl
        ndMQ50stiFMDyGfJUwgquwb7Bu4evvSdQge5LuUL+j+Cvv47J
X-Received: by 2002:a17:906:4413:: with SMTP id x19mr5475681ejo.234.1631789558221;
        Thu, 16 Sep 2021 03:52:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGfx6w0ppmn0HpLTJ+dsV03ZGRjBHau0aYhh2Ng8iIcPUHpQyfZSlfhi3RuYMMxWbYjlibTg==
X-Received: by 2002:a17:906:4413:: with SMTP id x19mr5475670ejo.234.1631789558079;
        Thu, 16 Sep 2021 03:52:38 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id d16sm1244793edu.8.2021.09.16.03.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 03:52:37 -0700 (PDT)
Subject: Re: [PATCH] i2c: s3c2410: Delete unneeded variable: "ret"
To:     Xiang wangx <wangxiang@cdjrlc.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210916103718.29956-1-wangxiang@cdjrlc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <0d1a0027-e74d-9f07-3b96-372b5ca14ae3@canonical.com>
Date:   Thu, 16 Sep 2021 12:52:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916103718.29956-1-wangxiang@cdjrlc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/09/2021 12:37, Xiang wangx wrote:
> variable: "ret" defined but not used in function "i2c_s3c_irq_nextbyte"
> 
> Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index b49a1b170bb2..6df85b23156c 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -385,7 +385,6 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
>  {
>  	unsigned long tmp;
>  	unsigned char byte;
> -	int ret = 0;
>  
>  	switch (i2c->state) {
>  
> @@ -548,7 +547,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
>  	tmp &= ~S3C2410_IICCON_IRQPEND;
>  	writel(tmp, i2c->regs + S3C2410_IICCON);
>   out:
> -	return ret;
> +	return 0;

Change is okay but I would go step further - made the function return
void(). None of the callers check for return so no functionality is lost.


Best regards,
Krzysztof
