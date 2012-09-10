From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] ARM: dts: exynos4: allow i2c0 bus to be configured
 using pinctrl interface
Date: Mon, 10 Sep 2012 13:23:20 -0600
Message-ID: <504E3E28.8030004@wwwdotorg.org>
References: <1346923381-14144-1-git-send-email-thomas.abraham@linaro.org> <1346923381-14144-3-git-send-email-thomas.abraham@linaro.org> <5320531.svfjn4BD9X@amdc1227> <CAJuYYwSC6nvs4eJ7GOTD2Ti8EvcTPPGZ7Fj7reT2eY65nvq22Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:50751 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758279Ab2IJTXY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Sep 2012 15:23:24 -0400
In-Reply-To: <CAJuYYwSC6nvs4eJ7GOTD2Ti8EvcTPPGZ7Fj7reT2eY65nvq22Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, linus.walleij@linaro.org, w.sang@pengutronix.de, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, dong.aisheng@linaro.org

On 09/06/2012 05:14 AM, Thomas Abraham wrote:
> On 6 September 2012 15:43, Tomasz Figa <t.figa@samsung.com> wrote:
>> Hi Thomas,
>>
>> On Thursday 06 of September 2012 14:53:01 Thomas Abraham wrote:
>>>               compatible = "samsung,s3c2440-i2c";
>>>               reg = <0x13860000 0x100>;
>>>               interrupts = <0 58 0>;
>>> +             pinctrl-names = "default";
>>> +             pinctrl-0 = <&i2c0_bus>;
>>
>> If pinctrl-names property is omitted then the state index is used as a name
>> (e.g. pinctrl-0 would be named "0"). Maybe it would be better to use this
>> approach (with respective adjustment in first patch)? What do you think?
> 
> I tend to prefer to name the states because it is easier to
> cross-reference code and dts files. i2c was a simple one, but for mmc
> controllers, there will 1-bit state, 4-bit state and 8-bit state, and
> it will be nicer to name then accordingly. So I prefer to use names
> but if there is wider consensus on not using names, we can drop names.

I would only expect to see multiple states defined in a single board
.dts file /if/ runtime muxing is required. Given MMC doesn't runtime
mux, I wouldn't expect there to be multiple states for different bus
widths; it's just that the "default" state would point at whatever
single configuration is appropriate for the board.
