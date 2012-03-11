From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL 3/4] Samsung devel-mmc for v3.4
Date: Sun, 11 Mar 2012 00:13:53 -0800
Message-ID: <4F5C5EC1.7000102@samsung.com>
References: <4F5B7C8D.5000805@samsung.com> <CAOesGMgx-86rUuOfjTN8BeYZD+S=04oj+N9u-m9dr8JQA1Oxiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:33507 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751912Ab2CKIN5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Mar 2012 04:13:57 -0400
Received: by iagz16 with SMTP id z16so4985343iag.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Mar 2012 00:13:56 -0800 (PST)
In-Reply-To: <CAOesGMgx-86rUuOfjTN8BeYZD+S=04oj+N9u-m9dr8JQA1Oxiw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Chris Ball <cjb@laptop.org>


On 03/10/12 10:10, Olof Johansson wrote:
 > On 03/10/12 10:08, Olof Johansson wrote:
>> Hi,
>>
>> On Sat, Mar 10, 2012 at 8:08 AM, Kukjin Kim<kgene.kim@samsung.com>  wrote:
>>> Hi Arnd, Olof
>>>
>>> This is regarding Samsung mmc for v3.4.
>>>
>>> As a note, v3.4-for-cjb branch is merged into mmc/mmc-next like following:
>>> http://git.kernel.org/?p=linux/kernel/git/cjb/mmc.git;a=commit;h=fcd9bdae386753531a9cb6b2577359a83f4e121c
>>
>> Looking at this series, there's really only one patch that is not in
>> the mmc tree:
>>
>> ARM: SAMSUNG: change the name from s3c-sdhci to exynos4-sdhci
>>
>> And all it does is change the platform device string contents.
>>
>> Since there are no build-time dependencies between this and the MMC
>> change, I suggest you send only this patch so that we avoid having
>> merge dependencies where not strictly needed.
>>
>> Would that be OK with you? If so, please send a fresh pull request
>> with only the above change in it.
>>
>>
>Sorry, I misread the series when browsing it. Looks like there are two
 > more patches in it:
 >
 > mmc: sdhci-s3c: add platform data for the second capability
 > ARM: SAMSUNG: support the second capability for samsung-soc
 >
 > But the original suggestion remains, since those two seem to be
 > unrelated to the branch sent to Chris. So please resend with just
 > those patches, please?
 >
OK, I agree. Let me do it soon.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
