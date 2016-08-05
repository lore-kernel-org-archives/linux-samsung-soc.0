From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RESEND 7/8] ASoC: samsung: s3c24xx_uda134x: debug/error
 trace cleanup
Date: Fri, 05 Aug 2016 14:01:10 +0200
Message-ID: <89360a6d-334c-0efd-2066-66a2fc60892a@samsung.com>
References: <1470390429-30902-1-git-send-email-s.nawrocki@samsung.com>
 <20160805100343.GO10383@sirena.org.uk>
 <3fcce0ec-0cbc-20f0-adc2-30ea53f83106@samsung.com>
 <20160805104525.GQ10383@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:8947 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934983AbcHEMBW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Aug 2016 08:01:22 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBF003ZXQQ6SZ70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 05 Aug 2016 13:01:18 +0100 (BST)
In-reply-to: <20160805104525.GQ10383@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org

On 08/05/2016 12:45 PM, Mark Brown wrote:
> On Fri, Aug 05, 2016 at 12:20:58PM +0200, Sylwester Nawrocki wrote:
> 
>>> > > I've only got patch 7 here, what's the story with the other patches?
>> > I didn't resend them since I got notification they are already applied
>> > (1/8...6/8). Should I resend all patches as in this branch:
>> > https://git.linuxtv.org/snawrocki/samsung.git/log/?h=for-v4.9/asoc/s3c24xx_uda134x
>
> No, don't resend already applied patches!  If you are posting a patch
> series the patch series needs to be internally consistent.  The fact
> that a patch may at some point have been included in some other series
> is not relevant later.  The point with numbering things in a series is
> so people can tell what order the series is in, it means nothing outside
> of that.

Right, I should have omitted the numbering and should just have resent
as a standalone patch.
