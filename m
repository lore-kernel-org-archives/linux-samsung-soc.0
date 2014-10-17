From: Kevin Hilman <khilman@kernel.org>
Subject: Re: exynos5422-odroid-xu3: MCPM: only 6 of 8 CPUs coming online
Date: Fri, 17 Oct 2014 05:06:41 -0700
Message-ID: <CAMAWPa8ANvzaC4EfvRbwCZSya6xt=u6qmvN5cF1jhAROTdW3Pg@mail.gmail.com>
References: <7133556.456161412823997169.JavaMail.weblogic@epml02>
	<7hzjd4lxc5.fsf@deeprootsystems.com>
	<loom.20141015T133306-266@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:52817 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753281AbaJQMGs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Oct 2014 08:06:48 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id C149E201EF
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Oct 2014 12:06:46 +0000 (UTC)
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com [209.85.217.173])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6DCE02010C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Oct 2014 12:06:45 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id 10so551349lbg.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Oct 2014 05:06:41 -0700 (PDT)
In-Reply-To: <loom.20141015T133306-266@post.gmane.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Wed, Oct 15, 2014 at 4:35 AM, Joonyoung Shim <jy0922.shim@samsung.com> wrote:
> Hi,
>
> Kevin Hilman <khilman <at> kernel.org> writes:
>
>>
>> Hi Abhilash,
>>
>> Abhilash Kesavan <a.kesavan <at> samsung.com> writes:
>>
>> > I had noticed a similar issue where only 6 cores would come up during
>> > development on 5420. This was because there was a check in our u-boot
>> > secondary boot-up path which would put a core into WFI if a flag was
>> > not present and hence fail to boot. I wonder if it is the same
>> > situation in your case too.
>> > Is the u-boot for odroid-xu3 publically available or can you check if
> there is any such code present in your
>> secondary bring-up path.
>>
>> I'm using the hardkernel u-boot[1], branch: odroidxu3-v2012.07.  I'm
>> currently using the pre-built binaries that are in the
>> sd_fuse/hardkernel directory of that branch, but I can rebuild u-boot if
>> needed.
>>
>> I'm not very familiar with u-boot, but if f you have some pointers where
>> to start looking in that code, that would be helpful.
>>
>> Kevin
>>
>> [1] https://github.com/hardkernel/u-boot.git
>>
>>
>
> It seems to need magic code.
>
> Please refer
> https://github.com/abhijeet-dev/linux-samsung/commit/553b7f40465ab4fad6c270f289cd4780942f7fae

Thanks, Abhilash had pointed me to the same code, and it works.  But...

Can someone explain this "magic", ideally in the form of a changelog
and patch submitted upstream?

Kevin
