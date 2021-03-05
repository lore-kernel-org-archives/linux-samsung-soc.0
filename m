Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0428AC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  5 Mar 2021 10:06:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4BB564F45
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  5 Mar 2021 10:06:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbhCEKGE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 5 Mar 2021 05:06:04 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:49129 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbhCEKFy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 05:05:54 -0500
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lI7LF-0005MN-2z
        for linux-samsung-soc@vger.kernel.org; Fri, 05 Mar 2021 10:05:53 +0000
Received: by mail-wr1-f69.google.com with SMTP id r12so836683wro.15
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Mar 2021 02:05:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PGmg5dV7hVfKn04C67/ajk1oG+EyMbudwGnFqSTHrxs=;
        b=UVRhUuzH5lXM0q5WzURUnzyKKGtcThA3+lbrfcWS7ucNF2SI9JtquLDgHPdTAw+Q6u
         Nw+6ki0GBo5c5lHyhU8DoIKgDyBbZ83S9WjloctiBxVGr2hyIbJXDyGEhoEZTpxzL1P9
         Zf/5JjKPyJrmKlY++1pVoft1D2ATO7dnmYyI9AOpuuLnf+Qme6HNbP7cSveLZKtXb9xO
         vhEvGS0quUGBvglT9ohcb5KW8CzImV+MchSFpmsy7+wIc4g4GakcBoiT8XHOBYoKNS+d
         Q8hucmUo6StzYGxTNheawYrLDiNO4CyKQ67zTbR1X5iyVii1ttXpSO85s+WPSfYzVQkh
         etMA==
X-Gm-Message-State: AOAM533ZQads8kMd5ZG8HOxTgxqgRbY+yRY3pRyrQ06VG+fj8UuqJP0J
        7dkNp10WRN3lSDzFuToEpaCSXEJFAVK8QpSAjrh5y+I/f64Oxu6lENp9WlcTTazBSUgaBlAx/E/
        y/sPOFLQMRhCfpMzbNwP7SSvo9Pm5e6EWxviJY0rqB1o390fV
X-Received: by 2002:a05:6000:1081:: with SMTP id y1mr8313814wrw.347.1614938752890;
        Fri, 05 Mar 2021 02:05:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGQBsfEHk5+RMowmVgMf1LBys7tnSPKD2v5PbIRXo+DrvJkDFUeI/t+g3t3bBx2KsrWxtLFQ==
X-Received: by 2002:a05:6000:1081:: with SMTP id y1mr8313799wrw.347.1614938752771;
        Fri, 05 Mar 2021 02:05:52 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id p16sm4197316wrt.54.2021.03.05.02.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 02:05:52 -0800 (PST)
Subject: Re: [PATCH 1/2] usb: gadget: s3c: Fix incorrect resources releasing
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        balbi@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org,
        ndesaulniers@google.com, arnd@arndb.de, gustavoars@kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210221074117.937965-1-christophe.jaillet@wanadoo.fr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f63496f6-f894-2a86-0328-0f8dadbd28cc@canonical.com>
Date:   Fri, 5 Mar 2021 11:05:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210221074117.937965-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/02/2021 08:41, Christophe JAILLET wrote:
> Since commit fe0f8e5c9ba8 ("usb: gadget: s3c: use platform resources"),
> 'request_mem_region()' and 'ioremap()' are no more used, so they don't need
> to be undone in the error handling path of the probe and in the removre

s/removre/remove/

> function.
> 
> Remove these calls and the unneeded 'rsrc_start' and 'rsrc_len' global
> variables.
> 
> Fixes: fe0f8e5c9ba8 ("usb: gadget: s3c: use platform resources")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> the 'err' label is used only to reduce the diff size of this patch. It is
> removed in the following patch.
> 
> checkpatch reports:
> WARNING: Unknown commit id 'fe0f8e5c9ba8', maybe rebased or not pulled?
> According to https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/usb/gadget/udc/s3c2410_udc.c?id=188db4435ac64f0918def7ba0593d408700ecc4b
> the commit ID looks correct to me. Maybe something should be tweaked somewhere
> before applying, but I don't know what!
> ---
>  drivers/usb/gadget/udc/s3c2410_udc.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)

With fixing of commit sha:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
