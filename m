From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: Exynos5250: Enabling samsung usb phy
Date: Tue, 22 Jan 2013 11:24:25 +0530
Message-ID: <CAFp+6iFM8g28PohX=95qMccNDkdmt86gKNg9=AJXdrCovsryPQ@mail.gmail.com>
References: <1355845182-14104-1-git-send-email-gautam.vivek@samsung.com>
	<20130118131013.GG4672@arwen.pp.htv.fi>
	<20130118131250.GH4672@arwen.pp.htv.fi>
	<053501cdf85e$507c2560$f1747020$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <053501cdf85e$507c2560$f1747020$@samsung.com>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,


On Tue, Jan 22, 2013 at 10:36 AM, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Felipe Balbi wrote:
>>
>> On Fri, Jan 18, 2013 at 03:10:13PM +0200, Felipe Balbi wrote:
>> > Hi,
>> >
>> > On Tue, Dec 18, 2012 at 09:09:40PM +0530, Vivek Gautam wrote:
>> > > This patch-set enables the samsung-usbphy driver on exynos5250,
>> > > which enables the support for USB2 type and USB3 type phys.
>> > > The corresponding phy driver patches are available at:
>> > >  1) https://lkml.org/lkml/2012/12/18/201
>> > >  2) https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-
>> December/024559.html
>> > >
>> > > Tested this patch-set on exynos5250 with following patch-sets for
>> > > USB 2.0 and USB 3.0:
>> > >  - https://patchwork.kernel.org/patch/1794651/
>> > >  - https://lkml.org/lkml/2012/12/18/201
>> > >  - https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-
>> December/024559.html
>> > >  - http://comments.gmane.org/gmane.linux.usb.general/76352
>> > >  - https://lkml.org/lkml/2012/12/13/492
>> > >
>> > > Vivek Gautam (2):
>> > >   ARM: Exynos5250: Enabling samsung-usbphy driver
>> > >   ARM: Exynos5250: Enabling USB 3.0 phy for samsung-usbphy driver
>> >
>> > What should I do with this series ? Is it ready to apply ? If it is,
>> > then please resend with Kukjim's Acked-by.
>>
>> actually, now that I look again, it's all under arch/arm/, so Kukjim can
>> take all of those through his tree ;-)
>>
> Yes, once Vivek addresses comments from Sylwester, let me pick up into
> Samsung tree :-)
>

Sure, i shall update this patch-series based on separate drivers for
USB 3.0 PHY controller
as posted in following patch series :
[PATCH v3 0/2] Adding USB 3.0 DRD-phy support for exynos5250



-- 
Thanks & Regards
Vivek
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
