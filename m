From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH V8 00/14] drm/exynos: few patches to enhance bridge chip
 support
Date: Mon, 19 Jan 2015 18:05:07 +0100
Message-ID: <54BD3943.80402@collabora.co.uk>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com> <CAEC9eQOrKw2Z1q-ztFfadXmsL3CTcAkkv9kcS2QnDOAVSh2AuQ@mail.gmail.com> <548ABAB6.6010200@collabora.co.uk> <3197445.qizQc0zeRb@avalon> <54914D7D.9060108@collabora.co.uk> <CAPj87rN4HZzDt5JBLyTRmKZs7XcOG=0ha7ZQf9hmjPAFgTyhYQ@mail.gmail.com> <20150105135015.GA12010@ulmo.nvidia.com> <54BCDC28.7080003@collabora.co.uk> <20150119163043.GB7751@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150119163043.GB7751-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sean Paul <seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Ajay kumar <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pannaga Bhushan Reddy Patel <bhushan.r-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Prashanth G <prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Thierry,

On 01/19/2015 05:30 PM, Thierry Reding wrote:
>> 
>> I know you probably are very busy but it would be great if you can take a look
>> to this series to avoid another kernel release to be missed since we are already
>> at v3.19-rc5.
>> 
>> Only this version was posted 2 months ago and the first version of the series
>> was sent on May, 2014 so it has been on the list for almost a year now...
>> 
>> Tomi and Laurent had already agreed with the DT binging so I think that we can
>> already merge these and if there are any remaining issues, those can be fixed
>> during the 3.20 -rc cycle.
> 
> I see only a single Tested-by on this series and that seems to be with a
> bunch of out-of-tree patches applied on top. Does this now actually work
> applied on top of upstream? Also it seems like many people actually want
> this to get merged but there's been no Reviewed-bys and only a single
> Tested-by? Is that as good as it's going to get?
>

Good point, I provided some feedback on an early version of the series but I'm not
an DRM expert so I couldn't review it in detail to provide my Reviewed-by.

I did provide my Tested-by a long time ago though but looking at the patches it
seems those were dropped so here goes again:

For the whole series on an Exynos5420 Peach Pit and an Exynos5250 Snow Chromebooks:

Tested-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
 
> Also I think the last update was that Ajay was going to resend this
> based on v3.19-rc1 or something. Is that still going to happen?
> Otherwise I can probably try to apply as-is, but not sure how well it
> will.
>

Ajay,

Are you going to rebase and resend this series with all the provided tags? Gustavo
and I have a rebased branch on top of 3.19-rc5 and one of us can post your series if
you are not planning to do it.

Laurent and Tomi,

You said that you are OK with the DT bindings now, does that count as an Acked-by or
Reviewed-by for you at least for the DT bindings changes in the series?
 
> Thierry
> 

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
