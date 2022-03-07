Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AABC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 07:57:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236003AbiCGH6H (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 02:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232814AbiCGH6H (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 02:58:07 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2E160D92
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Mar 2022 23:57:13 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8F7813F5FB
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 07:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646639832;
        bh=AHjs0QVNDIis7IjbqKISlEAz1swFuZig4/uG4UShOyE=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=nEl8mjnZiB5/FVWjTbsg3JhHK7FC8C3VzYGfG0Mf6jidLCTgGxlI0RnJtb6wfZfDr
         XhQTHPJycROyzCG+Z2KMA7UBuN3rcMxhh9xhm/NqJz6aYyncDGLsSL8SRfh6HM2oQW
         oSKSfGBJDLyIwTRsaea+lGJKj+sarZeAdlJR4QpD/UExgDRumSXLZs3jRlYKtXB/1Q
         FMONPV5OgEmrHDkbFbpQYyde8I5JZqqANKww0aWpWcAZIpruPZNnJSmtjd3zRoIF1d
         9ABQVFCrf+uAB8WvGWD4JTDLTzHwxXUqT4fI8cNJ5kqtMfrKe7SOXpdoNs69FrO43K
         MhihBAjFhRvPQ==
Received: by mail-ed1-f71.google.com with SMTP id bq19-20020a056402215300b0040f276105a4so8147523edb.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Mar 2022 23:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AHjs0QVNDIis7IjbqKISlEAz1swFuZig4/uG4UShOyE=;
        b=Jmw60Q3wZ1EZUrWRNBjAbD1YqutdgjZEdAeOHlezxesnIUe1mbacpBSyx8fkNaepLB
         Nn337DWtqoE1hkaEvH8syDYKPeLvu1nLpJV/hD0AvlIkSy6Af4scYBj8zrs9v1YsHUU7
         uhP33ghaeSw0tO3skHzQ8FxevB+dI6ZBnZToQl6jnvYCO6fbx/4TmLz8BWEm+2Mt00n2
         ahcTEDN79/JwUaPczLoDLYNITd61UAGKlqIPGrhaj6+ZHiJbgRr++9+PmDC8zt0fk0lT
         FgsxCEDSL/dVizThYWEa3JX2ahAyqSS7jLqQNbbzeF/Xd4VyWOPK4b2CUHOU6YYUtRdF
         +Gpw==
X-Gm-Message-State: AOAM530I9C5411fxf4BU/b/eKKkLkt/1psSR+SCvAWwRkj21gM8eGby3
        c1If0QwlAzAjuC0NncQKTbM9sOfaLmAriRekiEpPCYQ1zXfCsoFd713EguKLK+bPqtHZJdodAyo
        iHzP46uB98bj85gDY/nlNSFNBt8JpssmQcedmQgUUH1zK6Xew
X-Received: by 2002:a50:cc89:0:b0:400:8f82:99e8 with SMTP id q9-20020a50cc89000000b004008f8299e8mr9972849edi.7.1646639831760;
        Sun, 06 Mar 2022 23:57:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygdn8fB+C/23DihWZly2xL8YqfCrN9GvsUhuY2VVyKRBR/TZrb3zslpnePuPyHobQpUacerg==
X-Received: by 2002:a50:cc89:0:b0:400:8f82:99e8 with SMTP id q9-20020a50cc89000000b004008f8299e8mr9972836edi.7.1646639831624;
        Sun, 06 Mar 2022 23:57:11 -0800 (PST)
Received: from [192.168.0.140] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id u9-20020a170906124900b006ce88a505a1sm4573922eja.179.2022.03.06.23.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Mar 2022 23:57:10 -0800 (PST)
Message-ID: <a41fb0e8-ce9e-9bdf-c583-a0b6098d70d6@canonical.com>
Date:   Mon, 7 Mar 2022 08:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] media: exynos4-is: Fix PM disable depth imbalance in
 fimc_is_probe
Content-Language: en-US
To:     Miaoqian Lin <linmq006@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Younghwan Joo <yhwan.joo@samsung.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220307075206.10737-1-linmq006@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307075206.10737-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/03/2022 08:52, Miaoqian Lin wrote:
> If probe fails then we need to call pm_runtime_disable() to balance
> out the previous pm_runtime_enable() call.
> 
> Fixes: 9a761e436843 ("[media] exynos4-is: Add Exynos4x12 FIMC-IS driver")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/media/platform/exynos4-is/fimc-is.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
