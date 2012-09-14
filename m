From: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 1/5] usb: phy: samsung: Introducing usb phy driver for hsotg
Date: Fri, 14 Sep 2012 15:29:14 +0530
Message-ID: <CAD6zSYOjpfZX4w6-ZR24QDoga7bQq9bzC8Yie=xX2BZPK3ta3A@mail.gmail.com>
References: <1347446757-20519-1-git-send-email-p.paneri@samsung.com>
	<1347446757-20519-2-git-send-email-p.paneri@samsung.com>
	<50506D2A.7040908@pengutronix.de>
	<33690123.AyeJMS7yMW@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <33690123.AyeJMS7yMW@flatron>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 12, 2012 at 9:51 PM, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Praveen, Marc,
>
> On Wednesday 12 of September 2012 13:08:26 Marc Kleine-Budde wrote:
>> > +static const struct of_device_id samsung_usbphy_dt_match[];
>> > +
>> > +static inline int samsung_usbphy_get_driver_data(struct
>> > platform_device *pdev) +{
>> > +#ifdef CONFIG_OF
>>
>> if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node)
>
> Is this check needed at all?
>
> In case of CONFIG_OF disabled, of_node should always be NULL and there is a
but I guess it can also be NULL when CONFIG_OF is enabled but the
driver is probed non DT way.
> dummy macro provided for of_match_node, so it should compile and work just
> fine.
>
> --
> Best regards,
> Tomasz Figa
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
