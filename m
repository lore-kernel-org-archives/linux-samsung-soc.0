From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH v2 1/4] Exynos4 NURI: configure regulators and PMIC
Date: Tue, 21 Jun 2011 17:19:14 +0530
Message-ID: <4E00853A.7010003@linaro.org>
References: <20110620103124.GD31864@opensource.wolfsonmicro.com> <1308622033-2521-1-git-send-email-myungjoo.ham@samsung.com> <1308622033-2521-2-git-send-email-myungjoo.ham@samsung.com> <4E002D18.2080401@linaro.org> <20110621111010.GH22177@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:46345 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782Ab1FULtW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 07:49:22 -0400
In-Reply-To: <20110621111010.GH22177@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, myungjoo.ham@gmail.com, dg77.kim@samsung.com

On Tuesday 21 June 2011 04:40 PM, Mark Brown wrote:
> On Tue, Jun 21, 2011 at 11:03:12AM +0530, Tushar Behera wrote:
>
>> Will it be possible to move PMIC specific defines to a common file
>> and make appropriate calls in the board-specific file?
>
>> In that way, we can re-use this PMIC code on some other boards (e.g.
>> Insignal low-cost board Origen featuring Exynos4210 also features
>> MAX8997).
>
> If the board is similar enough in design to be sharing the PMIC code
> that sounds like it should be sharing a lot more of the board setup
> code.
Origen board details can be found at http://www.origenboard.org/

Under 'Documents' section, there are some schematics for the board.

As for other peripherals, I am not sure how much similar this is w.r.t. 
NURI (I don't have NURI board schematics).

-- 
Tushar Behera
