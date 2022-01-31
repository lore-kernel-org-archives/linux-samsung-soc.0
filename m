Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971D8C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jan 2022 08:54:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348151AbiAaIyD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jan 2022 03:54:03 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38148
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347238AbiAaIyC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jan 2022 03:54:02 -0500
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8F2453F308
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jan 2022 08:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643619241;
        bh=Nw4J5FSO0/NGyfqa9gmpjIM7NtP91GXWHGgvWMRkq1I=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=IUl201egHHisqQmietg/NqmPuNoswDoqYO0Ff0sKASmJjKry18kDkcUJdqCnSP3AS
         bFn6dOfVeuqNh4dlrINdXv1WPYnKvNe9aELr3HofmAe7Cit1hpAs5OjErE13HCEavk
         G8tEE8Szg04BvSY4NATn3F58+eTDwcOKc8t0Qry++fdycLbO7Jv45Qq/57rRR5BK1F
         bOAdBLbS214I/ecdPWmUj/xQ2YTSVHCM5CendkCSwAv+qvgrfI9iS5HOwUvPPVcGIZ
         gqX3Njrgov34POwqN+6qaAw0GLS76f1EfKbHqzZQeVRbpnKqovdYMXVyTUDgHWKi9l
         XNTQQm4CH4E0Q==
Received: by mail-ej1-f69.google.com with SMTP id o4-20020a170906768400b006a981625756so4740774ejm.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jan 2022 00:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Nw4J5FSO0/NGyfqa9gmpjIM7NtP91GXWHGgvWMRkq1I=;
        b=fjEzo0NyqurAXajNO/l/3R2d7tSsVJFUCdnDMJvUww6+Ibu9/mRxEgNhHpVo4wigeB
         5FKG0gkOa0fVhieChlEdP42zgYEuct3n7G8srV73iAsTDTe6x2ahfQET4eynfYrpn6s6
         wT/ax0D68BqtDZ30y+reypFR5JRXFtJdOoK7hGlTQ7n1homtf8XesPucnTnNeR6VxhhJ
         9JR1cuf6mdcygtt3EHdz3LD7o8V6NcIhgvSZvv3hmJNXtDhTzMQAIsaZZpJvvHXxH0ZU
         lViLTizjfKmnqPbbK+DqsKwhUnjCGuX0IvKPXCv4XNh4Mu5E7KWAhXGBK6kkJpz+DUaY
         SvLg==
X-Gm-Message-State: AOAM532WRw9WFhoq3A637mu7d7IZgPxQZrgRHGChsOJ+fTAHiVi25NLu
        upsoeXoiODad7C/jcSG7gTd2wc6Z7HaZFFplLNM78Rj7FkEnpZpKe70uQM4AVhSKh59BWvCOJ7s
        jX+dK6tcGEJ7O6vGqN1rK1se3uh898jxfCV5i/go+TuE5WnP5
X-Received: by 2002:a17:907:8a1b:: with SMTP id sc27mr7678214ejc.300.1643619241258;
        Mon, 31 Jan 2022 00:54:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzi61kssgqB4iIEvZMFNY8TmBwEuHgoyp4eoG0qGYq2fPVOjqOPm5AcjRhPA7u3o1xiyozJ/Q==
X-Received: by 2002:a17:907:8a1b:: with SMTP id sc27mr7678201ejc.300.1643619241094;
        Mon, 31 Jan 2022 00:54:01 -0800 (PST)
Received: from [192.168.0.71] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v15sm17357839edq.35.2022.01.31.00.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 00:54:00 -0800 (PST)
Message-ID: <131c9bd9-b035-8a75-ca27-f9c2b3993566@canonical.com>
Date:   Mon, 31 Jan 2022 09:54:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ARM: dts: add 533 MHz step to p4note GPU opp table
Content-Language: en-US
To:     =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220129221452.GA36524@adroid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220129221452.GA36524@adroid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 29/01/2022 23:14, Martin Jücker wrote:
> The p4note devices support 533 MHz GPU speed, so let's make use of it.
> 

If there is going to be resend, please add prefix "exynos:" in subject.
Just like other commits (git log --oneline arch/arm/boot/dts/exynos*).

> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> ---
>  arch/arm/boot/dts/exynos4412-p4note.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
> index 4ae6eb3091c4..d277b2337ae0 100644
> --- a/arch/arm/boot/dts/exynos4412-p4note.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
> @@ -355,6 +355,13 @@ &gpu {
>  	status = "okay";
>  };
>  
> +&gpu_opp_table {
> +	opp-533000000 {
> +		opp-hz = /bits/ 64 <533000000>;
> +		opp-microvolt = <1075000>;
> +	};
> +};

This looks like Exynos4412 Prime. Please check also CPU frequencies and
if they match, just include exynos4412-prime.dtsi (like Odroid U3).

> +
>  &hsotg {
>  	vusb_a-supply = <&ldo12_reg>;
>  	dr_mode = "peripheral";


Best regards,
Krzysztof
