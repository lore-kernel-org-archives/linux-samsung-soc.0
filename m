From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: Re: [PATCH v5 1/2] usb: host: ehci-exynos: Remove unnecessary usb-phy support
Date: Mon, 29 Sep 2014 11:50:04 +0530
Message-ID: <CAFp+6iHMBWxy9B03FW05bHPZHEcAg0cWtpTsb8GEzSkzaXSQ9g@mail.gmail.com>
References: <CAFp+6iGXLKhtGaHm=dFDGCpN38G=w6mX0PuatskBhvcL_HA=Bg@mail.gmail.com>
	<1411364719-28064-1-git-send-email-gautam.vivek@samsung.com>
	<CAFp+6iE0DGZ722kqFmBSDSzKLJ38=n3yfzx8t8knncjGbuAkyA@mail.gmail.com>
	<20140929015153.GA27008@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140929015153.GA27008@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Kukjin Kim <kgene.kim@samsung.com>, Jingoo Han <jg1.han@samsung.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Sep 29, 2014 at 7:21 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Thu, Sep 25, 2014 at 10:50:22AM +0530, Vivek Gautam wrote:
>> Hi Greg,
>>
>>
>> On Mon, Sep 22, 2014 at 11:15 AM, Vivek Gautam <gautam.vivek@samsung.com> wrote:
>> > Now that we have completely moved from older USB-PHY drivers
>> > to newer GENERIC-PHY drivers for PHYs available with USB controllers
>> > on Exynos series of SoCs, we can remove the support for the same
>> > in our host drivers too.
>> >
>> > We also defer the probe for our host in case we end up getting
>> > EPROBE_DEFER error when getting PHYs.
>> >
>> > Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
>> > Acked-by: Jingoo Han <jg1.han@samsung.com>
>> > Acked-by: Alan Stern <stern@rowland.harvard.edu>
>> > ---
>>
>> Did this one got missed for usb-next ?
>> I can only see "usb: host: ohci-exynos: Remove unnecessary usb-phy support"
>> in the next branch.
>>
>> Ignore me if you have already taken care of this, and plan to queue it up.
>
> If it's not in my tree already, please resend as I don't have this in my
> queue anymore.

yea, i don't see it in usb-next.
I will resend it then.

>
> greg k-h
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
