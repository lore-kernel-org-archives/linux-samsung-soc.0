Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7211C6FA99
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 18:33:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbjCLSdw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 14:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbjCLSdd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 14:33:33 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3327012BF2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 11:30:40 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id j11so40230471edq.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 11:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678645772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uklOMUJVS+u74q2lNQ2L3Oa76MwPD6cKkPZXD0PzvOk=;
        b=BumR+9k0EaadI1IgYmXc+rwPYkQvm47PndRlmx8tM60dEp4CxcHQVluZxo+sLYNHss
         /Ws59s0tWohVYn7SLx9YEfxkBX0Zf+Bzo1eshtH7kXR7K0a4ZwTqtxj+2l1YDux/5mIn
         Vd0wUqJdFdQVqKET+DVm7odEbhjAQ+mRBeT9UA4vuFdj0ZrgiEH19I8BLZNYayAD6KD1
         LgvjxxPhLJe4h3Ww/ILseqltlRTwQ4jMa+lyntg0i/vMCDS0Q80AfvM7m868GiD7CqfU
         S+cmJND/RtB9G0EmqWbMujksVQVwmvc/Kog9npwyjOnd0AsBydteY+eDKu1WdjTIH7N1
         4tyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678645772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uklOMUJVS+u74q2lNQ2L3Oa76MwPD6cKkPZXD0PzvOk=;
        b=NyCOT3sV8uY6S666dXvQpCeGA5YM74iksldIOX1XkCI1xoh4YD1BJUFXsienQgyPwf
         WJUlHQMDiPIVq8+vGYOD1PuXySuyR5GPPJtoypkTsgJH7dNXJUjY0FL0bx0KgdgnF0ZW
         6R29EC1Kuvbsq9v+VYeAFJIDSYSPKQrbT95XFMmKEG1HNCBhXjwXdew3Qx/qMzjEMYH5
         oM41+kRDyYdqRquNjJplvC+JHjbAkb/AbDJBN8DVcXZxMHjSaNyuH9SlcEv5RQ3lYj5g
         UGdoigkm5qDYu6DEg1F09+vtJacnG+xl99b8qc1LbOnW2ZWM7rp2DjdowmM7OCHl2KjW
         gR9Q==
X-Gm-Message-State: AO0yUKVtefAnDad4UL8umCP3qtV7kMaG7fm1xPDe326ewXM4mWJyIffO
        vwozGyez3DYQTcFpWNvXWEJ46P2EzRNDv3CUdHk=
X-Google-Smtp-Source: AK7set+wLPwfiYTBJKHeb6798JXdZToZ1wN8CLYiuEE03LcKlvgRWrhC81BlP33K3TpRYzt56OBfGQ==
X-Received: by 2002:a17:906:1604:b0:8af:7b80:82ba with SMTP id m4-20020a170906160400b008af7b8082bamr30601317ejd.20.1678644712043;
        Sun, 12 Mar 2023 11:11:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id b18-20020a17090636d200b008d0dbf15b8bsm2441348ejc.212.2023.03.12.11.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 11:11:51 -0700 (PDT)
Message-ID: <f0f6d714-f35c-fa53-f9bf-44cd4baa4aea@linaro.org>
Date:   Sun, 12 Mar 2023 19:11:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/3] dt-bindings: exynos-dw-mshc-common: add exynos7885
 variants
Content-Language: en-US
To:     Sergey Lisov <sleirsgoevy@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1678644516.665314-1-sleirsgoevy@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1678644516.665314-1-sleirsgoevy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/03/2023 18:58, Sergey Lisov wrote:
> Some Samsung Exynos boards using the arm64 architecture have DW MMC
> controllers configured for a 32-bit data bus but a 64-bit FIFO. On these
> systems the 64-bit FIFO registers must be accessed in two 32-bit halves.
> 
> Add two new compatible strings, "samsung,exynos7885-dw-mshc" and
> "samsung,exynos7885-dw-mshc-smu" respectively, to denote exynos7885
> boards that need this quirk. But it's very possible that all
> "samsung,exynos7-dw-mshc" boards are actually affected.

And now this is third copy of the same email. This is not acceptable.

Best regards,
Krzysztof

