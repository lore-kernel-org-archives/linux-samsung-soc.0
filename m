From: Praveen Paneri <p.paneri@samsung.com>
Subject: Re: [PATCH v7 2/5] usb: s3c-hsotg: Adding phy driver support
Date: Fri, 2 Nov 2012 09:56:37 +0530
Message-ID: <CAD6zSYOvGSTF18Zr1zPFduz3povs7qiiU8p=iUtAAyDX_LUy+A@mail.gmail.com>
References: <1351573057-22249-1-git-send-email-p.paneri@samsung.com>
	<1351573057-22249-3-git-send-email-p.paneri@samsung.com>
	<20121031140548.GE10998@arwen.pp.htv.fi>
	<20121031154407.4eb54dba@amdc308.digital.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f174.google.com ([209.85.210.174]:45863 "EHLO
	mail-ia0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751216Ab2KBE0i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Nov 2012 00:26:38 -0400
In-Reply-To: <20121031154407.4eb54dba@amdc308.digital.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: balbi@ti.com, linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, gregkh@linuxfoundation.org, thomas.abraham@linaro.org, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, kyungmin.park@samsung.com, grant.likely@secretlab.ca, heiko@sntech.de, t.figa@samsung.com, gautam.vivek@samsung.com

On Wed, Oct 31, 2012 at 8:14 PM, Lukasz Majewski <l.majewski@samsung.com> wrote:
> Hi Felipe,
>
>> Hi,
>>
>> On Tue, Oct 30, 2012 at 10:27:34AM +0530, Praveen Paneri wrote:
>> > @@ -3501,20 +3511,27 @@ static int __devinit s3c_hsotg_probe(struct
>> > platform_device *pdev) int ret;
>> >     int i;
>> >
>> > -   plat = pdev->dev.platform_data;
>> > -   if (!plat) {
>> > -           dev_err(&pdev->dev, "no platform data defined\n");
>> > -           return -EINVAL;
>> > -   }
>> > -
>> >     hsotg = devm_kzalloc(&pdev->dev, sizeof(struct s3c_hsotg),
>> > GFP_KERNEL); if (!hsotg) {
>> >             dev_err(dev, "cannot get memory\n");
>> >             return -ENOMEM;
>> >     }
>> >
>> > +   plat = pdev->dev.platform_data;
>> > +   if (!plat) {
>> > +           /* Fallback for transceiver */
>> > +           phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
>> > +           if (IS_ERR_OR_NULL(phy)) {
>> > +                   dev_err(&pdev->dev, "no platform data or
>> > transceiver defined\n");
>> > +                   return -EPROBE_DEFER;
>> > +           } else {
>> > +                   hsotg->phy = phy;
>> > +           }
>> > +   } else {
>> > +           hsotg->plat = plat;
>> > +   }
>>
>> I think this should be the other way around, meaning you try to grab
>> the phy, if you can't, then you fallback to pdata.
Agreed! Will swap it

regards,
Praveen
>>
>
> I agree.
>
> The new approach is to use new PHY driver. And only when failed we
> shall use legacy approach.
>
> --
> Best regards,
>
> Lukasz Majewski
>
> Samsung Poland R&D Center | Linux Platform Group
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
