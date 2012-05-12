From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung fixes for v3.4
Date: Sat, 12 May 2012 15:48:23 -0700
Message-ID: <CAOesGMhhseR+WPru4xen7ijHCC91cBWqaZpJAHEAFLgyUiNQ3w@mail.gmail.com>
References: <4FAED92C.4090103@samsung.com>
	<CAOesGMj8PgGRmdQQSnJmAurL1uYM2exxDaeTTWHVe9JQR0zQ-w@mail.gmail.com>
	<4FAEF5FD.6070904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:48133 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754347Ab2ELWsY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 May 2012 18:48:24 -0400
Received: by obbtb18 with SMTP id tb18so5212175obb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 May 2012 15:48:23 -0700 (PDT)
In-Reply-To: <4FAEF5FD.6070904@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sat, May 12, 2012 at 4:45 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> On 05/13/12 07:29, Olof Johansson wrote:
>>
>> Hi,
>>
>>
>> Since we are _so_ close to release, I am going to be picky about wha=
t
>> kind of patches we're going to accept for 3.4. See below.
>>
>> On Sat, May 12, 2012 at 2:42 PM, Kukjin Kim<kgene.kim@samsung.com> =A0=
wrote:
>>
>>
>>> Changhwan Youn (1):
>>> =A0 =A0 =A0ARM: EXYNOS: fix the hotplug for Cortex-A15
>>
>>
>> This is a feature, not a bug fix -- cpu hotplug has never worked for
>> A15 based on the patch description. So per definition it's 3.5
>> material.
>>
> Hmm, in this case, IMHO, it's hard to say whether it is not a bug fix
> because in current mach-exynos/ problem happens during cpu hotplug on
> exynos5250 without that...But, OK it will be queued for v3.5.

Agreed, it's a borderline case -- and earlier in the -rc cycle I would
have included this one without complaints.

>> Also, I'll send out a comment on the patch itself, it shouldn't chec=
k
>> for SoC version, it should check for core version. See separate emai=
l
>> shortly.
>>
> OK, thanks for your comments and will update it even though checking =
SoC
> version is enough in mach-exynos/ :)

Well, sort of -- you will need to add new checks when you add another
SoC with A15, and that's just messy. If you check for A15 instead,
then you won't have to modify that piece of code for every new SoC
(hopefully).

>>> Jose Miguel Goncalves (1):
>>> =A0 =A0 =A0ARM: SAMSUNG: Fix for S3C2412 EBI memory mapping
>>
>>
>> This has been broken since 2.6.32. Please queue it up in a fixes
>> branch for the 3.5 merge window instead, it doesn't qualify as a
>> recent regression and thus we shouldn't try to squeeze it in before
>> the merge window closes.
>>
> OK, I agree.
>
>
>>> Kukjin Kim (1):
>>> =A0 =A0 =A0ARM: EXYNOS: fix ctrlbit for exynos5_clk_pdma1
>>>
>>> Marek Szyprowski (1):
>>> =A0 =A0 =A0ARM: EXYNOS: use s5p-timer for UniversalC210 board
>>
>>
>> Those two look appropriate. Please send a new pull request with thos=
e two.
>>
> I sent just now.

Thanks for the quick turnaround!


-Olof
