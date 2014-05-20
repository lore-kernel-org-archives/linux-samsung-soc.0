From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ASoC: samsung: Allow setting OP_CLK of the IIS Multi
 Audio Interface
Date: Tue, 20 May 2014 10:44:41 +0530
Message-ID: <537AE4C1.7050703@linaro.org>
References: <1400520638-6907-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1400520638-6907-1-git-send-email-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/19/2014 11:00 PM, Sylwester Nawrocki wrote:
> This patch adds support for setting source clock of the "Core CLK"
> of the IIS Multi Audio Interface.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c |    4 ++++
>  sound/soc/samsung/i2s.h |    1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index 048ead9..ae02811 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -451,6 +451,10 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
>  	u32 mod = readl(i2s->addr + I2SMOD);
>  
>  	switch (clk_id) {
> +	case SAMSUNG_I2S_OPCLK:
> +		mod &= ~MOD_OPCLK_MASK;
> +		mod |= dir;

I am assuming here that dir is one of SND_SOC_CLOCK_IN or
SND_SOC_CLOCK_OUT. In that case, you need to take care of offset (30).

Also the value of this bit-field doesn't match with SND_SOC_CLOCK_XXX
macros.

Bit-field (2'b):
00	Codec Clock out
01	Codec Clock in
10	Bit clock out
11	Audio bus clock

Value of macros:
SND_SOC_CLOCK_IN	0
SND_SOC_CLOCK_OUT	1

In the manual, this field is suggested to be Audio bus clock always. Is
there an use-case where we might need to update this?

The default value for audio playback right now is 00 (2'b), which needs
to be fixed anyways.

-- 
Tushar Behera
