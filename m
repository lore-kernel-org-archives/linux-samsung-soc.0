From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 02/14] regulator: Add function to map modes to struct
 regulator_desc
Date: Tue, 04 Nov 2014 11:31:12 +0100
Message-ID: <1415097072.7941.5.camel@AMDC1943>
References: <1415025649-8119-1-git-send-email-javier.martinez@collabora.co.uk>
 <1415025649-8119-3-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38674 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752559AbaKDKbQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Nov 2014 05:31:16 -0500
In-reply-to: <1415025649-8119-3-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On pon, 2014-11-03 at 15:40 +0100, Javier Martinez Canillas wrote:
> The regulator-initial-mode and regulator-mode DT properties allows to
> configure the regulator operating modes at startup or when a system
> enters into a susend state.
> 
> But these properties use as valid values the operating modes supported
> by each device while the core deals with the standard operating modes.
> So a mapping function is needed to translate from the hardware specific
> modes to the standard ones.
> 
> This mapping is a non-varying configuration for each regulator, so add
> a function pointer to struct regulator_desc that will allow drivers to
> define their callback to do the modes translation.
> 
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  include/linux/regulator/driver.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
> index 28da08e..b54d037 100644
> --- a/include/linux/regulator/driver.h
> +++ b/include/linux/regulator/driver.h
> @@ -243,6 +243,8 @@ enum regulator_type {
>   *
>   * @enable_time: Time taken for initial enable of regulator (in uS).
>   * @off_on_delay: guard time (in uS), before re-enabling a regulator
> + *
> + * @map_modes: Callback invoked to translate between hardware to standard modes.

Initially I thought it should map from standard to hardware. But then I
looked at max77802 implementation and it maps from hardware to standard.
Anyway I got confused (both are "modes" and both unsigned ints).

Could you describe which should be returned?


>   */
>  struct regulator_desc {
>  	const char *name;
> @@ -285,6 +287,8 @@ struct regulator_desc {
>  	unsigned int enable_time;
>  
>  	unsigned int off_on_delay;
> +
> +	unsigned int (*map_modes)(unsigned int mode);

Shouldn't this be in regulator ops?

Best regards,
Krzysztof
