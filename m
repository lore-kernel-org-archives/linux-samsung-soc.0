From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v3 6/6] mfd: cros_ec: Instantiate sub-devices from device
 tree
Date: Thu, 25 Sep 2014 17:42:22 +0200
Message-ID: <542437DE.4090701@collabora.co.uk>
References: <1410428289-18229-1-git-send-email-javier.martinez@collabora.co.uk> <1410428289-18229-7-git-send-email-javier.martinez@collabora.co.uk> <20140917163114.GL30918@lee--X1> <541A8E88.6050707@collabora.co.uk> <20140919001512.GA29852@lee--X1> <54241E74.9000403@collabora.co.uk> <20140925144846.GC21351@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140925144846.GC21351@lee--X1>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Todd Broch <tbroch-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Andreas Faerber <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 09/25/2014 04:48 PM, Lee Jones wrote:
> On Thu, 25 Sep 2014, Javier Martinez Canillas wrote:
>> 
>> The last version of the series (v4) I posted a week ago [0], does not include
>> this patch so I hope the series can be picked for 3.18 since most of the patches
>> were already acked by you.
> 
> Unfortunately this is going to have to wait until v3.19 now, as Linus
> is closing the -rcs early.  I have subsequently applied my last
> patch to the MFD tree for v3.18.  It will be good for these patches to
> get some soak testing in -next anyway, rather than rush them in.
> 

No worries. Does that mean that you are going to pick this series after
the 3.18 merge window or should I resend this once 3.18-rc1 is released?

Best regards,
Javier
