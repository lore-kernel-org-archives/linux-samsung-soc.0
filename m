From: Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] USB: ehci-s5p: Fix phy reset
Date: Wed, 13 Mar 2013 18:45:52 +0100
Message-ID: <A763CC55-549D-4CCD-8EE8-2BCE17F84606@suse.de>
References: <1363136988-3704-1-git-send-email-agraf@suse.de> <CAD=FV=UXaZvZJOZwAguwi=iyYO1iMSvt8fdEsDhr96pgMXDYSg@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=UXaZvZJOZwAguwi=iyYO1iMSvt8fdEsDhr96pgMXDYSg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmueller-l3A5Bk7waGM@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


On 13.03.2013, at 18:28, Doug Anderson wrote:

> Alexander,
> 
> On Tue, Mar 12, 2013 at 6:09 PM, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org> wrote:
>> -       err = gpio_request_one(gpio, GPIOF_OUT_INIT_HIGH, "ehci_vbus_gpio");
>> -       if (err)
>> +       /* reset pulls the line down, then up again */
>> +       err = gpio_request_one(gpio, GPIOF_OUT_INIT_LOW, "ehci_vbus_gpio");
>> +       if (err) {
>>                dev_err(&pdev->dev, "can't request ehci vbus gpio %d", gpio);
>> +               return;
>> +       }
>> +       mdelay(1);
>> +       __gpio_set_value(gpio, 1);
>> +       gpio_free(gpio);
> 
> Freeing the gpio is a little on the iffy side since you actually care
> about keeping the value.  Perhaps you can change this to
> devm_gpio_request_one() and avoid the free?  I was about to submit a
> patch to do just that (since otherwise you run into trouble if you
> ever defer the probe) but then ran across your patch.

I could also just return it when the function exits and only free it when we exit the probe function with a negative value. The reason I put it in here was that on probe deferral, the pin simply gets blocked.

However, I could probably also just completely take the gpio_free() out of this patch and resubmit, as it should be pretty much unrelated. Then you can patch it properly.


Alex

> 
> Thanks!
> 
> -Doug

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
