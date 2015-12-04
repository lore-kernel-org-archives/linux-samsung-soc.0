From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/3] Add support for monitoring gpio switches
Date: Fri, 4 Dec 2015 10:57:13 -0800
Message-ID: <20151204185713.GA22925@kroah.com>
References: <1449250275-23435-1-git-send-email-martyn.welch@collabora.co.uk>
 <1449250275-23435-3-git-send-email-martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:44700 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751005AbbLDS5O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Dec 2015 13:57:14 -0500
Content-Disposition: inline
In-Reply-To: <1449250275-23435-3-git-send-email-martyn.welch@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

On Fri, Dec 04, 2015 at 05:31:14PM +0000, Martyn Welch wrote:
> Select Chromebooks have gpio attached to switches used to cause the
> firmware to enter alternative modes of operation and/or control other
> device characteristics (such as write protection on flash devices). This
> patch adds a driver that exposes a read-only interface to allow these
> signals to be read from user space.
> 
> This functionality has been generalised to provide support for any device
> with device tree support which needs to identify a gpio as being used for a
> specific task.
> 
> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
> ---
>  drivers/misc/Kconfig       |  11 ++++
>  drivers/misc/Makefile      |   1 +
>  drivers/misc/gpio-switch.c | 160 +++++++++++++++++++++++++++++++++++++++++++++

Why isn't this in drivers/gpio/ ?

why make it a misc driver?

thanks,

greg k-h
