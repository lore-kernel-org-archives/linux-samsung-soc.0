From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 2/3] spi: s3c64xx: validate s3c64xx_spi_csinfo before
 using
Date: Tue, 15 Jul 2014 22:00:30 +0200
Message-ID: <53C5885E.2020609@collabora.co.uk>
References: <1405426860-18404-1-git-send-email-ch.naveen@samsung.com> <1405426860-18404-3-git-send-email-ch.naveen@samsung.com> <53C569A8.1000103@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:46896 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751752AbaGOUAp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 16:00:45 -0400
In-Reply-To: <53C569A8.1000103@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, kgene.kim@samsung.com, cpgs@samsung.com, devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>

Hello Naveen,

On 07/15/2014 07:49 PM, Tomasz Figa wrote:
> 
> In general, I liked previous version of this series much more, as it was
> doing what it should as opposed to this one.
> 
> Best regards,
> Tomasz
> 

I agree with Tomasz. I think version v6 of your series was (almost) correct
while this is one is not. You only had to address Mark's concerns about using
gpio_is_valid(spi->cs_gpio).

Also, you need to work out your commit messages since I they are still not
clearly explaining the motivation for the changes. You are explaining what the
patches are changing but you have to explain why the changes are needed in the
first place.

Best regards,
Javier
