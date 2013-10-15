From: Naveen Krishna Ch <naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3 v3] exynos: i2c: Fix i2c driver to handle NACKs properly
Date: Tue, 15 Oct 2013 11:42:37 +0530
Message-ID: <CAHfPSqDxSGFaBDAMQD7Xz3J+jNtMdcEuF8uFdjLBP8p1G1DsMw@mail.gmail.com>
References: <1380799354-14460-1-git-send-email-ch.naveen@samsung.com>
 <1381813971-16006-1-git-send-email-ch.naveen@samsung.com> <525CDB51.70408@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <525CDB51.70408-ynQEQJNshbs@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hs-ynQEQJNshbs@public.gmane.org
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, d.mueller-Xx/oXIv9zdPtRgLqZ5aouw@public.gmane.org, trini-l0cyMroinI0@public.gmane.org, Minkyu Kang <mk7.kang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 15 October 2013 11:36, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org> wrote:
> Hello Naveen,
>
> Am 15.10.2013 07:12, schrieb Naveen Krishna Chatradhi:
>
>> The Exynos5 i2c driver does not handle NACKs properly. This change:
>>
>> - fixes the NACK processing problem (do not continue transaction if
>>    address cycle was NACKed)
>>
>> - eliminates a fair amount of duplicate code
>>
>> Signed-off-by: Vadim Bendebury<vbendeb-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Reviewed-by: Simon Glass<sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Naveen Krishna Chatradhi<ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>> Changes since v1:
>> Fixed complilation warning in function i2c_init()
>>
>> Changes since v2:
>> None
>>
>>   drivers/i2c/s3c24x0_i2c.c |  214
>> +++++++++++++++++++--------------------------
>>   1 file changed, 90 insertions(+), 124 deletions(-)
>
>
> Hmm.. I think your patchset is for u-boot, or? But I could not find
> the u-boot ml on cc... instead some linux ml ... if so, please resend
> to the u-boot ml ...
>
> (matches for all three patches from you)
I just checked that u-boot mailing list is missing.
I've done the checks you mentioned in the other mail and reposted with
u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org in --to

Thanks for your review.
>
>
> bye,
> Heiko
> --
> DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany



-- 
Shine bright,
(: Nav :)
