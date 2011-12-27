From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH 2/2] ARM: Exynos: Hook up power domains to generic power
 domain infrastructure
Date: Tue, 27 Dec 2011 23:16:12 +0100
Message-ID: <4EFA43AC.8030900@gmail.com>
References: <1323704789-23923-1-git-send-email-thomas.abraham@linaro.org> <1323704789-23923-2-git-send-email-thomas.abraham@linaro.org> <1323704789-23923-3-git-send-email-thomas.abraham@linaro.org> <20111226190616.GL8722@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:41643 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751376Ab1L0WQR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Dec 2011 17:16:17 -0500
In-Reply-To: <20111226190616.GL8722@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, rjw@sisk.pl, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, patches@linaro.org

On 12/26/2011 08:06 PM, Mark Brown wrote:
> On Mon, Dec 12, 2011 at 09:16:29PM +0530, Thomas Abraham wrote:
> 
>> +	/* Wait max 1ms */
>> +	timeout = 10;
>> +	while ((__raw_readl(base + 0x4) & S5P_INT_LOCAL_PWR_EN)
>> +					!= S5P_INT_LOCAL_PWR_EN) {
>> +		if (!timeout) {
>> +			pr_err("Power domain %s enable failed\n", domain->name);
>> +			return -ETIMEDOUT;
>> +		}
>> +		timeout--;
>> +		udelay(100);
>> +	}
> 
> Might be worth putting a cpu_relax() in there just to be a bit nicer?

There is a quite significant delay within the loop, thus it might make more
sense to replace udelay() with usleep_range() instead.
