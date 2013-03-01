From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 0/2] Add automatic bus number support for i2c busses
 with device tree
Date: Thu, 28 Feb 2013 16:55:36 -0800
Message-ID: <CAD=FV=XnhG_gM7mFLRHKt=j3a249QsbbgDb4cTCGa7297svVeQ@mail.gmail.com>
References: <1360630085-26874-1-git-send-email-dianders@chromium.org>
	<CAD=FV=WS5Vj74d-FNXCVpNsx6Nf-8+RC-WO29Z1XNmkEOYLxfQ@mail.gmail.com>
	<20130228232558.GA8180@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130228232558.GA8180-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Wolfram,

On Thu, Feb 28, 2013 at 3:25 PM, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org> wrote:
>
> Regarding patch 1, I was waiting for the idr changes to hit mainline.
> They are mainline now, but since the removal of MAX_IDR_MASK your patch
> doesn't apply anymore :( Can you rebase and retest, please? I'd like to
> get it into 3.9, still.

Yes, I'll rebase/retest tomorrow.  I'll let you make the call between
3.9 and 3.10.  Obviously I'd love to see it in 3.9 but I'm OK with
either.  I was just hoping not to find out at the end of the 3.10
cycle that it needs fixes and need to wait for 3.11.  I wanted to make
sure all my ducks were in a row.  ;-)


> For patch 2, some Tested-by would be nice; but it will probably make it
> into my for-next somewhen after rc1 is out.

I have no urgent need for patch 2 to land but it seemed nice to tidy
up the pxa driver and I felt it was my obligation to post it together
with patch set #1 (plus it's always nice to remove code).  Putting it
into your for-next seems like a very good solution.  That gives people
some time to test it and make sure it works for them.


Thanks!

-Doug
