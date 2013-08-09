From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCHv2 5/5] ARM: dts: Add dt binding documentation for exynos
 rotator
Date: Fri, 09 Aug 2013 10:38:30 -0600
Message-ID: <52051B06.7000209@wwwdotorg.org>
References: <1376034053-31910-1-git-send-email-chanho61.park@samsung.com> <1376034053-31910-6-git-send-email-chanho61.park@samsung.com> <229348511.e5ckfeMu0d@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:33973 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S968067Ab3HIQie (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Aug 2013 12:38:34 -0400
In-Reply-To: <229348511.e5ckfeMu0d@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Chanho Park <chanho61.park@samsung.com>, inki.dae@samsung.com, kgene.kim@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, mark.rutland@arm.com, l.stach@pengutronix.de, s.nawrocki@samsung.com, tomasz.figa@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, ian.campbell@citrix.com, rob.herring@calxeda.com, pawel.moll@arm.com

On 08/09/2013 07:15 AM, Tomasz Figa wrote:
> Hi Chanho,
> 
> On Friday 09 of August 2013 16:40:53 Chanho Park wrote:
>> This patch describes each nodes of rotator and specifies a example how to
>> bind it.

>> diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.txt

>> +* Samsung Image Rotator
>> +
>> +Required properties:
>> +  - compatible : value should be following:
>> +	(a) "samsung,exynos4210-rotator" for Rotator IP in Exynos4210
>> +	(b) "samsung,exynos4212-rotator" for Rotator IP in Exynos4212/4412
>> +	(c) "samsung,exynos5250-rotator" for Rotator IP in Exynos5250

Is "rotator" the name that the HW documentation uses to refer to this
block? If so, those compatible values seem fine. If not, they seem
slightly too generic for me; perhaps better to use the raw HW block name?
