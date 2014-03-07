From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/3] regulator: s2mps11: Add set_suspend_disable for S2MPS14
Date: Fri, 07 Mar 2014 08:28:11 +0100
Message-ID: <1394177291.20224.1.camel@AMDC1943>
References: <1394011373-4057-1-git-send-email-k.kozlowski@samsung.com>
 <1394011373-4057-3-git-send-email-k.kozlowski@samsung.com>
 <20140306093826.GO13126@sirena.org.uk> <1394099334.25853.1.camel@AMDC1943>
 <20140307015139.GS13126@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:17166 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750834AbaCGH2P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Mar 2014 02:28:15 -0500
In-reply-to: <20140307015139.GS13126@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>

On Fri, 2014-03-07 at 09:51 +0800, Mark Brown wrote:
> On Thu, Mar 06, 2014 at 10:48:54AM +0100, Krzysztof Kozlowski wrote:
> 
> > Anyway can you look at other two patches and apply them if they are OK?
> > They don't depend on this.
> 
> There appears to be some external dependency for the definition of
> macros like S2MPS14X?
The patchset depends on S2MPS14 support for MFD driver. This was applied
by Lee here:
https://git.linaro.org/people/lee.jones/mfd.git/shortlog/refs/heads/for-mfd-next
and merged into linux-next.

Best regards,
Krzysztof
