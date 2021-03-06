Return-Path: <SRS0=po1K=IE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D375C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  6 Mar 2021 16:14:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CFE665005
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  6 Mar 2021 16:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbhCFQNp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 6 Mar 2021 11:13:45 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:59161 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231197AbhCFQNl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 6 Mar 2021 11:13:41 -0500
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lIZYh-0004al-W2
        for linux-samsung-soc@vger.kernel.org; Sat, 06 Mar 2021 16:13:40 +0000
Received: by mail-ed1-f70.google.com with SMTP id l23so2628982edt.23
        for <linux-samsung-soc@vger.kernel.org>; Sat, 06 Mar 2021 08:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kSOpPvwteB7OgdggMYlflHqoFNnAak/wbdk3zQ46jYs=;
        b=WgL/J5kEU+l7KJG+ZPNihLf/MU/hEzbQKJjL+3I24ADvd7QNxfD7Z0pg9Ck3fRHDEm
         jBZdBmWmJ4Yp06C8A2QNqazFUxVbZ56wG4HzxRLoS7+ASqSHtFGnqNUTMDtuCRuM90sN
         V0v8PsqilJTwVNk1VbnTqQpAGQOXx+yNDH9f/c1/rZC8tIzJcUcn4+aUNYd6pmdtyc+P
         5Y5HIaycu0Jrmkr4gmPFIwZvkMFfcTmQ3JVKO/3/uhDIZGj6kVKx8A9IhefzuQkIGll7
         Meg+d5CFB6W3NKekUvf+A7MyojaGPDqX83kZg1yKvrUDkVK/CPYlZ3SkHSqadJXLTQRB
         NHtg==
X-Gm-Message-State: AOAM533IsL5vZLB4IK8emeM+CBa2psFJ0/Uea247ZalnTneQTUYmtXRY
        iTA468Okq6/uz/OFQEPkaONmepmtO66UpJAs4IjNEy+xSO19Q3+m8clloZeNbeSTKakSaJa//H9
        RUeSTZsHl0gfs1GvRNdc6cwL8CxhiPlC6M+kVzvwUmNXrlWXS
X-Received: by 2002:a05:6402:704:: with SMTP id w4mr15006220edx.175.1615047219682;
        Sat, 06 Mar 2021 08:13:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdAGCIq65lZYlyAxqCZzWAm3VpQnb3VqeFecUkSHeg10URY0/jp2c3aXPC8lt9nQB63KGrWg==
X-Received: by 2002:a05:6402:704:: with SMTP id w4mr15006200edx.175.1615047219456;
        Sat, 06 Mar 2021 08:13:39 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id k5sm3487412eja.70.2021.03.06.08.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Mar 2021 08:13:39 -0800 (PST)
Subject: Re: [PATCH 1/2 V2] usb: gadget: s3c: Fix incorrect resources
 releasing
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        balbi@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org,
        gustavoars@kernel.org, arnd@arndb.de, ben-linux@fluff.org
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20210306142108.3429-1-christophe.jaillet@wanadoo.fr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4ef30769-91c2-031e-8e19-af25d26c848c@canonical.com>
Date:   Sat, 6 Mar 2021 17:13:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210306142108.3429-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/03/2021 15:21, Christophe JAILLET wrote:
> Since commit 188db4435ac6 ("usb: gadget: s3c: use platform resources"),
> 'request_mem_region()' and 'ioremap()' are no more used, so they don't need
> to be undone in the error handling path of the probe and in the removre

You ignored my comment about typo here and did not add my review tags.
Did my emails missed you? The made to the mailing list...

https://lore.kernel.org/linux-samsung-soc/f63496f6-f894-2a86-0328-0f8dadbd28cc@canonical.com/

Best regards,
Krzysztof
