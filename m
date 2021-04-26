Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3474BC433ED
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Apr 2021 14:12:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF1C961165
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Apr 2021 14:12:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbhDZON1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Apr 2021 10:13:27 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52999 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbhDZON1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Apr 2021 10:13:27 -0400
Received: from mail-ed1-f69.google.com ([209.85.208.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lb1yf-0007K5-Bk
        for linux-samsung-soc@vger.kernel.org; Mon, 26 Apr 2021 14:12:45 +0000
Received: by mail-ed1-f69.google.com with SMTP id bf25-20020a0564021a59b0290385169cebf8so15781921edb.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Apr 2021 07:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CQkRFQ6Y0bHYJBnErjBTEh/3f5vNzlcUccgnU7weOHE=;
        b=W3q1mmMmLintzpxn//DVvpX8nh1rRJ5koTBZbLA37HG5Sy3vp7CrrnM1yesfP1QNbb
         qr7EV5OtSid91mUlEmOhp1j5ubV7KwKctIYEoRpkbclyg6AgtDOtknXvHg/W70YKp0yO
         7D0xrC5Ic+xn6IEHyy25PSMmGyxyXSFeoTlNZkFI1le3HLguhGxP6s6prdq19QPO9PDk
         JbighKl/EntUotAWHWauplq/IKLyrdZgSA1gZtLuXIYuIZKj102IQandnxALnyXhduEO
         1354QnK7ITy/4WUBhvmLDCi92qJMk2P7IsvCG2WrfSHQyHVeohyyzfz5bi8s10eqxN8f
         +2qQ==
X-Gm-Message-State: AOAM533FVa2/vRfPJUwFDScf6Y/lo4YMfjYnnL+CdDnDWn+4jXMpAOzo
        zOiAC3uTTBzhdTirNz/EbIuAexP2dNajCHEXAKa2Ude/9yBs1tSj4KcaPMoe7BEjPBqxBDEVxab
        bm+9Ff/DoWhusIkOPa+9Rex5z1c+p+nfPcioIANNqPVWQg7mh
X-Received: by 2002:a05:6402:453:: with SMTP id p19mr21229249edw.88.1619446364481;
        Mon, 26 Apr 2021 07:12:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0G/5IlEi3Qqw47a4bcxAUt3AKWr7PBSa5H/Wt9JXmfed8LWOMXdmYvG7vsv9ZXG1sgic6ag==
X-Received: by 2002:a05:6402:453:: with SMTP id p19mr21229236edw.88.1619446364384;
        Mon, 26 Apr 2021 07:12:44 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id mt26sm5810273ejc.32.2021.04.26.07.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 07:12:43 -0700 (PDT)
Subject: Re: [PATCH v2] tty: serial: samsung_tty: remove set but not used
 variables
To:     Tian Tao <tiantao6@hisilicon.com>, gregkh@linuxfoundation.org,
        jirislaby@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org
References: <1619443135-21399-1-git-send-email-tiantao6@hisilicon.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ff816f12-c9fc-94bd-52a7-1d1b1c9a49de@canonical.com>
Date:   Mon, 26 Apr 2021 16:12:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1619443135-21399-1-git-send-email-tiantao6@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/04/2021 15:18, Tian Tao wrote:
> The value of 'ret' is not used which reported by svace, so jutst return

s/jutst/just/


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

> instead of break.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
> v2: s3c24xx_serial_probe function exit than convert ret to some default
> value when the attribute "reg-io-width" is not 1 or 4.
> ---
>  drivers/tty/serial/samsung_tty.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)



Best regards,
Krzysztof
