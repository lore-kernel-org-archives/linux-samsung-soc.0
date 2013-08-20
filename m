From: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: RE: RE: [PATCH v2 0/8] Common Clock Framework support for Samsung
 S3C64xx
Date: Tue, 20 Aug 2013 16:09:26 +0900
Message-ID: <18f101ce9d74$34e23450$9ea69cf0$@org>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
 <2956608.dyLtqySMuJ@amdc1227> <20130816210203.4443.43511@quantum>
 <3890424.fJfWX17mED@flatron> <158901ce9b34$c0ac8720$42059560$@org>
 <20130820002258.4443.34197@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20130820002258.4443.34197@quantum>
Content-language: ko
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Mike Turquette' <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Tomasz Figa' <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: 'Tomasz Figa' <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Mark Brown' <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, 'Arnd Bergmann' <arnd-r2nGTMty4D4@public.gmane.org>, 'Olof Johansson' <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Sylwester Nawrocki' <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?'Heiko_St=C3=BCbner'?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, 'Thomas Abraham' <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Mike Turquette wrote:
> 

[...]

> > OK, if new branch is ready, I will replace with that or if re-merge is
> > required, I will. Either way, I'm fine and can handle. Mike, let me know
> > your choice :-)
> 
> Since I have already published it let's just go with the delta patch.  I
> can create another stable branch named clk-next-s3c64xx-delta that just
> has this patch on top of clk-next-s3c64xx OR I can apply it on top of
> the existing clk-next-s3c64xx and re-merge it.
> 
Sounds good to me. If the branch for the delta is ready, let me know.

> I'm trying to think on whether there are any weird git corner cases with
> re-merging clk-next-s3c64xx. Let me know if re-merging is somehow unsafe
> (makes history weird, or whatever).
> 
I don't think it causes some problem.

> Let me know what option is better for you. I'll publish as soon as I get
> the delta patch. Apologies again for creating some extra work!
> 
No problem.

Thanks,
Kukjin

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
