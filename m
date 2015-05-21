From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: Update video-phy node with syscon phandle for Exynos3250
Date: Thu, 21 May 2015 11:04:28 +0900
Message-ID: <CAJKOXPcnYq0pS-akXNDd8TE6wqeq0pg-cx4PK0jeke9z3tHsOw@mail.gmail.com>
References: <1426762587-24923-1-git-send-email-b.michalska@samsung.com>
	<CAJKOXPfumy5a6A275ETy7vnztzE20qSuXD_i=ebY9Br47p93Dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f50.google.com ([209.85.216.50]:41570 "EHLO
	mail-vn0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754865AbbEUCE3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 22:04:29 -0400
In-Reply-To: <CAJKOXPfumy5a6A275ETy7vnztzE20qSuXD_i=ebY9Br47p93Dg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Beata Michalska <b.michalska@samsung.com>, kgene@kernel.org, kishon@ti.com, s.nawrocki@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

2015-05-21 10:57 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
> 2015-03-19 19:56 GMT+09:00 Beata Michalska <b.michalska@samsung.com>:
>> As a follow-up to recent changes to Exynos mipi video phy
>> driver, introducing support for PMU regmap in commit
>> e4b3d38088df6f3acd40 ("phy: exynos-video-mipi: Fix regression
>> by adding support for PMU regmap") add a syscon phandle to
>> video-phy node to bring back to life both MIPI DSI displays
>> and MIPI CSIS-2 camera sensors on Exynos3250.
>>
>> Signed-off-by: Beata Michalska <b.michalska@samsung.com>
>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
> Tested on Gear 2 (Exynos3250) board.

Oh, I was too fast. It seems that "reg" property is not needed
anymore. Can you remove it?

Best regards,
Krzysztof
