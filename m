From: Praveen Paneri <p.paneri@samsung.com>
Subject: Re: [PATCH v3 2/5] usb: s3c-hsotg: Adding phy driver support
Date: Thu, 9 Aug 2012 15:30:11 +0530
Message-ID: <CAD6zSYOU2Adz1dPjEjTEqp3L09Hmxd6Qu1AGL-1D8bvcLv_f3Q@mail.gmail.com>
References: <1344411661-17821-1-git-send-email-p.paneri@samsung.com>
	<1344411661-17821-3-git-send-email-p.paneri@samsung.com>
	<20120809092938.GK12174@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:35971 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755702Ab2HIKAN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Aug 2012 06:00:13 -0400
In-Reply-To: <20120809092938.GK12174@arwen.pp.htv.fi>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com
Cc: linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, gregkh@linuxfoundation.org, thomas.abraham@linaro.org, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, l.majewski@samsung.com, kyungmin.park@samsung.com, grant.likely@secretlab.ca, heiko@sntech.de

On Thu, Aug 9, 2012 at 2:59 PM, Felipe Balbi <balbi@ti.com> wrote:
> On Wed, Aug 08, 2012 at 01:10:58PM +0530, Praveen Paneri wrote:
>> @@ -3689,6 +3706,9 @@ static int __devexit s3c_hsotg_remove(struct platform_device *pdev)
>>       s3c_hsotg_phy_disable(hsotg);
>>       regulator_bulk_free(ARRAY_SIZE(hsotg->supplies), hsotg->supplies);
>>
>> +     if (hsotg->phy)
>> +             devm_usb_put_phy(&pdev->dev, hsotg->phy);
>
> unnecessary. This will be called for you when the platform_device object
> is detroyed.
Off-course, I will remove this.

Thanks
Praveen
>
> --
> balbi
