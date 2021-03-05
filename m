Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2C2C433E6
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  5 Mar 2021 10:11:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5A5A6501B
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  5 Mar 2021 10:11:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbhCEKK7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 5 Mar 2021 05:10:59 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:49543 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhCEKKy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 05:10:54 -0500
Received: from mail-wm1-f70.google.com ([209.85.128.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lI7Q5-0005wP-EC
        for linux-samsung-soc@vger.kernel.org; Fri, 05 Mar 2021 10:10:53 +0000
Received: by mail-wm1-f70.google.com with SMTP id s192so573423wme.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Mar 2021 02:10:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dc1X7XD8sIPk/f9CtULIHpjeF451ceoNr0To1nwZ7Rk=;
        b=K7ooRia39XcZwHhb8MH473DJgVlnHDLT3M+uMYaV/Np1c3okQUeOE+FoF+n8ECX3A/
         gdk6WYkyjLEGkVuyJdxNASUFEZOgxp6tNZoLA1ty8sMi68nyEiH54mCg9fv4jMMCIkxd
         0ITVHfhRMvAR/xh/foCAwSGrM0qFc7o72oVTaUAERhdFV1bKp5/QXQZG2lZZSQOTV3xD
         iP9WlNI7tJQXmRS5odUvri33bTH0qAg17bH0Nsl98B4S9tBu712yOqRHpxV9BO4mZ1DY
         2ezr3BlfhRrU0vesa+Wullx+WzALi5pD7VjL5r3z+v7DUz1o9HCrAip7TiIXl3N6acfn
         6RSQ==
X-Gm-Message-State: AOAM532/392XwamDE3wFXMO8DM4MECM3kTqmKsOZe4pPntYmToE45i6f
        D6FvQyoRFZJsfthQXJVSYJFYW4zXXEH25Xkwn7JDQOu4RvCg0X/0wTxJF4ReAVpl0X098gcBXLD
        EvIEM8qsjCfhCOn+AOl5o4tYuuswuqI7W6tVYWtCbxykv1J3F
X-Received: by 2002:a1c:7312:: with SMTP id d18mr8029198wmb.155.1614939053086;
        Fri, 05 Mar 2021 02:10:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJTFUqM4RWURTdZMPFSaLPGO6A85/2AN+p8IFVvZ8Jnf1yZlTvGqR63lFecZvTKp5HVZ2Rlg==
X-Received: by 2002:a1c:7312:: with SMTP id d18mr8029170wmb.155.1614939052859;
        Fri, 05 Mar 2021 02:10:52 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id o14sm3527991wri.48.2021.03.05.02.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 02:10:52 -0800 (PST)
Subject: Re: [PATCH -next] USB: gadget: udc: s3c2410_udc: fix return value
 check in s3c2410_udc_probe()
To:     'Wei Yongjun <weiyongjun1@huawei.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
References: <20210305034927.3232386-1-weiyongjun1@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3cf7abbf-0dc8-495f-4737-2d84bbea8158@canonical.com>
Date:   Fri, 5 Mar 2021 11:10:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305034927.3232386-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/03/2021 04:49, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function devm_platform_ioremap_resource()
> returns ERR_PTR() and never returns NULL. The NULL test in the
> return value check should be replaced with IS_ERR().
> 
> Fixes: 188db4435ac6 ("usb: gadget: s3c: use platform resources")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
