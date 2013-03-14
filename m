From: Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2] USB: ehci-s5p: Fix phy reset
Date: Thu, 14 Mar 2013 13:04:00 +0100
Message-ID: <0A9719D9-5957-44B8-8466-F0F454588B2C@suse.de>
References: <1363219179-14900-1-git-send-email-agraf@suse.de> <CAD=FV=UyCUMZss36Fw3VZSGgi56CToewEaOjUo95z6=vJreysg@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=UyCUMZss36Fw3VZSGgi56CToewEaOjUo95z6=vJreysg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmueller-l3A5Bk7waGM@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


On 14.03.2013, at 04:38, Doug Anderson wrote:

> Alexander,
> 
> On Wed, Mar 13, 2013 at 4:59 PM, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org> wrote:
>> On my Exynos 5 based Arndale system, I need to pull the reset line down
>> and then let it go up again to actually perform a reset. Without that
>> reset, I can't find any USB hubs on my bus, rendering the USB controller
>> useless.
>> 
>> We also only need to reset the line after the phy node has been found.
>> This way we don't accidently reserve the vbus GPIO pin, but later on
>> defer the creation of our controller, because the phy device tree node
>> hasn't been probed yet.
>> 
>> This patch implements the above logic, making EHCI and OHCI work on
>> Arndale systems for me.
>> 
>> Signed-off-by: Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>
>> CC: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> CC: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> CC: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
>> CC: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> CC: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
>> CC: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
>> CC: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> 
>> ---
>> 
>> v1 -> v2:
>> 
>>  - remove gpio_free call
>>  - move reset logic after phy node search
> 
> Seems fine to me.  I guess the earlier problem you wrote about was the
> probe failure, then?  

Well, the problem I wrote about was that when I do

  * probe
    -> reset phy
  * probe gets deferred
  * deferred probe
    -> can't reset phy because the pin is already in use

Then I get the same breakage again. However, if I do

  * probe
  * probe gets deferred
  * deferred probe
    -> reset phy

Then everything works just fine.

> I think that the reason I don't tend to get the
> probe failure is that I've got my device tree ordered differently so
> that the phy gets initted in a different order.

Odd - I get the deferral regardless of how I order my device tree :).


Alex

> 
> I'll send up the devm_ patch atop this.
> 
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> Thanks!  :)
> 
> -Doug

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
