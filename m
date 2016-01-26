From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/exynos: fix building without CONFIG_PM_SLEEP
Date: Tue, 26 Jan 2016 13:56:22 +0100
Message-ID: <2340022.8FaqkycQpP@wuerfel>
References: <9569056.LBRz4v8fSj@wuerfel> <56A71075.7070606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:57903 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964860AbcAZM5A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2016 07:57:00 -0500
In-Reply-To: <56A71075.7070606@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Tuesday 26 January 2016 15:21:41 Inki Dae wrote:
> > -#ifdef CONFIG_PM_SLEEP
> 
> How about just changing it to CONFIG_PM for consistency of other kms drivers?
> Actually, I had modified it to PM since original auther, Gustavo Padovan, posted runtime pm support.
> However, it seems missing this one.

Everybody gets the #ifdef's wrong, so the __maybe_unused approach is
being used increasingly all over the kernel.

	Arnd
