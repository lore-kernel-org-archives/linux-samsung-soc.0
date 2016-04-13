From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v7 1/2] drivers: base: add support for registering
 notifier about deferred probe
Date: Wed, 13 Apr 2016 07:12:54 -0700
Message-ID: <20160413141254.GB12749@kroah.com>
References: <1460540160-18762-1-git-send-email-m.szyprowski@samsung.com>
 <1460540160-18762-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:33427 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934284AbcDMOMz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Apr 2016 10:12:55 -0400
Content-Disposition: inline
In-Reply-To: <1460540160-18762-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, Apr 13, 2016 at 11:35:59AM +0200, Marek Szyprowski wrote:
> This patch adds code which allow other subsystems get a notification
> when deferred probe has been triggered. This way one can retry some
> actions, which earlier failed with -EPROBE_DEFER error code.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Why would some other subsystem want/care about this?  You aren't telling
them what device was deferred, and you don't need to as the bus itself
already knows this information as it did the deferring!

confused,

greg k-h
