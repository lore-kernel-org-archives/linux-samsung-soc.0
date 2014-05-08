From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: S5PV210: Remove camera support from mach-goni.c
Date: Thu, 08 May 2014 18:09:24 +0200
Message-ID: <536BAC34.2020904@samsung.com>
References: <1397583272-28295-1-git-send-email-s.nawrocki@samsung.com>
 <1397583272-28295-2-git-send-email-s.nawrocki@samsung.com>
 <081001cf65cc$cbef8700$63ce9500$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <081001cf65cc$cbef8700$63ce9500$@samsung.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 02/05/14 08:07, Kukjin Kim wrote:
> Sylwester Nawrocki wrote:
>> > 
>> > S5PV210 is going to get DT support, so we can remove the camera
>> > bits from the only board using camera on S5PV210. This allows to
>> > clean the exynos4-is driver by dropping code for non-dt platforms.
>> > This patch can be dropped if a patch removing the whole board
>> > file is applied first.
>> > 
>> > Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> > Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> Hi Sylwester,
> 
> Cleanup is always welcome ;-)
> 
> I think, when this series is ready for mainline, this will be handled in
> media tree. So,
> 
> Acked-by: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Hi Kukjin,

Thank you, patch queued up for the media tree!

--
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
