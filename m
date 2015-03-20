From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] exynos: pmu: use =?UTF-8?Q?PS=5FHOLD=20based=20powero?=
 =?UTF-8?Q?ff=20for=20all=20supported=20SoCs?=
Date: Fri, 20 Mar 2015 17:03:25 +0100
Message-ID: <0674e072e0ff906ff4d41a4a9a95253f@math.uni-bielefeld.de>
References: <1423466741-11421-1-git-send-email-m.szyprowski@samsung.com>
 <CAJKOXPeeUjcwO6qBdHA8DJaviPxRwjAsSe7ciyGDFOUoNhZvcQ@mail.gmail.com>
 <CAJKOXPe4=DHsV3_axDUhpimRaqSHA3=HLiSJ1K3DYZoGRRiTTg@mail.gmail.com>
 <550C3888.7050905@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:53300 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751077AbbCTQD1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Mar 2015 12:03:27 -0400
In-Reply-To: <550C3888.7050905@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Daniel Drake <drake@endlessm.com>

Hello Marek,

On 2015-03-20 16:11, Marek Szyprowski wrote:
>> It was my fault (I left attached JIG cable which prevents power off).
>> Now it works fine.
>> 
>> Tested on Trats2 (Exynos4412):
>> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> 
>> Patch also looks good, so:
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> Gentle ping for merging this in v4.1-next...
> 
> Best regards
I'd say that this is even a candidate for 4.0.0. Like I reported 
earlier, the SoC gets really hot without proper shutdown, so definitely 
something you don't want for a not properly cooled system (U3 without 
the fan running e.g.).

With best wishes,
Tobias
