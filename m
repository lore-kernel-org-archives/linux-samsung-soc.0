Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DCAC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 13 Jan 2022 13:30:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235158AbiAMNaL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 13 Jan 2022 08:30:11 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56276
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235140AbiAMNaK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Jan 2022 08:30:10 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C67A84001E
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 13:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642080608;
        bh=Gdbdjf8zVy+P14tpf21E4rjEbB+nBaQfGlpLQYdJfQ0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=C8eWvpPY71qN+Qddb2gZiPAZvv95C6kkV5Et9K8HzOGSXj5V0LcbaEBUjWJtWLSWP
         QzjlCHIuZsW2DLelfYVLecydqlvSn026GwjsqBxiJiA4YG8Bvw4uaqCw4nJp2vXkRJ
         xNSIOckx9a8XYLjW1BIVzql39jskEWOmP4oRiLuprYHKJicK6o4LGdNgqXQ75ioCmx
         0NnUMhcc3vIrqRAKSCoraeX4TT9xdHzt4fviBrCRnE2DqlWsgVyF0wV/wyek/YaOTg
         J482UGF6JMxYKX9b0+bt7QMrHVM/lge6bHnzee/qX8MOcQv4O4AwB5zjWQIthq/Vzl
         d+AqsCGVFlObw==
Received: by mail-ed1-f71.google.com with SMTP id ec25-20020a0564020d5900b003fc074c5d21so5277025edb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 05:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Gdbdjf8zVy+P14tpf21E4rjEbB+nBaQfGlpLQYdJfQ0=;
        b=6XBlZ4bLRUSd55dJ+fRkpOQYBoTtVm2x1y9AJ7Dzk2G5+zlC5OffTG8AkcFp8utlXY
         BqcN2cJIQWP6cPSnApDSdok4s5WffHAuYy0Nzx9FMAnyARrNgrCAYHEW80dbCKVA4xvI
         n6CnnXV5fIrXO2OAie5GUS7FGPeyTfue+90TSnk5xrC7x+fRgS8OJW5eD1f4uvBFe8K2
         CD5JPGhVrWaO8HsmulQGEuFy7/1QPlTwiKWxpXKWKsZXwFaFHUXNg+7Jwl4V+Ncqszh2
         m5k+P3DT55AkYBOeBoMvRXg9N9RBwcU1ivwroc56d6QTxArUNtXJmJnpmyeWQHOHc82X
         h/pA==
X-Gm-Message-State: AOAM530HPc/783XgARMWOQq/bHd1IE9FjNMxUQVqsw7d5bRFW9iFtToa
        En/h+/LDmep6WtPrrBxXT9gdznELjT9JrXKl2oXOceC9abtibDZrcuRVtdokWla8TOBXuJydYfD
        bibXdWOx3oYtkDYHQiJK3Cw0HqvH/i6Q6ZZIbAfpSmTOZAH28
X-Received: by 2002:a17:906:a109:: with SMTP id t9mr3500768ejy.718.1642080607703;
        Thu, 13 Jan 2022 05:30:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMNkfQi4+m47jbNQiciQP+7ptefZU6skQjA2XWtlYYF4xXnLw2qZV1JKz789+WCaQqP5cfCw==
X-Received: by 2002:a17:906:a109:: with SMTP id t9mr3500755ejy.718.1642080607579;
        Thu, 13 Jan 2022 05:30:07 -0800 (PST)
Received: from [192.168.0.30] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id w3sm877146eji.134.2022.01.13.05.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 05:30:07 -0800 (PST)
Message-ID: <9c3ef183-2872-f070-4d22-0ab2e79d2555@canonical.com>
Date:   Thu, 13 Jan 2022 14:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 19/23] arm64: dts: fsd: Add SPI device nodes
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        Aswani Reddy <aswani.reddy@samsung.com>, linux-fsd@tesla.com
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122440epcas5p4651d7cb2fc6d6a70fd5eaab5eadcf996@epcas5p4.samsung.com>
 <20220113121143.22280-20-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-20-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/01/2022 13:11, Alim Akhtar wrote:
> From: Aswani Reddy <aswani.reddy@samsung.com>
> 
> This patch add device tree node for SPI IPs and needed
> GPIO pin configurations needed for SPI IP
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd.dts  | 12 +++++++
>  arch/arm64/boot/dts/tesla/fsd.dtsi | 57 ++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
