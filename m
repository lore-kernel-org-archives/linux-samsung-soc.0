From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/3] ARM: Exynos4: Add ioremap interceptor for statically
 remapped regions
Date: Wed, 12 Oct 2011 22:00:11 +0530
Message-ID: <CAJuYYwSQgiZMEuzyqFvijy+sTLWqi=TqvM8cGe=W3bPOSBe0Hg@mail.gmail.com>
References: <1318234289-22041-1-git-send-email-thomas.abraham@linaro.org>
	<1318234289-22041-3-git-send-email-thomas.abraham@linaro.org>
	<4E95BC8E.8010105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:63690 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753421Ab1JLQaM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Oct 2011 12:30:12 -0400
Received: by ggnv2 with SMTP id v2so841851ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Oct 2011 09:30:11 -0700 (PDT)
In-Reply-To: <4E95BC8E.8010105@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On 12 October 2011 21:43, Rob Herring <robherring2@gmail.com> wrote:
> On 10/10/2011 03:11 AM, Thomas Abraham wrote:
>> ioremap() request for statically remapped regions are intercepted an=
d the
>> statically assigned virtual address is returned. For requests for wh=
ich
>> there are no statically remapped regions, the requests are let throu=
gh.
>>
>> Cc: Kukjin Kim <kgene.kim@samsung.com>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0arch/arm/mach-exynos4/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 16 ++++=
++++++++++++
>> =A0arch/arm/mach-exynos4/include/mach/io.h | =A0 =A04 ++++
>> =A02 files changed, 20 insertions(+), 0 deletions(-)
>>
>
> You won't need this with Nico's vmalloc.h clean-up series. It does
> exactly this but generically for all platforms.

Ok. Thanks for your suggestion. I will move to using Nico's patches.

Regards,
Thomas.

>
> Rob
>
