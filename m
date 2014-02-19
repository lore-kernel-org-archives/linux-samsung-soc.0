From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 11/14] regulator: s2mps11: Add opmode for S2MPS14
 regulators
Date: Wed, 19 Feb 2014 15:19:00 +0100
Message-ID: <1392819540.12624.14.camel@AMDC1943>
References: <1392282847-25444-1-git-send-email-k.kozlowski@samsung.com>
 <1392282847-25444-12-git-send-email-k.kozlowski@samsung.com>
 <CAKew6eWcwVm1EAUAdFu48y_O5puu+eGvGW3k6923MdXfMa3UAw@mail.gmail.com>
 <1392383156.12506.20.camel@AMDC1943> <20140214210502.GX4451@sirena.org.uk>
 <1392624454.3755.12.camel@AMDC1943> <20140218003555.GJ2669@sirena.org.uk>
 <1392711129.14646.9.camel@AMDC1943> <20140219040818.GQ2669@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34798 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753483AbaBSOTE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Feb 2014 09:19:04 -0500
In-reply-to: <20140219040818.GQ2669@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Yadwinder Singh Brar <yadi.brar01@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <t.figa@samsung.com>

On Wed, 2014-02-19 at 13:08 +0900, Mark Brown wrote:
> On Tue, Feb 18, 2014 at 09:12:09AM +0100, Krzysztof Kozlowski wrote:
> > On Tue, 2014-02-18 at 09:35 +0900, Mark Brown wrote:
> 
> > > I don't understand the above?  Are you saying that suspend mode actually
> > > turns off the regulator or something else? If it's a separate setting
> > > for suspend mode then it should be using the core suspend mode stuff.
> 
> > No, it is similar to external control (by GPIO) except that regulator is
> > controlled by PWREN pin. The PMIC's PWREN is not a GPIO, but instead it
> > is directly connected to AP (for Exynos 4212: XPWRRGTON). In AP's normal
> > mode the XPWRRGTON/PWREN is high. In sleep mode *AP* sets it low.
> 
> How is that different to suspend mode then?

I found two differences: performance (no need to send I2C commands) and
possible issues during resume.

Example: regulator which should be disabled during suspend to memory and
enabled for normal system operation.

As I understand the suspend mode (correct me if I'm wrong), the
regulator core during suspend to mem:
1. Calls suspend_set_state().
2. rstate->disabled is true so the ops->set_suspend_disable() is called.
3. The ops->set_suspend_disable() function (implemented by the driver)
disables the regulator (e.g. through I2C commands /regmap/).
4. During resume the regulator is enabled normal way (ops->enable(), I2C
again).

Possible problems:
A. What happens if some driver using this regulator resumes earlier then
regulator_suspend_finish()?
B. What happens if resuming regulator requires some other driver to be
resumed earlier (e.g. I2C bus)? If regulator resumes before I2C bus then
calling ops->enable() would fail.


The S5M8767 suspend mode (controlled by PWREN pin) works differently:
1. To enable regulator set regulator mode to "On/Off controller by
PWREN". During normal mode it will be enabled.
2. During suspend the regulator won't be suspended or disabled by
regulator core but instead the SoC will set PWREN to low and PMIC will
disable the regulator. No need to send I2C commands.
3. During resume the PWREN will be set to high and PMIC will enable the
regulator before resuming other drivers. No need to send I2C commands as
well.


Best regards,
Krzysztof
