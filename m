From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: ehci: s5p: Power-off VBUS during suspend.
Date: Tue, 29 Jan 2013 17:31:00 +0530
Message-ID: <CAFp+6iGpbSmCsdFVzk1W+cKXMzzUtnreP+bTCab7xOtBs60tXg@mail.gmail.com>
References: <1359456765-7335-1-git-send-email-gautam.vivek@samsung.com>
	<2944580.3eEfUK6kfJ@linux-5eaq.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2944580.3eEfUK6kfJ-7ztolUikljGernLeA6q8OA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oliver Neukum <oneukum-l3A5Bk7waGM@public.gmane.org>
Cc: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Oliver,


On Tue, Jan 29, 2013 at 5:07 PM, Oliver Neukum <oneukum-l3A5Bk7waGM@public.gmane.org> wrote:
> On Tuesday 29 January 2013 16:22:45 Vivek Gautam wrote:
>> This change de-asserts vbus_gpio on suspend and
>> re-asserts on resume in order to save power.
>> NOTE, this change means no USB charging in suspend
>> mode.
>
> What happens if a device on the bus is a source of wakeups?
>

The device will not be powered in suspend state,
so the corresponding wakeup will get missed ?


>         Regards
>                 Oliver
>



-- 
Thanks & Regards
Vivek
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
