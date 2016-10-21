From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [RFC] ARM: dts: exynos: Remove exynos4415.dtsi
Date: Fri, 21 Oct 2016 12:28:14 -0300
Message-ID: <465ede6d-32db-7c2b-622d-2e655e8f9ae2@osg.samsung.com>
References: <CGME20161021141653eucas1p11801729a8cea77169d2639bbae6f0d6c@eucas1p1.samsung.com>
 <1477059331-14586-1-git-send-email-krzk@kernel.org>
 <c8576159-347c-42df-6a8d-8620ba4be8a1@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c8576159-347c-42df-6a8d-8620ba4be8a1@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org


On 10/21/2016 11:33 AM, Sylwester Nawrocki wrote:
> On 10/21/2016 04:15 PM, Krzysztof Kozlowski wrote:
>> There are no boards in mainline using exynos4415.dtsi.  This is DTS
>> was not tested for long.  I am also not aware of any popular out-of-tree
>> boards using this (except consumer devices released by Samsung but those
>> cannot use mainline).
>>
>> Keeping Exynos4415 costs some useless effort so remove it.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> It seems a sane thing to do, I don't know of any active platform that
> uses Exynos4415.
> 
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
