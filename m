From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 6/8] regulator: max77686: Add external GPIO control
Date: Tue, 28 Oct 2014 09:52:36 +0100
Message-ID: <1414486356.24949.19.camel@AMDC1943>
References: <1414422226-10948-1-git-send-email-k.kozlowski@samsung.com>
 <1414422226-10948-7-git-send-email-k.kozlowski@samsung.com>
 <544EA4FA.6040704@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:17516 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932598AbaJ1Iwl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Oct 2014 04:52:41 -0400
In-reply-to: <544EA4FA.6040704@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On pon, 2014-10-27 at 21:03 +0100, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 10/27/2014 04:03 PM, Krzysztof Kozlowski wrote:
> > @@ -85,6 +91,9 @@ struct max77686_data {
> >  	struct max77686_regulator_data *regulators;
> >  	int num_regulators;
> >  
> > +	/* Array of size num_regulators with GPIOs for external control. */
> > +	int *ext_control_gpio;
> > +
> 
> The integer-based GPIO API is deprecated in favor of the descriptor-based GPIO
> interface (Documentation/gpio/consumer.txt). Could you please use the later?

Sure, I can. Please have in mind that regulator core still accepts old
GPIO so I will have to use desc_to_gpio(). That should work... and
should be future-ready.

Thanks for feedback,
Krzysztof

> 
> Best regards,
> Javier
