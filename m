From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt/bindings: exynos-rng: Move dt binding documentation to bindings/crypto
Date: Wed, 23 Aug 2017 12:17:44 +0200
Message-ID: <CAJKOXPeMAtQWBqM9d8qzQb6X8rON=cmuEe1vhAC8op9YykZW8w@mail.gmail.com>
References: <20170822161050.24610-1-prasannatsmkumar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753677AbdHWKRq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Aug 2017 06:17:46 -0400
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com [209.85.223.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DAE9721A1C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Aug 2017 10:17:45 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id g71so5734328ioe.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Aug 2017 03:17:45 -0700 (PDT)
In-Reply-To: <20170822161050.24610-1-prasannatsmkumar@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Cc: kgene@kernel.org, linux-samsung-soc@vger.kernel.org

On Tue, Aug 22, 2017 at 6:10 PM, PrasannaKumar Muralidharan
<prasannatsmkumar@gmail.com> wrote:
> Samsung exynos PRNG driver is using crypto framework instead of
> hw_random framework. So move the devicetree binding to crypto folder.
>
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> ---
>  Documentation/devicetree/bindings/{rng => crypto}/samsung,exynos-rng4.txt | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/{rng => crypto}/samsung,exynos-rng4.txt (100%)
>
> diff --git a/Documentation/devicetree/bindings/rng/samsung,exynos-rng4.txt b/Documentation/devicetree/bindings/crypto/samsung,exynos-rng4.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/rng/samsung,exynos-rng4.txt
> rename to Documentation/devicetree/bindings/crypto/samsung,exynos-rng4.txt

You also need to update the path in MAINTAINERS file.

You missed to CC relevant crypto folks. Probably because of the reason above.

Best regards,
Krzysztof
