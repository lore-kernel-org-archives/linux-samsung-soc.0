From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable CONFIG_FHANDLE
Date: Sat, 24 Jan 2015 13:54:28 +0900
Message-ID: <54C32584.4040601@kernel.org>
References: <1417176414-21558-1-git-send-email-sjoerd.simons@collabora.co.uk> <54786C1D.3050306@collabora.co.uk> <54BC9995.4020300@samsung.com> <54C20CD5.7060001@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:40311 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752375AbbAXEyg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 23:54:36 -0500
In-Reply-To: <54C20CD5.7060001@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andreas Faerber <afaerber@suse.de>

On 01/23/15 17:56, Javier Martinez Canillas wrote:
> Hello Kukjin,
> 
Hi,

> On 01/19/2015 06:43 AM, Joonyoung Shim wrote:
>>>
>>
>> I also hope merge this, already multi_v7_defconfig supports this.
>>
> 
> I would also hope this to be merged since it's required to boot
> using systemd.
> 
>> Thanks.
>>
>>> This is certainly required for newer systemd and has to be enabled.
>>>
>>> But it would also be great to have enabled all the config symbols
>>> that are listed as requirements in the systemd README file:
>>>
>>> http://cgit.freedesktop.org/systemd/systemd/tree/README.
>>>
>>> Tony added that support to OMAP2+ defconfig in commit 673ce00c
>>> ("ARM: omap2plus_defconfig: Add support for distros with systemd")
>>> so the same should be done in exynos_defconfig.
>>>
>>> That can of course be a follow-up patch though, so for $subject:
>>>
>>> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>>>
Thanks, applied.

- Kukjin
