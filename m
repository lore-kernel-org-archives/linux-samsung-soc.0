Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20341C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Mar 2022 07:07:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234164AbiCJHIC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Mar 2022 02:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240004AbiCJHHy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 02:07:54 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ADC41301A6
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Mar 2022 23:06:51 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F36E13F4BC
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Mar 2022 07:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646896004;
        bh=pjDcjqvWwdimhut7heTvSMtYMfEdm4Tu45ZKmgOV7iM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=iMhjFe2qiLDbkHYJU3GHsHriUfr7H8PSbgwOqidJHSdA+JKfsDVYT58fFLdjyTzPL
         MbXVC5r90/nw/NoGt0DiA5EAZroIJkAxiX7Kt2G6+1pvGoCxsAIdUWCHSFfKFBZl7e
         sP+VqYEP+3F+QPv8PcpC79r+haq1t88A2ypoaJEwvh0q5s/39DkWBqIpD8fPtDz1I/
         jSLfvVYuI0p80d8ema+JBMe/j3wZKRUbIVNGP7RznUxMNzB5oD6nC5cp9Lk6BECkMU
         2udLr7rA1tG8XpEY8FYyLmnrHDJSSqL8H3XxeEUqHAlXgNciXBfDFUeMh5Mckh8gGP
         JCG9MAtCadD0Q==
Received: by mail-ej1-f71.google.com with SMTP id k16-20020a17090632d000b006ae1cdb0f07so2591658ejk.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Mar 2022 23:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pjDcjqvWwdimhut7heTvSMtYMfEdm4Tu45ZKmgOV7iM=;
        b=tqkoFJqnyl7CuEOPwaLLWfKck/axpxWbcWiewaCZcc/qLK+dQdQJs3a8oJOSMnIHaa
         U14MQj+mxmBGjxXe5x4EPG7PGnW/Ifij2XDl0dm8Z/Ec/AlK4rdT0kwZmDykVRv04tVM
         646CbicE1Te53h0N39voceU7VXipBZKSwiCGcj4Wt6RhFgk+JYqsug7D2absLQgGdipt
         23MIYS10o7y/QGnLSBN5P+MQPQP89b5Fr/vO595U6qR0XoekrJZkEa2XaxeVTZDJmyIs
         THjbKgkcJeYhWGNgthRvqWC6OhQOL02J1KTSbHB5VytuEAZtcNpK1amxE2GHhoqG134B
         piuQ==
X-Gm-Message-State: AOAM5303EuGy+ubaZYKeCJ46R3Fi6tb1hjtJJlHK90qdG7tLxuSStxpp
        QZaoKlV41ZSFDHDwFLdkor4BRzqXTyXueND2SDtbe2GWHssOGiL6QRRFcBBPucmDwfKXIKtSdUl
        hZsd8BpbM9P6bg8+lXI4Srqs4euJFmzfuU6cPccZj4emrIEcy
X-Received: by 2002:aa7:c789:0:b0:413:605d:8d17 with SMTP id n9-20020aa7c789000000b00413605d8d17mr2975159eds.100.1646896003288;
        Wed, 09 Mar 2022 23:06:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYlrNfPdQVnGvzey4MCLdIxRsL5wg+KaBPH40tvaqpWz00KbkDX2/VWP4tuc0tLXFyHzkXtA==
X-Received: by 2002:aa7:c789:0:b0:413:605d:8d17 with SMTP id n9-20020aa7c789000000b00413605d8d17mr2975146eds.100.1646896003137;
        Wed, 09 Mar 2022 23:06:43 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id a9-20020a1709066d4900b006da888c3ef0sm1482181ejt.108.2022.03.09.23.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 23:06:42 -0800 (PST)
Message-ID: <4cd1b54c-f51a-b013-2683-533e4ea31f76@canonical.com>
Date:   Thu, 10 Mar 2022 08:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/3] Add support for artpec8 to samsung tmu
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
References: <20220310013140.127026-1-hypmean.kim@samsung.com>
 <CGME20220310013127epcas3p3f1b7ab9549b1d6d9da65c73adda5c514@epcms2p6>
 <20220310015302epcms2p6ba3fd122f7ebfb9121924109a85801d2@epcms2p6>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220310015302epcms2p6ba3fd122f7ebfb9121924109a85801d2@epcms2p6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/03/2022 02:53, Sang Min Kim wrote:
> These patches are to add thermal management uint to artpec8 SoC.
> 
> The tmu of artpec8 is derived from the tmu of exynos, but it includes settings
> 
> specialized for artpec8 SoC, such as supporting multiple remote sensors.
> 

Do not send emails in HTML. The patchset was partially rejected by
mailing list, so you need to resend.


Best regards,
Krzysztof
