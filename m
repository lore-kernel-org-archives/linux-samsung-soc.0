From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 RESEND 3/5] driver core: handle -EPROBE_DEFER from
 bus_type.match()
Date: Thu, 11 Feb 2016 19:19:07 -0800
Message-ID: <20160212031907.GD10157@kroah.com>
References: <1455101250-11327-1-git-send-email-m.szyprowski@samsung.com>
 <1455101250-11327-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:38937 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750963AbcBLDTH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Feb 2016 22:19:07 -0500
Content-Disposition: inline
In-Reply-To: <1455101250-11327-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, Feb 10, 2016 at 11:47:28AM +0100, Marek Szyprowski wrote:
> From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> 
> Allow implementations of the match() callback in struct bus_type to
> return errors and if it's -EPROBE_DEFER then queue the device for
> deferred probing.
> 
> This is useful to buses such as AMBA in which devices are registered
> before their matching information can be retrieved from the HW
> (typically because a clock driver hasn't probed yet).
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> [changed if-else code structure, adjusted documentation to match the code,
> extended comments]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  Documentation/driver-model/porting.txt |  6 ++++--
>  drivers/base/dd.c                      | 24 ++++++++++++++++++++++--
>  include/linux/device.h                 |  7 +++++--
>  3 files changed, 31 insertions(+), 6 deletions(-)


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
