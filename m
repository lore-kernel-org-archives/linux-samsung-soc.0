From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 4/4] arm: exynos4: add device tree support for external
 wakeup interrupt controller
Date: Wed, 7 Dec 2011 22:19:41 +0530
Message-ID: <CAJuYYwSp_5Bvcz7JqP7u6xd5DQXBRroezFNCRNh=A=Vf+pAhZA@mail.gmail.com>
References: <1323266392-28330-1-git-send-email-thomas.abraham@linaro.org>
	<1323266392-28330-2-git-send-email-thomas.abraham@linaro.org>
	<1323266392-28330-3-git-send-email-thomas.abraham@linaro.org>
	<1323266392-28330-4-git-send-email-thomas.abraham@linaro.org>
	<1323266392-28330-5-git-send-email-thomas.abraham@linaro.org>
	<4EDF9169.2030100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:37682 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758126Ab1LGQtm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Dec 2011 11:49:42 -0500
Received: by vcbfk14 with SMTP id fk14so596043vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Dec 2011 08:49:41 -0800 (PST)
In-Reply-To: <4EDF9169.2030100@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, kgene.kim@samsung.com, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, patches@linaro.org

Hi Rob,

On 7 December 2011 21:46, Rob Herring <robherring2@gmail.com> wrote:
> On 12/07/2011 07:59 AM, Thomas Abraham wrote:
>> Add device tree support for external wakeup source interrupt control=
ler
>> on Exynos4.
>>
>> Cc: Rob Herring <rob.herring@calxeda.com>
>> Cc: Grant Likely <grant.likely@secretlab.ca>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---

[...]

>> diff --git a/Documentation/devicetree/bindings/arm/samsung/wakeup-ei=
nt.txt b/Documentation/devicetree/bindings/arm/samsung/wakeup-eint.txt
>> new file mode 100644
>> index 0000000..0ca5782
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/samsung/wakeup-eint.txt
>> @@ -0,0 +1,14 @@
>> +* Samsung Exynos4 External Wakeup Interrupt Source Controller
>> +
>> +Samsung Exynos4 processor supports 32 external wakeup interrupt sou=
rces. First
>> +16 of these interrupts are directly connected to GIC and the rest 1=
6 of the
>> +interrupts are grouped together to deliver a single interrupt to GI=
C.
>> +
>> +Required properties:
>> +
>> +- compatible: should be "samsung,exynos4210-wakeup-eint".
>> +- interrupt-controller: Identifies the node as an interrupt control=
ler.
>> +- interrupt-cells: Specifies the number of cells required to specif=
y the
>> + =A0 =A0interrupt source number. The value of should be <2>. The fi=
rst cell
>> + =A0 =A0represents the wakeup interrupt source number and the secon=
d cell
>> + =A0 =A0should be zero (currently unused).
>
> interrupt-parent needs to be set to the gic?

Yes, I missed that. gic is set as the interrupt parent in the root
node and all child nodes inherit it. I will add interrupt-parent as
the required property as list gic as the parent.

>
>> diff --git a/arch/arm/mach-exynos/cpu.c b/arch/arm/mach-exynos/cpu.c

[...]

>> +#ifdef CONFIG_OF
>> + =A0 =A0 if (of_have_populated_dt()) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 domain->of_node =3D of_find_compatible_nod=
e(NULL, NULL,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "samsung,exynos4210-wakeup-eint");
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!domain->of_node)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_info("exynos4_init_irq_=
eint: of_node not found\n");
>> + =A0 =A0 }
>> +#endif
>
> Your function prototype is wrong for of_irq_init as it provides you t=
he
> node ptr.

Thanks. I got this wrong. That would make the code above much simpler.
I will fix this.

>
> Otherwise, the series looks pretty good.
>
> Rob

Thanks for your review and comments.

Regards,
Thomas.
