From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: Re: [PATCH 2/2] crypto: s5p-sss: Add HASH support for Exynos
Date: Wed, 25 Oct 2017 17:26:28 +0200
Message-ID: <3aa6f120-cd5a-ee4e-317c-133f0c91f05d@partner.samsung.com>
References: <20171025145746.9712-1-k.konieczny@partner.samsung.com>
        <CGME20171025145805eucas1p13412c8e28388c2323ccc3d104ccbfc64@eucas1p1.samsung.com>
        <20171025145746.9712-3-k.konieczny@partner.samsung.com>
        <82a1fda5-d60b-2b79-033b-c9c1055aee4b@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41134 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751374AbdJYP0d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Oct 2017 11:26:33 -0400
In-reply-to: <82a1fda5-d60b-2b79-033b-c9c1055aee4b@mleia.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Vladimir,

On 25.10.2017 17:09, Vladimir Zapolskiy wrote:
> 
> thank you for updates, everything looks good from my point of view.
> 

Thank you for your work, I am still newbie, I forgot 'v8'
and to: linux-crypto :( 
So I will resend this patch series with improved title 
and your Ack added.

> On 10/25/2017 05:57 PM, Kamil Konieczny wrote:
>> Add support for MD5, SHA1, SHA256 hash algorithms for Exynos HW.
>> It uses the crypto framework asynchronous hash api.
>> It is based on omap-sham.c driver.
>> S5P has some HW differencies and is not implemented.
>>[...]
>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
>> ---
> 
> I won't linger this time :)
> 
> Please feel free to add 
> 
> Acked-by: Vladimir Zapolskiy <vz@mleia.com>
> 
-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland
