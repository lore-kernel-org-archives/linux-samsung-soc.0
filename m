From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] drm/exynos/ipp: Replace struct timeval usage
Date: Mon, 1 Jun 2015 06:31:37 +0300
Message-ID: <20150601033137.GR2282@tarshish>
References: <20150601031308.GA2785@tinar>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:56973 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752078AbbFADbq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 31 May 2015 23:31:46 -0400
Content-Disposition: inline
In-Reply-To: <20150601031308.GA2785@tinar>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tina Ruchandani <ruchandani.tina@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, y2038@lists.linaro.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-arm-kernel@lists.infradead.org

Hi Tina,

On Mon, Jun 01, 2015 at 08:43:08AM +0530, Tina Ruchandani wrote:
> 'struct timeval' uses a 32-bit seconds representation which
> will overflow in the year 2038 and beyond. This patch
> replaces the use of struct timeval with struct timespec64
> which uses a 64-bit seconds representation and is y2038 safe.
> 
> The patch is part of a larger effort to remove all 32-bit
> timekeeping variables (timeval, time_t and timespec) from the
> kernel.

Your sing-off is missing.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
