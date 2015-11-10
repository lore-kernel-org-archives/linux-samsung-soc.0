From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 09/13] exynos/fimg2d: add g2d_move
Date: Tue, 10 Nov 2015 14:24:11 +0100
Message-ID: <5641EFFB.1020509@math.uni-bielefeld.de>
References: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1442937302-8211-10-git-send-email-tjakobi@math.uni-bielefeld.de>
 <20151109163013.011f4cb6@hwh-ubuntu> <56406B96.1050701@math.uni-bielefeld.de>
 <20151110132005.73ff2b60@hwh-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:59074 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753072AbbKJNYN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 08:24:13 -0500
In-Reply-To: <20151110132005.73ff2b60@hwh-ubuntu>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hyungwon Hwang <human.hwang@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hello Hyungwon,


Hyungwon Hwang wrote:
> Hello Tobias,
> 
> On Mon, 09 Nov 2015 10:47:02 +0100
> Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> 
>> Hello Hyungwon,
>>
>>
>> Hyungwon Hwang wrote:
>>> Hello Tobias,
>>>
>>> I was in vacation last week, so I could run your code today. I found
>>> that what g2d_move() does is actually copying not moving, because
>>> the operation does not clear the previous area.
>> I choose g2d_move() because we also have memcpy() and memmove() in
>> libc. Like in libc 'moving' memory doesn't actually move it, like you
>> would move a real object, since it's undefined what 'empty' memory
>> should be.
>>
>> The same applies here. It's not defined what 'empty' areas of the
>> buffer should be.
>>
>>
>>> Would it be possible to
>>> generalize g2d_copy() works better, so it could works well in case
>>> of the src buffer and dst buffer being same.
>> I think this would break g2d_copy() backward compatibility.
>>
>> I also want the user to explicitly request this. The user should make
>> sure what requirements he has for the buffers in question. Are the
>> buffers disjoint or not?
>>
>>
>>> If it is possible, I think it
>>> would be better way to do that. If it is not, at least chaning the
>>> function name is needed. I tested it on my Odroid U3 board.
>> I don't have a strong opinion on the naming. Any recommendations?
>>
>> I still think the naming is fine though, since it mirrors libc's
>> naming. And the user is supposed to read the documentation anyway.
> 
>>
>>
>>
>> With best wishes,
>> Tobias
> 
> In that manner following glibc, I agree that the naming is reasonable.
well, that was just my way of thinking. But I guess most people have
experience using the libc, so the naming should look at least 'familiar'.



> I commented like that previously, because at the first time when I run
> the test, I think that the result seems like a bug. The test program
> said that it was a move test, but the operation seemed copying.
Ok, so just that I understand this correctly. Your issue is with the
commit the description of the test or with the commit description of the
patch that introduces g2d_move()?

Because I don't see what you point out in the test commit description:

"
tests/exynos: add test for g2d_move

To check if g2d_move() works properly we create a small checkerboard
pattern in the center of the screen and then shift this pattern
around with g2d_move(). The pattern should be properly preserved
by the operation.
"

I intentionally avoid to write "...move this pattern around...", so
instead I choose "shift".

I'm not a native speaker, so I'm clueless how to formulate this in a
more clear way.


> It
> would be just OK if it is well documented or printed when runs the test
> that the test does not do anything about the previous area
> intentionally.
I could add solid fills of the 'empty' areas after each move()
operation. Would that be more in line what you think the test should do?


With best wishes,
Tobias




> 
> 
> BRs,
> Hyungwon Hwang
> 
