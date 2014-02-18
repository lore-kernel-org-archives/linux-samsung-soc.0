From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 11/14] regulator: s2mps11: Add opmode for S2MPS14
 regulators
Date: Tue, 18 Feb 2014 09:12:09 +0100
Message-ID: <1392711129.14646.9.camel@AMDC1943>
References: <1392282847-25444-1-git-send-email-k.kozlowski@samsung.com>
 <1392282847-25444-12-git-send-email-k.kozlowski@samsung.com>
 <CAKew6eWcwVm1EAUAdFu48y_O5puu+eGvGW3k6923MdXfMa3UAw@mail.gmail.com>
 <1392383156.12506.20.camel@AMDC1943> <20140214210502.GX4451@sirena.org.uk>
 <1392624454.3755.12.camel@AMDC1943> <20140218003555.GJ2669@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:26292 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754045AbaBRIMO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Feb 2014 03:12:14 -0500
In-reply-to: <20140218003555.GJ2669@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Yadwinder Singh Brar <yadi.brar01@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <t.figa@samsung.com>

On Tue, 2014-02-18 at 09:35 +0900, Mark Brown wrote:
> On Mon, Feb 17, 2014 at 09:07:34AM +0100, Krzysztof Kozlowski wrote:
> 
> > The low power maps to REGULATOR_MODE_IDLE or REGULATOR_MODE_STANDBY
> > (depending on the understanding of "more efficient" and "most efficient"
> > for light loads). However the suspend mode of S5M8767/S2MPS14 is more
> > like automatic regulator disable by SoC.
> 
> I don't understand the above?  Are you saying that suspend mode actually
> turns off the regulator or something else? If it's a separate setting
> for suspend mode then it should be using the core suspend mode stuff.

No, it is similar to external control (by GPIO) except that regulator is
controlled by PWREN pin. The PMIC's PWREN is not a GPIO, but instead it
is directly connected to AP (for Exynos 4212: XPWRRGTON). In AP's normal
mode the XPWRRGTON/PWREN is high. In sleep mode *AP* sets it low.

Best regards,
Krzysztof
