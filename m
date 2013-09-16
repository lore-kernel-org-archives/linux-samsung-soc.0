From: Arun Kumar K <arunkk.samsung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 12/12] V4L: Add driver for s5k4e5 image sensor
Date: Mon, 16 Sep 2013 11:29:14 +0530
Message-ID: <CALt3h78TezzNoET+st6RBUH6Fefj_HX5A6NkeTit5SYb2EQ_Rw@mail.gmail.com>
References: <1378987669-10870-1-git-send-email-arun.kk@samsung.com>
	<1378987669-10870-13-git-send-email-arun.kk@samsung.com>
	<1379076935.4396.13.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379076935.4396.13.camel-/rZezPiN1rtR6QfukMTsflXZhhPuCNm+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, kilyeon.im-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Philipp,

>> +Example:
>> +
>> +     i2c-isp@13130000 {
>> +             s5k4e5@20 {
>> +                     compatible = "samsung,s5k4e5";
>> +                     reg = <0x20>;
>> +                     gpios = <&gpx1 2 1>;
>
> This probably should be 'reset-gpios', too.
>

Yes thats right. I missed updating the example.
Thanks for pointing out.

Regards
Arun
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
