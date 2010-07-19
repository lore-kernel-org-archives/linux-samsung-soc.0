From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v3 7/7] ARM: S5PV210: Initial CPUFREQ Support
Date: Mon, 19 Jul 2010 09:47:46 +0100
Message-ID: <20100719084745.GA7002@sirena.org.uk>
References: <1279517483-22751-1-git-send-email-myungjoo.ham@samsung.com> <1279517483-22751-2-git-send-email-myungjoo.ham@samsung.com> <1279517483-22751-3-git-send-email-myungjoo.ham@samsung.com> <1279517483-22751-4-git-send-email-myungjoo.ham@samsung.com> <1279517483-22751-5-git-send-email-myungjoo.ham@samsung.com> <1279517483-22751-6-git-send-email-myungjoo.ham@samsung.com> <1279517483-22751-7-git-send-email-myungjoo.ham@samsung.com> <1279517483-22751-8-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:47741 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760226Ab0GSIrt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jul 2010 04:47:49 -0400
Content-Disposition: inline
In-Reply-To: <1279517483-22751-8-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org

On Mon, Jul 19, 2010 at 02:31:23PM +0900, MyungJoo Ham wrote:
> S5PV210 CPUFREQ Support.
> 
> This CPUFREQ may work without PMIC's DVS support. However, it is not
> as effective without DVS support as supposed. AVS is not supported in
> this version.
> 
> Note that CLK_SRC of some clocks including ARMCLK, G3D, G2D, MFC,
> and ONEDRAM are modified directly without updating clksrc_src
> representations of the clocks.  Because CPUFREQ reverts the CLK_SRC
> to the supposed values, this does not affect the consistency as long as
> there are no other modules that modifies clock sources of ARMCLK, G3D,
> G2D, MFC, and ONEDRAM (and only CPUFREQ should have the control). As
> soon as clock framework is settled, we may update source clocks
> (.parent field) of those clocks accordingly later.
> 
> 
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Still:

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
