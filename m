From: "Javi Merino" <javi.merino@arm.com>
Subject: Re: [PATCH] thermal: Add missing cpumask_clear
Date: Tue, 8 Jul 2014 14:56:14 +0100
Message-ID: <20140708135613.GD2796@e104805>
References: <000001cf9771$e2f465c0$a8dd3140$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:59171 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751931AbaGHN4U convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 09:56:20 -0400
In-Reply-To: <000001cf9771$e2f465c0$a8dd3140$@samsung.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jonghwan Choi <jhbird.choi@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 'Eduardo Valentin' <eduardo.valentin@ti.com>, 'Jonghwa Lee' <jonghwa3.lee@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, 'Lukasz Majewski' <l.majewski@samsung.com>

On Fri, Jul 04, 2014 at 11:22:40AM +0100, Jonghwan Choi wrote:
> Cpumasks should be cleared before using.
> 
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  drivers/thermal/db8500_cpufreq_cooling.c        |    1 +
>  drivers/thermal/imx_thermal.c                   |    1 +
>  drivers/thermal/samsung/exynos_thermal_common.c |    1 +
>  3 files changed, 3 insertions(+)

Reviewed-by: Javi Merino <javi.merino@arm.com>

You should send this patch to linux-pm, I think it should go via the
thermal tree.

Cheers,
Javi
