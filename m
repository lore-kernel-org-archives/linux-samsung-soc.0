From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: EXYNOS: no more support non-DT for EXYNOS SoCs
Date: Tue, 9 Apr 2013 13:48:14 +0200
Message-ID: <201304091348.14887.arnd@arndb.de>
References: <2f3001ce3515$9a9ae1b0$cfd0a510$%kim@samsung.com> <2f3701ce3516$c29aca80$47d05f80$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:65216 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933173Ab3DILsT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 07:48:19 -0400
In-Reply-To: <2f3701ce3516$c29aca80$47d05f80$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Olof Johansson' <olof@lixom.net>, kyungmin.park@samsung.com, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>

On Tuesday 09 April 2013, Kukjin Kim wrote:
> One more, as you know, we cannot support all features non-DT did only with
> DT exynos. But I think, if required, some of them can be kept in samsung
> tree temporarily.

Which are the features that are going to be missing? Is it possible to
add the ones that people are likely to miss using auxdata?
 
> Note, original patch couldn't submitted to linux arm kernel ml due to size.
> And please ignore useless line wrapped due to e-mail client problem :-(

You might be able to send it when you create the patch using 'git format-patch 
-M -D', which will leave out deleted files.

	Arnd
