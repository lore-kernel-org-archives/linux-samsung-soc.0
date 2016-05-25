From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: ARM: dts: exynos: Add MFC memory banks for Peach boards
Date: Wed, 25 May 2016 11:02:04 -0400
Message-ID: <d045b880-4a44-acd8-f7f6-e521caf374aa@osg.samsung.com>
References: <1461871311-18344-1-git-send-email-javier@osg.samsung.com>
 <57456344.7020708@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57456344.7020708@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "pankaj.dubey" <pankaj.dubey@samsung.com>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Pankaj,

On 05/25/2016 04:33 AM, pankaj.dubey wrote:
> Hi Javier,
> 
> On Friday 29 April 2016 12:51 AM, Javier Martinez Canillas wrote:
>> The MFC nodes with the memory regions reserved for memory allocations
>> are missing in the Exynos5420 Peach Pit and Exynos5800 Peach Pi DTS.
>>
>> This causes the s5p-mfc driver probe to fail with the following error:
>>
>> [    4.140647] s5p_mfc_alloc_memdevs:1072: Failed to declare coherent memory for MFC device
>> [    4.216163] s5p-mfc: probe of 11000000.codec failed with error -12
>>
>> Add the missing nodes so the driver probes and the {en,de}coder video
>> nodes are registered correctly:
>>
>> [    4.096277] s5p-mfc 11000000.codec: decoder registered as /dev/video4
>> [    4.102282] s5p-mfc 11000000.codec: encoder registered as /dev/video5
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> Just noticed that, current krzk/for-next failed to boot on Exynos5880
> based Chromebook device. Git bisect is showing culprit as this patch.

Strange, krzk/for-next boots correctly on my Exynos5800 Peach Pi:

$ git log --pretty=oneline --abbrev-commit HEAD
35e691cf5165 Merge branch 'fixes-v4.7' into for-next

$ uname -r
4.6.0-00073-g35e691cf5165

> When I reverted this patch, its able to boot normally.
> Is there any missing patches that we need to take on krzk/for-next to
> boot on Chromebook.
>

No that I'm aware of. I wonder why it boots for me but fails for
you. Can you please share your complete boot log to see if there
are any hints there?
 
> Thanks,
> Pankaj Dubey
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
