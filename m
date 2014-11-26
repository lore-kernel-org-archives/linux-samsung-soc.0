From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [RESEND PATCH 1/2] ARM: dts: exynos4x12: Device tree node definition
 for TMU on Exynos4x12
Date: Thu, 27 Nov 2014 02:56:52 +0900
Message-ID: <54761464.2080005@kernel.org>
References: <1416474343-1283-1-git-send-email-l.majewski@samsung.com> <035001d005fd$7abac670$70305350$@kernel.org> <20141124094926.04ffacfd@amdc2363>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:59675 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751028AbaKZR44 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Nov 2014 12:56:56 -0500
In-Reply-To: <20141124094926.04ffacfd@amdc2363>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

On 11/24/14 17:49, Lukasz Majewski wrote:
> Hi Kukjin,
> 
>> Lukasz Majewski wrote:
>>>
>> + Bart, Tomasz and MLs
>>
>> Hi Lukasz,
>>
>> Please post including MLs, even resending.
>>
>> Will apply for v3.19, and just note that you asked me to apply this
>> for 3.18 in personal talk but I couldn't see any requirements for
>> fixes-3.18. If I'm missing something, please let me know.
> 
> The thing is that by default Exynos 4412 (trats2) can run with modified
> cpufreq to support SW governed overclocking (BOOST).
> 
> To provide safe BOOST operation, TMU (thermal) _must_ be configured.
> Configuration is not possible when trats2 DTS lacks of those patches.
> 
Well, AFAIK the BOOST mode is only available on only Samsung mobile not
mainline and so I think this is not for bug fix in mainline for 3.18...

- Kukjin

> So, yes there is a requirement to add those patches to v3.18 (if not
> possible please add it to v3.19).
> 
>>
>> Thanks,
>> Kukjin
>>
>>> The TMU device tree node definition for Exynos4x12 family of SoCs.
>>>
>>> Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
>>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>>> Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>
>>> ---
>>>  arch/arm/boot/dts/exynos4x12.dtsi | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
