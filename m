From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2 5/5] ARM: S5PV210: Initial CPUFREQ Support
Date: Fri, 16 Jul 2010 09:58:45 +0100
Message-ID: <20100716085844.GC18376@sirena.org.uk>
References: <1279267277-6804-1-git-send-email-myungjoo.ham@samsung.com> <1279267277-6804-2-git-send-email-myungjoo.ham@samsung.com> <1279267277-6804-3-git-send-email-myungjoo.ham@samsung.com> <1279267277-6804-4-git-send-email-myungjoo.ham@samsung.com> <1279267277-6804-5-git-send-email-myungjoo.ham@samsung.com> <1279267277-6804-6-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:58238 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S936027Ab0GPI6t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jul 2010 04:58:49 -0400
Content-Disposition: inline
In-Reply-To: <1279267277-6804-6-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org

On Fri, Jul 16, 2010 at 05:01:17PM +0900, MyungJoo Ham wrote:
> S5PV210 CPUFREQ Support.
> 
> This CPUFREQ may work without PMIC's DVS support. However, it is not
> as effective without DVS support as supposed. AVS is not supported in
> this version.

Especially in terms of the regulator API usage:

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
