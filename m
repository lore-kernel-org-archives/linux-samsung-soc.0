From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/5] Samsung cleanup-s3c24xx for v3.9
Date: Tue, 5 Feb 2013 17:08:56 -0800
Message-ID: <CAOesGMgtReoC5Ons3PkYzYe=v+JCtDPUfrgw-Hi75-mjxcOyeA@mail.gmail.com>
References: <120c01ce0331$389e43a0$a9dacae0$@samsung.com>
	<20130206001532.GA28722@quad.lixom.net>
	<14ef01ce0404$87e51280$97af3780$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:56097 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753950Ab3BFBI5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 20:08:57 -0500
Received: by mail-wi0-f172.google.com with SMTP id ez12so4965008wid.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Feb 2013 17:08:56 -0800 (PST)
In-Reply-To: <14ef01ce0404$87e51280$97af3780$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tue, Feb 5, 2013 at 4:54 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Olof Johansson wrote:
>>
>> On Mon, Feb 04, 2013 at 03:41:55PM -0800, Kukjin Kim wrote:
>> > Hi Arnd and Olof,
>> >
>> > Here is 2nd cleanup for Samsung S3C24XX stuff and based on previous
>> > pull-request branch, 'next/cleanup-header'.
>> > Basically, this patch merges mach-s3c2410, mach-s3c2412 and mach-s3c2440
>> > into mach-s3c24xx.
>> >
>> > Note, this is 2nd pull request and first is 'next/cleanup-header'
> branch.
>> > If any problems, please let me know.
>>
>> Hi,
>>
> Hi,
>
>> So, your first pull request didn't contain a "1/5", so it's hard to match
> them
>> up.
>>
> Could be, sorry for that.
>
>> Also, see how the word wrapping looks below? I wonder if you run your "git
>> request-pull" in a terminal window that is wider than 80 characters, and
> then
>> copy-and-paste it over? That doesn't work well. (I suspect you do since
> your
>> git URL is always wrapped too :( )
>>
> Yeah, I know...sigh, it's hard to me how to avoid wrapped git URL...anyway
> let me check it more closely from now on.
>
>> Finally, would you mind starting to use signed tags with branch
> descriptions,
>
> Hmm, I see...but unfortunately, I can't use signed tag in my office, because
> I can't use my own laptop in my office due to company security. Let me find
> the way but probably need more time to use it.
>
>> or at least give a short overview of the branches in the pull requests?
>>
> OK, let me add it next time.
>
> So you want to re-send this pull request? Even though I'm not sure how I can
> cover your ask except a short overview...


No, it's ok for this time. I've pulled in all the branches now. It was
more for future branches.


-Olof
