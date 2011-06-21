From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH v2 1/4] Exynos4 NURI: configure regulators and PMIC
Date: Tue, 21 Jun 2011 11:03:12 +0530
Message-ID: <4E002D18.2080401@linaro.org>
References: <20110620103124.GD31864@opensource.wolfsonmicro.com> <1308622033-2521-1-git-send-email-myungjoo.ham@samsung.com> <1308622033-2521-2-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:50058 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751035Ab1FUFdU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 01:33:20 -0400
In-Reply-To: <1308622033-2521-2-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, myungjoo.ham@gmail.com, dg77.kim@samsung.com

On Tuesday 21 June 2011 07:37 AM, MyungJoo Ham wrote:
> Signed-off-by: MyungJoo Ham<myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>
> --
> Changes from v1. Thanks so much for your valuable comments, Mark.
> - Removed unnecessary initialization data
> - Add __initdata where necessary
> - Corrected a regulator name for ADC
> ---
>   arch/arm/mach-exynos4/mach-nuri.c |  622 ++++++++++++++++++++++++++++++++++++-
>   1 files changed, 621 insertions(+), 1 deletions(-)
>
Will it be possible to move PMIC specific defines to a common file and 
make appropriate calls in the board-specific file?

In that way, we can re-use this PMIC code on some other boards (e.g. 
Insignal low-cost board Origen featuring Exynos4210 also features MAX8997).


-- 
Tushar Behera
