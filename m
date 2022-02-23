Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A80C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Feb 2022 08:24:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236066AbiBWIYb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 23 Feb 2022 03:24:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235019AbiBWIYa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Feb 2022 03:24:30 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1609945AFA
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Feb 2022 00:24:02 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CE97E3FCA8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Feb 2022 08:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645604640;
        bh=OUH0bTj/LUGqclp4FyWkS6uNhE/OcvDSgnjHRV7vNUM=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=Pu662HM8GUmsL6EFDuAtLgNF2UA3qqIBMwOkCpiDI33TPzmAXvAgmzsaPGtjQAadk
         meTtHVI/jsLtyb57vRqLLHIi40zP5iNj50bUDg+McoqjZTPbWvND61gMQEW37SZt+d
         1IPjlGyutmuNTPe27FuvUj72RFFsAj6zPimKwc/WWc8+AvmZKDsPnC/G9bwa1Cj2gu
         myBnB7yo5mmlSPtRChSHdio0Yd74EC89NyjkH6nusLOCpdXZIVY/m0eji35N9I6Hj5
         TfuJ+oajTc0KVOBZp3D12ZPq4rZ0hZ2J4lS3C1IPLn5Yo6VRXq9g82VOTns6DGT9X0
         PPYcit9npV3AA==
Received: by mail-ej1-f69.google.com with SMTP id d7-20020a1709061f4700b006bbf73a7becso6771678ejk.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Feb 2022 00:24:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OUH0bTj/LUGqclp4FyWkS6uNhE/OcvDSgnjHRV7vNUM=;
        b=8CMo+uNHe1UNAFRoHZ0tfyZdYGTI9fCW6RtASg4tSelcA9FIHWJ+VXH/e98L1yN3vO
         FKS5srlaQZn1lAa+owjOV4Yvt3HKGOB+efFapzzWkIEOgvWt1Lvb2SmaCrrCkUlJOuzX
         XzsDlTp/qsWQjjkxuK9yVyOFxRb6qLzUkCtSWVp8Ma7bSVBcQWK4WOWo7AZ+xkFC3Rhr
         2KaXUCNj1SwueZrLz4QlnZeEgjLXvcVLaOBsfXBdb0/D+q/bC0+eSLt0hulj8HMiIusm
         h7ZT/lbBs97h78yCYjRaOQk6CgkgvWtm0jVKVgwz/0ovO97ROEgKfkGtFF34xVf0UWSU
         edZQ==
X-Gm-Message-State: AOAM532SzWhALTwnlOx3x9HvaOez5MxnDbbl+9bTtN3bkLPTnEgNPkz5
        NIMBBpUncjw7kc7qgM5MXyLNynDw8XH+zTu7TWa3XT7G2zkGeMbWuMecxqYF7nJEwv3rsQBxFmr
        Yu9lLH/R5iZrFM3gwYEjMnB+R5TUV9CZVxBBaBIjlrgnFv+X1
X-Received: by 2002:a17:906:3109:b0:6cc:7a1:8db0 with SMTP id 9-20020a170906310900b006cc07a18db0mr22106113ejx.266.1645604640502;
        Wed, 23 Feb 2022 00:24:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmlOe0uOWGCSaW649hZ3pFA8AEz4z12SvTxoyLOxSd5Mf7R4zHsjAvMUopfEcfA/lfYgjr1A==
X-Received: by 2002:a17:906:3109:b0:6cc:7a1:8db0 with SMTP id 9-20020a170906310900b006cc07a18db0mr22106094ejx.266.1645604640319;
        Wed, 23 Feb 2022 00:24:00 -0800 (PST)
Received: from [192.168.0.125] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id p16sm1162411ejn.33.2022.02.23.00.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 00:23:59 -0800 (PST)
Message-ID: <968cf18e-af5c-0503-79b1-a622938d4e0a@canonical.com>
Date:   Wed, 23 Feb 2022 09:23:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/15] scsi: ufs: deprecate 'freq-table-hz' property
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        'Avri Altman' <avri.altman@wdc.com>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Andy Gross' <agross@kernel.org>,
        'Bjorn Andersson' <bjorn.andersson@linaro.org>,
        'Wei Xu' <xuwei5@hisilicon.com>, 'Nishanth Menon' <nm@ti.com>,
        'Vignesh Raghavendra' <vigneshr@ti.com>,
        'Tero Kristo' <kristo@kernel.org>,
        "'James E.J. Bottomley'" <jejb@linux.ibm.com>,
        "'Martin K. Petersen'" <martin.petersen@oracle.com>,
        'Jan Kotas' <jank@cadence.com>, 'Li Wei' <liwei213@huawei.com>,
        'Stanley Chu' <stanley.chu@mediatek.com>,
        'Yaniv Gardi' <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <CGME20220222150007epcas5p22f05e6c8e80a5ad18a9528cd0ead865d@epcas5p2.samsung.com>
 <20220222145854.358646-10-krzysztof.kozlowski@canonical.com>
 <0c8b01d8280b$868abc20$93a03460$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <0c8b01d8280b$868abc20$93a03460$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22/02/2022 17:44, Alim Akhtar wrote:
> Hi Krzysztof
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@canonical.com]
>> Sent: Tuesday, February 22, 2022 8:29 PM
>> To: Alim Akhtar <alim.akhtar@samsung.com>; Avri Altman
>> <avri.altman@wdc.com>; Rob Herring <robh+dt@kernel.org>; Krzysztof
>> Kozlowski <krzysztof.kozlowski@canonical.com>; Andy Gross
>> <agross@kernel.org>; Bjorn Andersson <bjorn.andersson@linaro.org>; Wei
>> Xu <xuwei5@hisilicon.com>; Nishanth Menon <nm@ti.com>; Vignesh
>> Raghavendra <vigneshr@ti.com>; Tero Kristo <kristo@kernel.org>; James E.J.
>> Bottomley <jejb@linux.ibm.com>; Martin K. Petersen
>> <martin.petersen@oracle.com>; Jan Kotas <jank@cadence.com>; Li Wei
>> <liwei213@huawei.com>; Stanley Chu <stanley.chu@mediatek.com>; Yaniv
>> Gardi <ygardi@codeaurora.org>; linux-scsi@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
>> msm@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-
>> soc@vger.kernel.org; linux-mediatek@lists.infradead.org
>> Subject: [PATCH v2 09/15] scsi: ufs: deprecate 'freq-table-hz' property
>>
>> The 'freq-table-hz' is not correct in DT schema, because '-hz' suffix
> defines
>> uint32 type, not an array.  Therefore deprecate 'freq-table-hz'
>> and use 'freq-table' instead.
>>
> May be once all the dts change migrate to using 'freq-table', just remove
> 'freq-table-hz' from driver.

At some point in the future 'freq-table-hz' parsing could be removed,
but now you have both old and new DTS, so it should stay. Also for DTB
compatibility.


Best regards,
Krzysztof
