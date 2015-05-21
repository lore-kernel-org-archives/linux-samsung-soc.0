From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] ARM: dts: Update video-phy node with syscon phandle for Exynos3250
Date: Thu, 21 May 2015 09:25:45 +0200
Message-ID: <CABxcv=npaHemH_KcYgGf-_x8Bo=V2UMDJREfUY6LRmDT1iQYpw@mail.gmail.com>
References: <1426762587-24923-1-git-send-email-b.michalska@samsung.com>
	<CAJKOXPfumy5a6A275ETy7vnztzE20qSuXD_i=ebY9Br47p93Dg@mail.gmail.com>
	<CAJKOXPcnYq0pS-akXNDd8TE6wqeq0pg-cx4PK0jeke9z3tHsOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f178.google.com ([209.85.160.178]:34401 "EHLO
	mail-yk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754420AbbEUHZq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 03:25:46 -0400
Received: by ykft189 with SMTP id t189so23888858ykf.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2015 00:25:46 -0700 (PDT)
In-Reply-To: <CAJKOXPcnYq0pS-akXNDd8TE6wqeq0pg-cx4PK0jeke9z3tHsOw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Beata Michalska <b.michalska@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Thu, May 21, 2015 at 4:04 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> 2015-05-21 10:57 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
>> 2015-03-19 19:56 GMT+09:00 Beata Michalska <b.michalska@samsung.com>:
>>> As a follow-up to recent changes to Exynos mipi video phy
>>> driver, introducing support for PMU regmap in commit
>>> e4b3d38088df6f3acd40 ("phy: exynos-video-mipi: Fix regression
>>> by adding support for PMU regmap") add a syscon phandle to
>>> video-phy node to bring back to life both MIPI DSI displays
>>> and MIPI CSIS-2 camera sensors on Exynos3250.
>>>
>>> Signed-off-by: Beata Michalska <b.michalska@samsung.com>
>>
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
>> Tested on Gear 2 (Exynos3250) board.
>
> Oh, I was too fast. It seems that "reg" property is not needed
> anymore. Can you remove it?
>

After removing the reg property as Krzysztof suggested.

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
