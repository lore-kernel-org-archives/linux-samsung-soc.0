Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF925C433E1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Mar 2021 18:18:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5AB36191F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Mar 2021 18:18:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbhC2SRx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 29 Mar 2021 14:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbhC2SRi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 14:17:38 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88145C061574;
        Mon, 29 Mar 2021 11:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=5H716pK9atAIkvTCo4iJ/NvZkHtVJZfSlEL2AsX8qFM=; b=gdn6/XKLGmVksTKZZUi7dDBHnp
        8KFQDonVT36XOgMznXvqMUnrMUD1rYpgewESUB3tulYttC3P1f43log8T2vdGV0pXvuGeTWpBBQrH
        mgRJpepoV2egp6BrNz6fGicj4q+wEMduQCge+15EAs9onQT7sWhWoyeSDbGgNHhdSEk8Pxv6dLqdN
        bDnwXqHjS/+LAkqz2MtbRBG1Z6JDMw4B9MBnkjC2tVf9izBgFgLlv4RET64/5n9J+S2BkXeCP04sa
        ZCE2yuvXIs7OjFdffz2F2fZf38/7PTkvl5au98DOHtNXKf/pLaL8hAuDslXavqCByt1A3JE11u3bD
        iXu1tVBA==;
Received: from [2601:1c0:6280:3f0::4557]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lQwSD-00114f-0G; Mon, 29 Mar 2021 18:17:33 +0000
Subject: Re: [PATCH] usb: dwc3: exynos: fix incorrect kernel-doc comment
 syntax
To:     Aditya Srivastava <yashsri421@gmail.com>, balbi@kernel.org
Cc:     lukas.bulwahn@gmail.com, gregkh@linuxfoundation.org,
        krzysztof.kozlowski@canonical.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210329140318.27742-1-yashsri421@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <60cc1fc7-9f99-d0ec-6ed6-9eae1784cad3@infradead.org>
Date:   Mon, 29 Mar 2021 11:17:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210329140318.27742-1-yashsri421@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 3/29/21 7:03 AM, Aditya Srivastava wrote:
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
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> * Applies perfectly on next-20210326
> 
>  drivers/usb/dwc3/dwc3-exynos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
> index 90bb022737da..0ecf20eeceee 100644
> --- a/drivers/usb/dwc3/dwc3-exynos.c
> +++ b/drivers/usb/dwc3/dwc3-exynos.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/**
> +/*
>   * dwc3-exynos.c - Samsung Exynos DWC3 Specific Glue layer
>   *
>   * Copyright (c) 2012 Samsung Electronics Co., Ltd.
> 


-- 
~Randy

