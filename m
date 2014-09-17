From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: DTS: correct the capability string for mmc0
Date: Wed, 17 Sep 2014 17:43:40 +0530
Message-ID: <CAFp+6iE07b=juik2Ms4WEzzBw0FxPnAgbxtdqVGBBYZQ7fk5zA@mail.gmail.com>
References: <1410857409-24767-1-git-send-email-gautam.vivek@samsung.com>
	<CAD=FV=U4rPsfGkTcSY3OYHPgCFOccaHTjG1qC6WAekOEV09Q7A@mail.gmail.com>
	<01ce01cfd270$3b3d31b0$b1b79510$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <01ce01cfd270$3b3d31b0$b1b79510$@kernel.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seungwon Jeon <tgih.jun-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,


On Wed, Sep 17, 2014 at 5:39 PM, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> Doug Anderson wrote:
>>
>> Vivek,
>>
> Hi,
>
>> On Tue, Sep 16, 2014 at 1:50 AM, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> > From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> >
>> > MMC capability for HS200 is parsed in mmc/core/host.c as
>> > dts string "mmc-hs200-1_8v".
>> >
>> > This patch corrects the dts string for Exynos5420 based peach-pit
>> > and Exynos5800 based peach-pi boards.
>> >
>> > Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> In this case, Vivek's sign is required here.

Ok, i will resend it with my Signed-off

>
>> > ---
>> >
>> > Hi Kukjin,
>> >
>> > As commented by Doug earlier for this patch, the two patches required
>> >   -- mmc: dw_mmc: Make sure we don't get stuck when we get an error
>> >   -- mmc: dw_mmc: change to use recommended reset procedure
>> > are now merged in upstream.
>> > So you can go ahead and pick this change.
>> >
>> >  arch/arm/boot/dts/exynos5420-peach-pit.dts |    2 +-
>> >  arch/arm/boot/dts/exynos5800-peach-pi.dts  |    2 +-
>> >  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> Thanks, I will take this patch once Vivek replies his sign on this patch.
>
> - Kukjin
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
