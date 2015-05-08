From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [RESEND][PATCH] ARM: dts: exynos4412-odroid: add 'rtc_src' clockto
 rtc node
Date: Sat, 09 May 2015 02:59:14 +0900
Message-ID: <554CF972.4060800@kernel.org>
References: <554C8319.70203@fivetechno.de> <554C9A71.9080408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:47634 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932546AbbEHR7X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 13:59:23 -0400
In-Reply-To: <554C9A71.9080408@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Markus Reichl <m.reichl@fivetechno.de>, linux-samsung-soc@vger.kernel.org, javier.martinez@collabora.co.uk, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>

On 05/08/15 20:13, Krzysztof Kozlowski wrote:
> W dniu 08.05.2015 o 18:34, Markus Reichl pisze:
>> The Exynos4412 SoC has a s3c6410 RTC where the source clock is now
>> a mandatory property.
>>
>> This patch fixes probe failure of s3c-rtc on Odroid-X2/U2/U3
>> boards.
>>
>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de> Tested-by:
>> Tobias Jakobi <tjakobi@math.uni-bielefeld.de> Reviewed-by: Chanwoo
>> Choi <cw00.choi@samsung.com> Reviewed-by: Javier Martinez Canillas
>> <javier.martinez@collabora.co.uk> Tested-by: Krzysztof Kozlowski
>> <k.kozlowski@samsung.com>
> 
> Thanks, applied. I'll push it to Kukjin a little later, depending on
> status of previous pull requests.
> 
Applied in my tree directly.

Thanks,
Kukjin
