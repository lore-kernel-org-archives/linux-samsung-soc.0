From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/3] regulator: s2mps11: Add set_suspend_disable for S2MPS14
Date: Fri, 07 Mar 2014 11:15:10 +0100
Message-ID: <1394187310.30396.0.camel@AMDC1943>
References: <1394011373-4057-1-git-send-email-k.kozlowski@samsung.com>
 <1394011373-4057-3-git-send-email-k.kozlowski@samsung.com>
 <20140306093826.GO13126@sirena.org.uk> <1394116942.25853.14.camel@AMDC1943>
 <20140307023747.GT13126@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20140307023747.GT13126@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 2014-03-07 at 10:37 +0800, Mark Brown wrote:
> On Thu, Mar 06, 2014 at 03:42:22PM +0100, Krzysztof Kozlowski wrote:
> 
> > However in that case the driver won't be able later to change that value
> > back to "normal enable" (enable_mask). Consider such flow:
> > 1. System is going to suspend.
> > 2. Some regulator has "rstate->disabled" so set_suspend_disable() is
> > called on it.
> > 3. The "suspend" value is written to the device for given regulator and
> > it is stored as "enable" value.
> > 4. If regulator is enabled during here then the same "suspend" value
> > will be written.
> > 5. System is suspended.
> > 6. After resuming regulator_suspend_finish() calls
> > _regulator_do_enable() on the regulator... which will write the
> > "suspend" value because the driver cannot differentiate between this
> > enable and previous.
> 
> > I assume that this may not be a problem because:
> > 1. Regulator will be still turned on (the "suspend" value tells PMIC to
> > enable the regulator when SoC enables power).
> > 2. The first disable of regulator may bring back "enable" value back to
> > normal mode.
> 
> > Am I thinking here correctly? 
> 
> I'm not entirely sure I follow here.  Why would a disable reset the
> enable value?  My understanding is that this is a bitfield with several
> values, off, on always and on when they system is active.  The suspend
> state is being tracked with a variable so I'm not sure why disabling
> would reset it?
> 
> There is a bit of an issue if the regulator is disabled during runtime
> but enabled in suspend but that's hard to resolve and I'm not sure that
> it's a realistic issue.

OK, I think I understand it... I sent v2 of the set_suspend_disable
patch.

Best regards,
Krzysztof
