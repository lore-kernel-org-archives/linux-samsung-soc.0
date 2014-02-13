From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 11/14] regulator: s2mps11: Add opmode for S2MPS14
 regulators
Date: Thu, 13 Feb 2014 14:00:52 +0100
Message-ID: <1392296452.14541.7.camel@AMDC1943>
References: <1392282847-25444-1-git-send-email-k.kozlowski@samsung.com>
 <1392282847-25444-12-git-send-email-k.kozlowski@samsung.com>
 <20140213124320.GB3403@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:10199 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753189AbaBMNA4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Feb 2014 08:00:56 -0500
In-reply-to: <20140213124320.GB3403@lee--X1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>



On Thu, 2014-02-13 at 12:43 +0000, Lee Jones wrote:
> > S2MPS11/S2MPS14 regulators support different modes of operation:
> >  - Always off;
> >  - On/Off controlled by pin/GPIO (PWREN/LDOEN/EMMCEN);
> >  - Always on;
> > This is very similar to S5M8767 regulator driver which also supports
> > opmodes (although S5M8767 have also low-power mode).
> > 
> > This patch adds parsing the operation mode from DTS by reading a
> > "op_mode" property from regulator child node.
> > 
> > The op_mode is then used for enabling the S2MPS14 regulators.
> > On S2MPS11 the DTS "op_mode" property is parsed but not used for
> > enabling, as this was not tested.
> > 
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > ---
> >  drivers/regulator/s2mps11.c         |   97 ++++++++++++++++++++++++++++++++++-
> >  include/linux/mfd/samsung/s2mps14.h |   19 +++++++
> >  2 files changed, 115 insertions(+), 1 deletion(-)
> 
> <snip>
> 
> > +++ b/include/linux/mfd/samsung/s2mps14.h
> > @@ -149,4 +149,23 @@ enum s2mps14_regulators {
> >  #define S2MPS14_LDO_N_VOLTAGES		(S2MPS14_LDO_VSEL_MASK + 1)
> >  #define S2MPS14_BUCK_N_VOLTAGES		(S2MPS14_BUCK_VSEL_MASK + 1)
> >  
> > +#define S2MPS14_ENCTRL_SHIFT		6
> > +#define S2MPS14_ENCTRL_MASK		(0x3 << S2MPS14_ENCTRL_SHIFT)
> > +
> > +/*
> > + * Values of regulator operation modes match device tree bindings.
> > + */
> > +enum s2mps14_regulator_opmode {
> > +	S2MPS14_REGULATOR_OPMODE_OFF		= 0,
> > +	S2MPS14_REGULATOR_OPMODE_ON		= 1,
> > +	/*
> > +	 * Reserved for compatibility with S5M8767 where this
> > +	 * is a low power mode.
> > +	 */
> > +	S2MPS14_REGULATOR_OPMODE_RESERVED	= 2,
> > +	S2MPS14_REGULATOR_OPMODE_SUSPEND	= 3,
> 
> You don't need to number these like this. If you want to force the
> numbering to start at '0' initialise the top value, then the rest
> should be sequential.

Yes, I know. I wanted to emphasize the relationship to opmode entries in
DTS (to prevent adding new enum value somewhere between them). The code
somehow self-documents that the enum should only be extended, not
modified.

Best regards,
Krzysztof

> 
> > +	S2MPS14_REGULATOR_OPMODE_MAX,
> > +};
> > +
> >  #endif /*  __LINUX_MFD_S2MPS14_H */
> 
