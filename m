From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2 1/4] Exynos4 NURI: configure regulators and PMIC
Date: Tue, 21 Jun 2011 12:10:10 +0100
Message-ID: <20110621111010.GH22177@opensource.wolfsonmicro.com>
References: <20110620103124.GD31864@opensource.wolfsonmicro.com>
 <1308622033-2521-1-git-send-email-myungjoo.ham@samsung.com>
 <1308622033-2521-2-git-send-email-myungjoo.ham@samsung.com>
 <4E002D18.2080401@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:48842 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756014Ab1FULKM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 07:10:12 -0400
Content-Disposition: inline
In-Reply-To: <4E002D18.2080401@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, myungjoo.ham@gmail.com, dg77.kim@samsung.com

On Tue, Jun 21, 2011 at 11:03:12AM +0530, Tushar Behera wrote:

> Will it be possible to move PMIC specific defines to a common file
> and make appropriate calls in the board-specific file?

> In that way, we can re-use this PMIC code on some other boards (e.g.
> Insignal low-cost board Origen featuring Exynos4210 also features
> MAX8997).

If the board is similar enough in design to be sharing the PMIC code
that sounds like it should be sharing a lot more of the board setup
code.
