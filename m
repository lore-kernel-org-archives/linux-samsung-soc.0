Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C000C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 20:35:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6ADFF610A8
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 20:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhJaUh5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Oct 2021 16:37:57 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:34748
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229946AbhJaUh5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 16:37:57 -0400
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 154673F1A0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 20:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635712523;
        bh=uz8KXM9nhvh1Fc9fo2R2qEoJSyZUeT9D64pnEDQSjg4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=jDJM09xGcX7Y6653EI0YJDux9hu5ozkz6shUNx6LcEaZ7smQA3rDxjak2Is7j6Xul
         W+5fOcsjWHjLm1ic7mmrpR0eGstfv7ZQjLwkGhYOuTPvexv2PCk15zZI3MNhLDffsT
         FfSNZMzgYVBwsaP0khNj7+YqXPc6qEMLWNvyv5qD6scQlsKiqN4Zjx5mocm4J+OAq+
         4UsTr+yRZJhexJoJuL1bfa+UqN1vejVrdpRsdHj/YhABQnLEdXtXpUx4+BrfF1jkfu
         iAEKwBPX2Bbkt3UOiY2RgIO7RLAcgFuprLD6A3zdpIDX1MRVJ0bdd7gOv/yH1P/ZtV
         YbuXGLda5xzpQ==
Received: by mail-lj1-f200.google.com with SMTP id s12-20020a2e98cc000000b0021539440855so295962ljj.20
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 13:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uz8KXM9nhvh1Fc9fo2R2qEoJSyZUeT9D64pnEDQSjg4=;
        b=jMXop8BKParaxTf0a4wZuWtu0Sx8emFowojYMoi06e0gBS07fyhq1RCYc7oyoNHIzc
         s87ZlDWe34uKzci4VP9FhM3nuXxsifdCGFTkCLlxJlRLhIoR+rmed369nBYCG6hVUwYA
         jzhEDAYe+y04CJK2N6TkGcyiuuEnB0Me28zG6HCA6dtcN6d1K0iO8S+jyO4TWau1bsj1
         mPe/wjSWB8NfLkmz7kTj/8sx4/yJAjLJpluNdfXwonNgDxacEg3puX1f91Q8U06YSJtp
         9ABbPDq5xA41i5W5AJLXhHEKhLnzuDYuTYEwxwTdiiTugSn8h5YDCBfW8D5MwdZALky3
         v/WQ==
X-Gm-Message-State: AOAM532H4P6mi7MTb4eJ1WM+OiCiSv/+Qr3qL2yVWcalhm72+trx0hsK
        5o3Gwqgy/Xq82HRBnfwWyVd253xPsv2B5kWWzCEbQ9xq+Qxerdur8kQviGycmMbr7Aqq+GAmpak
        OK9RE0JtcL3n6uSFISRp+Z4XsEbhjXVhv3vlMERWX8+uayuKg
X-Received: by 2002:a2e:9801:: with SMTP id a1mr26995068ljj.183.1635712522182;
        Sun, 31 Oct 2021 13:35:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5cT/7nWKqTQCj9uRJML2CHx4YTenvK/QkUZQVyvMf8vTTpKJ2Q6w7woXNVG+XvX/PgNgmrQ==
X-Received: by 2002:a2e:9801:: with SMTP id a1mr26995048ljj.183.1635712521970;
        Sun, 31 Oct 2021 13:35:21 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d20sm1230083lfv.117.2021.10.31.13.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Oct 2021 13:35:21 -0700 (PDT)
Message-ID: <878a4657-c68a-743e-7c89-bf69b416b824@canonical.com>
Date:   Sun, 31 Oct 2021 21:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 1/2] soc: samsung: exynos-chipid: print entire PRO_ID reg
 when probing
Content-Language: en-US
To:     Henrik Grimler <henrik@grimler.se>, chanho61.park@samsung.com,
        semen.protsenko@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031165645.1182368-1-henrik@grimler.se>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031165645.1182368-1-henrik@grimler.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 31/10/2021 17:56, Henrik Grimler wrote:
> Older Exynos socs has one reg PRO_ID containing both product id and
> revision information. Newer Exynos socs has one Product_ID reg with
> product id, and one CHIPID_REV reg with revision information.
> 
> In commit c072c4ef7ef0 ("soc: samsung: exynos-chipid: Pass revision
> reg offsets") the driver was changed so that the revision part of
> PRO_ID is masked to 0 when printed during probing. This can give a
> false impression that the revision is 0, so lets change so entire
> PRO_ID reg is printed again.
> 
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
> Has been tested on exynos4412-i9300, which is compatible with
> exynos4210-chipid, and on an exynos8895 device compatible with
> exynos850-chipid.
> ---

Hi,

Thanks for the patch.

I miss here however the most important information - why do you need it?
The answer to "why" should be in commit msg.

The change was kind of intentional and accepted, because revision ID is
printed next to the product ID. Printing revision ID with product ID
could be confusing...

Best regards,
Krzysztof


Best regards,
Krzysztof
