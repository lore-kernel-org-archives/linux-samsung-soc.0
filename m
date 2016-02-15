From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH] regulator: Rename files for max77686 and max77802 drivers
Date: Mon, 15 Feb 2016 15:37:07 +0900
Message-ID: <20160215063707.GC10719@samsunx.samsung>
References: <1455250463-5955-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <1455250463-5955-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Brown <broonie@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Feb 12, 2016 at 01:14:23AM -0300, Javier Martinez Canillas wrote:
> The max77686 and max77802 regulator drivers are for sub-devices of a MFD
> driver for some PMIC blocks. But the same object file name (max77686.o)
> was used for both the common MFD driver and the max77686 regulator one.
> 
> This confuses kbuild if both drivers are built as module causing the MFD
> driver to not be copied when installing the modules.
> 
> Also, max77{686,802} are a quite generic name for MFD subdevices drivers
> so it is better to rename them to max77{686,802}-regulator like it's the
> case for most regulator drivers.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Looks good.

Reviewed-by: Andi Shyti <andi.shyti@samsung.com>

Andi
