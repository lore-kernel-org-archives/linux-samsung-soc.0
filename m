From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v8 0/3] Exynos 5410 support
Date: Mon, 19 May 2014 09:58:04 +0900
Message-ID: <019101cf72fd$644883c0$2cd98b40$@samsung.com>
References: <1397459860-21869-1-git-send-email-t.dakhran@samsung.com>
 <7hppk5f26g.fsf@paris.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:32530 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752493AbaESA6I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 May 2014 20:58:08 -0400
In-reply-to: <7hppk5f26g.fsf@paris.lan>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kevin Hilman' <khilman@linaro.org>, 'Tarek Dakhran' <t.dakhran@samsung.com>
Cc: linux-kernel@vger.kernel.org, 'Rob Herring' <robh+dt@kernel.org>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, 'Kumar Gala' <galak@codeaurora.org>, 'Rob Landley' <rob@landley.net>, 'Russell King' <linux@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>, 'Tomasz Figa' <t.figa@samsung.com>, 'Mike Turquette' <mturquette@linaro.org>, 'Vyacheslav Tyrtov' <v.tyrtov@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Heiko Stuebner' <heiko@sntech.de>, 'Romain Naour' <romain.naour@openwide.fr>, 'Chander Kashyap' <chander.kashyap@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Tarek Dakhran' <t.dakhran@gmail.com>

Kevin Hilman wrote:
> 
> Tarek Dakhran <t.dakhran@samsung.com> writes:
> 
> > The series of patches represent support of Exynos 5410 SoC
> >
> > The Exynos 5410 is the first Samsung SoC based on bigLITTLE architecture
> >
> > Patches add new platform description, support of clock controller and
> device
> > tree for Exynos 5410.
> >
> > Has been build on Linux Kernel v3.15-rc1
> > Has been tested on: 1) Exynos 5410 reference board (exynos_defconfig)
> > 		    2) Odroid-XU board (exynos_defconfig)
> 
Hi all,

Sorry for late response...

> Tested-by: Kevin Hilman <khilman@linaro.org>
> 
Kevin,

Thanks for your test :-)

[...]

Tarek, can you please re-spin this series based on my current for-next
because some common stuff has been changed?

Thanks,
Kukjin
