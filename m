From: Colin Cross <ccross@android.com>
Subject: Re: [PATCH 2/2] ARM: S5PV310: Update CPU hotplug implementation
Date: Thu, 30 Sep 2010 10:02:37 -0700
Message-ID: <AANLkTinaGsnZg-nTGvXS4xw-_8e8+pLpL4hYN-HMNYfh@mail.gmail.com>
References: <1284700388-9394-1-git-send-email-kgene.kim@samsung.com>
	<1284700388-9394-3-git-send-email-kgene.kim@samsung.com>
	<001901cb5fcd$a0a5b5a0$e1f120e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.44.51]:19608 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932227Ab0I3RCl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Sep 2010 13:02:41 -0400
Received: from wpaz33.hot.corp.google.com (wpaz33.hot.corp.google.com [172.24.198.97])
	by smtp-out.google.com with ESMTP id o8UH2eAN005742
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2010 10:02:40 -0700
Received: from eyg24 (eyg24.prod.google.com [10.208.7.24])
	by wpaz33.hot.corp.google.com with ESMTP id o8UH2ONq020873
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2010 10:02:39 -0700
Received: by eyg24 with SMTP id 24so1574817eyg.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2010 10:02:38 -0700 (PDT)
In-Reply-To: <001901cb5fcd$a0a5b5a0$e1f120e0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, Russell King <rmk@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, Erik Gilling <konkers@android.com>, Olof Johansson <olof@lixom.net>

On Wed, Sep 29, 2010 at 4:58 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Kukjin Kim wrote:
>>
>> From: Changhwan Youn <chaos.youn@samsung.com>
>>
>> This patch updates CPU hotplug implementation to reduce CPU power
>> consumption
>> and will turn off the CPU power when CPU1 is unplugged while previou=
s CPU
>> hotplug
>> used CPU idle.
>> This patch removes init memory freeing code to use CPU boot code whe=
n CPU1
> is
>> plugged-in again and adds vfp_enable() call to allow to access CP10 =
and
> CP11.
>>
>> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> Cc: Russell King <rmk@arm.linux.org.uk>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Colin Cross <ccross@android.com>
> Cc: Erik Gilling <konkers@android.com>
> Cc: Olof Johansson <olof@lixom.net>
>

snip

>> +#ifndef CONFIG_HOTPLUG_CPU
>> =A0 =A0 =A0 if (!machine_is_integrator() && !machine_is_cintegrator(=
))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 totalram_pages +=3D
> free_area(__phys_to_pfn(__pa(__init_begin)),
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 __phys_to_pfn(__pa(__init_end)),
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 "init");
>> +#endif
>> =A0}
>>
>> =A0#ifdef CONFIG_BLK_DEV_INITRD

I don't think this is necessary.  Any symbol that is necessary for CPU
hotplug should be marked with __cpuinit instead of __init.  The linker
script will put __cpuinit symbols outside the __init_begin -
__init_end section if CONFIG_HOTPLUG_CPU is enabled.
