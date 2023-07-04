Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03537EB64DD
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  4 Jul 2023 07:54:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjGDHyM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 4 Jul 2023 03:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbjGDHyH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 4 Jul 2023 03:54:07 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B9251985
        for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Jul 2023 00:53:32 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51d805cb33aso6640430a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Jul 2023 00:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688457208; x=1691049208;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HrXqUlrBpP30rY5ycLmE0WvwHXAB0h27Bdu5zKC2Elg=;
        b=bCW7pqOJ64xhF0HIEPsHvQ+0+7BWUlVlL1e7z1GGz58BneMnJccND5zP0pNu+jZoNq
         RChj7ohW528rLmyIYzBbvoihB8D3WM04s3IO9ruW/unYLeD6+xi1tBmjQxsQpoGUnb2K
         L54mD+Cy3JttcFFuV1GJ2wtHFTZPAjTwkEafXNme5vNllaltQpGZdGOdMOXhoGoBkrPr
         g2zoolXgnZU1tHiSaglE2nYJX20xuGjrzljbC3iWP7broCuJSxurXCqDczYhhzs0LRbw
         sF2ZHd6i32PioLWh804whUOTJM5EWRoLmz3aCG+BF8kWe/o+pxE7vNI1PAkTEhMigMZi
         gpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688457208; x=1691049208;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrXqUlrBpP30rY5ycLmE0WvwHXAB0h27Bdu5zKC2Elg=;
        b=dKGZOrI4Nbm7VRzEG0RKdzZBC9OXWAF4BK4u1v86NnliSafTNtfIhCDuWbfnuNCnJG
         xtbDexzSdQeaPHRxMjqlZdVrh6GUg91ZmD79zRj+GUynvxEvV58UnSmT985r3vm16/Fh
         zfqZFLENDdbOhVE0iSgjceo7oss327K1wZclYUSklpwnGc1l7+WnsQZoDwckwPx2psCu
         VJBlgUuRfm+1G+rmvdDJtcljVpNl3phZ/dqFpnnxtHrYPfrkrYeFZo/r8pw4I3bML7LG
         97zFRS0QZfSMHMNE5qCg/R1F60x/Z1q1YdUq7cXMlaLUvWZsYTgwxllpo3J/qIqLRFpm
         R7xg==
X-Gm-Message-State: ABy/qLYhXwMIesTQl8pkDh7j+c6nVISJpii724P7Iw47C8ggsZHqYhPX
        ffHMuhoJxvGwf662Ey0REJVGjg==
X-Google-Smtp-Source: APBJJlFWLYHbDmuyT7EitO1lmZ66TFGNuZz7Pz9jO+RKjMKBFNB9oSWYbE0oFCtgp7d5u+4mwtlvUA==
X-Received: by 2002:a17:906:8315:b0:98e:1484:5954 with SMTP id j21-20020a170906831500b0098e14845954mr10230260ejx.71.1688457208285;
        Tue, 04 Jul 2023 00:53:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id w10-20020a170906130a00b00992b50fbbe9sm6651031ejb.90.2023.07.04.00.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 00:53:27 -0700 (PDT)
Message-ID: <b6d3a872-f32e-bfcd-b603-c08339737045@linaro.org>
Date:   Tue, 4 Jul 2023 09:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] watchdog: s3c2410: Fix potential deadlock on &wdt->lock
Content-Language: en-US
To:     Chengfeng Ye <dg573847474@gmail.com>, alim.akhtar@samsung.com,
        wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230628164759.67594-1-dg573847474@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230628164759.67594-1-dg573847474@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/06/2023 18:47, Chengfeng Ye wrote:
> As &wdt->lock is acquired by hard irq s3c2410wdt_irq(),
> other acquisition of the same lock under process context should
> disable irq, otherwise deadlock could happen if the
> irq preempt the execution while the lock is held in process context
> on the same CPU.
> 
>   [Interrupt]: s3c2410wdt_irq
>     -->/root/linux/drivers/watchdog/s3c2410_wdt.c:547
>     -->/root/linux/drivers/watchdog/s3c2410_wdt.c:383
>     -->spin_lock(&wdt->lock);

This interrupt is a threaded interrupt. Therefore the
s3c2410wdt_keepalive() will be called again from process thread. Are you
sure there is deadlock?

Anyway, please also strip unrelated paths and rather use function names,
not references to lines, because these might be not accurate.


Best regards,
Krzysztof

