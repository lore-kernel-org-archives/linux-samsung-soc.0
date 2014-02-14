From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] phy: Add new Exynos5 USB 3.0 PHY driver
Date: Fri, 14 Feb 2014 16:47:29 +0100
Message-ID: <52FE3A91.1090107@samsung.com>
References: <1386151747-3209-2-git-send-email-gautam.vivek@samsung.com>
 <1390225363-24210-1-git-send-email-gautam.vivek@samsung.com>
 <52F39710.80101@samsung.com>
 <CAFp+6iFYoN1w_BX7mMEa-Xx5ADaPTTKeDzjsSbQmwVKdSEsmOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAFp+6iFYoN1w_BX7mMEa-Xx5ADaPTTKeDzjsSbQmwVKdSEsmOw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, kishon <kishon-l0cyMroinI0@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Vivek,

On 14.02.2014 14:53, Vivek Gautam wrote:
>>> Changes from v2:
>>> 1) Added support for multiple PHYs (UTMI+ and PIPE3) and
>>>      related changes in the driver structuring.
>>
>>
>> I'm a bit skeptical about this separation. Can the PHY operate with just the
>> UTMI+ or PIPE3 part enabled alone without the other? Can any PHY consumer
>> operate this way?
>
> Yes :-)
> As also pointed by Kishon the PHY consumer (which is DWC3 in case of
> Exynos5 SoC series)
> should theoretically be able use either UTMI+ phy for High speed
> operations or both (UTMI+ and PIPE3)
> for Super Speed operations.

OK, that's fine then. This is the explanation I needed, thanks.

>>
>> I believe the right thing to do here is to do all the initialization in
>> .power_on() and let the driver simply call phy_power_on() when it needs the
>> PHY and phy_power_off() otherwise.
>
> If this is what we should be doing then what will be the purpose of
> two separate APIs :
> phy_power_on() and phy_init().
> Am i missing while understanding the things.
>

I don't understand this separation as well. Operations that should be 
done together shouldn't be separated. Is there any case when you can 
call one of phy_power_on() and phy_init() without calling another one 
right before/after it?

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
