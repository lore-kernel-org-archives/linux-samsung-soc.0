From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 7/8] ASoC: samsung: Add missing #sound-dai-cells
 property documentation
Date: Wed, 07 Feb 2018 17:37:33 +0100
Message-ID: <5d525a1a-b7a7-8b90-97f9-a59c9e361509@samsung.com>
References: <CGME20180205154533epcas2p2d0ed58188cf7f29751c08cd804f6fb0d@epcas2p2.samsung.com>
        <20180205154403.13520-1-s.nawrocki@samsung.com>
        <20180205154403.13520-8-s.nawrocki@samsung.com>
        <CAJKOXPc_NUa2worczHpm4VoTY9Do1-Gq4-711kLz7W0qowTeGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51076 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754347AbeBGQhm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Feb 2018 11:37:42 -0500
In-reply-to: <CAJKOXPc_NUa2worczHpm4VoTY9Do1-Gq4-711kLz7W0qowTeGQ@mail.gmail.com>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jcsing.lee@samsung.com, sbkim73@samsung.com, linux-kernel@vger.kernel.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 02/06/2018 02:02 PM, Krzysztof Kozlowski wrote:
> On Mon, Feb 5, 2018 at 4:44 PM, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>> The #sound-dai-cells property might be helpful in selecting primary
>> or secondary CPU DAI and it's already present in i2s nodes for some
>> exynos SoCs so let's add it to the DT binding documentation.
>
> The description above looks like you are documenting existing optional
> property but you added it as a required property.

Actually, it would be better to have it as a required property, but
that could be done with any new device bindings. For the exisitng ones 
I will move this property to the "Optional SoC Specific Properties"
paragraph.

-- 
Regards,
Sylwester
