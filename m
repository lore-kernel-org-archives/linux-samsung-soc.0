From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V6 02/10] ASoC: SAMSUNG: Add DT support for i2s
Date: Sun, 17 Feb 2013 06:01:53 +0530
Message-ID: <CAAgF-BdopAF4CxT4Wb4O6OoYVA0Yib+1hwm7Nu_KkXjFcky2gQ@mail.gmail.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
	<1358509629-20471-3-git-send-email-padma.v@samsung.com>
	<511CC11B.5030700@samsung.com>
	<20130214114337.GD13249@opensource.wolfsonmicro.com>
	<511D49FC.4080402@gmail.com>
	<20130215120145.GC22283@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f170.google.com ([209.85.210.170]:57139 "EHLO
	mail-ia0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755123Ab3BQAby (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Feb 2013 19:31:54 -0500
Received: by mail-ia0-f170.google.com with SMTP id k20so4385544iak.29
        for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Feb 2013 16:31:53 -0800 (PST)
In-Reply-To: <20130215120145.GC22283@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Padmavathi Venna <padma.v@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org

Hi,

On Fri, Feb 15, 2013 at 5:31 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Thu, Feb 14, 2013 at 09:33:00PM +0100, Sylwester Nawrocki wrote:
>
>> My apologies for the late review. It's already sixth version of this patch
>> series... But I noticed it just now when applying it for Exynos4. The GPIO
>> part of the bindings is now incompatible with Exynos4 and the bindings will
>> need to be changed. Leaving the compatibility code in the I2S driver, when
>> we could have it done well right from the beginning. If I'm not mistaken
>> a file similar to arch/arm/boot/dts/exynos4x12-pinctrl.dtsi with at least
>> entries for the I2S devices is needed and an addition of related pinctrl
>> nodes in exynos5250.dtsi. But I guess this is not something that could be
>> fixed in the -rc period ?
>
> Yes, and incremental fix would be fine.

I will send a patch for required pinctrl support soon.

Thanks
Padma
