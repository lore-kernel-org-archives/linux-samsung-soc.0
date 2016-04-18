From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2] regulator: s2mps11: Set default ramp delay for S2MPS11
 LDOs
Date: Mon, 18 Apr 2016 13:03:22 -0400
Message-ID: <5715135A.4010402@osg.samsung.com>
References: <1460986390-9674-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:60960 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751420AbcDRRDd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Apr 2016 13:03:33 -0400
In-Reply-To: <1460986390-9674-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Krzysztof,

On 04/18/2016 09:33 AM, Krzysztof Kozlowski wrote:
> Driver did not provide default value for ramp delay for LDOs which lead
> to warning in dmesg, e.g. on Odroid XU4:
> 
> [    1.486076] vdd_ldo9: ramp_delay not set
> [    1.506875] vddq_mmc2: ramp_delay not set
> [    1.523766] vdd_ldo15: ramp_delay not set
> [    1.544702] vdd_sd: ramp_delay not set
> 
> The datasheet for all the S2MPS1x family is inconsistent here and does
> not specify unambiguously the value of ramp delay for LDO. It mentions
> 30 mV/us in one timing diagram but then omits it completely in LDO
> regulator characteristics table (it is specified for bucks).
> 
> However the vendor kernels for Galaxy S5 and Odroid XU3 use values of 12
> mV/us or 24 mV/us.
> 
> Without the ramp delay value the consumers do not wait for voltage
> settle after changing it. Although the proper value of ramp delay for
> LDOs is unknown, it seems safer to use at least some value from
> reference kernel than to leave it unset.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
