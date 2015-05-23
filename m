From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH] ARM: dts: Update video-phy node with syscon phandle for
 Exynos3250
Date: Sat, 23 May 2015 12:53:16 +0900
Message-ID: <555FF9AC.1060909@kernel.org>
References: <1426762587-24923-1-git-send-email-b.michalska@samsung.com>	<CAJKOXPfumy5a6A275ETy7vnztzE20qSuXD_i=ebY9Br47p93Dg@mail.gmail.com>	<CAJKOXPcnYq0pS-akXNDd8TE6wqeq0pg-cx4PK0jeke9z3tHsOw@mail.gmail.com> <CABxcv=npaHemH_KcYgGf-_x8Bo=V2UMDJREfUY6LRmDT1iQYpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:40959 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757344AbbEWDx1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 23:53:27 -0400
In-Reply-To: <CABxcv=npaHemH_KcYgGf-_x8Bo=V2UMDJREfUY6LRmDT1iQYpw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Beata Michalska <b.michalska@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 05/21/15 16:25, Javier Martinez Canillas wrote:
> On Thu, May 21, 2015 at 4:04 AM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> 2015-05-21 10:57 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
>>> 2015-03-19 19:56 GMT+09:00 Beata Michalska <b.michalska@samsung.com>:
>>>> As a follow-up to recent changes to Exynos mipi video phy
>>>> driver, introducing support for PMU regmap in commit
>>>> e4b3d38088df6f3acd40 ("phy: exynos-video-mipi: Fix regression
>>>> by adding support for PMU regmap") add a syscon phandle to
>>>> video-phy node to bring back to life both MIPI DSI displays
>>>> and MIPI CSIS-2 camera sensors on Exynos3250.
>>>>
>>>> Signed-off-by: Beata Michalska <b.michalska@samsung.com>
>>>
>>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>>
>>> Tested on Gear 2 (Exynos3250) board.
>>
>> Oh, I was too fast. It seems that "reg" property is not needed
>> anymore. Can you remove it?
>>
> 
> After removing the reg property as Krzysztof suggested.
> 
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> 
will apply with changing as per you guys' review comment ;-)

Thanks,
Kukjin
