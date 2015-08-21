From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ASoC: Samsung: Remove redundant arndale_audio_remove
Date: Fri, 21 Aug 2015 09:48:22 +0900
Message-ID: <55D67556.4040500@samsung.com>
References: <20150820164115.GA19191@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:52353 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752796AbbHUAsY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Aug 2015 20:48:24 -0400
In-reply-to: <20150820164115.GA19191@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vaishali Thakkar <vthakkar1994@gmail.com>, Kukjin Kim <kgene@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

On 21.08.2015 01:41, Vaishali Thakkar wrote:
> There is no use of snd_soc_unregister_card in remove function
> as devm_snd_soc_register_card in probe function automatically
> handles it. So, remove use of snd_soc_unregister_card and with
> this change remove arndale_audio_remove as it is now redundant.
> 
> Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>z
> ---
>  sound/soc/samsung/arndale_rt5631.c | 10 ----------
>  1 file changed, 10 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
