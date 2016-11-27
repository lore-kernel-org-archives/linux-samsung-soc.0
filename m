From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] usb: ohci: s3c2410: allow probing from device tree
Date: Sun, 27 Nov 2016 18:36:30 +0200
Message-ID: <20161127163630.GB4423@kozik-lap>
References: <1480085249-25014-1-git-send-email-sergio.prado@e-labworks.com>
 <1480085249-25014-3-git-send-email-sergio.prado@e-labworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1480085249-25014-3-git-send-email-sergio.prado@e-labworks.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, krzk@kernel.org, javier@osg.samsung.com, robh+dt@kernel.org, stern@rowland.harvard.edu, kgene@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Nov 25, 2016 at 12:47:29PM -0200, Sergio Prado wrote:
> Allows configuring Samsung's s3c2410 USB OHCI controller using a
> devicetree.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  drivers/usb/host/ohci-s3c2410.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
> index 7a1919ca543a..d8e03a801f2e 100644
> --- a/drivers/usb/host/ohci-s3c2410.c
> +++ b/drivers/usb/host/ohci-s3c2410.c
> @@ -457,6 +457,13 @@ static int ohci_hcd_s3c2410_drv_resume(struct device *dev)
>  	.resume		= ohci_hcd_s3c2410_drv_resume,
>  };
>  
> +static const struct of_device_id ohci_hcd_s3c2410_dt_ids[] = {
> +	{ .compatible = "samsung,s3c2410-ohci" },
> +	{ /* sentinel */ }
> +};
> +

A nit, usually MODULE_DEVICE_TABLE comes right after the table, without
a blank line.

Beside that:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

> +MODULE_DEVICE_TABLE(of, ohci_hcd_s3c2410_dt_ids);
> +
>  static struct platform_driver ohci_hcd_s3c2410_driver = {
>  	.probe		= ohci_hcd_s3c2410_drv_probe,
>  	.remove		= ohci_hcd_s3c2410_drv_remove,
> @@ -464,6 +471,7 @@ static int ohci_hcd_s3c2410_drv_resume(struct device *dev)
>  	.driver		= {
>  		.name	= "s3c2410-ohci",
>  		.pm	= &ohci_hcd_s3c2410_pm_ops,
> +		.of_match_table	= ohci_hcd_s3c2410_dt_ids,
>  	},
>  };
>  
> -- 
> 1.9.1
> 
