From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/3] ARM: Exynos4: Add ioremap interceptor for statically
 remapped regions
Date: Wed, 12 Oct 2011 21:29:31 -0600
Message-ID: <CACxGe6uDCxC_2fQQm6pYSXSfrvoK0NVoFC5EH0EsZWagPLPr3Q@mail.gmail.com>
References: <1318234289-22041-1-git-send-email-thomas.abraham@linaro.org>
 <1318234289-22041-3-git-send-email-thomas.abraham@linaro.org>
 <4E95BC8E.8010105@gmail.com> <CAJuYYwSQgiZMEuzyqFvijy+sTLWqi=TqvM8cGe=W3bPOSBe0Hg@mail.gmail.com>
 <CAJuYYwTpUX+zdRr5PO9SW+nUFW-BwsSwWkWXNRjw_TKy+vdEgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:39098 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752239Ab1JMD3w convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Oct 2011 23:29:52 -0400
Received: by vcbgb30 with SMTP id gb30so1176675vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Oct 2011 20:29:51 -0700 (PDT)
In-Reply-To: <CAJuYYwTpUX+zdRr5PO9SW+nUFW-BwsSwWkWXNRjw_TKy+vdEgw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Rob Herring <robherring2@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, kgene.kim@samsung.com, patches@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Wed, Oct 12, 2011 at 9:28 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> On 12 October 2011 22:00, Thomas Abraham <thomas.abraham@linaro.org> =
wrote:
>> On 12 October 2011 21:43, Rob Herring <robherring2@gmail.com> wrote:
>>> On 10/10/2011 03:11 AM, Thomas Abraham wrote:
>>>> ioremap() request for statically remapped regions are intercepted =
and the
>>>> statically assigned virtual address is returned. For requests for =
which
>>>> there are no statically remapped regions, the requests are let thr=
ough.
>>>>
>>>> Cc: Kukjin Kim <kgene.kim@samsung.com>
>>>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>>>> ---
>>>> =A0arch/arm/mach-exynos4/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 16 ++=
++++++++++++++
>>>> =A0arch/arm/mach-exynos4/include/mach/io.h | =A0 =A04 ++++
>>>> =A02 files changed, 20 insertions(+), 0 deletions(-)
>>>>
>>>
>>> You won't need this with Nico's vmalloc.h clean-up series. It does
>>> exactly this but generically for all platforms.
>>
>> Ok. Thanks for your suggestion. I will move to using Nico's patches.
>
> From Nico's reply to his pull request of vmalloc cleanup series, it
> looks like that pull request has been withdrawn (hope I am not missin=
g
> anything here). Without Nico's series, and gic dt support for exynos4
> support requiring this patch, all other workarounds to replace this
> patch does not seem be correct.
>
> So is it acceptable to retain this patch and later rework/drop the
> exynos4 specific ioremap along with Nico's vmalloc patch series when
> it is merged.

I would say yes, but I don't get to make the decision here.

g.
