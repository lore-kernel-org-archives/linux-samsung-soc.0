From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 11/14] regulator: s2mps11: Add opmode for S2MPS14
 regulators
Date: Fri, 14 Feb 2014 09:15:12 +0100
Message-ID: <1392365712.29133.16.camel@AMDC1943>
References: <1392282847-25444-1-git-send-email-k.kozlowski@samsung.com>
 <1392282847-25444-12-git-send-email-k.kozlowski@samsung.com>
 <20140213192835.GD28112@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29306 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751145AbaBNIPQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Feb 2014 03:15:16 -0500
In-reply-to: <20140213192835.GD28112@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>

On Thu, 2014-02-13 at 19:28 +0000, Mark Brown wrote:
> On Thu, Feb 13, 2014 at 10:14:04AM +0100, Krzysztof Kozlowski wrote:
> > S2MPS11/S2MPS14 regulators support different modes of operation:
> >  - Always off;
> >  - On/Off controlled by pin/GPIO (PWREN/LDOEN/EMMCEN);
> >  - Always on;
> > This is very similar to S5M8767 regulator driver which also supports
> > opmodes (although S5M8767 have also low-power mode).
> 
> What is the difference between always off/on and the normal enable
> control?  This sounds like a fairly standard register control that can
> be overridden by a GPIO.  The usual way of specifying that is by keying
> off the presence of the GPIO.

My initial idea was to do this similarly to the S5M8767 regulator (where
there is also 4th mode: low power). The presence of GPIO in DTS can
simplify the bindings but on the other hand it wouldn't be compatible
with S5M8767 regulator driver. This may complicate the merge of these
drivers.

What is your opinion on this - should I abandon the "op_mode" idea and
use presence of GPIO?

Best regards,
Krzysztof
