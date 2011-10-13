From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/3] ARM: Exynos4: Add ioremap interceptor for statically
 remapped regions
Date: Thu, 13 Oct 2011 08:58:11 +0530
Message-ID: <CAJuYYwTpUX+zdRr5PO9SW+nUFW-BwsSwWkWXNRjw_TKy+vdEgw@mail.gmail.com>
References: <1318234289-22041-1-git-send-email-thomas.abraham@linaro.org>
	<1318234289-22041-3-git-send-email-thomas.abraham@linaro.org>
	<4E95BC8E.8010105@gmail.com>
	<CAJuYYwSQgiZMEuzyqFvijy+sTLWqi=TqvM8cGe=W3bPOSBe0Hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:36312 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752239Ab1JMD2M convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Oct 2011 23:28:12 -0400
Received: by ywb5 with SMTP id 5so713777ywb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Oct 2011 20:28:11 -0700 (PDT)
In-Reply-To: <CAJuYYwSQgiZMEuzyqFvijy+sTLWqi=TqvM8cGe=W3bPOSBe0Hg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org, Nicolas Pitre <nicolas.pitre@linaro.org>

On 12 October 2011 22:00, Thomas Abraham <thomas.abraham@linaro.org> wr=
ote:
> On 12 October 2011 21:43, Rob Herring <robherring2@gmail.com> wrote:
>> On 10/10/2011 03:11 AM, Thomas Abraham wrote:
>>> ioremap() request for statically remapped regions are intercepted a=
nd the
>>> statically assigned virtual address is returned. For requests for w=
hich
>>> there are no statically remapped regions, the requests are let thro=
ugh.
>>>
>>> Cc: Kukjin Kim <kgene.kim@samsung.com>
>>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>>> ---
>>> =A0arch/arm/mach-exynos4/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 16 +++=
+++++++++++++
>>> =A0arch/arm/mach-exynos4/include/mach/io.h | =A0 =A04 ++++
>>> =A02 files changed, 20 insertions(+), 0 deletions(-)
>>>
>>
>> You won't need this with Nico's vmalloc.h clean-up series. It does
>> exactly this but generically for all platforms.
>
> Ok. Thanks for your suggestion. I will move to using Nico's patches.

=46rom Nico's reply to his pull request of vmalloc cleanup series, it
looks like that pull request has been withdrawn (hope I am not missing
anything here). Without Nico's series, and gic dt support for exynos4
support requiring this patch, all other workarounds to replace this
patch does not seem be correct.

So is it acceptable to retain this patch and later rework/drop the
exynos4 specific ioremap along with Nico's vmalloc patch series when
it is merged.

Thanks,
Thomas.

>
> Regards,
> Thomas.
>
>>
>> Rob
>>
>
