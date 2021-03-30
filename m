Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1367DC433C1
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 30 Mar 2021 08:52:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA1C161990
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 30 Mar 2021 08:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhC3Ivf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 30 Mar 2021 04:51:35 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37069 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbhC3IvS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 Mar 2021 04:51:18 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lRA5k-0004td-RW
        for linux-samsung-soc@vger.kernel.org; Tue, 30 Mar 2021 08:51:16 +0000
Received: by mail-wr1-f70.google.com with SMTP id z6so10062972wrh.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Mar 2021 01:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=djVlT/RAmq6AwtihToV3c2qx0PjKLnFe2UuBJ80EzkM=;
        b=Gv4ts1v/rdm6mftA54S7qPiNtkcJ8Id2+W8mjvk4JRD32KVQaQq3JJM952bCKqcABg
         2WJDsIdOp0TFmWMSM01is/86UVhHRAWzAhJqFw4Wkd/g7TOYpdsgkZYVH6tWioT2vTrg
         K+SqBzsmEevANxHnDp+i5XoovVnbhbuYryRjprHR/XU765NaZArND9Rxzy9HT8EMXTrL
         G/XM9y1v94m1IIveSpP1wer1XLlfPIzP0ZlrB3T0kf4cMvWoGrWctQ4gvuTd18wkY+/z
         1VgJ+YdYbYTg9qardOIz5a4SpUM78n0BAxB2ORA6Vj64t2UpUot7JunflAIZzyxAsq3v
         gcXA==
X-Gm-Message-State: AOAM53165KMPhMGFxNyC99twwKdc4WHYPOqx15C6N4o1hTTAmWPqcdBG
        aL3gaWFcLABLstjquHV9Tw0kGq8zh6IlCuMDF3Gqzz6EfLGa6xjfmLk963FR+qez9KUdl2php+y
        W78DuxvZp5i3M8yWvES5489bJaDfuX3M/rglIuOJ1N14C1Yh1
X-Received: by 2002:a1c:7515:: with SMTP id o21mr2898596wmc.90.1617094276514;
        Tue, 30 Mar 2021 01:51:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMM+kQaqpCWb0b7OW+orw77+hmaUElyaV7pasIVj3HsWg6jELlm0lBduYBq4l8/WLCYe23Ww==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr2898587wmc.90.1617094276417;
        Tue, 30 Mar 2021 01:51:16 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id l6sm34969120wrn.3.2021.03.30.01.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 01:51:16 -0700 (PDT)
Subject: Re: [PATCH] usb: dwc3: exynos: fix incorrect kernel-doc comment
 syntax
To:     Aditya Srivastava <yashsri421@gmail.com>, balbi@kernel.org
Cc:     lukas.bulwahn@gmail.com, gregkh@linuxfoundation.org,
        rdunlap@infradead.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210329140318.27742-1-yashsri421@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b341b0a5-4f78-d986-d038-8e067bf5d34e@canonical.com>
Date:   Tue, 30 Mar 2021 10:51:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329140318.27742-1-yashsri421@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 29/03/2021 16:03, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for drivers/usb/dwc3/dwc3-exynos.c follows this syntax, but the
> content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc:
> "warning: expecting prototype for dwc3(). Prototype was for DWC3_EXYNOS_MAX_CLOCKS() instead"
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.

One sentence with error log would be enough for such trivial change. Anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
