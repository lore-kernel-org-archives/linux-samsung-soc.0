From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V3 09/15] ASoC: samsung: i2s: Protect more registers with a
 spinlock
Date: Mon, 19 Jan 2015 13:28:50 +0100
Message-ID: <54BCF882.10005@samsung.com>
References: <1421260962-16892-1-git-send-email-s.nawrocki@samsung.com>
 <1421260962-16892-10-git-send-email-s.nawrocki@samsung.com>
 <CAC5m3BxTkS3KtwUC6itMRF=545PoWJw1gYV6av3p7QjtVMFXTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAC5m3BxTkS3KtwUC6itMRF=545PoWJw1gYV6av3p7QjtVMFXTQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tushar Behera <trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, Kim Sangbeom <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linux-ALSA <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, ML Devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML Arch-Arm <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tuashar,

On 17/01/15 06:21, Tushar Behera wrote:
> On Thu, Jan 15, 2015 at 3:42 AM, Sylwester Nawrocki
> <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> Ensure the I2SMOD, I2SPSR registers, which are also exposed through
>> clk API are only accessed with the i2s->spinlock spinlock held.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  sound/soc/samsung/i2s.c |   81 +++++++++++++++++++++++++++++------------------
>>  1 file changed, 51 insertions(+), 30 deletions(-)
>>
>> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
>> index 20cc51f..05fc2f0 100644
>> --- a/sound/soc/samsung/i2s.c
>> +++ b/sound/soc/samsung/i2s.c
>> @@ -472,17 +472,22 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
>>  {
>>         struct i2s_dai *i2s = to_info(dai);
>>         struct i2s_dai *other = get_other_dai(i2s);
>> -       u32 mod = readl(i2s->addr + I2SMOD);
>>         const struct samsung_i2s_variant_regs *i2s_regs = i2s->variant_regs;
>>         unsigned int cdcon_mask = 1 << i2s_regs->cdclkcon_off;
>>         unsigned int rsrc_mask = 1 << i2s_regs->rclksrc_off;
>> +       u32 mod, mask, val = 0;
>> +
>> +       spin_lock(i2s->lock);
>> +       mod = readl(i2s->addr + I2SMOD);
>> +       spin_unlock(i2s->lock);
>>
> 
> 'mod' is now updated only at the bottom of this function. The above
> readl can be omitted.

mod is used in some of the 'if' statements below, so we must read it
here beforehand.

>>         switch (clk_id) {
>>         case SAMSUNG_I2S_OPCLK:
>> -               mod &= ~MOD_OPCLK_MASK;
>> -               mod |= dir;
>> +               mask = MOD_OPCLK_MASK;
>> +               val = dir;
>>                 break;
>>         case SAMSUNG_I2S_CDCLK:
>> +               mask = 1 << i2s_regs->cdclkcon_off;
> 
> Use BIT() macro instead?

Yes, it would be a good code cleanup, might be worth to include it in
some future patch series. I'll keep it in mind, since this patch is merged
already.
And the logical bit operations is one of things people make mistakes most
often, so any changes like these would need to be well tested and/or
carefully reviewed.

--
Thanks,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
