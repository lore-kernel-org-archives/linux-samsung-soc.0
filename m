From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v2 6/6] arm: exynos: removing exynos-drm device
 registration from non-dt platforms
Date: Mon, 15 Oct 2012 11:34:14 +0530
Message-ID: <CAPdUM4PhVKcHq0f2SDOBwLUqLgt-0+nro85j13Sb-GSvW3vHaA@mail.gmail.com>
References: <1350074555-26018-1-git-send-email-rahul.sharma@samsung.com>
	<1350074555-26018-7-git-send-email-rahul.sharma@samsung.com>
	<3753436.Oasjq2fFLk@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:49835 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752861Ab2JOGEP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Oct 2012 02:04:15 -0400
Received: by mail-gh0-f174.google.com with SMTP id g15so1224024ghb.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Oct 2012 23:04:14 -0700 (PDT)
In-Reply-To: <3753436.Oasjq2fFLk@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com

On Sat, Oct 13, 2012 at 7:16 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On Saturday 13 of October 2012 02:12:35 Rahul Sharma wrote:
>> As exynos-drm is a software device, its registration is moved to the
>> exynos drm driver. This will provide generic solution for device
>> registration for dt and non-dt platforms. Corresponding patches are
>> posted to dri-devel list.
>>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> ---
>>  arch/arm/mach-exynos/Makefile              |    1 -
>>  arch/arm/mach-exynos/dev-drm.c             |   29
>> ---------------------------- arch/arm/mach-exynos/mach-nuri.c
>> |    3 --
>>  arch/arm/mach-exynos/mach-origen.c         |    3 --
>>  arch/arm/mach-exynos/mach-smdk4x12.c       |    3 --
>>  arch/arm/mach-exynos/mach-smdkv310.c       |    3 --
>>  arch/arm/mach-exynos/mach-universal_c210.c |    3 --
>>  arch/arm/plat-samsung/include/plat/devs.h  |    2 -
>>  8 files changed, 0 insertions(+), 47 deletions(-)
>>  delete mode 100644 arch/arm/mach-exynos/dev-drm.c
>
> Hmm, shouldn't this patch belong to the series adding registration in the
> driver?
> (http://comments.gmane.org/gmane.comp.video.dri.devel/75121)
>
> It doesn't look to be directly related to adding dt support for exynos5
> hdmi.
>
> Best regards,
> Tomasz Figa
>

Hi Tomasz,

Actually other patch set is also about "adding platform device to drm
driver", not a best place
for the following patch. I added it here because these deletions are
done as part of adding DT
support for Exynos5. But If you still feel it is totally out of place,
I will post it again as an
independent patch.

regards,
Rahul Sharma.
