Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF4DC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Feb 2022 09:15:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239222AbiBWJQJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 23 Feb 2022 04:16:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239216AbiBWJQI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Feb 2022 04:16:08 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF6F811B9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Feb 2022 01:15:41 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 78CA73FC9E
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Feb 2022 09:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645607739;
        bh=6E8LpkVcd+7AGHgdYAkEZe+ycoMDPekcdYSjpmTWlKw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=KIXEMAa8AuF6uaZuxLF89QrDNcDSiK7303EAvONki2SEBK2NNwx0dITeyAELIkpyG
         AmIJ93e1HPuVe0N7EwPQ/VL2o8mvrcosADmRIqQCUjJCAix7Teih5K/tO+NxhYferB
         VxPk8kgA1W53woe5lPRkcTD3dI7r2LYZ5HcNHiCir48pYAYmOxet9JVjFktHvbH3Ij
         IQ9+yEHVuAloLX1dnIEpHsPXzzCmd0Vn3zFQ2QgZz6Ftkn9I0HrGOqRult3Zlw2vjf
         fcU/o6OqT37ebenFg9YfB6hAdXUegxIhviTSxdLAGDhUdGVeAHUWLtGkarnOo2W5Ov
         A322L2UPSkMBQ==
Received: by mail-ej1-f71.google.com with SMTP id la22-20020a170907781600b006a7884de505so6856674ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Feb 2022 01:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6E8LpkVcd+7AGHgdYAkEZe+ycoMDPekcdYSjpmTWlKw=;
        b=mj6qDPvG2LMHkfKIbH5+JdLur8B+h5Pq0LR2XAGnk9Gan2Q3V9s1INz9j6G4lqObZf
         zO6V+uANixNLpKwH+CcB1Lu0QaUqCLPd/iDGTs9eDRpvnZG7Fnot1ucdhItFbk4Ak1N5
         7Kd/L5AgZNBMksHbKsYro0+RlygkSy/mUYQFHK7ZitXHOA1H2y6HEYxL4JAfe1W689sK
         8DGW+mqD0wUzE3qIwu7Dq1S7yr9OUPclVzJANRr+CZznXBwIU/zK6UScxR19yZILN9Wi
         I8FlDlE3Bx1foAlWqUOuKqbUfNdjDd65ZoHd+mKPKhTZrza5TiS88A2iRxcsIjvlBqnH
         4IEw==
X-Gm-Message-State: AOAM530dO19g4VAlnOz8qVniOikdsrxAQ+dGg8rmZtr5AdTm8WCNdIjO
        umHzqLsT1ii8QVcZUNfEyXp/QUvvcl9gHpjde70lskrqGDolG8w1g9V/0C47Zj5RXeint+JX/+l
        F0yT/it+5t1YCB0WewOvn2GU1bc8VGr4ZEhTPPC0rnZr0CMnD
X-Received: by 2002:a17:906:a2d7:b0:6d3:45dd:bdf0 with SMTP id by23-20020a170906a2d700b006d345ddbdf0mr4297307ejb.104.1645607738039;
        Wed, 23 Feb 2022 01:15:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+9RnhMOLjSidBg/q3fUtt63PE3LgnR/AR0rH4GmRR5w77qD1Ua2aWMA7kqobhEoIkxmVgRg==
X-Received: by 2002:a17:906:a2d7:b0:6d3:45dd:bdf0 with SMTP id by23-20020a170906a2d700b006d345ddbdf0mr4297297ejb.104.1645607737804;
        Wed, 23 Feb 2022 01:15:37 -0800 (PST)
Received: from [192.168.0.125] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id el5sm10993751edb.71.2022.02.23.01.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 01:15:37 -0800 (PST)
Message-ID: <455a8a87-63e7-7864-f765-142be18d1fa8@canonical.com>
Date:   Wed, 23 Feb 2022 10:15:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/15] scsi: ufs: deprecate 'freq-table-hz' property
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-10-krzysztof.kozlowski@canonical.com>
 <YhUodbzxx4wbr+gy@ripper>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YhUodbzxx4wbr+gy@ripper>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22/02/2022 19:16, Bjorn Andersson wrote:
> On Tue 22 Feb 06:58 PST 2022, Krzysztof Kozlowski wrote:
> 
>> The 'freq-table-hz' is not correct in DT schema, because '-hz' suffix
>> defines uint32 type, not an array.  Therefore deprecate 'freq-table-hz'
>> and use 'freq-table' instead.
>>
> 
> Patch looks good in itself, but why don't we use opp-table to describe
> the performance states?
> 
> In particular looking at the two columns of frequencies for various
> Qualcomm boards they require different performance-states.
> 
> A concrete example is sm8350.dtsi, which specifies 75MHz and 300MHz as
> the first frequency pair. The lower level requires the VDD_CX power rail
> to be at least &rpmhpd_opp_low_svs, the higher frequency has a
> required-opps of &rpmhpd_opp_nom.
> 
> 
> As this isn't possible to express in the current binding we've just been
> forced to always run at a higher voltage level and kept this in the todo
> list.
> 
> But rather than migrating freq-table-hz to freq-table and then having to
> introduce an opp table to express the power constraints, could we
> perhaps skip the intermediate step?
> 
> Or would you have any other suggestion about how we can represent the
> required-opps level together with the freq-table (if that's what we want
> to stick with).

Usage of OPP tables is interesting solution. It would solve your problem
of power rail levels. This would need several opp-tables - one for each
clock, which is not a big problem.

The problem is that I do not have any UFS hardware (none of my Samsung
Exynos boards have UFS... I don't have even arm64 Exynos chips :( ), so
implementing it theoretically will be painful.
OTOH, I believe that having a working dtschema is very useful. Having
dtschema without errors/warnings is even worth some churn/intermediary work.

The intermediary work is also not that big. Once proper OPP is
implemented, we will have "just" two deprecated properties in the bindings.

Best regards,
Krzysztof
