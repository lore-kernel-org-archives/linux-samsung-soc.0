From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH v7 2/4] usb: phy: samsung: Add host phy support to
 samsung-phy driver
Date: Mon, 21 Jan 2013 15:33:36 +0530
Message-ID: <CAFp+6iFN47wTbGPwL4qeU6eUWNfB9zU7qrDjsZ272nq9rmq9aA@mail.gmail.com>
References: <1357916550-11421-3-git-send-email-gautam.vivek@samsung.com>
	<1358166135-22073-1-git-send-email-gautam.vivek@samsung.com>
	<20130118131633.GJ4672@arwen.pp.htv.fi>
	<CAFp+6iF9H+n1Fwr89es-jtDAN=ht1PuXQER9vQ=jG2RZQTceWw@mail.gmail.com>
	<20130118142251.GL4672@arwen.pp.htv.fi>
	<CAFp+6iE5gU5QrheYyHLV2yfO=d3j3fVA7qq8CQ4KLysjXFRh3w@mail.gmail.com>
	<20130118150732.GP4672@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130118150732.GP4672@arwen.pp.htv.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene.kim@samsung.com
Cc: balbi@ti.com, Vivek Gautam <gautam.vivek@samsung.com>, jg1.han@samsung.com, linux-samsung-soc@vger.kernel.org, p.paneri@samsung.com, gregkh@linuxfoundation.org, devicetree-discuss@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, sylvester.nawrocki@gmail.com, Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,


On Fri, Jan 18, 2013 at 8:37 PM, Felipe Balbi <balbi@ti.com> wrote:
> On Fri, Jan 18, 2013 at 07:59:52PM +0530, Vivek Gautam wrote:
>> HI Balbi,
>>
>>
>> On Fri, Jan 18, 2013 at 7:52 PM, Felipe Balbi <balbi@ti.com> wrote:
>> > On Fri, Jan 18, 2013 at 07:51:08PM +0530, Vivek Gautam wrote:
>> >> Hi Felipe,
>> >>
>> >>
>> >> On Fri, Jan 18, 2013 at 6:46 PM, Felipe Balbi <balbi@ti.com> wrote:
>> >> > Hi,
>> >> >
>> >> > On Mon, Jan 14, 2013 at 05:52:15PM +0530, Vivek Gautam wrote:
>> >> >> This patch adds host phy support to samsung-usbphy driver and
>> >> >> further adds support for samsung's exynos5250 usb-phy.
>> >> >>
>> >> >> Signed-off-by: Praveen Paneri <p.paneri@samsung.com>
>> >> >> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
>> >> >
>> >> > Missing Kukjim's Acked-by here
>> >> >
>> >>
>> >> Hope you are fine with the changes happened after discussion in thread:
>> >> [PATCH v5 2/4] usb: phy: samsung: Add host phy support to samsung-phy driver
>> >>
>> >> Is it something you want me to modify in this patch ?
>> >
>> > please send the final patch and we shall see. After quickly browsing
>> > that thread, I didn't see anything scary, but I'd like to see your final
>> > version before giving my final answer ;-)
>> >
>>
>> this series of patch is the final version from my side unless Doug or
>> you have any further comments
>> on the thread :
>> https://lkml.org/lkml/2013/1/14/481
>>
>> Seems like Doug wanted to know your opinion in this regard. ;-)
>
> only Kukjim's Acked-by missing ;-)
>

Any comments on this patch-series please ?


-- 
Thanks & Regards
Vivek
