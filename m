From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: ABBA deadlock in Common Clock Framework
Date: Wed, 02 Jul 2014 14:41:54 +0200
Message-ID: <53B3FE12.3000608@samsung.com>
References: <53B3E5F8.80501@samsung.com>
 <20140702114924.GC3679@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45513 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751297AbaGBMl7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 08:41:59 -0400
In-reply-to: <20140702114924.GC3679@tbergstrom-lnx.Nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Tomasz Figa <t.figa@samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?B?VG9tYXN6IFN0YW5pc8WCYXdza2k=?= <t.stanislaws@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, Andrzej Hajda <a.hajda@samsung.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 02/07/14 13:49, Peter De Schrijver wrote:
> Or if you use notifiers which use i2c... See also
> http://comments.gmane.org/gmane.linux.kernel/1553699. One workaround is to
> always leave the clock of the i2c controller in a prepared state.

Keeping the clock always prepared might not be that bad, given
prepare/unprepare ops are empty on Exynos and I'd say chances
this ever changes are very low. Now we have just an overhead
of calling to the clock core before and after each single I2C
transfer.

--
Regards,
Sylwester
