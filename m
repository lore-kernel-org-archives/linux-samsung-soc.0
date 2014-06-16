From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 3/5] clk: Add driver for Maxim 77802 PMIC clocks
Date: Mon, 16 Jun 2014 10:54:58 +0200
Message-ID: <539EB0E2.1080307@collabora.co.uk>
References: <1402306670-17041-1-git-send-email-javier.martinez@collabora.co.uk> <1402306670-17041-4-git-send-email-javier.martinez@collabora.co.uk> <20140616084427.GG14323@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:54268 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754285AbaFPIzF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jun 2014 04:55:05 -0400
In-Reply-To: <20140616084427.GG14323@lee--X1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Lee,

On 06/16/2014 10:44 AM, Lee Jones wrote:
>> The MAX77802 PMIC has two 32.768kHz Buffered Clock Outputs with
>> Low Jitter Mode. This patch adds support for these two clocks.
>> 
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> ---
>>  .../devicetree/bindings/clock/maxim,max77802.txt   |  40 ++++
>>  drivers/clk/Kconfig                                |   6 +
>>  drivers/clk/Makefile                               |   1 +
>>  drivers/clk/clk-max77802.c                         | 253 +++++++++++++++++++++
>>  drivers/mfd/max77802.c                             |   3 +
>>  include/dt-bindings/clock/maxim,max77802.h         |  22 ++
>>  6 files changed, 325 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/maxim,max77802.txt
>>  create mode 100644 drivers/clk/clk-max77802.c
>>  create mode 100644 include/dt-bindings/clock/maxim,max77802.h
> 
> [...]
> 
>> diff --git a/drivers/mfd/max77802.c b/drivers/mfd/max77802.c
>> index 59696dd..33e8023 100644
>> --- a/drivers/mfd/max77802.c
>> +++ b/drivers/mfd/max77802.c
>> @@ -35,6 +35,9 @@
>>  
>>  static const struct mfd_cell max77802_devs[] = {
>>  	{ .name = "max77802-pmic", },
>> +#if defined(CONFIG_COMMON_CLK_MAX77802)
> 
> No, don't do that.  If COMMON_CLK_MAX77802 is not defined it just
> won't be matched, which is enough to ensure it won't be probed.
>

Thanks a lot for the explanation.

I'll send a v2 patch-set soon which has changes based on the feedback from Mark
and Krzysztof. I'll take this point into account as well.

>> +	{ .name = "max77802-clk", },
>> +#endif
>>  };
> 
> [...]
> 

Best regards,
Javier
