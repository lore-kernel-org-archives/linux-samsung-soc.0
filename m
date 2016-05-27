From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Re: Endless "supply vcc not found, using dummy regulator"
Date: Fri, 27 May 2016 15:13:47 +0530
Message-ID: <CAFp+6iFsUQSS0Gqpoa6bQiFq_zMQ-Tnosfz9XjZwEySxbOvDnw@mail.gmail.com>
References: <20160523162455.GW8206@sirena.org.uk>
	<20160523170617.GA8997@sesse.net>
	<CAJKOXPds5PgVmcYLEOriyL-a6tp0jkg7x0GTjPZaN9YLL_gO_A@mail.gmail.com>
	<20160524152638.GA20341@sesse.net>
	<574478FE.4070800@samsung.com>
	<20160524192424.GA11690@sesse.net>
	<CANAwSgSS=LPUJ4HXQ_D4tsMYXP=1qG_f_jn-G9xwN6AOKy6QMw@mail.gmail.com>
	<20160525175236.GA5788@sesse.net>
	<20160526125757.GA23797@sesse.net>
	<CAFp+6iE_QW0BDO-Z1Ce5zrUJiToWD_8UtnCFnfKLeaYyys7U8A@mail.gmail.com>
	<20160527093919.GA34987@sesse.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160527093919.GA34987-gdzBep0Ce9heoWH0uzbU5w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Steinar H. Gunderson" <sgunderson-jG/AHqQBv7lBDgjK7y7TUQ@public.gmane.org>
Cc: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 823552-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, May 27, 2016 at 3:09 PM, Steinar H. Gunderson
<sgunderson-jG/AHqQBv7lBDgjK7y7TUQ@public.gmane.org> wrote:
> On Fri, May 27, 2016 at 03:02:48PM +0530, Vivek Gautam wrote:
>> Above mentioned patches were not accepted by the maintainers of generic-phy
>> and usb. I couldn't get any response on them for quite a long time. So, the
>> patches could never make it to the mainline.
>> I can try initiating the entire exercise once again and try to get them merged.
>
> That would be nice; having USB3 speeds is certainly attractive.
>
>> AFA dwc3-exynos is concerned, there's definitely a resource leak as
>> pointed out by you.
>> Please post the suggested patch, adding required people in CC.
>
> http://www.spinics.net/lists/linux-usb/msg141385.html
>
> Is there anyone I should have Cc-ed that I didn't?

That's alright, i missed noticing your patch.

>
> /* Steinar */
> --
> Homepage: https://www.sesse.net/



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
