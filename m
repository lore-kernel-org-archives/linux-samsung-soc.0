From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: Use correct mfc_pd async-bridge
 clock for Exynos5420
Date: Fri, 20 Jan 2017 14:15:40 -0300
Message-ID: <55cdceb9-d768-d5a9-7bc2-d4ef26d2e5e8@osg.samsung.com>
References: <1484864995-10679-1-git-send-email-javier@osg.samsung.com>
 <1484864995-10679-2-git-send-email-javier@osg.samsung.com>
 <20170120162846.x766u3nzblqywggj@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170120162846.x766u3nzblqywggj@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 01/20/2017 01:28 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 19, 2017 at 07:29:55PM -0300, Javier Martinez Canillas wrote:
>> Commit 94aed538e032 ("ARM: dts: exynos: Add async-bridge clock to MFC
>> power domain for Exynos5420") fixed an imprecise external abort error
>> when the MFC registers were tried to be accessed and the needed clock
>> for the asynchronous bridges were gated.
>>
>> But according to the Exynos5420 manual the "Gating AXI clock for MFC"
>> is not CLK_ACLK333 but CLK_MFC.
>>
>> The end effect is the same because CLK_ACLK333 is a parent of CLK_MFC
>> but the correct clock should be used instead.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
>> ---
>>
>>  arch/arm/boot/dts/exynos5420.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Is this still needed?
> 

Not really, only if we care about correctness in the existing power domains
that have their clocks defined. But as said, even currently with CLK_ACLK333
works due to the clock hierarchy.

I think is less of an issue now that we prefer to mark clocks that needs to
be ungated as critical instead of growing the DT ABI.

> Best regards,
> Krzysztof
> 
 
Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
