From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung devel for v3.3
Date: Mon, 9 Jan 2012 15:56:34 +0000
Message-ID: <201201091556.34817.arnd@arndb.de>
References: <018801ccca70$25f01260$71d03720$%kim@samsung.com> <CAOesGMjn5uQEWbxrJryC+jOf=3SYbAnPY4A71NUZKFBi=a0QjA@mail.gmail.com> <01a301ccce6f$9bb51790$d31f46b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:60556 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932225Ab2AIP4r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jan 2012 10:56:47 -0500
In-Reply-To: <01a301ccce6f$9bb51790$d31f46b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Monday 09 January 2012, Kukjin Kim wrote:
> In my opinion, as you know, it would be better to us if you could send this in
> this merge window.
> Actually, it does not have any dependency with others, in addition, for a long
> time this has been included in linux-next for this
> merge window.

Your patches have caused too much problems already so far, with many complex
merges (multiple files combined into new files in the restart branch, but
modified in multiple other conflicting branches), and I would rather not
see *anything* besides fixes from you for late 3.3 patches. If it hadn't
been for the conflicts I mentioned, everything else from arm-soc could
have been sent last Saturday already, but this way I spent a national
holiday and a weekend day, both during my vacation, mostly trying to
understand what you were trying to do and get it into shape for upstream
submission, giving up in the end.

I don't consider it enough to have patches in linux-next before the merge
window, and I thought I had made it clear enough that everything has to be
in arm-soc before the merge window. I realize that sometimes there is stuff
that gets done last minute and really has to get merged, but since you have
had it in your own tree for so long, that certainly doesn't apply here.

> If this can be missed from sending list to Linus, please kindly let me know.

Sorry, but the chances are pretty slim this time.

> Let me send this to Linus at the end of this merge window.

No, if you do this, I will NAK that pull request.

Of course we will take all bug fixes. Just rebase the rest on top of 3.3-rc1
and we can take it right away for 3.4.

	Arnd
