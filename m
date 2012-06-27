From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Remove the L2 cache latency setting for
 EXYNOS5
Date: Wed, 27 Jun 2012 14:10:00 +0900
Message-ID: <4FEA95A8.3080505@samsung.com>
References: <038301cd4f47$8202b420$86081c60$%kim@samsung.com>
 <CAPLVkLsgi3ST622ZhRusJz5OHV6MJYP7SNkj2Mh-QPos1AWyhQ@mail.gmail.com>
 <006d01cd53f7$6877ed90$3967c8b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8145111646154562763=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <006d01cd53f7$6877ed90$3967c8b0$%kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Joonyoung Shim' <dofmind@gmail.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============8145111646154562763==
Content-type: multipart/alternative;
 boundary=------------060608010604000405010108

This is a multi-part message in MIME format.
--------------060608010604000405010108
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/27/2012 08:57 AM, Boojin Kim wrote:
> Joonyoung Shim wrote:
>
>> I don't understand this. Do you mean that BL1 codes do it?
>> I also wonder how enable L2 cache at the exynos5.
> Yes, the latency configuration of L2 cache is located on IROM or BL1 code.

How does kernel know it? Also, IROM and BL1 is blackbox to me

> It can remove the overhead about cache reset and cache flush.
> And, Kernel enables L2 cache.

I cannot find codes to enable L2 cache for exynos5 in the kernel.
Please let me know it.

Thanks.

> Thanks.
>>> no longer need that in the kernel. It helps to reduce
>>> booting time (no need cache disable and cache enable).
>>>
>>> Signed-off-by: Boojin Kim<boojin.kim@samsung.com>
>>> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
>>> ---
>>> ?rch/arm/mach-exynos/common.c |   25 -------------------------
>>>   1 files changed, 0 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
>>> index 742edd3..0ec1a91 100644
>>> --- a/arch/arm/mach-exynos/common.c
>>> +++ b/arch/arm/mach-exynos/common.c
>>> @@ -712,31 +712,6 @@ static int __init exynos4_l2x0_cache_init(void)
>>> ?arly_initcall(exynos4_l2x0_cache_init);
>>>   #endif
>>>
>>> -static int __init exynos5_l2_cache_init(void)
>>> -{
>>> -       unsigned int val;
>>> -
>>> -       if (!soc_is_exynos5250())
>>> -               return 0;
>>> -
>>> -       asm volatile("mrc p15, 0, %0, c1, c0, 0\n"
>>> -                    "bic %0, %0, #(1<<  2)\n"  /* cache disable */
>>> -                    "mcr p15, 0, %0, c1, c0, 0\n"
>>> -                    "mrc p15, 1, %0, c9, c0, 2\n"
>>> -                    : "=r"(val));
>>> -
>>> -       val |= (1<<  9) | (1<<  5) | (2<<  6) | (2<<  0);
>>> -
>>> -       asm volatile("mcr p15, 1, %0, c9, c0, 2\n" : : "r"(val));
>>> -       asm volatile("mrc p15, 0, %0, c1, c0, 0\n"
>>> -                    "orr %0, %0, #(1<<  2)\n"  /* cache enable */
>>> -                    "mcr p15, 0, %0, c1, c0, 0\n"
>>> -                    : : "r"(val));
>>> -
>>> -       return 0;
>>> -}
>>> -early_initcall(exynos5_l2_cache_init);
>>> -
>>> ?tatic int __init exynos_init(void)
>>>   {
>>>        ?rintk(KERN_INFO "EXYNOS: Initializing architecture\n");
>>> --
>>> 1.7.1
>>>
>>>
>>> _______________________________________________
>>> linux-arm-kernel mailing list
>>> linux-arm-kernel@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
>>
>> --
>> - Joonyoung Shim
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


--------------060608010604000405010108
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi,<br>
    <br>
    On 06/27/2012 08:57 AM, Boojin Kim wrote:
    <blockquote
      cite="mid:006d01cd53f7$6877ed90$3967c8b0$%25kim@samsung.com"
      type="cite">
      <pre wrap="">Joonyoung Shim wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="">I don't understand this. Do you mean that BL1 codes do it?
I also wonder how enable L2 cache at the exynos5.
</pre>
      </blockquote>
      <pre wrap="">Yes, the latency configuration of L2 cache is located on IROM or BL1 code.</pre>
    </blockquote>
    <br>
    How does kernel know it? Also, IROM and BL1 is blackbox to me<br>
    <br>
    <blockquote
      cite="mid:006d01cd53f7$6877ed90$3967c8b0$%25kim@samsung.com"
      type="cite">
      <pre wrap="">
It can remove the overhead about cache reset and cache flush.
And, Kernel enables L2 cache.</pre>
    </blockquote>
    <br>
    I cannot find codes to enable L2 cache for exynos5 in the kernel.<br>
    Please let me know it.<br>
    <br>
    Thanks.<br>
    <br>
    <blockquote
      cite="mid:006d01cd53f7$6877ed90$3967c8b0$%25kim@samsung.com"
      type="cite">
      <pre wrap="">
Thanks.
</pre>
      <blockquote type="cite">
        <pre wrap="">
</pre>
        <blockquote type="cite">
          <pre wrap="">no longer need that in the kernel. It helps to reduce
booting time (no need cache disable and cache enable).

Signed-off-by: Boojin Kim <a class="moz-txt-link-rfc2396E" href="mailto:boojin.kim@samsung.com">&lt;boojin.kim@samsung.com&gt;</a>
Signed-off-by: Kukjin Kim <a class="moz-txt-link-rfc2396E" href="mailto:kgene.kim@samsung.com">&lt;kgene.kim@samsung.com&gt;</a>
---
&#51166;rch/arm/mach-exynos/common.c | &nbsp; 25 -------------------------
&nbsp;1 files changed, 0 insertions(+), 25 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 742edd3..0ec1a91 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -712,31 +712,6 @@ static int __init exynos4_l2x0_cache_init(void)
&#51170;arly_initcall(exynos4_l2x0_cache_init);
&nbsp;#endif

-static int __init exynos5_l2_cache_init(void)
-{
- &nbsp; &nbsp; &nbsp; unsigned int val;
-
- &nbsp; &nbsp; &nbsp; if (!soc_is_exynos5250())
- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return 0;
-
- &nbsp; &nbsp; &nbsp; asm volatile("mrc p15, 0, %0, c1, c0, 0\n"
- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"bic %0, %0, #(1 &lt;&lt; 2)\n" &nbsp;/* cache disable */
- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"mcr p15, 0, %0, c1, c0, 0\n"
- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"mrc p15, 1, %0, c9, c0, 2\n"
- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: "=r"(val));
-
- &nbsp; &nbsp; &nbsp; val |= (1 &lt;&lt; 9) | (1 &lt;&lt; 5) | (2 &lt;&lt; 6) | (2 &lt;&lt; 0);
-
- &nbsp; &nbsp; &nbsp; asm volatile("mcr p15, 1, %0, c9, c0, 2\n" : : "r"(val));
- &nbsp; &nbsp; &nbsp; asm volatile("mrc p15, 0, %0, c1, c0, 0\n"
- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"orr %0, %0, #(1 &lt;&lt; 2)\n" &nbsp;/* cache enable */
- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"mcr p15, 0, %0, c1, c0, 0\n"
- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: : "r"(val));
-
- &nbsp; &nbsp; &nbsp; return 0;
-}
-early_initcall(exynos5_l2_cache_init);
-
&#51187;tatic int __init exynos_init(void)
&nbsp;{
&nbsp; &nbsp; &nbsp; &#51184;rintk(KERN_INFO "EXYNOS: Initializing architecture\n");
--
1.7.1


_______________________________________________
linux-arm-kernel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@lists.infradead.org</a>
<a class="moz-txt-link-freetext" href="http://lists.infradead.org/mailman/listinfo/linux-arm-kernel">http://lists.infradead.org/mailman/listinfo/linux-arm-kernel</a>
</pre>
        </blockquote>
        <pre wrap="">


--
- Joonyoung Shim

_______________________________________________
linux-arm-kernel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@lists.infradead.org</a>
<a class="moz-txt-link-freetext" href="http://lists.infradead.org/mailman/listinfo/linux-arm-kernel">http://lists.infradead.org/mailman/listinfo/linux-arm-kernel</a>
</pre>
      </blockquote>
      <pre wrap="">


</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
linux-arm-kernel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@lists.infradead.org</a>
<a class="moz-txt-link-freetext" href="http://lists.infradead.org/mailman/listinfo/linux-arm-kernel">http://lists.infradead.org/mailman/listinfo/linux-arm-kernel</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------060608010604000405010108--



--===============8145111646154562763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8145111646154562763==--
