From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 3/3] ARM: dts: Disable I2C controllers by default on Exynos5250
Date: Thu, 12 Sep 2013 09:03:23 -0600
Message-ID: <5231D7BB.6050702@wwwdotorg.org>
References: <1378982427-5802-1-git-send-email-broonie@kernel.org> <1378982427-5802-3-git-send-email-broonie@kernel.org> <2175767.kktjrZWOAr@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:47132 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752053Ab3ILPD1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 11:03:27 -0400
In-Reply-To: <2175767.kktjrZWOAr@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@vger.kernel.org, Mark Brown <broonie@linaro.org>

On 09/12/2013 06:58 AM, Tomasz Figa wrote:
> Hi Mark,
> 
> On Thursday 12 of September 2013 11:40:27 Mark Brown wrote:
>> From: Mark Brown <broonie@linaro.org>
>>
>> Ensure that unused I2C controllers are not activated, causing problems
>> due to inappropriate pinmuxing or similar, by marking the controllers as
>> disabled by default and requiring boards to explicitly enable those that
>> are in use.

>> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts

>>  	i2c@12C60000 {
>> +		status = "okay";
> 
> I would keep the status properties at the end of all properties, indicating 
> that at this point the description is complete and also to be consistent 
> with other dts files around.

DT doesn't define any kind of ordering for the properties AFAIK, so the
order shouldn't matter in practice; it conveys no semantic
representation as far as the parsing code is concerned even if a human
may be influenced otherwise:-)

Just as an FYI, the rule I've been trying to follow in Tegra DT files is
that properties that are overridden from any included .dtsi file come
first, followed by any new properties. Still, there's no particular
reason anyone else has to follow that layout.
