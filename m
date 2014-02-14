From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 11/14] regulator: s2mps11: Add opmode for S2MPS14
 regulators
Date: Fri, 14 Feb 2014 14:05:56 +0100
Message-ID: <1392383156.12506.20.camel@AMDC1943>
References: <1392282847-25444-1-git-send-email-k.kozlowski@samsung.com>
 <1392282847-25444-12-git-send-email-k.kozlowski@samsung.com>
 <CAKew6eWcwVm1EAUAdFu48y_O5puu+eGvGW3k6923MdXfMa3UAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56267 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751288AbaBNNGA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Feb 2014 08:06:00 -0500
In-reply-to: <CAKew6eWcwVm1EAUAdFu48y_O5puu+eGvGW3k6923MdXfMa3UAw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <t.figa@samsung.com>



On Thu, 2014-02-13 at 17:46 +0530, Yadwinder Singh Brar wrote:
> Hi,
> 
> On Thu, Feb 13, 2014 at 2:44 PM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
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
> 
> First thing since "op_mode" is not generic property, I think it should
> be appended with some driver specific prefix.
> 
> But IMHO its quite generic property used and required by many other
> PMICs(almost all used by Samsung).
> I would like to use this opportunity to discuss about adding it as
> generic regulator constraint(as initial_mode)
> by providing a default mapping of generic Regulator operating
> modes(kernel specific) to operating modes supported by hardware in
> regulator driver itself.
> 
> Regards,
> Yadwinder

Hi,

I was thinking about this. This relates also to ideas pointed by Mark:
 - Maybe s2mps11 and s5m8767 regulator drivers could be merged into one;
 - The external control should be determined by presence of attribute
with gpios.

The S5M8767 has following operation modes (except on/off):
 - external control by GPIO;
 - On/Off controlled by PWREN;
 - low-power mode;
 - low-power mode controlled by PWREN;
Although not all are present for each regulator.

The S2MPS14 is easier:
 - external control by GPIO;
 - On/Off controlled by PWREN;

A generic solution for operating mode of regulators (not only s2mps11
and s5m8767) could cover all of these above or just a subset, for
example regulator bindings could look like:
 - regulator-mode-suspend; /* PWR controls: on/off or low-power mode */
 - regulator-mode-low-power; /* Low power mode */


What do you think?

Best regards,
Krzysztof
