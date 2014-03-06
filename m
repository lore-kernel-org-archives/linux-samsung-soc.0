From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/3] regulator: s2mps11: Add set_suspend_disable for S2MPS14
Date: Thu, 06 Mar 2014 10:48:54 +0100
Message-ID: <1394099334.25853.1.camel@AMDC1943>
References: <1394011373-4057-1-git-send-email-k.kozlowski@samsung.com>
 <1394011373-4057-3-git-send-email-k.kozlowski@samsung.com>
 <20140306093826.GO13126@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20140306093826.GO13126@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 2014-03-06 at 17:38 +0800, Mark Brown wrote:
> On Wed, Mar 05, 2014 at 10:22:52AM +0100, Krzysztof Kozlowski wrote:
> 
> > +	ret = regmap_read(rdev->regmap, rdev->desc->enable_reg, &data);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/*
> > +	 * Don't enable suspend mode if regulator is already disabled because
> > +	 * this would effectively for a short time turn on the regulator after
> > +	 * resuming.
> > +	 */
> > +	if (!(data & rdev->desc->enable_mask))
> > +		return 0;
> > +
> > +	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
> > +			rdev->desc->enable_mask, S2MPS14_ENABLE_SUSPEND);
> > +}
> 
> What happens if the regulator gets enabled between this being called
> and the device suspending?  I'd expect this to be storing the state and
> then changing what gets written during enable and disable operations (if
> the hardware does what I think it does).

Hmmm... you're right. I'll fix this.

Anyway can you look at other two patches and apply them if they are OK?
They don't depend on this.

Best regards,
Krzysztof
