From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: dts: Add Exynos5250 Snow Rev5+ support
Date: Wed, 30 Sep 2015 09:25:27 +0200
Message-ID: <560B8E67.1080202@osg.samsung.com>
References: <1443527855-434-1-git-send-email-javier@osg.samsung.com>
 <560B2D29.5060707@samsung.com> <560B8818.8020002@kernel.org>
 <560B890C.3060200@samsung.com> <560B8A0F.8090709@osg.samsung.com>
 <560B8A8A.5050506@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <560B8A8A.5050506@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 09/30/2015 09:08 AM, Krzysztof Kozlowski wrote:
> On 30.09.2015 16:06, Javier Martinez Canillas wrote:
>> Hello,
>>
>> On 09/30/2015 09:02 AM, Krzysztof Kozlowski wrote:
>>> On 30.09.2015 15:58, Kukjin Kim wrote:
>>
>> [snip]
>>
>>>>>
>>>>> Could you add the new compatible and fix patch issues pointed by Doug?
>>>>>
>>>> Documenting for the compatibles would be required even I already applied
>>>> its updated patch...
>>>
>>
>> Kukjin, I agree that they should be documented but I thought it would
>> be a separate patch since currently we don't document any board.
>>  
>>> What do you mean by "documenting compatibles"? These are board
>>> compatibles, they are not documented...
>>>
>>
>> Krzysztof, I've on my TODO list to add a file describing all Exynos
>> platforms and DT bindings, something like what other SoC do, i.e:
>>
>> Documentation/devicetree/bindings/arm/omap/omap.txt
>> Documentation/devicetree/bindings/arm/rockchip.txt
> 
> Right, that's a good idea. However lack of it does not affect current
> work because compatibles for Exynos board are not documented at all.
> 

Agreed. That's why I didn't add it, even when checkpatch.pl complains:

WARNING: DT compatible string "google,snow-rev5" appears un-documented -- check ./Documentation/devicetree/bindings/

> Best regards,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
