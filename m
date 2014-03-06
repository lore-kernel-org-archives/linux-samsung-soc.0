From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/3] regulator: s2mps11: Add set_suspend_disable for S2MPS14
Date: Thu, 06 Mar 2014 15:42:22 +0100
Message-ID: <1394116942.25853.14.camel@AMDC1943>
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

It seems that none of the regulators implementing set_suspend_disable()
work that way. They just write the suspend value to device. Of course
this is not an issue - the S2MPS14 may be the first :).

However in that case the driver won't be able later to change that value
back to "normal enable" (enable_mask). Consider such flow:
1. System is going to suspend.
2. Some regulator has "rstate->disabled" so set_suspend_disable() is
called on it.
3. The "suspend" value is written to the device for given regulator and
it is stored as "enable" value.
4. If regulator is enabled during here then the same "suspend" value
will be written.
5. System is suspended.
6. After resuming regulator_suspend_finish() calls
_regulator_do_enable() on the regulator... which will write the
"suspend" value because the driver cannot differentiate between this
enable and previous.

I assume that this may not be a problem because:
1. Regulator will be still turned on (the "suspend" value tells PMIC to
enable the regulator when SoC enables power).
2. The first disable of regulator may bring back "enable" value back to
normal mode.

Am I thinking here correctly? 


Best regards,
Krzysztof
