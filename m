Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F86C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Mar 2022 11:52:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241619AbiCBLwu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Mar 2022 06:52:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241612AbiCBLwt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Mar 2022 06:52:49 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18EEBA76A
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Mar 2022 03:52:06 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8E9593F607
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Mar 2022 11:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646221925;
        bh=GZ+2gRpwKiQW36vuEeC1R6O1z6W6FXlkVCMt+nuuy1c=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=VT+rVZNfBj+nKfYmg/tutfP0Nv3y4RtQh/4j7iTWQF0yQLOY1urUfFI/M3Qr6OG/M
         AI+kuPW8MliFePZThcX3JJnJL28GeiW0FTRfVeKZzoQ1XaT22RZ9kF83Hmyfh5TggA
         /0cx8MMLMBmUdGi3dwaj8JUhEdjRjBpUH9+IoFeve9JkFuGCpJc2FwzB2nAVduaIV0
         MWPOBwFtGpwtPxi1XJuygI/SbcZ1Qv/S1ROpdWkoBx10utXiFlRwdu8WDOyH5O6G4x
         7mhsitO56pPUCAgBvf5mRCfkcqoSOxP0eJ19jQkGgwWpscpZSTRON6UlwXP97I4YYF
         Cc//H9guDzCUA==
Received: by mail-ej1-f71.google.com with SMTP id d7-20020a1709061f4700b006bbf73a7becso858503ejk.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Mar 2022 03:52:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GZ+2gRpwKiQW36vuEeC1R6O1z6W6FXlkVCMt+nuuy1c=;
        b=sOerqb91/cUvyJVi6M+d0jTtMhcZyYgkobnpNyiWbvWQ3/54RPRvMwdhb6Ef6dZa90
         AjEfhJfgjag3AnUR4eCVXSZDZIkuIkHJ1yzRIQAqIeW0AGpMlpEwn8p2xd5zMtSNUegg
         gGZgIRWnVeOpjBYNssD3enhTx2fx2yz87VMXBSFN0IHzGRKl0S4DhVpbYYAF6my0wATn
         DrAdTZRPaajKhDQjirxK6nZEnokHtpIe1yY12O2R6+69u+JqE34xV14yroTtdKgqCh1A
         yYYW/MdZ33o5y8ZhyfvjJAptjpbHScJvTtvKQUMqnOuuPP86RYhq6fSu/WbxjKoohhfx
         ZKRg==
X-Gm-Message-State: AOAM530xdVZiEkempBr9X63Cz37LFdWWvOayQs46CZdQaX4w6IiycLcL
        +AwXlz5Ff3ithyUNj46EqJISTHTfqNbV+zPnhbRI22TDYnJkalaiR5BojmrffHB9XVdxE3oWt7x
        TlJXn1mnA3F8+OBHqhC6Z6dFvDCNU/idDbE+vtnd3rWSMAwEg
X-Received: by 2002:a05:6402:372:b0:40a:bbf4:7973 with SMTP id s18-20020a056402037200b0040abbf47973mr28811625edw.399.1646221925281;
        Wed, 02 Mar 2022 03:52:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHlgE9lrc9DIKhd5HEEpVRbPqfpkzxaQ24qbVi00bwUH6CL9gHM16wriclt0C6f0bHFRgaaw==
X-Received: by 2002:a05:6402:372:b0:40a:bbf4:7973 with SMTP id s18-20020a056402037200b0040abbf47973mr28811606edw.399.1646221925129;
        Wed, 02 Mar 2022 03:52:05 -0800 (PST)
Received: from [192.168.0.136] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id c4-20020a170906340400b006d077e850b5sm6286439ejb.23.2022.03.02.03.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 03:52:04 -0800 (PST)
Message-ID: <6f17b476-0bba-5820-5cf2-7c888750ce31@canonical.com>
Date:   Wed, 2 Mar 2022 12:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] serial: samsung: Add samsung_early_read to support
 early kgdboc
Content-Language: en-US
To:     Woody Lin <woodylin@google.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, markcheng@google.com
References: <20220302114923.144523-1-woodylin@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220302114923.144523-1-woodylin@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/03/2022 12:49, Woody Lin wrote:
> The 'kgdboc_earlycon_init' looks for boot console that has both .read
> and .write callbacks. Adds 'samsung_early_read' to samsung_tty.c's early
> console to support kgdboc.
> 
> Signed-off-by: Woody Lin <woodylin@google.com>
> ---
> v2:
> add 'const' to 'struct samsung_early_console_data *data'
> ---
>  drivers/tty/serial/samsung_tty.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
