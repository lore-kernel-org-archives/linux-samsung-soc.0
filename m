Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C46C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Mar 2022 07:07:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240042AbiCJHIW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Mar 2022 02:08:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240047AbiCJHIS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 02:08:18 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 853C2131132
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Mar 2022 23:07:16 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4EBD33F312
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Mar 2022 07:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646896035;
        bh=6p/D+Bc/qqmeMKK+FRdwTSZQdroM/n8bZhOT25VprHM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=XbV8zWV9qJpG+7aItlKbTcv+BYgARY4Hx16Z5QxZ1Vq6E7LTk4xBItldPHkwUJB8H
         tziGEcLKGOX/ClFB6NsHd6G0A3nG6rzP8utcfKiCHkTGnD+V/BfwUOHLz3KuxF7qKD
         GN5cAArsQFE+ZpB7OWpe2ztST3AA1VBCrlfxE2Uf+cwkkHxj3Tz+6RwS7Sccl+oEwG
         onQvTZveo1gZ5diOammmBNpapJjYa/LI13fpkjDOsUXd6FHpDVxZWVT0IDolQIL+Sc
         XHaw4BmivVnvDDdMcBiRB4F5p1MuelyE5EyjG1hOkpF3rQFF+AzoVI1hcVUPaWOS12
         FHfFvLHOaINAQ==
Received: by mail-ed1-f69.google.com with SMTP id b9-20020aa7d489000000b0041669cd2cbfso2574191edr.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Mar 2022 23:07:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6p/D+Bc/qqmeMKK+FRdwTSZQdroM/n8bZhOT25VprHM=;
        b=GAXhHEknLC057fmwi3zlEW1hqB7gml/bX7l5/WeGt6mwYIIOEjlspg0uPqroFqx41S
         espV2cy0XaSGiqtOT1HB8/xjtLINhEoR8vlygyGRVhKyeJRkyOT/S9I1AxGHwpfsq60K
         QfBpK3L4Y3ro0BPDeVpVZtz+UcYCq1YLf43zcZ6/gyNBpQ/Y4PiV7TnBlpXOOKsM+TS8
         zKQNcMZ4imPDcx5UoamnW+5OrZ1YZ4XKyt16Oc6+eUM7Q60wDyWbcV2CzFRaOa0bfZBI
         BqyZ0+mWSTq0Vu0iqh9QDujoubjae+QsJxp+5racMrJlP7E83EDXBcgGCr/sotVnJceH
         kyng==
X-Gm-Message-State: AOAM532E9uDELimrk2S2Re1kHYignKATUQ9FKNCKHxEtDKFuhOnuGsd/
        WP2+SF3YCtbfzzO/rrIJ+NnInLVhC6BL7yPM9IUM5yjk8CfSCki4JvQkB2gd4LtmVQ8Y73GgyHT
        t58kkhD4KryMBqOPnt7dHf1ELVoDGE1jIv2z0Qr1/xJtLqeZZ
X-Received: by 2002:a17:906:2a92:b0:6cd:4349:dc1a with SMTP id l18-20020a1709062a9200b006cd4349dc1amr2935080eje.648.1646896034841;
        Wed, 09 Mar 2022 23:07:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZQqV4+JLCJnqqzlEYSJJui8mweQhJgkoLXyXvqcczf2LMXmsaFlGI/RYma6UcVMLsfxt9MQ==
X-Received: by 2002:a17:906:2a92:b0:6cd:4349:dc1a with SMTP id l18-20020a1709062a9200b006cd4349dc1amr2935064eje.648.1646896034627;
        Wed, 09 Mar 2022 23:07:14 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id m25-20020a170906161900b006d43be5b95fsm1505876ejd.118.2022.03.09.23.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 23:07:14 -0800 (PST)
Message-ID: <7a5f8296-be69-6dac-fed2-45dc2b85e1d6@canonical.com>
Date:   Thu, 10 Mar 2022 08:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] dt-bindings: thermal: Add artpec8 compatible string
 for exynos-thermal
Content-Language: en-US
To:     hypmean.kim@samsung.com, "bzolnier@gmail.com" <bzolnier@gmail.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "amitk@kernel.org" <amitk@kernel.org>,
        "rui.zhang@intel.com" <rui.zhang@intel.com>
Cc:     "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220310013140.127026-2-hypmean.kim@samsung.com>
 <20220310013140.127026-1-hypmean.kim@samsung.com>
 <CGME20220310013129epcas3p1110cbdfbd3d72ade45b8d98433ca0aac@epcms2p4>
 <20220310015318epcms2p42622831ee212753057763d946282bef7@epcms2p4>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220310015318epcms2p42622831ee212753057763d946282bef7@epcms2p4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/03/2022 02:53, Sang Min Kim wrote:
>  
> 
> Extend the exynos-thermal dt bindings document to include compatible
> 
> string supporting artpec8 SoC.
> 

Please resend without HTML. Use git to create and send patches.


Best regards,
Krzysztof
