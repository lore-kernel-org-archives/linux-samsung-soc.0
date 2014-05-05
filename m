From: Shaik Ameer Basha <shaik.samsung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/16] exynos5420: clock file cleanup
Date: Mon, 5 May 2014 10:10:36 +0530
Message-ID: <CAOD6ATqerMT4rrX7iv0ikHtqgZeVrzEoyxMmc_YmwG7fgbvgTQ@mail.gmail.com>
References: <1398344632-18623-1-git-send-email-shaik.ameer@samsung.com> <5362BC8A.6020609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5362BC8A.6020609-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linux Samsung SOC <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux DeviceTree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rahul Sharma <r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz,

On Fri, May 2, 2014 at 2:58 AM, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 24.04.2014 15:03, Shaik Ameer Basha wrote:
>>
>> Many changes/fixes have been identified for clock file for exynos5420.
>> These include correct parents, bit fields, new clocks etc. Existing
>> files needs some correction in terms of names of the clock and
>> indentation. These issues are addressed in this patch series. It also
>> replaces the usage of enums with macro as clock ids.
>>
>> This patch series is rebased on,
>> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git:master
>>
>> This patch is also dependent on the following patch.
>> ARM: dts: add dt node for sss module for exynos5250/5420
>
>
> Also a general comment to all the patches. Please assign clock IDs for all
> the clocks being added. In general, all the defined clocks should have clock
> IDs defined to let them be accessed from Device Tree, for example in case of
> DT clock initialization that is being worked on right now.

Ok. Will take care of this in next series.

Regards,
Shaik

>
> Best regards,
> Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
