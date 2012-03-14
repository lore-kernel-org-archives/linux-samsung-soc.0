From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3 0/4] ARM: Exynos4: Add irq domain and device tree
 support for wakeup interrupts
Date: Wed, 14 Mar 2012 15:32:49 +0530
Message-ID: <CAJuYYwQxiz9tcx=15MK2vvhR71yhQyFBXrVDR0QO4YDdJ4Xvbw@mail.gmail.com>
References: <1329912858-32750-1-git-send-email-thomas.abraham@linaro.org>
	<4F5A30B8.6060801@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:52407 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760519Ab2CNKCv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Mar 2012 06:02:51 -0400
Received: by vcqp1 with SMTP id p1so1704486vcq.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Mar 2012 03:02:50 -0700 (PDT)
In-Reply-To: <4F5A30B8.6060801@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, patches@linaro.org

Dear Mr. Kim,

On 9 March 2012 22:02, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 02/22/12 04:14, Thomas Abraham wrote:
>>
>> Changes since v2:
>> - Reworked irq domain support based on v5 of the irq_domain generali=
zation
>> =A0 patches.
>>
>> Changes since v1: (only patch 4/4 has changes)
>> - Fixes based on Rob's comments:
>> =A0 a. Fixed the function prototype of exynos4_init_irq_eint(void)
>> =A0 b. Included interrupt-parent as an optional property for wakeup
>> interrupt
>> =A0 =A0 =A0 controller node.
>>
>> Samsung Exynos4 includes 32 external wakeup interrupt sources. The f=
irst
>> 16
>> of these interrupts are connected to GIC SPI[31:16]. The last 16 of =
these
>> interrupts are grouped together into one interrupt and connected to =
GIC
>> SPI[32].
>>
>> This patchset adds irq domain and device tree support for these
>> interrupts.
>> Since there are users of fixed linux irq numbers of the external wak=
eup
>> interrupts, the legacy mapping is used for the irq domain.
>>
>> This patchset is based on
>> http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.g=
it
>> [for-next]
>>
>> with all irq_domain (v5) patches merged from
>> http://git.secretlab.ca/git/linux-2.6.git [irqdomain/next]
>>
>> This patchset should be applied after applying the following patch.
>> [PATCH] ARM: Exynos: Add irq domain and device tree support for inte=
rrupt
>> combiner
>
>
> Looks ok to me this series, but I lost above patch in my mail box.
> Thomas, could you please send updated it so that I can apply this ser=
ies?

The device tree support patches for wakeup interrupts and interrupt
combiner do not apply cleanly to the for-next branch due to the
Exynos5 additions.  So I will rebase, test and post an updated version
of these patches.

Thanks,
Thomas.
