From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2 1/4] usb: ohci-exynos: Use struct device instead of
 platform_device
Date: Thu, 1 May 2014 10:26:00 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1405011025260.1152-100000@iolanthe.rowland.org>
References: <1398835192-21634-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1398835192-21634-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, balbi@ti.com, kgene.kim@samsung.com, k.debski@samsung.com, jg1.han@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 30 Apr 2014, Vivek Gautam wrote:

> Change to use struct device instead of struct platform_device
> for some static functions.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Acked-by: Jingoo Han <jg1.han@samsung.com>
> ---

For all four patches in this series:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

