From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ASoC: samsung: Allow setting OP_CLK of the IIS Multi Audio
 Interface
Date: Tue, 20 May 2014 11:10:08 +0200
Message-ID: <537B1BF0.8060302@samsung.com>
References: <1400520638-6907-1-git-send-email-s.nawrocki@samsung.com>
 <537AE4C1.7050703@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:65144 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173AbaETJKN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 05:10:13 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5V001UN84TBW60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 May 2014 10:10:05 +0100 (BST)
In-reply-to: <537AE4C1.7050703@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 20/05/14 07:14, Tushar Behera wrote:
> On 05/19/2014 11:00 PM, Sylwester Nawrocki wrote:
>> This patch adds support for setting source clock of the "Core CLK"
>> of the IIS Multi Audio Interface.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
>>  sound/soc/samsung/i2s.c |    4 ++++
>>  sound/soc/samsung/i2s.h |    1 +
>>  2 files changed, 5 insertions(+)
>>
>> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
>> index 048ead9..ae02811 100644
>> --- a/sound/soc/samsung/i2s.c
>> +++ b/sound/soc/samsung/i2s.c
>> @@ -451,6 +451,10 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
>>  	u32 mod = readl(i2s->addr + I2SMOD);
>>  
>>  	switch (clk_id) {
>> +	case SAMSUNG_I2S_OPCLK:
>> +		mod &= ~MOD_OPCLK_MASK;
>> +		mod |= dir;
> 
> I am assuming here that dir is one of SND_SOC_CLOCK_IN or
> SND_SOC_CLOCK_OUT. In that case, you need to take care of offset (30).

And that's not a correct assumption. I also got similarly confused when 
first seeing this in our downstream kernels. 'dir' is supposed to be one 
of the MOD_OPCLK_* constants, as defined in sound/soc/samsung/i2s-regs.h.

#define MOD_OPCLK_CDCLK_OUT	(0 << 30)
#define MOD_OPCLK_CDCLK_IN	(1 << 30)
#define MOD_OPCLK_BCLK_OUT	(2 << 30)
#define MOD_OPCLK_PCLK		(3 << 30)
#define MOD_OPCLK_MASK		(3 << 30)

So the clock is reconfigured with calls like:
snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_OPCLK, 0, MOD_OPCLK_PCLK);

> Also the value of this bit-field doesn't match with SND_SOC_CLOCK_XXX
> macros.
> 
> Bit-field (2'b):
> 00	Codec Clock out
> 01	Codec Clock in
> 10	Bit clock out
> 11	Audio bus clock
> 
> Value of macros:
> SND_SOC_CLOCK_IN	0
> SND_SOC_CLOCK_OUT	1

> In the manual, this field is suggested to be Audio bus clock always. Is
> there an use-case where we might need to update this?

I've checked couple boards and AFAICS we're always setting MOD_OPCLK_PCLK,
however it's still different from the default value after reset - 
MOD_OPCLK_CDCLK_OUT. 
So how do you think this should be addressed ? Isn't it better to give
options to the machine drivers to alter these clock settings, rather than
hard coding it in the I2S driver ? Let's not forget it covers multiple 
Samsung SoC series.

> The default value for audio playback right now is 00 (2'b), which needs
> to be fixed anyways.

--
Regards,
Sylwester
