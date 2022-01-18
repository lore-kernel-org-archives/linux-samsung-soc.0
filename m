Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED22C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:34:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348078AbiARSeq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:34:46 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:43482
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347934AbiARSeg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 13:34:36 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DB2B440050
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 18:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642530874;
        bh=2sNtXURDOFY5YeHmaa+6rq6KkuL9DgoBnkrsKI2ksQ0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=l/Hh+RMsZtGyHItbDR2fsiBaTCC/8CfNMqfDuIy3prCMnSQ8sm1OXEKPtNvWNO46P
         8SVoD7etnfLKxa+rFUElRbUE9lxYqhVYcOe7jcm3nLA9F/wl8g3GVqkQYVOJEjl0yx
         +C1bY4JPj9TqavLtDYlFbbr/0iJ5C4FX5PEdYLkDn4zLD58UKuXgrUhmInSZ7bDuBn
         rzB2v6HoX2TWY01MSQS3pPzxZ7E8OkGghp3DkQ7DYJmE49clugrP8LErtsh+4eKAJt
         vAw4OLZVVd4VftsdhSeFYpNpsUksvArL/Ro+3pC0Zk3+ZX9Bt8y7IfrOUJsD1GyNly
         OVgDN7fm4sZXA==
Received: by mail-ed1-f71.google.com with SMTP id j10-20020a05640211ca00b003ff0e234fdfso17901754edw.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 10:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2sNtXURDOFY5YeHmaa+6rq6KkuL9DgoBnkrsKI2ksQ0=;
        b=XERoF8CzyC7j61gGQbo777D2WulO5nxu5CUDiVzTn0QGck6BeCDVnDH9KcDwCYHjaN
         iX9yTQkUz+qH5OidrSsAyM/ee4SrregviBNO9GVnGsgFcJ4V/eR5zLn6guiRvzK/P+Tc
         FQZ5g7UpeBpodkhG/fQ9pcze4UoZ3qWIMCw3Of9IVV3bRC9sWsQqGa4UhqdwzZtBXesf
         p53s7z78baymew+KB6ieIiOQYwAp5+dk3LoLv+p8UH27VZ5Rr6r/qnQxjyxzhGSsWbTv
         tN3A3cNPqiR0vomCEh7tsyx6KwtLre6KESUsxD5DryRY//T68M9xSxr7iKNOeZAkylz/
         g6Aw==
X-Gm-Message-State: AOAM530rOgVzLCCgrlXnalgYGhJdiVpBDQbMDVNd5sVX0P5pH39OlXOR
        66Jdtv+nUUmNtiGhQAP2pAfFZn3SM4oS952g4VoaNFwIkMi8c1zutGkQprrUfWj/Y5pb0lrtDFi
        5AYcqvS67Id1RsdNtFwqCeFNqiFg+vYBh8lWzOqBMy0+hG0mC
X-Received: by 2002:a50:d69e:: with SMTP id r30mr1416878edi.284.1642530872196;
        Tue, 18 Jan 2022 10:34:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFfk4qysqwQQ+JBGYnqeMFUI+XaHpezXkBv6eaAh0acQ0crMg2NxWfal3ZD4TuQozsNPJjAA==
X-Received: by 2002:a50:d69e:: with SMTP id r30mr1416854edi.284.1642530872062;
        Tue, 18 Jan 2022 10:34:32 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id l10sm5590235ejh.102.2022.01.18.10.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:34:31 -0800 (PST)
Message-ID: <3c400f9f-9d02-050e-cf21-c3376bf15127@canonical.com>
Date:   Tue, 18 Jan 2022 19:34:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 06/16] clk: samsung: fsd: Add cmu_fsys0 clock
 information
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Shradha Todi <shradha.t@samsung.com>,
        Jayati Sahu <jayati.sahu@samsung.com>,
        Ajay Kumar <ajaykumar.rs@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150037epcas5p1624361eb48fa14cdf9ed88de6f890db4@epcas5p1.samsung.com>
 <20220118144851.69537-7-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-7-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/01/2022 15:48, Alim Akhtar wrote:
> CMU_FSYS0 block has IPs like UFS, EQOS, PCIe etc, lets add
> the related clock information for the same.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-fsd.c | 302 ++++++++++++++++++++++++++++++++++
>  1 file changed, 302 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
