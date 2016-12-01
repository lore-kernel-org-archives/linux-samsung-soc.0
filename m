From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2] USB: OHCI: ohci-s3c2410: remove useless functions
Date: Thu, 1 Dec 2016 10:20:50 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1612011017270.2334-100000@iolanthe.rowland.org>
References: <1480603590-23924-1-git-send-email-csmanjuvijay@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480603590-23924-1-git-send-email-csmanjuvijay@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: csmanjuvijay@gmail.com
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 1 Dec 2016 csmanjuvijay@gmail.com wrote:

> From: Manjunath Goudar <csmanjuvijay@gmail.com>
> 
> The ohci_hcd_s3c2410_drv_probe and ohci_hcd_s3c2410_drv_remove
> functions are removed as these are useless functions except calling
> usb_hcd_s3c2410_probe and usb_hcd_s3c2410_remove functions.
> 
> The usb_hcd_s3c2410_probe function renamed to ohci_hcd_s3c2410_drv_probe
> and usb_hcd_s3c2410_remove function renamed to ohci_hcd_s3c2410_drv_remove
> for proper naming.
> 
> Signed-off-by: Manjunath Goudar <csmanjuvijay@gmail.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Changelog v1 -> v2:
> Removed checkpatch.pl warnings and errors cleanup code which is not related
> to this patch.

Acked-by: Alan Stern <stern@rowland.harvard.edu>
