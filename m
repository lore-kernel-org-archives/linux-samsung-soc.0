From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v4 05/14] clk: Add generic driver for Maxim PMIC clocks
Date: Thu, 26 Jun 2014 14:31:36 +0200
Message-ID: <53AC12A8.6040201@collabora.co.uk>
References: <1403723019-6212-1-git-send-email-javier.martinez@collabora.co.uk>	<1403723019-6212-6-git-send-email-javier.martinez@collabora.co.uk> <CAKew6eWt-0c4gxGX7C7KtRrxR=9h9BSUmN3a2aWQtuT40cva1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:33062 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754917AbaFZMbm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 08:31:42 -0400
In-Reply-To: <CAKew6eWt-0c4gxGX7C7KtRrxR=9h9BSUmN3a2aWQtuT40cva1w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hello Yadwinder,

Thanks a lot for your feedback.

On 06/26/2014 01:51 PM, Yadwinder Singh Brar wrote:
> Hi Javier,
> 
> Sorry for jumping in late, but just one concern mentioned inline.
> 
> [ .. ]
> 
>> +
>> +static unsigned long max_gen_recalc_rate(struct clk_hw *hw,
>> +                                        unsigned long parent_rate)
>> +{
>> +       return 32768;
>> +}
> 
> Isn't more safer(correct), if it check and return 0 when clk is
> disabled(unprepared) ?
> 

Makes sense to me. I'll add a if (__clk_is_enabled(hw->clk)) check in the next
version.

> Regards,
> Yadwinder
> 

Best regards,
Javier
