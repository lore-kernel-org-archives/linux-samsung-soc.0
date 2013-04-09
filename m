From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: GENERIC_GPIO considered deprecated
Date: Mon, 8 Apr 2013 17:07:54 -0700
Message-ID: <CAAVeFuJCxYiOXRkjJZXpSFUaGoiAtWwBWBJmxXUyQMkmrSEsew@mail.gmail.com>
References: <CAAVeFu+QUw1WmzwaJDfjyw75PrStd3p3PHs1MU5BC7_WXMB7kw@mail.gmail.com>
 <2c9501ce342b$1535d290$3fa177b0$%kim@samsung.com> <5162EC32.2030602@wwwdotorg.org>
 <201304082136.44905.arnd@arndb.de> <20130409093842.656ae3fff92d5368db5c0646@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:44924 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934888Ab3DIAIQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 20:08:16 -0400
In-Reply-To: <20130409093842.656ae3fff92d5368db5c0646@canb.auug.org.au>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Romain Naour <romain.naour@openwide.fr>, linux-next <linux-next@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, ARM kernel mailing list <linux-arm-kernel@lists.infradead.org>

On Mon, Apr 8, 2013 at 4:38 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> On Mon, 8 Apr 2013 21:36:44 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Monday 08 April 2013, Stephen Warren wrote:
>> > >>
>> > >> Should do the trick, if we can make sure that your tree is merged
>> > >> prior to my patches.
>> > >
>> > > I'm not sure but I think, arm-soc tree should be merged into mainline before others...
>> > >
>> > >> Can you put it into your tree for 3.10?
>> > >>
>> > > I did, so it should be fine.
>> > >
>> >
>> > You may want to discuss how to handle this dependency with the arm-soc
>> > maintainers (CC'd).
>>
>> I'm fine with putting the same branch into arm-soc as well as the gpio tree
>> and anything else that might need it, that tends to be the least invasive
>> way.
>
> Just a reminder: that had better be the exact same branch and that branch
> had better never be rebased/rewritten ...

Sorry, which branch are we talking about - is it the one I published
for -next initially? If so wouldn't it be simpler to withdraw it and
have Grant integrate the patches in his branch? Since no one depends
on them for now anyway...

I remember rebasing it once some time ago to add Acked-bys, but it
hasn't changed since then.

Alex.
