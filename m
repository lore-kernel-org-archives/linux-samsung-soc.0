From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] exynos: add C++ support to exynos_drmif header
Date: Wed, 5 Apr 2017 18:23:25 +0200
Message-ID: <e15aabd7-bd99-aa70-118b-4fb0ae2c644e@math.uni-bielefeld.de>
References: <1491402144-3298-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <20170405154852.ncs2nhquiz2wy23m@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55113 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755860AbdDEQXc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Apr 2017 12:23:32 -0400
In-Reply-To: <20170405154852.ncs2nhquiz2wy23m@imgtec.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Eric Engestrom <eric.engestrom@imgtec.com>
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org

Hello Eric,


Eric Engestrom wrote:
> On Wednesday, 2017-04-05 16:22:24 +0200, Tobias Jakobi wrote:
>> Add the usual extern "C" when compiling in C++ mode.
> 
> Thanks, but why specifically this header? The other exynos/*.h headers
> also lack the c++ mangling guard.
I'm currently writing a small C++ project using the
exynos_bo_{create,destroy}() calls, and noticed this.

> A quick grep shows that only 15/101 headers in libdrm have it.
> Can I interest you in fixing a few more headers? :)
Not at the moment.


- Tobias

> In any case, this patch is:
> Reviewed-by: Eric Engestrom <eric.engestrom@imgtec.com>
> (I assume you'll push it yourself?)
> 
> Btw, can you run this in your local libdrm repo?
>   $ git config --local format.subjectPrefix "PATCH libdrm"
> 
> Cheers,
>   Eric
> 
> 
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  exynos/exynos_drmif.h | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/exynos/exynos_drmif.h b/exynos/exynos_drmif.h
>> index 626e399..154439b 100644
>> --- a/exynos/exynos_drmif.h
>> +++ b/exynos/exynos_drmif.h
>> @@ -31,6 +31,10 @@
>>  #include <stdint.h>
>>  #include "exynos_drm.h"
>>  
>> +#if defined(__cplusplus)
>> +extern "C" {
>> +#endif
>> +
>>  struct exynos_device {
>>  	int fd;
>>  };
>> @@ -109,4 +113,8 @@ int exynos_handle_event(struct exynos_device *dev,
>>  				struct exynos_event_context *ctx);
>>  
>>  
>> +#if defined(__cplusplus)
>> +}
>> +#endif
>> +
>>  #endif /* EXYNOS_DRMIF_H_ */
>> -- 
>> 2.7.3
>>
