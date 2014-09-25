From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v3 6/6] mfd: cros_ec: Instantiate sub-devices from device
 tree
Date: Thu, 25 Sep 2014 15:53:56 +0200
Message-ID: <54241E74.9000403@collabora.co.uk>
References: <1410428289-18229-1-git-send-email-javier.martinez@collabora.co.uk> <1410428289-18229-7-git-send-email-javier.martinez@collabora.co.uk> <20140917163114.GL30918@lee--X1> <541A8E88.6050707@collabora.co.uk> <20140919001512.GA29852@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140919001512.GA29852@lee--X1>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Todd Broch <tbroch-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Andreas Faerber <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Lee,

On 09/19/2014 02:15 AM, Lee Jones wrote:
>> 
>> As explained above, DT, non-DT and x86 platforms instantiate the cros-ec-dev
>> cells but DT platforms can define other child nodes. But I can remove the
>> conditional if you want and reintroduce it once cros-ec-dev support is added.
> 
> Yes, that makes sense.  I only care about doing what's right for
> Mainline, so if it doesn't make sense here, then we shouldn't be doing
> it.
> 

Understood, that's why I dropped this since as explained earlier, it makes more
sense to include this change once the cros_ec_dev driver is pushed to upstream.

The last version of the series (v4) I posted a week ago [0], does not include
this patch so I hope the series can be picked for 3.18 since most of the patches
were already acked by you.

Thanks a lot and best regards,
Javier

[0]: https://www.mail-archive.com/linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg36770.html
