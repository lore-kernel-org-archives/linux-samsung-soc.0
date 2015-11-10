From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v4] tests/exynos: add fimg2d performance analysis
Date: Tue, 10 Nov 2015 14:23:51 +0100
Message-ID: <5641EFE7.7060509@math.uni-bielefeld.de>
References: <1446457929-8302-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <20151109164551.28ef93e7@hwh-ubuntu> <56406BA1.7090004@math.uni-bielefeld.de>
 <20151110115946.2eedfd19@hwh-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:59068 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753050AbbKJNXy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 08:23:54 -0500
In-Reply-To: <20151110115946.2eedfd19@hwh-ubuntu>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hyungwon Hwang <human.hwang@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, inki.dae@samsung.com

Hello Hyungwon,


Hyungwon Hwang wrote:
> Hello Tobias,
> 
> On Mon, 09 Nov 2015 10:47:13 +0100
> Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> 
>> Hello Hyungwon,
>>
>>
>> Hyungwon Hwang wrote:
>>> Hello,
>>>
>>> I think this patch should update .gitignore, not for adding the
>>> built binary to untracked file list.
>> Thanks!
>>
>>
>>> Also, I want to make clear about the purpose of this test program.
>>> What do you want to get after this test? This program runs G2D with
>>> randomly chosen number of pixel and shows the elapsed time to do
>>> that. I run it on my board. But I could not find any meaning of the
>>> test. If you just want to know the execution time of solid fill,
>>> what about get the width and height from user and run the same tests
>>> iteratively for more accurate result? Or at least, increasing
>>> number of pixels?
>> The test is to measure the dependency between amount of pixels the G2D
>> has to process and the amount of time for the G2D to process such
>> pixels.
>>
>> It's exactly what a performance test should do, measure the time it
>> takes for a certain workload to complete.
>>
>> In particular the test wants to answer the question if the dependency
>> stated above is of linear type.
>>
>> Of course it's not, since we have setup time, so at least it should be
>> affine linear. But even that is not true, since you see subtle
>> 'branching' when doing high density plots (that's why I added export
>> of the data to Mathematica).
>>
>>
>> What you ask for (user input) is in fact already implemented. The user
>> can specify the buffer width and height, which in turn limits the size
>> of the rectangle that is solid filled.
>>
>> If you want smaller rectangles filled, decrease buffer width and
>> height, if you want bigger ones filled, increase.
>>
>>
>> The second purpose is to stress test the G2D, as already indicated in
>> the commit description. The G2D can be overclocked quite a lot under
>> certain conditions. With increase MIF/INT voltages I can run it with
>> 400MHz instead of the 200MHz defaults. The application can now be used
>> to check stability. E.g. if voltages are too low the system can
>> quickly lock-up.
>>
>> In particular one could also check how processing time depends on the
>> clock rate of the G2D. One interesting question here is how memory
>> bandwidth limits us.
>>
>>
>>
>> With best wishes,
>> Tobias
> 
> Yes. I agree with the broad view. Please see the below, I run the test
> 2 times in a row.
> 
> root@localhost:~# ./exynos_fimg2d_perf  -i 10 -w 1024 -h 1024   
> exynos/fimg2d: G2D version (4.1).
> starting simple G2D performance test
> buffer width = 1024, buffer height = 1024, iterations = 10
> num_pixels = 136000, usecs = 236000
> num_pixels = 8492, usecs = 47083
> num_pixels = 100688, usecs = 200042
> num_pixels = 141312, usecs = 216667
> num_pixels = 39962, usecs = 92708
> num_pixels = 95046, usecs = 156542
> num_pixels = 2562, usecs = 34666
> num_pixels = 176485, usecs = 326916
> num_pixels = 17760, usecs = 56625
> num_pixels = 1625, usecs = 31833
> starting multi G2D performance test (batch size = 3)
> buffer width = 1024, buffer height = 1024, iterations = 10
> num_pixels = 245180, usecs = 385083
> num_pixels = 276320, usecs = 398625
> num_pixels = 196807, usecs = 356666
> num_pixels = 305540, usecs = 420458
> num_pixels = 65978, usecs = 120250
> num_pixels = 265028, usecs = 379417
> num_pixels = 139079, usecs = 213667
> num_pixels = 24970, usecs = 67625
> num_pixels = 46808, usecs = 114125
> num_pixels = 100804, usecs = 179750
> root@localhost:~# ./exynos_fimg2d_perf  -i 10 -w 1024 -h 1024 
> exynos/fimg2d: G2D version (4.1).
> starting simple G2D performance test
> buffer width = 1024, buffer height = 1024, iterations = 10
> num_pixels = 18676, usecs = 95541
> num_pixels = 117056, usecs = 218875
> num_pixels = 80784, usecs = 137209
> num_pixels = 427, usecs = 33209
> num_pixels = 238044, usecs = 403041
> num_pixels = 4392, usecs = 37709
> num_pixels = 19880, usecs = 59750
> num_pixels = 3666, usecs = 36542
> num_pixels = 4630, usecs = 36166
> num_pixels = 70834, usecs = 125917
> starting multi G2D performance test (batch size = 3)
> buffer width = 1024, buffer height = 1024, iterations = 10
> num_pixels = 216516, usecs = 347042
> num_pixels = 242863, usecs = 422417
> num_pixels = 28176, usecs = 72292
> num_pixels = 110713, usecs = 179167
> num_pixels = 292266, usecs = 431750
> num_pixels = 274127, usecs = 392833
> num_pixels = 291659, usecs = 415875
> num_pixels = 140202, usecs = 218833
> num_pixels = 122400, usecs = 193084
> num_pixels = 168647, usecs = 251375
> 
> As you said, I can adjust the buffer width and height. But because the
> program choose the number of pixel to process randomly, I can't compare
> the result after I modified something (clock, or something else like
> you mentioned).
I have trouble following you here. It seems to be that by 'compare' you
mean that you want to compare performance using these numbers by hand.

That's of course a real pain in the ass, and I would never recommend it!



> Also I can figure out the tendency between the number
> of pixels and the processing time after I draw the graph. But it is too
> hard not by doing that, because the number of pixels are not in
> increasing order at least.
That's why you don't do analysis of large data sets yourself.

The intended way is to feed the data in your program of choice and then
apply various methods there.

This e.g. is a plot done via Mathematica:
https://www.math.uni-bielefeld.de/~tjakobi/exynos/g2d_clear_perf.pdf

By fitting a polynomial of degree 1 to the data you can then extract
average setup time and average processing time per pixel.

That's information that actually interests you. The 'raw' data you
posted above are just individual samples and are therefore only of
limited meaning. It's the large amount of samples and the averaging of
these that gives you statistical meaning.


You could argue that the test application should implement all this
itself, but I would strongly disagree with that. We've got GnuPlot,
Maple, MATLAB, Mathematica, Octave, SAGE, and probably a dozen of other
tools that do data analysis way better than we ever could.



> I think that this program will be more useful
> if the user can control the whole situation more tightly. But if you
> need this kind of test, then it's OK to me.
I hope the explanation above reveals why you don't want the user to
control the situation 'more tightly' :)



With best wishes,
Tobias


> Best regards,
> Hyungwon Hwang
