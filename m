From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 0/5] Fix the parse_dt of exynos dsi and remove the OF
 graph
Date: Mon, 20 Feb 2017 17:32:22 +0900
Message-ID: <58AAA996.3080900@samsung.com>
References: <CGME20170209012715epcas1p3dbe1788b864c50d339dcfd791c0900ec@epcas1p3.samsung.com>
 <1486603601-26826-1-git-send-email-hoegeun.kwon@samsung.com>
 <58AA95C1.4020809@samsung.com>
 <CAJKOXPd7Roubdf_5B6pT1PkA9K9dZmjPydYOujXvrz8cVcKVmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAJKOXPd7Roubdf_5B6pT1PkA9K9dZmjPydYOujXvrz8cVcKVmg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org



2017년 02월 20일 16:27에 Krzysztof Kozlowski 이(가) 쓴 글:
> On Mon, Feb 20, 2017 at 9:07 AM, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> Hi Krzysztof,
>>
>> Can you merge patch 2 and 5 to your tree so that they can go to mainline? Otherwise, I can merge them to my tree if you give me acked-by.
> 
> Hi,
> 
> Hm? Why do you need them to be merged? Do you mean that the first
> patch breaks not only ABI but also bisectability? Then this has to be
> reworked because:
> 
> 1. The DTS patches cannot go through non-DT tree so no, you cannot
> take them into your branch. I will merge them according to point 4
> below.
> 2. Bisectability has to be preserved.
> 3. DTS changes in general should not be a dependency for driver changes.

Krzysztof,

I know that. I didn't check you gave a comment to Hoegun do rework this patch series. I just checked reviewed-by from Andrzej H. and thought no problem.
 
Ideally you are right. DT changes should be no any dependency of driver changes but now Exynos DT is broken.
So if we have to keep the bisectability between driver and device tree patches - this means that all drivers should always keep the backward compatibility - then the drivers will be messed up.

About this, we had a discussion and I think you agreed,
https://patchwork.kernel.org/patch/9477957/

Do you want the backward compatibility to be kept always when new dt binding relevant patch - which fixes up the wrong usage of dt binding - is posted?
It would be good for the backward compatibility to be kept as long as we can do but there would be several cases to make the driver to be messed up like this patch series.

> 4 . Usually DTS patches wait for driver to be acked by devicetree
> maintainers or merging by driver maintainer. This did not happen so
> DTS patches wait. Also these were sent too late to merge for this
> cycle so the only chance is v4.12.

Yes, maybe.


Thanks,
Inki Dae


> 
> Best regards,
> Krzysztof
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
