From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/2] usb: host: ehci-exynos: Decrese node refcount on
 exynos_ehci_get_phy() error paths
Date: Mon, 9 Jan 2017 11:05:20 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1701091104540.1954-100000@iolanthe.rowland.org>
References: <20170107084141.3731-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170107084141.3731-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, 7 Jan 2017, Krzysztof Kozlowski wrote:

> Returning from for_each_available_child_of_node() loop requires cleaning
> up node refcount.  Error paths lacked it so for example in case of
> deferred probe, the refcount of phy node was left increased.
> 
> Fixes: 6d40500ac9b6 ("usb: ehci/ohci-exynos: Fix of_node_put() for child when getting PHYs")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/usb/host/ehci-exynos.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> index 42e5b66353ef..7a603f66a9bc 100644
> --- a/drivers/usb/host/ehci-exynos.c
> +++ b/drivers/usb/host/ehci-exynos.c
> @@ -77,10 +77,12 @@ static int exynos_ehci_get_phy(struct device *dev,
>  		if (IS_ERR(phy)) {
>  			ret = PTR_ERR(phy);
>  			if (ret == -EPROBE_DEFER) {
> +				of_node_put(child);
>  				return ret;
>  			} else if (ret != -ENOSYS && ret != -ENODEV) {
>  				dev_err(dev,
>  					"Error retrieving usb2 phy: %d\n", ret);
> +				of_node_put(child);
>  				return ret;
>  			}
>  		}
> 

Acked-by: Alan Stern <stern@rowland.harvard.edu>
