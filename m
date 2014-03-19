From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 2/3] mfd: sec-core: Add of_compatible strings for clock
 MFD cells
Date: Wed, 19 Mar 2014 14:15:51 +0100
Message-ID: <1395234951.7642.1.camel@AMDC1943>
References: <1395047958-17953-1-git-send-email-k.kozlowski@samsung.com>
 <1395047958-17953-3-git-send-email-k.kozlowski@samsung.com>
 <20140318203159.GW25478@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:19443 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965229AbaCSNP4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Mar 2014 09:15:56 -0400
In-reply-to: <20140318203159.GW25478@lee--X1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>

On Tue, 2014-03-18 at 20:31 +0000, Lee Jones wrote:
> > Add of_compatible strings for S5M8767 and S2MPS14 clock MFD cells.
> > 
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > ---
> >  drivers/mfd/sec-core.c |    3 +++
> >  1 file changed, 3 insertions(+)
> 
> Applied with Tomasz' Reviewed-by.

Thanks! One minor thing - I see that Tomasz' Review-by got lost when the
patch was applied to your tree:
https://git.kernel.org/cgit/linux/kernel/git/lee/mfd.git/commit/?h=for-mfd-next&id=09f8c0a07044bb8ac5085fcbcf82468173a1666d.

Best regards,
Krzysztof
