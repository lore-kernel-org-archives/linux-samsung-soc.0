From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/5] Samsung defconfig udpates for v4.1
Date: Fri, 3 Apr 2015 14:58:11 -0700
Message-ID: <20150403215811.GU23023@localhost>
References: <551C35F6.1090602@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:35571 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751923AbbDCV6N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Apr 2015 17:58:13 -0400
Received: by pddn5 with SMTP id n5so133513348pdd.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Apr 2015 14:58:12 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <551C35F6.1090602@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On Thu, Apr 02, 2015 at 03:16:22AM +0900, Kukjin Kim wrote:
> The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:
> 
>   Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-defconfig
> 
> for you to fetch changes up to bb84296ae52da844c9cab81e0197152a69f2f841:
> 
>   ARM: exynos_defconfig: Enable HDMI support (2015-03-27 02:00:09 +0900)
> 
> ----------------------------------------------------------------
> Samsung defconfig updates for v4.1
> 
> - update exynos-defconfig
>   : enable HDMI, CPUidle, ChromeOS EC chardev driver
>     and thermal emulation, Marvell WiFi-Ex, CPUfreq,
>     and support for NFS rootfs
>   : remove EXYNOS_THERMAL_CORE define
>     and disable IOMMU support until support it

Merged, thanks.


-Olof
