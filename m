Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E50C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Sep 2021 10:52:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C78360EBA
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Sep 2021 10:52:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbhIFKxv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Sep 2021 06:53:51 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:55678
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229913AbhIFKxu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 06:53:50 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0191640199
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Sep 2021 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630925565;
        bh=iRc4lHe20biO35iQiW32ac/SanSeDuN2N3S5V2+ed2g=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=rAIapUNHRSEE0sGI6WEXOeAOdoeCxMwdfQVf2WoJmV1XH0x6x4zBxlAWeJ8X3YIiG
         3jlhHFUbaOLg/QCiBapKMv4osLV+c7pirj5cEqXaT9DLwEHXOpFlLSwrCSjGoHPB4i
         dkph8yOyZYN68+JiHTpXOTPfFVRTeNy/2Zmi4/uFqRYfx4VKFWPKQ514eBgCBm3Qc1
         AoggGNEOoQi4kO7VC5dczmjI/eCLlUbkqDB1W7XeohfiS3VqV+ZRm8JKHGLz08KrXx
         C9m/iu5kuSF16H6PF3sVIhOMonUMVU6R45Rgx/hUS5XPSzQN7CsujL9vKPbPTKBWm9
         Rcq4dGzsI0UYQ==
Received: by mail-wr1-f72.google.com with SMTP id p10-20020adfce0a000000b001572d05c970so1086390wrn.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Sep 2021 03:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iRc4lHe20biO35iQiW32ac/SanSeDuN2N3S5V2+ed2g=;
        b=FfpTKi4cxSSuZj0fMFUamSMqsbJZQkPc71MEqCmGV0egOpPBCNYP7z9ZhQTz9hSqC7
         xbbKMD29qNYPK93L3XksMVbq5eXfxz5wAeOiQP+Dcn2TtYUSues1H2DIs98CrkPrUJuZ
         CLHQvX/IEQQKplhu61a0wb5Dm5HPZSTyutYF4yYXfclia+X1L2bJDfSp8gUkjWz8Z/z1
         IKkzCZNgjtlpNatvpy/dC1xIjamVOWLsQ3bzqSg44R0QotIC0SZ/0tVh7k9squK0p6k2
         0yrHynTXIK8vvaKxMN+0VIVoCqhmFO1PeGm+1cbpuYkHQVQvH4PsSvjFhRAgV6XXOe8n
         pMPg==
X-Gm-Message-State: AOAM530Onfd1jTqi5gA1NTQF6dEL2PFOiGeNAUjOnSN1Mcsjv1S+NRTY
        Ief0k/a9YDgsxf+tWg26tMd9uEJoPjS3FrgrebNp4QMQXwRprE6VjhxI0/PbeG9sKL89SMCEFQ2
        EJab+64pW6h1/rbm4Bov+FUm7QW9K00k2yn6x7EEE/4qKM+YM
X-Received: by 2002:adf:f892:: with SMTP id u18mr12102391wrp.31.1630925564743;
        Mon, 06 Sep 2021 03:52:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFVQWFypICwx6NcS4VUhXn24qyGuLff4GFrP/CGz19Z08nleMyL3VXwZm3SLSNmB2yDSv4BA==
X-Received: by 2002:adf:f892:: with SMTP id u18mr12102380wrp.31.1630925564610;
        Mon, 06 Sep 2021 03:52:44 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.188])
        by smtp.gmail.com with ESMTPSA id s14sm6740025wmc.25.2021.09.06.03.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 03:52:44 -0700 (PDT)
Subject: Re: [PATCH v2] ARM: s3c: irq-s3c24xx: Fix return value check for
 s3c24xx_init_intc()
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, liuyun01@kylinos.cn
References: <20210901123557.1043953-1-liu.yun@linux.dev>
 <a67a8252-a153-8f06-1e0e-fc1a9019869e@linux.dev>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <c8472968-a7ca-820b-b250-8f8648b8eaf6@canonical.com>
Date:   Mon, 6 Sep 2021 12:52:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a67a8252-a153-8f06-1e0e-fc1a9019869e@linux.dev>
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/09/2021 12:23, Jackie Liu wrote:
> Hi, krzysztof. Any suggestion?
> 

No, looks good, but it's a merge window time so this will wait.


Best regards,
Krzysztof
