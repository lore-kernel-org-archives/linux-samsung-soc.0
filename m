Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7A4C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 08:10:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236135AbiCGILS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:11:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236167AbiCGILI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 03:11:08 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672F251307
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 00:10:10 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3A41E3F1AF
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 08:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646640609;
        bh=rZiSscehpFaw25MYSQrGhTmta6JFYZvBO72KN+MNtGk=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=seiWrj7pASYo59gEsGP6r3jWGc5ym8vZqIAqde2j1ONMIXs9tc3+9WUt5ARe0Psjn
         +dXTUrSIVONY6f9a7o1UNhFdYssjUtbjOSeFq0BX9Ou/2HbDSxUoEMyq0PvSSVpgU/
         VNfqtMGWTT2zNPoaiOZqjWuj9d5p+Ttn0inSTYg7WX2UiBV3FQP+SrpDmc8mvDRag/
         kGpVQXQdRQ0YWMWnL4ywE23epaNHcKKZcIR1y8Z2hFRcDcr8SnoUvNSofbewJepnq+
         bzsk7VeJLboiPS8HK2bfot9HkJQ1ezBiAFNNutDLlMwNXjni2Co1J6rsMZ2jWdgZAF
         FcUf/+dHCcFQg==
Received: by mail-ed1-f69.google.com with SMTP id o20-20020aa7dd54000000b00413bc19ad08so8176372edw.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 00:10:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rZiSscehpFaw25MYSQrGhTmta6JFYZvBO72KN+MNtGk=;
        b=tB6MgWI8zyaCatXXPjQHDUMHJRLVYdNdkKMCIljb+QCp4XOAZSKVpY+44zXHQxu9ne
         sNwP2NwpHdJtxzmiz1+UVEVWsUNftoqFHuSk4o+Y8Ua2Gk9fsx6sVb8P63TvM3+mvPFh
         OZ3lvascaeZ4oZ902UrMGU7pvJNvwHaFsnrbom+SGA+zII4a0q7QzxgMdwADWF+LrGtG
         038U2OVuc1JTrTkv2lTwHvgq4KfQ/UQYSAZk4axKDGylA1kK3BZocPS++GyJmOFOuTu3
         g3k/wUjtKpJGAOcYQS37k93oOoR2YTSABBNKLo1/kyUhsLntlrvv3Uv7/kIxsU/7n/Oc
         at0A==
X-Gm-Message-State: AOAM530Ao18gwMLAYHNQJpotEiRjutl+o2FgllH7Z1T+s5v9OzRtnXG3
        KJwUDUMRI+Gy5jIyB4fOp/Bbu/RttZBit8E3ikUU5aoyR5Y297SrE3YXLCTFTybNev/Jezwf4fQ
        ibyFSir7z6PN6L1Ht3N3SpVxpllAuUT7QjUfyjFY6Gi/NsQ18
X-Received: by 2002:a17:906:b6c7:b0:6db:2e14:875 with SMTP id ec7-20020a170906b6c700b006db2e140875mr2778338ejb.737.1646640608117;
        Mon, 07 Mar 2022 00:10:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyd6HS0bvQ2SwL7iCHkBfje+k5g6sDwg1lh8KmBe4nqnJ4FmOFFYvoqWBiy8wC//2osRBIahw==
X-Received: by 2002:a17:906:b6c7:b0:6db:2e14:875 with SMTP id ec7-20020a170906b6c700b006db2e140875mr2778324ejb.737.1646640607971;
        Mon, 07 Mar 2022 00:10:07 -0800 (PST)
Received: from [192.168.0.140] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id u4-20020a170906780400b006ce69ff6050sm4482993ejm.69.2022.03.07.00.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 00:10:07 -0800 (PST)
Message-ID: <9e4bd211-89e2-f7ef-735e-1d6bc9b795cd@canonical.com>
Date:   Mon, 7 Mar 2022 09:10:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/7] tty: serial: samsung: embed s3c24xx_uart_info in
 parent structure
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
 <20220307080852.53992-1-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307080852.53992-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/03/2022 09:08, Krzysztof Kozlowski wrote:
> Embed "struct s3c24xx_uart_info" directly as a member of "struct
> s3c24xx_serial_drv_data" instead of keeping it as a pointer.  This makes
> the code clearer (obvious ownership of "struct s3c24xx_serial_drv_data")
> and saves one pointer.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
> ---

I had SMTP troubles when sending so this one duplicated itself. Sorry
for the noise.


Best regards,
Krzysztof
