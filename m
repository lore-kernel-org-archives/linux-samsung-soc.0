From: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 1/4] phy: Add provision for calibrating phy.
Date: Mon, 9 Jun 2014 09:19:03 +0530
Message-ID: <20140609034902.GA2625@pratyush-vbox>
References: <1402056736-12674-1-git-send-email-gautam.vivek@samsung.com>
 <1402056736-12674-2-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402056736-12674-2-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "kishon-l0cyMroinI0@public.gmane.org" <kishon-l0cyMroinI0@public.gmane.org>, "mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jun 06, 2014 at 08:12:12PM +0800, Vivek Gautam wrote:
> Some PHY controllers may need to calibrate certain
> PHY settings after initialization of the controller and
> sometimes even after initializing the PHY-consumer too.
> Add support for the same in order to let consumers do so in need.
> 
> Signed-off-by: vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/phy/phy-core.c  |   36 ++++++++++++++++++++++++++++++++++++
>  include/linux/phy/phy.h |    7 +++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 74d4346..92d31a3 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -376,6 +376,42 @@ int phy_power_off(struct phy *phy)
>  EXPORT_SYMBOL_GPL(phy_power_off);
>  
>  /**
> + * phy_calibrate - calibrate a phy post initialization
> + * @phy: Pointer to 'phy' from consumer
> + *
> + * For certain PHYs, it may be needed to calibrate few phy parameters
> + * post initialization. The need to calibrate may arise after the

For USB you may need to calibrate phy after each new connection. If
so, why not to use already existing struct usb_phy's notify_connect.

        pratyush

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
