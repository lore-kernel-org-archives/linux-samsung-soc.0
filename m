Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D6EC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  6 Feb 2022 17:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344632AbiBFRj5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 6 Feb 2022 12:39:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344638AbiBFRjv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Feb 2022 12:39:51 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28D5C043188
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Feb 2022 09:39:50 -0800 (PST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6972C4003B
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Feb 2022 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644169189;
        bh=O2vA7wr1KPFYU+oEMCTxA6vrus8R+EX5FuB8VVDgV7c=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
         In-Reply-To:Content-Type;
        b=rgLJiZtTaSq6udYxixdLReQO3PiQZRK04s5NeBBLCHCQZkoaqTSBxZpJBZtelv3ZJ
         NfMVkT3dyW6TcFpkWagD0hZA/gH3A6Zc4aSUXo4r34reSvq3ZDko6eMkX6POCX/o9F
         y/v1aHgiSeQe4WBvjvv9nDQIiZO0+yojLOfHgUygKJLeIyZcUCaNX9c+G6vYxt2F3Q
         7UaViPdWRd5145rTOEWgMkXm7ujJLIRwCjh5OthrRvZpLjrFIN7h+Nc4I23JoCqh/b
         8sZf6q+M4IEUFiz/h8GC5glflgD8cBzIbaWqEMMVSNKjtIgmnGo10LmGy++OTUk+yk
         talUSW6bjf1Rg==
Received: by mail-wm1-f72.google.com with SMTP id r8-20020a7bc088000000b0037bbf779d26so1089742wmh.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Feb 2022 09:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=O2vA7wr1KPFYU+oEMCTxA6vrus8R+EX5FuB8VVDgV7c=;
        b=3Ze2pjIMz+qQhZixkrYu968AA519wN27gUAitSmSnUbBHDBBr9L7kVRedC86v3cpd5
         4SnCUfEhraLpur0gyhaNej2GalALW12phQXVHkasdlzeuSDeP6c4yeKvvI0dvAbSzcQD
         aDJfneVZIMxu6SLOZAzIVfTQz1vKGdHTXjRyuItiFvLZw5QG7v0Rfoe5iZjKndsINHyh
         3irBwT+VtO2kGo7TMDw4peTNNnSV+8N6bCf7LgDf3y1FXofxhOqXfK9UquKL8ehbVjQD
         CRDXZwp88YQq0c0ijEDisMbzDa309UNsuvF7GHglgIpaUn23lRE9XiocDtWeK+0FfAsM
         S6FA==
X-Gm-Message-State: AOAM530NQDjs8dVvzvgXgisLLOcMjgVIXeZNf7/w1fZtp7ST4eLGerEh
        Us2vfY8CQH46yh2whH9Wi827CtIT7mbPcaZzx6C8daz3iPqNmEv4CPbo7n1s3caVYLq4RABVQSF
        LktG+EY8kVLrymNibdJZfdfVHWSJy62+aLjWIBf3FcUtRsNAc
X-Received: by 2002:a5d:6da3:: with SMTP id u3mr4180463wrs.3.1644169189007;
        Sun, 06 Feb 2022 09:39:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyotauj4AZUDLVn7ZjdsCUkbRdn3TyGp68ino7AYP79PzHSXuQGwgWqBez9ydkl9pVGm9TudA==
X-Received: by 2002:a5d:6da3:: with SMTP id u3mr4180460wrs.3.1644169188876;
        Sun, 06 Feb 2022 09:39:48 -0800 (PST)
Received: from [192.168.0.86] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id o10sm1492735wrq.63.2022.02.06.09.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Feb 2022 09:39:48 -0800 (PST)
Message-ID: <1bebedb9-644f-783d-492c-84a5de91720d@canonical.com>
Date:   Sun, 6 Feb 2022 18:39:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/5] mfd/extcon/regulators: max77843: add
 dtschema/bindings
Content-Language: en-US
To:     Lee Jones <lee.jones@linaro.org>
References: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/01/2022 18:48, Krzysztof Kozlowski wrote:
> Hi,
> 
> The max77843 shares some parts with max77693 but it lacked bindings.  All
> its compatibles were undocumented.  Add basic bindings for max77843,
> matching existing devicetree.  These are not complete bindings, but
> rather reverse-engineered to match current state.
> 
> I do not have access to device with MAX77843, so if anyone else
> volunteers to be the bindings maintainer, please join.
> 
> Changes since v1
> ================
> 1. MFD: Use absolute path to schemas.
> 2. Regulator: mention all allowed properties,
>    additionalProperties=false, add min/max values for voltages and
>    current, don't use patternProperties when not needed.
> 3. extcon: Use absolute path to schemas.
> 
> Dependencies
> ============
> 1. Patch 1/5 (dts): nothing depends on it, sending here so Rob's automatic
>    checker won't complain about DTS.
>    I will take it via Samsung SoC tree.
> 
> 2. The patch 4/5 (mfd bindings) depends on regulator and extcon, so they
>    should come together (2+3+4+5).
> 
Dear Lee,

This patchset was reviewed and there are no outstanding issues. Could
you pick up patches 2-5 (skipping DTS patch) via MFD tree?

Best regards,
Krzysztof

