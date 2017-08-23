From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Subject: Re: [PATCH] dt/bindings: exynos-rng: Move dt binding documentation to bindings/crypto
Date: Wed, 23 Aug 2017 20:21:34 +0530
Message-ID: <CANc+2y6QzM_6zQgwgUP7jRAN6qptphF_RxYG=Ufdq5YQN9YVEw@mail.gmail.com>
References: <20170822161050.24610-1-prasannatsmkumar@gmail.com> <CAJKOXPeMAtQWBqM9d8qzQb6X8rON=cmuEe1vhAC8op9YykZW8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:37455 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754090AbdHWOvf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Aug 2017 10:51:35 -0400
Received: by mail-io0-f196.google.com with SMTP id m40so191376ioi.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Aug 2017 07:51:35 -0700 (PDT)
In-Reply-To: <CAJKOXPeMAtQWBqM9d8qzQb6X8rON=cmuEe1vhAC8op9YykZW8w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 23 August 2017 at 15:47, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Aug 22, 2017 at 6:10 PM, PrasannaKumar Muralidharan
> <prasannatsmkumar@gmail.com> wrote:
>> Samsung exynos PRNG driver is using crypto framework instead of
>> hw_random framework. So move the devicetree binding to crypto folder.
>>
>> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/{rng => crypto}/samsung,exynos-rng4.txt | 0
>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>  rename Documentation/devicetree/bindings/{rng => crypto}/samsung,exynos-rng4.txt (100%)
>>
>> diff --git a/Documentation/devicetree/bindings/rng/samsung,exynos-rng4.txt b/Documentation/devicetree/bindings/crypto/samsung,exynos-rng4.txt
>> similarity index 100%
>> rename from Documentation/devicetree/bindings/rng/samsung,exynos-rng4.txt
>> rename to Documentation/devicetree/bindings/crypto/samsung,exynos-rng4.txt
>
> You also need to update the path in MAINTAINERS file.
>
> You missed to CC relevant crypto folks. Probably because of the reason above.
>
> Best regards,
> Krzysztof

Missed it. Will send a v2.

Thanks,
PrasannaKumar
