From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v8 00/13] Add Maxim 77802 PMIC support
Date: Mon, 21 Jul 2014 14:44:07 +0200
Message-ID: <53CD0B17.5040706@collabora.co.uk>
References: <1405337769-3741-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405337769-3741-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Tushar Behera <trblinux@gmail.com>, Andreas Farber <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Lee,

On 07/14/2014 01:35 PM, Javier Martinez Canillas wrote:
> 
> * Patches 1-7 from v7 are not included since those were improvements to
> the max77686 mfd driver and can be applied independently. Lee Jones said
> that he is going to pick them from the posted v7 series.
> 

Thanks a lot for picking the max77686 preparatory patches.

> 
> Since there are cross-subsystems dependencies, I think that the best way to
> sort this out is if relevant maintainers ack the patches so 01/13 to 012/13
> can be merged through the mfd tree. The patches and the relevant acks are:
> 
> Patch 03/13 (regulator - Mark Brown)
> Patches 04/13 to 09/13 (clk - Mike Turquette)
> Patches 10/13 to 12/13 (rtc - Alessandro Zummo)
> 

Mark, Mike and Alessandro,

This is a gentle reminder to look at the patches that touches your subsystems
and provide acks if possible so Lee can merge the remainder set through the mfd
tree.

There were only trivial changes for the regulator, clock and rtc drivers since
v5 (posted almost a month ago in Jun 26) and this series is blocking a lot of
other patch-sets so is hurting forward progress on the chromebook2 platform as a
whole.

Lee,

Since I may not be able to get the acks before the merge window opens, do you
think that is possible to merge patch 01/13 "mfd: max77686: Add Maxim 77802 PMIC
support" which already has your ack?

So at least we can get the dependency for the other drivers in 3.17 and avoid
this cross subsystem churn for 3.18 since the rest of the drivers will be able
to go through the relevant trees.

Thanks a lot and best regards,
Javier
