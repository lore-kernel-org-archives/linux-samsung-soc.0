From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL 2/4] Samsung devel-pd for v3.4
Date: Sun, 11 Mar 2012 00:05:40 -0800
Message-ID: <4F5C5CD4.7020804@samsung.com>
References: <4F5B7C81.6080301@samsung.com> <CAOesGMjff3gVNJQ5FpJuSf+uvVDW8k22b+Xcikot-isM-4-6iw@mail.gmail.com> <201203102209.22451.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:61506 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751830Ab2CKIFp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Mar 2012 04:05:45 -0400
Received: by iagz16 with SMTP id z16so4977127iag.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Mar 2012 00:05:44 -0800 (PST)
In-Reply-To: <201203102209.22451.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 03/10/12 13:09, Rafael J. Wysocki wrote:
> Hi,
>
> On Saturday, March 10, 2012, Olof Johansson wrote:
>> Hi Rafael,
>>
>> The below series contains two patches that have been sent to you, and
>> that are sitting in the pm-domains branch.
>>
>> Two questions before I pull this into arm-soc:
>>
>> 1) Are you 100% sure this will be submitted to 3.4? And if so, will
>> you send it early during the merge window?
>
> Yes and yes.
>
>> 2) Are you 100% sure you will not rebase the branch into which you
>> pulled the v3.4-for-rafael branch?
>
> Yes, I am.
>
>> I am asking because if we pull this in, and you rebase between now and
>> when it's sent in, we're risking merge conflicts that will be painful
>> to resolve. We've been bitten by that from other dependencies in the
>> past so we're being careful.
>
> Sure, I understand that.
>
> As a general rule, topic braches in my tree whose names start with pm- are
> never rebased (exactly for this reason).
>
Hi,

Rafael, thanks.

Olof, please pull devel-samsung-pd from following:

git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/devel-samsung-pd

And if any problems, please let me know.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
