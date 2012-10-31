From: Lukasz Majewski <l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v7 2/5] usb: s3c-hsotg: Adding phy driver support
Date: Wed, 31 Oct 2012 15:44:07 +0100
Message-ID: <20121031154407.4eb54dba@amdc308.digital.local>
References: <1351573057-22249-1-git-send-email-p.paneri@samsung.com>
 <1351573057-22249-3-git-send-email-p.paneri@samsung.com>
 <20121031140548.GE10998@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20121031140548.GE10998-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Felipe,

> Hi,
> 
> On Tue, Oct 30, 2012 at 10:27:34AM +0530, Praveen Paneri wrote:
> > @@ -3501,20 +3511,27 @@ static int __devinit s3c_hsotg_probe(struct
> > platform_device *pdev) int ret;
> >  	int i;
> >  
> > -	plat = pdev->dev.platform_data;
> > -	if (!plat) {
> > -		dev_err(&pdev->dev, "no platform data defined\n");
> > -		return -EINVAL;
> > -	}
> > -
> >  	hsotg = devm_kzalloc(&pdev->dev, sizeof(struct s3c_hsotg),
> > GFP_KERNEL); if (!hsotg) {
> >  		dev_err(dev, "cannot get memory\n");
> >  		return -ENOMEM;
> >  	}
> >  
> > +	plat = pdev->dev.platform_data;
> > +	if (!plat) {
> > +		/* Fallback for transceiver */
> > +		phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
> > +		if (IS_ERR_OR_NULL(phy)) {
> > +			dev_err(&pdev->dev, "no platform data or
> > transceiver defined\n");
> > +			return -EPROBE_DEFER;
> > +		} else {
> > +			hsotg->phy = phy;
> > +		}
> > +	} else {
> > +		hsotg->plat = plat;
> > +	}
> 
> I think this should be the other way around, meaning you try to grab
> the phy, if you can't, then you fallback to pdata.
> 

I agree.

The new approach is to use new PHY driver. And only when failed we
shall use legacy approach.

-- 
Best regards,

Lukasz Majewski

Samsung Poland R&D Center | Linux Platform Group
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
