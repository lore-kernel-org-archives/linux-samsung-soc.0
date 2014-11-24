From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: Peach Pi/Pit boot failures in linux-next  (was Re: [RFC PATCH 1/1]
 drm/exynos: Move platform drivers registration to module init)
Date: Mon, 24 Nov 2014 14:53:49 +0100
Message-ID: <1416837229.5023.23.camel@AMDC1943>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>
 <7hh9xwxsev.fsf@deeprootsystems.com> <546CCAB8.9050402@collabora.co.uk>
 <CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>
 <7hppchsu29.fsf@deeprootsystems.com> <546E293D.9000300@collabora.co.uk>
 <7hbno1spdt.fsf@deeprootsystems.com> <546F3837.5020706@collabora.co.uk>
 <7hzjbko6eb.fsf@deeprootsystems.com> <546FA53D.2060807@collabora.co.uk>
 <547063C4.9030607@samsung.com> <5472FC7F.6090508@collabora.co.uk>
 <1416824001.5023.7.camel@AMDC1943> <54731183.7090307@collabora.co.uk>
 <1416827525.5023.10.camel@AMDC1943> <54732FAD.6070608@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49586 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751179AbaKXNxy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 08:53:54 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFJ0095RQQEIW80@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Nov 2014 13:56:38 +0000 (GMT)
In-reply-to: <54732FAD.6070608@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kevin Hilman <khilman@kernel.org>, Kukjin Kim <kgene@kernel.org>, Vivek Gautam <gautamvivek1987@gmail.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>, Tushar Behera <tushar.b@samsung.com>, Doug Anderson <dianders@chromium.org>, Ajay Kumar <ajaykumar.rs@samsung.com>

On pon, 2014-11-24 at 14:16 +0100, Javier Martinez Canillas wrote:
> [adding Tushar Behera and Doug Anderson to cc list]
> 
> Hello,
> 
> On 11/24/2014 12:12 PM, Krzysztof Kozlowski wrote:
> > On pon, 2014-11-24 at 12:07 +0100, Javier Martinez Canillas wrote:
> >> Hello Krzysztof,
> >> 
> >> > It seems that mau_epll has to be enabled... or something is wrong with
> >> > clock hierarchy.
> >> >
> >> 
> >> Another strange thing is that the problem does not happen for some people
> >> using the same board, kernel and config options. For example Vivek and Ajay
> >> report that they can't reproduce the issue on a Peach Pi using next-20141121
> >> and exynos_defconfig without using clk_ignore_unused.
> > 
> > Maybe they have different bootloader which messes here by enabling some
> > clock?
> > 
> > Anyway it is reproducible on at least some Arndale Octa (Kevin's and
> > mine) and Peach Pi boards (yours).
> > 
> 
> This issue started to look extremely familiar to me so I searched in
> my mail inbox and found that the same problem was previously reported
> by Kevin a couple of months ago [0] and Tushar provided a fix [1].
> 
> I tested linux-next + [1] and that indeed fixes the hang on Peach.
> 
> To save you a click, the problem as explained by Tushar is that the
> AUDSS mux has two parents: XXTI crystal and MAU_EPLL clock. But when
> the output of AUDSS mux is gated, no operations can be made on the
> clocks provided by MAU block. For some reason the kernel just oops
> so it seems to be a H/W errata?
> 
> Mike was not fond about the solution proposed in [1] but something
> along those lines would be needed maybe Tushar can comment on that.
> 
> Vivek and Ajay,
> 
> As explained in [0], you are not facing this issue because your RW
> U-Boot seems to predate when audio support was enabled by default.
> 
> Can you try executing "sound init" in the U-Boot prompt and see if
> that triggers the hang for you?
> 
> Best regards,
> Javier
> 
> [0]: http://lists.infradead.org/pipermail/linux-arm-kernel/2014-June/262259.html
> [1]: http://www.spinics.net/lists/arm-kernel/msg337970.html

Thank you for digging this out.

It looks like mau_epll is needed to keep audio powered on...

Disabling the adma device (from DT) helps. But then
$ cat /sys/kernel/debug/clk/clk_summary
stops working. Just like ISP clocks (need to keep ISP domain on to read clk_summary).

When mau_epll is disabled all of reads and writes to Audio registers
fail. When system tries to disable unused adma clock it stucks because
Audio domain is off...

Still this is strange.

Best regards,
Krzysztof
