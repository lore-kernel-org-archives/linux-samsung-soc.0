From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 07/10] spi: s3c64xx: Remove the 'set_level' callback from
 controller data
Date: Wed, 9 May 2012 13:33:54 +0530
Message-ID: <CABb+yY0Yu3Em+oU5+xjzBpxLaTrZ34Gxh4TK0-ra_z23RNBdJw@mail.gmail.com>
References: <1336514694-22393-1-git-send-email-thomas.abraham@linaro.org>
	<1336514694-22393-8-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:40196 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755706Ab2EIID4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 May 2012 04:03:56 -0400
Received: by wgbdr13 with SMTP id dr13so6818145wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 May 2012 01:03:55 -0700 (PDT)
In-Reply-To: <1336514694-22393-8-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: spi-devel-general@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Wed, May 9, 2012 at 3:34 AM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
>
> The set_level callback in the controller data, which is used to configure
> the slave select line, cannot be supported when migrating the driver to
> device tree based discovery. Since all the platforms currently use gpio
> as the slave select line, this callback can be removed from the
> controller data and replaced with call to gpio_set_value in the driver.
>
This patch is ok.
Separately, you might also want to see if we really need the air-tight
protection of spin_lock_irqsave around enable_cs - IIRC someone
had a CS coming out of an gpio extender connected over I2C
