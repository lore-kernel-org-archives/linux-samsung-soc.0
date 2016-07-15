From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] media: Doc add missing documentation for
 samsung,exynos4212-jpeg
Date: Fri, 15 Jul 2016 10:33:25 +0200
Message-ID: <57889FD5.9070302@samsung.com>
References: <1468526499-8840-1-git-send-email-shuahkh@osg.samsung.com>
 <578890BA.8040101@samsung.com> <57889B73.4090607@samsung.com>
 <57889C23.3050106@samsung.com> <57889EAB.30502@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <57889EAB.30502@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Shuah Khan <shuahkh@osg.samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, kgene@kernel.org, mchehab@osg.samsung.com, andrzej.p@samsung.com, hans.verkuil@cisco.com, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 07/15/2016 10:28 AM, Jacek Anaszewski wrote:
> On 07/15/2016 10:17 AM, Krzysztof Kozlowski wrote:
>> On 07/15/2016 10:14 AM, Jacek Anaszewski wrote:
>>>> However if these compatibles are exactly equal then
>>>> only one should be preferred. It makes everything easier. Second can be
>>>> still documented e.g. as deprecated.
>>>
>>> Still, both of them are present in the driver. Shouldn't it be reflected
>>> in the documentation?
>>
>> Right, it is a good practice, so how about:
>>
>>    - compatible    : should be one of:
>>            "samsung,s5pv210-jpeg", "samsung,exynos3250-jpeg",
>>            "samsung,exynos4210-jpeg", "samsung,exynos5420-jpeg",
>>            "samsung,exynos5433-jpeg";
>>
>>            Deprecated: "samsung,exynos4212-jpeg"
>>
>> (or any other formatting)
>> plus update to DTS changing it to 4210?
> 
> Why newer 4212 version should be made deprecated?

I don't mind the other way. However it seems logical to me that newer
chip is compatible with existing one so the existing one (older) is
used. When adding support for new devices, for most of re-usable drivers
we use old compatibles. But as I said, it doesn't really matter to me.

BR,
Krzysztof
