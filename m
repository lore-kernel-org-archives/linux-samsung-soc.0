Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD6EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Dec 2021 11:35:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbhLMLfU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Dec 2021 06:35:20 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:46878
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233832AbhLMLfS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 06:35:18 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A4B8140192
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 11:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639395317;
        bh=XmQFfZI2fAYBuLxinQknZKp6zP+Jb9M2TJ1/zIaaukg=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=hFToJ0egn6No8cyMxOJZoCfNmcvs4w7ltDErfwNsaqmDq7/z6xFysWULLCVQzXdn0
         GFGNcM4ve+08mWgnTVIGsOlEUeTZfmsE0sOFiEjvcZwEV+Uqb1C4HmixC0OTwAJSW4
         C3qtiYP6sc60X1h674xv6BrMuWVuVKP1YEYv+nMGaB5WVIEasb+UmqhXPu/uz8hl1t
         z8TYjv46Tw4TpMc3RZY5tIG5ATVfUbBFP3V7RSTujyR4eJxl70jeO5JZ0ikxkV3Q3S
         utxipmSH+ZBZLlbqFMdRkCk0ddJk2gEw+22tIKPTrzgG28ovaqpVlLlLczQUW6oFJq
         o9yTCubQBwLqw==
Received: by mail-lj1-f199.google.com with SMTP id z18-20020a2e8e92000000b00218e583aff1so4372221ljk.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 03:35:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XmQFfZI2fAYBuLxinQknZKp6zP+Jb9M2TJ1/zIaaukg=;
        b=Z9xY/ZArxfLTdjhYhy/VF6ezLCUXigr3R6iMBQG5GVw0T2x2BMyR6yMxzWIIckHLQw
         v97rNkFiIX/H/n2w5VTzNcQbTFs9NJiMRv/HPfF+feC8eVWcB3l+PlVucE7bAGVGBP+C
         DeY9OoUdgwFx0iK8Fo8iPjL8jH//DlnRdGl1h00BOBtUnDE2uYVUlhQ4KcUpDlDiQrNF
         nxiWcundIvx9BFglOSM61EhDaSeZVl4B5h0CgeONIWcNOZWnrwQPdnDjhx13MAQiCITC
         0xsSgIdP1Ei2GjK5o5hN53a7qH4R5p+1TzhfM4Daywk3gF5pzvKMXA3l7gPSJ49XA/ob
         a4Mw==
X-Gm-Message-State: AOAM531ao64AMjHtj3yNNWJHN8WfjB/ea6D58G2hXr63/j2FiV/Hp6Fx
        MUPAfqJNhuME7q2haFXNuNWa9mj34tcag/thNTfO5QwiUJ6UxEB8lWc7pFc2sHV44IgakcKaBV4
        +kB91hIdc9XPzTbYwy5fl6RizLTkIgAy3sXpugX7QWk6vaah3
X-Received: by 2002:ac2:442e:: with SMTP id w14mr28227329lfl.577.1639395317044;
        Mon, 13 Dec 2021 03:35:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyzWy5HL/QnWHO5qDxOL75aUaoSjf/KHJ7CmIOs1qs+h5a0PiJHTIHJuv0mVfGli6MhqmdLA==
X-Received: by 2002:ac2:442e:: with SMTP id w14mr28227316lfl.577.1639395316898;
        Mon, 13 Dec 2021 03:35:16 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j5sm1386457lfe.219.2021.12.13.03.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 03:35:16 -0800 (PST)
Message-ID: <ab15a97b-9351-4d50-f392-21cbfdec1289@canonical.com>
Date:   Mon, 13 Dec 2021 12:35:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 3/5] tty: serial: samsung: Remove USI initialization
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211204195757.8600-1-semen.protsenko@linaro.org>
 <20211204195757.8600-4-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211204195757.8600-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/12/2021 20:57, Sam Protsenko wrote:
> USI control is now extracted to the dedicated USI driver. Remove USI
> related code from serial driver to avoid conflicts and code duplication.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v3:
>   - Spell check fixes in commit message
> 
> Changes in v2:
>   - (none)
> 
>  drivers/tty/serial/samsung_tty.c | 36 ++++----------------------------
>  include/linux/serial_s3c.h       |  9 --------
>  2 files changed, 4 insertions(+), 41 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Greg,
If you are fine with the changes, please take the serial driver changes
via your tree.

Best regards,
Krzysztof
