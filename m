From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 1/3] ARM: dts: exynos: Document eMMC/SD/SDIO devices in
 Exynos5250 Snow board
Date: Fri, 28 Oct 2016 10:37:15 -0300
Message-ID: <01909b55-fc99-b1eb-32d7-7070a3c8e0ef@osg.samsung.com>
References: <1477588303-13681-1-git-send-email-javier@osg.samsung.com>
 <20161028133424.GA5646@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161028133424.GA5646@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 10/28/2016 10:34 AM, Krzysztof Kozlowski wrote:
> On Thu, Oct 27, 2016 at 02:11:41PM -0300, Javier Martinez Canillas wrote:
>> There's a cognitive load to figure out which mmc device node corresponds
>> to the eMMC flash, uSD card and WiFI SDIO module on the Snow boards.
>>
>> So it's better to have comments in the DTS to make this more clear.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> ---
>>
>>  arch/arm/boot/dts/exynos5250-snow-common.dtsi | 4 ++++
>>  1 file changed, 4 insertions(+)
> 
> Thanks, applied after squashing three into one. These are only comments,
> so no impact on the code, and meaning/goal of them is exactly same.
> 

Ok, sounds good to me. Thanks!

> Best regards,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
