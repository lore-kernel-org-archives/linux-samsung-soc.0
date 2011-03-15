From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: RE: [PATCH v2] ARM: EXYNOS4: add a placeholder for board specific
	interrupts
Date: Tue, 15 Mar 2011 22:07:00 +0900
Message-ID: <AANLkTim0Ld63n5raA0107yq_eQXY4__acd7rx7CaQOjo@mail.gmail.com>
References: <1300086405-9895-1-git-send-email-m.szyprowski@samsung.com>
	<011301cbe310$41381f10$c3a85d30$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1288692499=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <011301cbe310$41381f10$c3a85d30$%kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1288692499==
Content-Type: multipart/alternative; boundary=0016e6de1501990ff9049e851a4b

--0016e6de1501990ff9049e851a4b
Content-Type: text/plain; charset=ISO-8859-1

Now pmic8998, 8997 requires extra interrupts.

If you don't want to extends irqs, the sparse irq can be used at each board.

Of course, in case of exynos4210, need some patch for sparse irq support.

Kyungmin Park

>From Android
On Mar 15, 2011 9:55 PM, "Kukjin Kim" <kgene.kim@samsung.com> wrote:
> Marek Szyprowski wrote:
>>
>> This patch adds a placeholder for board specific interrupts on S5PC210
>> platform.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> arch/arm/mach-exynos4/include/mach/irqs.h | 6 +++++-
>> 1 files changed, 5 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-
>> exynos4/include/mach/irqs.h
>> index 5d03730..cc2186d 100644
>> --- a/arch/arm/mach-exynos4/include/mach/irqs.h
>> +++ b/arch/arm/mach-exynos4/include/mach/irqs.h
>> @@ -154,7 +154,11 @@
>> #define IRQ_GPIO2_NR_GROUPS 9
>> #define IRQ_GPIO_END (S5P_GPIOINT_BASE + S5P_GPIOINT_COUNT)
>>
>> +/* optional board specific irqs */
>> +#define IRQ_BOARD_START IRQ_GPIO_END
>> +#define IRQ_NR_BOARD 16
>> +
>> /* Set the default NR_IRQS */
>> -#define NR_IRQS (IRQ_GPIO_END)
>> +#define NR_IRQS (IRQ_GPIO_END + IRQ_NR_BOARD)
>>
>> #endif /* __ASM_ARCH_IRQS_H */
>> --
>> 1.7.1.569.g6f426
>
> I have no idea that we need specific interrupt on EXYNOS4 now.
> As you know, this can affect all machines of EXYNOS4 SoC even though there
> is EXYNOS4210 now.
>
> If required, we need something like SAMSUNG_GPIO_EXTRA for compatibility.
> Anyway need more discussion on this :)
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe
linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html

--0016e6de1501990ff9049e851a4b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>Now pmic8998, 8997 requires extra interrupts.</p>
<p>If you don&#39;t want to extends irqs, the sparse irq can be used at eac=
h board.</p>
<p>Of course, in case of exynos4210, need some patch for sparse irq support=
.</p>
<p>Kyungmin Park</p>
<p>From Android </p>
<div class=3D"gmail_quote">On Mar 15, 2011 9:55 PM, &quot;Kukjin Kim&quot; =
&lt;<a href=3D"mailto:kgene.kim@samsung.com">kgene.kim@samsung.com</a>&gt; =
wrote:<br type=3D"attribution">&gt; Marek Szyprowski wrote:<br>&gt;&gt; <br=
>
&gt;&gt; This patch adds a placeholder for board specific interrupts on S5P=
C210<br>&gt;&gt; platform.<br>&gt;&gt; <br>&gt;&gt; Signed-off-by: Marek Sz=
yprowski &lt;<a href=3D"mailto:m.szyprowski@samsung.com">m.szyprowski@samsu=
ng.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Kyungmin Park &lt;<a href=3D"mailto:kyungmin.park@s=
amsung.com">kyungmin.park@samsung.com</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt;  =
arch/arm/mach-exynos4/include/mach/irqs.h |    6 +++++-<br>&gt;&gt;  1 file=
s changed, 5 insertions(+), 1 deletions(-)<br>
&gt;&gt; <br>&gt;&gt; diff --git a/arch/arm/mach-exynos4/include/mach/irqs.=
h b/arch/arm/mach-<br>&gt;&gt; exynos4/include/mach/irqs.h<br>&gt;&gt; inde=
x 5d03730..cc2186d 100644<br>&gt;&gt; --- a/arch/arm/mach-exynos4/include/m=
ach/irqs.h<br>
&gt;&gt; +++ b/arch/arm/mach-exynos4/include/mach/irqs.h<br>&gt;&gt; @@ -15=
4,7 +154,11 @@<br>&gt;&gt;  #define IRQ_GPIO2_NR_GROUPS	9<br>&gt;&gt;  #def=
ine IRQ_GPIO_END		(S5P_GPIOINT_BASE + S5P_GPIOINT_COUNT)<br>&gt;&gt; <br>
&gt;&gt; +/* optional board specific irqs */<br>&gt;&gt; +#define IRQ_BOARD=
_START		IRQ_GPIO_END<br>&gt;&gt; +#define IRQ_NR_BOARD		16<br>&gt;&gt; +<br=
>&gt;&gt;  /* Set the default NR_IRQS */<br>&gt;&gt; -#define NR_IRQS			(IR=
Q_GPIO_END)<br>
&gt;&gt; +#define NR_IRQS			(IRQ_GPIO_END + IRQ_NR_BOARD)<br>&gt;&gt; <br>&=
gt;&gt;  #endif /* __ASM_ARCH_IRQS_H */<br>&gt;&gt; --<br>&gt;&gt; 1.7.1.56=
9.g6f426<br>&gt; <br>&gt; I have no idea that we need specific interrupt on=
 EXYNOS4 now.<br>
&gt; As you know, this can affect all machines of EXYNOS4 SoC even though t=
here<br>&gt; is EXYNOS4210 now.<br>&gt; <br>&gt; If required, we need somet=
hing like SAMSUNG_GPIO_EXTRA for compatibility.<br>&gt; Anyway need more di=
scussion on this :)<br>
&gt; <br>&gt; Thanks.<br>&gt; <br>&gt; Best regards,<br>&gt; Kgene.<br>&gt;=
 --<br>&gt; Kukjin Kim &lt;<a href=3D"mailto:kgene.kim@samsung.com">kgene.k=
im@samsung.com</a>&gt;, Senior Engineer,<br>&gt; SW Solution Development Te=
am, Samsung Electronics Co., Ltd.<br>
&gt; <br>&gt; --<br>&gt; To unsubscribe from this list: send the line &quot=
;unsubscribe linux-samsung-soc&quot; in<br>&gt; the body of a message to <a=
 href=3D"mailto:majordomo@vger.kernel.org">majordomo@vger.kernel.org</a><br=
>
&gt; More majordomo info at  <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html">http://vger.kernel.org/majordomo-info.html</a><br></div>

--0016e6de1501990ff9049e851a4b--


--===============1288692499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1288692499==--
