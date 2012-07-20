From: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/7] ARM: SAMSUNG: add additional registers and SFR
 definitions for writeback
Date: Fri, 20 Jul 2012 12:09:52 +0200
Message-ID: <50092E70.6090806@gmail.com>
References: <1342591053-7092-1-git-send-email-l.krishna@samsung.com>
 <1342591053-7092-2-git-send-email-l.krishna@samsung.com>
 <009c01cd64b1$bd3a8390$37af8ab0$%szyprowski@samsung.com>
 <CAEC9eQP01q+ddhA9Q4VQcm8wuvJXmR5KvAVZgX6MEdFLstST0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAEC9eQP01q+ddhA9Q4VQcm8wuvJXmR5KvAVZgX6MEdFLstST0g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Ajay kumar <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 07/18/2012 09:09 AM, Ajay kumar wrote:
>>> +config FB_EXYNOS_FIMD_V8
>>> +     bool "register extensions for FIMD version 8"
>>> +     depends on ARCH_EXYNOS5
>>> +     ---help---
>>> +     This uses register extensions for FIMD version 8
>>> +
>>>   config FB_S3C_DEBUG_REGWRITE
>>>          bool "Debug register writes"
>>>          depends on FB_S3C
>>
>> Do we really need these defines in arch/arm/plat-samsung/include/plat/regs-fb* ?
>> IMHO they should be moved from arch/arm to drivers/video to live together with the driver.
>> They are not a part of core platform code. I thought that there have been some patches
>> cleaning up regs-fb mess a long time ago, but it looks they didn't get their way to
>> mainline.
>
> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/5826
>
> These patches are merged.
> I created the patchset. I felt it was redundant to have regs-fb.h in
> individual samsung boards(arch/arm/mach-s*),
> so I moved them to plat-samsung. We still need to move plat/regs-fb.h
> to driver side.

Great. These headers are now used by drivers/video/s3c-fb.c and 
drivers/gpu/drm/exynos/exynos_drm_fimd.c, so we probably need to merge
them into one file under include/video.

--

Regards,
Sylwester
