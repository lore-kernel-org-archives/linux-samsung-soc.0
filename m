From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [next] Odroid XU3 easily over-heats
Date: Mon, 15 Feb 2016 15:36:18 +0900
Message-ID: <56C171E2.90306@samsung.com>
References: <56C01963.3080106@gmail.com> <20160215052843.GA6334@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59816 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751868AbcBOGg0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Feb 2016 01:36:26 -0500
In-reply-to: <20160215052843.GA6334@vireshk-i7>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Lukasz Majewski <l.majewski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>

On 15.02.2016 14:28, Viresh Kumar wrote:
> On 14-02-16, 15:06, Krzysztof Kozlowski wrote:
>> Hi all,
>>
>> With recent addition of cpufreq-dt support to Exynos5422
>> it is very easy to over-heat the Odroid XU3 leading to critical shutdown:
> 
> How were OPPs passed earlier? I failed to see them in kernel somehow.
> You must have been using opp-v1 earlier, right?

Till now there was no support for cpufreq for Exynos542x. For some time
Bartlomiej was developing these patches - using opp-v1 at beginning. I
don't know whether he encountered this before.

> 
> You used boost-freqs then? You used cpufreq as a cooling device then?
> 
>> What about cpufreq as cooling device? Probably that part
>> is missing now, right?
> 
> Maybe, how was that earlier though ?

Bootloader initialized frequency and regulators to some safe defaults. I
think the voltage set by uboot is 1 V (for big and little) which
corresponds to ~800 MHz of frequency (I don't know the exact frequency
because it is hardcoded as divider value...).

However there was no cooling device except fan. This did not change. So
the only difference seems to be that now at critical shutdown moment it
operates at 1300 MHz / 1.275 V (little) and 1800 MHz / 1.250 V (big).

Best regards,
Krzysztof
