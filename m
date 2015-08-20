From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 5/5] Documentation: dt-bindings: add exynos-srom binding
 information
Date: Thu, 20 Aug 2015 17:09:45 +0530
Message-ID: <55D5BC81.9050304@samsung.com>
References: <1430296712-10287-1-git-send-email-pankaj.dubey@samsung.com>
 <1430296712-10287-6-git-send-email-pankaj.dubey@samsung.com>
 <CAJKOXPfpu+k-3u3kFzeKL4b9bkh+iwWHak2ea+9QLtGUEZGWdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55119 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751284AbbHTLkJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Aug 2015 07:40:09 -0400
In-reply-to: <CAJKOXPfpu+k-3u3kFzeKL4b9bkh+iwWHak2ea+9QLtGUEZGWdA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux@arm.linux.org.uk, heiko@sntech.de, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, thomas.ab@samsung.com, kgene@kernel.org

Hi Krzysztof,

On Wednesday 27 May 2015 04:51 PM, Krzysztof Kozlowski wrote:
> 2015-04-29 17:38 GMT+09:00 Pankaj Dubey <pankaj.dubey@samsung.com>:
>> This patch adds exynos-srom binding information for SROM Controller
>> driver on Exynos SoCs.
>>
>> CC: Rob Herring <robh+dt@kernel.org>
>> CC: Mark Rutland <mark.rutland@arm.com>
>> CC: Ian Campbell <ijc+devicetree@hellion.org.uk>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>   .../devicetree/bindings/arm/samsung/exynos-srom.txt          | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
>> new file mode 100644
>> index 0000000..482d1cd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
>> @@ -0,0 +1,12 @@
>> +SAMSUNG Exynos SoCs SROM Controller driver.
>> +
>> +Required properties:
>> +- compatible : Should at least contain "samsung,exynos-srom".
>
> "At least" - do you already expect other compatibles?
>

Nope, as of now I do not expect any other compatible, so I will change 
this to "Should contain "samsung,exynos-srom"."

Thanks,
Pankaj Dubey
> Best regards,
> Krzysztof
>
