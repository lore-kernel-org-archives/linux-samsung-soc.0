From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 07/14] regulator: s2mps11: Copy supported regulators
 from initconst
Date: Thu, 13 Feb 2014 13:35:23 +0100
Message-ID: <1392294923.14541.0.camel@AMDC1943>
References: <1392282847-25444-1-git-send-email-k.kozlowski@samsung.com>
 <1392282847-25444-8-git-send-email-k.kozlowski@samsung.com>
 <CAKew6eUtuQEHJJ9G+g54LRoH8sXzqixDBUEjCjFyRDJTRP00Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:8888 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754031AbaBMMf2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Feb 2014 07:35:28 -0500
In-reply-to: <CAKew6eUtuQEHJJ9G+g54LRoH8sXzqixDBUEjCjFyRDJTRP00Nw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>

On Thu, 2014-02-13 at 17:51 +0530, Yadwinder Singh Brar wrote:
> Hi,
> 
> On Thu, Feb 13, 2014 at 2:44 PM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
> > Add __initconst to 'regulator_desc' array with supported regulators.
> > During probe choose how many and which regulators will be supported
> > according to device ID. Then copy the 'regulator_desc' array to
> > allocated memory so the regulator core can use it.
> >
> > Additionally allocate array of of_regulator_match() dynamically (based
> > on number of regulators) instead of allocation on the stack.
> >
> > This is needed for supporting different devices in s2mps11
> > driver and actually prepares the regulator driver for supporting the
> > S2MPS14 device.
> >
> > Code for supporting the S2MPS14 device will add its own array of
> > 'regulator_desc' (also marked as __initconst). This way memory footprint
> > of the driver will be reduced (approximately 'regulators_desc' array for
> > S2MPS11 occupies 5 kB on 32-bit ARM, for S2MPS14 will occupy 3 kB).
> >
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > Cc: Yadwinder Singh Brar <yadi.brar01@gmail.com>
> > ---
> 
> Just observed one trivial thing that in this patch, spacing is not
> provided before and after multiplication binary operator ( _ * _ ),
> which is recommended by linux spacing convention.
> 
> Other than that it looks fine to me, pls feel free to add
> 
> Reviewed-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> 

Thanks for review. I'll send a patch with proper spacing around '*'.

Best regards,
Krzysztof
