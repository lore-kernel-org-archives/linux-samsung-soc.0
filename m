From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [RFT v2 2/5] ASoC: samsung: smdk_wm8580: Remove old platforms and
 drop mach-types usage
Date: Mon, 21 Nov 2016 11:30:41 +0100
Message-ID: <8b81b058-0ba9-f1bc-a0ed-d30604853110@samsung.com>
References: <1479669895-19124-1-git-send-email-krzk@kernel.org>
 <CGME20161120192523epcas1p4f764b20d525d28059b85373276a4f725@epcas1p4.samsung.com>
 <1479669895-19124-3-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1479669895-19124-3-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
List-Id: linux-samsung-soc@vger.kernel.org

On 11/20/2016 08:24 PM, Krzysztof Kozlowski wrote:
> MACH_SMDKC100, MACH_SMDKV210 and MACH_SMDKC110 are no longer supported
> so we can drop the dead code.  After this the driver no longer
> differentiates between machines (S3C24xx machines are not supported by
> it) so there is no need to override I2S device id in cpu_dai_name and
> SEC_PLAYBACK dai_link can be removed as well.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
> 
> Not tested. The driver did not override .platform_name which looks
> suspicious to me. However I did not want to add changes which could have
> some visible impact on output code.

The patch looks good to me. However the existing smdk64xx sound support
less so. I don't have smdk6410 set up for testing yet, possibly I get
around that next week.
Indeed it's strange .platform_name is not also "samsung-i2s.2".

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
