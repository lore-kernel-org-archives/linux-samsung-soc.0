From: =?utf-8?B?7J207Jq06riw?= <woonki84.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH] NFC: Driver for SAMSUNG S3FHRN2 NFC Chip.
Date: Thu, 07 Jun 2012 09:40:11 +0900
Message-ID: <000601cd4446$18d0a9a0$4a71fce0$%lee@samsung.com>
References: <001201cd42ef$c283d8d0$478b8a70$%lee@samsung.com>
 <1338885523.1817.101.camel@aeonflux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1338885523.1817.101.camel@aeonflux>
Content-language: ko
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Marcel Holtmann' <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org, aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

> 
> > This is a driver for the S3FHRN2 NFC device. the driver is just a
> > proxy getting SHDLC/HCI frames from a userspace stack.
> 
> <snip>
> 
> > +
> > +	info->miscdev.minor = MISC_DYNAMIC_MINOR;
> > +	info->miscdev.name = S3FHRN2_DRIVER_NAME;
> > +	info->miscdev.fops = &s3fhrn2_fops;
> > +	info->miscdev.parent = &client->dev;
> > +	ret = misc_register(&info->miscdev);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "failed to register Device\n");
> > +		goto err_dev_reg;
> > +	}
> 
> instead of creating a misc character device, I would prefer that this
> gets integrated as driver for the NFC subsystem.
> 
> We do not want to have shim NFC drivers in the kernel anymore.
> 

Ok, I think you are right.
I will submit again after I change misc character device to nfc device
of NFC subsystem.
Thank you for your review.

Regards

Woonki.

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
