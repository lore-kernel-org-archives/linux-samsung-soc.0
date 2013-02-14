From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH V6 02/10] ASoC: SAMSUNG: Add DT support for i2s
Date: Thu, 14 Feb 2013 21:33:00 +0100
Message-ID: <511D49FC.4080402@gmail.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com> <1358509629-20471-3-git-send-email-padma.v@samsung.com> <511CC11B.5030700@samsung.com> <20130214114337.GD13249@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:45220 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758834Ab3BNUdG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Feb 2013 15:33:06 -0500
Received: by mail-ea0-f174.google.com with SMTP id 1so1130832eaa.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Feb 2013 12:33:05 -0800 (PST)
In-Reply-To: <20130214114337.GD13249@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Padmavathi Venna <padma.v@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org

On 02/14/2013 12:43 PM, Mark Brown wrote:
> On Thu, Feb 14, 2013 at 11:48:59AM +0100, Sylwester Nawrocki wrote:
>
>> NAK.
>
>> Why we should live with this temporary code when there is already
>> pinctrl support for Exynos SoCs ?
>
>> If the pinctrl driver for Exynos5 was updated you could instead just do
>
>> devm_pinctrl_get_select_default(&i2s->pdev->dev);
>
> Too late, this stuff is already merged and on its way upstream.

My apologies for the late review. It's already sixth version of this patch
series... But I noticed it just now when applying it for Exynos4. The GPIO
part of the bindings is now incompatible with Exynos4 and the bindings will
need to be changed. Leaving the compatibility code in the I2S driver, when
we could have it done well right from the beginning. If I'm not mistaken
a file similar to arch/arm/boot/dts/exynos4x12-pinctrl.dtsi with at least
entries for the I2S devices is needed and an addition of related pinctrl
nodes in exynos5250.dtsi. But I guess this is not something that could be
fixed in the -rc period ?
